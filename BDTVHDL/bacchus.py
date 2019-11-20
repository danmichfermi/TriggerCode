#standard command python bacchus.py -r 77 -L 13 -f 1 -l 50000(or end run) -H -T -B -s seaquel.physics.illinois.edu -d mc_drellyan_LD2_M024_S001
#!/usr/bin/env python

#This script generates new TriggerRoadsTHitEvent files for the given data/MC production

import time
import sys, os, csv
#import MySQLdb
from optparse import OptionParser

    ## Define the command line input
parser = OptionParser('Usage: %prog [options]')
#parser.add_option("--go", action="store_true", dest = 'go', help = 'Run with defaults', default = False)
parser.add_option('-r', '--roadset', dest = 'roadset', help = 'L1 roadset version', type = 'int')
parser.add_option('-L', '--L2', type = 'int', dest = 'L2', help = 'L2 logic version [default=%default]', default = 7)
#parser.add_option('-t', '--trigger', type = 'int', dest = 'trig', help = 'Which output trigger to simulate [default=%default]', default = 1)
#parser.add_option('-o', '--roc', type = 'int', dest = 'roc', help = 'ROC ID [default=%default]', default = 25)
parser.add_option('-f', '--firstspill', type = 'int', dest = 'first', help = 'First spill to analyze [default=%default]', default = 0)
parser.add_option('-l', '--lastspill', type = 'int', dest = 'last', help = 'Last spill to analyze [default=%default]', default = 50000)
#parser.add_option('-V', action="store_true", dest="v1495", default = False)
#parser.add_option('-T', action="store_true", dest="taiwan", default = False)
#parser.add_option('-K', action="store_true", dest="skip", help = 'skip generating ROOT file, use existing ROOT file', default = False)
parser.add_option('-H', action="store_true", dest="hit", default = False, help = 'Use Hit Table')
parser.add_option('-T', action="store_true", dest="calcTable", default = False, help = 'Calculate new TriggerRoadsTHitEvent table')
parser.add_option('-E', action="store_true", dest="event", default = False, help = 'Update Event Table')
parser.add_option('-C', action="store_true", dest="copy", default = False, help = 'Copy to relevant schema.')
parser.add_option('-s', '--host', type = 'string', dest = 'host', help = 'host address [default=%default]', default = 'e906-db1.fnal.gov')
parser.add_option('-d', '--schema', type = 'string', dest = 'schema', help = 'Name of data schema [default=%default]', default = 'production_DY_R1129_V1')
#parser.add_option('-x', '--ptmax', type = 'float', dest = 'ptmax', help = 'Maximum pt allowed in road [default=%default]', default = 6.)
#parser.add_option('-n', '--ptmin', type = 'float', dest = 'ptmin', help = 'Minimum pt allowed in road [default=%default]', default = 1.)
#parser.add_option('--output', type = 'string', dest = 'output', help = 'Output filename. [default=resultset_<L1>_<L2>.dat]', default = None)

(options, args) = parser.parse_args()

#print help if no arguments are given
if len( sys.argv ) < 2:
    parser.parse_args(["--help"])

hitsSchema = 'TriggerHit'
if options.hit == True:
    hitsSchema = 'Hit'

print 'hit = ', options.hit
print options
print args

if not options.roadset:
    print "Please specify a roadset!"
    sys.exit()

spillList = range(options.first, options.last+1)

port = 3306
if options.host == 'seaquel.physics.illinois.edu':
    port = 3283

#main loop
startTime = time.time()
print "Start", startTime
if options.calcTable == True:
    for spill in spillList:

        #set output file
        output = "resultset_%d_%d.dat" % ( options.roadset, options.L2 )


        sim1Query = '''USE test_MasterTriggerInfo;
DROP TABLE IF EXISTS test_MasterTriggerInfo.TriggerHit;
CREATE TEMPORARY TABLE test_MasterTriggerInfo.TriggerHit
SELECT * FROM '''+options.schema+'''.'''+hitsSchema+''' where detectorName like 'H%' and spillID = '''+str(spill)+''' order by spillID, eventID;

DROP TABLE IF EXISTS bHit, bHit1, bHit2, bHit3, bHit4, tmp_TriggerRoad;

CREATE TEMPORARY TABLE tmp_TriggerRoad like test_MasterTriggerInfo.TriggerRoads_'''+str(options.roadset)+'''; # <---
INSERT INTO tmp_TriggerRoad SELECT DISTINCT * FROM test_MasterTriggerInfo.TriggerRoads_'''+str(options.roadset)+'''; # <---

CREATE TEMPORARY TABLE bHit(spillID INT UNSIGNED NOT NULL, eventID INT UNSIGNED NOT NULL, detectorName CHAR(6), elementID SMALLINT);

INSERT INTO bHit SELECT 
spillID, eventID, detectorName, elementID 
FROM TriggerHit WHERE inTime = 1 AND detectorName RLIKE 'H[123][TB]';

INSERT INTO bHit SELECT 
spillID, eventID, detectorName, elementID 
FROM TriggerHit WHERE inTime = 1 AND detectorName RLIKE 'H4[TB]';

CREATE TEMPORARY TABLE bHitCopy like bHit;
INSERT INTO bHitCopy SELECT * FROM bHit;

Alter table bHit Add Index (`spillID`, `eventID`);
Alter table bHitCopy Add Index (`spillID`, `eventID`);

OPTIMIZE TABLE bHit;
OPTIMIZE TABLE bHitCopy;

INSERT INTO bHit SELECT 
h1.spillID, h1.eventID, 'H4T', h1.elementID 
FROM bHitCopy AS h1 
WHERE h1.detectorName = 'H4Tu' OR h1.detectorName = 'H4Td';

INSERT INTO bHit SELECT 
h1.spillID, h1.eventID, 'H4B', h1.elementID 
FROM bHitCopy AS h1 
WHERE h1.detectorName = 'H4Bu' OR h1.detectorName = 'H4Bd';

DROP TABLE IF EXISTS bHitCopy;

DELETE FROM bHit WHERE detectorName RLIKE '[TB][ud]$';

ALTER IGNORE TABLE bHit ADD UNIQUE INDEX uniqify (spillID, eventID, detectorName, elementID);

OPTIMIZE TABLE bHit;

CREATE TEMPORARY TABLE bHit1 LIKE bHit;
CREATE TEMPORARY TABLE bHit2 LIKE bHit;
CREATE TEMPORARY TABLE bHit3 LIKE bHit;
CREATE TEMPORARY TABLE bHit4 LIKE bHit;

INSERT INTO bHit1 SELECT DISTINCT * FROM bHit WHERE detectorName RLIKE 'H1[TB]';
INSERT INTO bHit2 SELECT DISTINCT * FROM bHit WHERE detectorName RLIKE 'H2[TB]';
INSERT INTO bHit3 SELECT DISTINCT * FROM bHit WHERE detectorName RLIKE 'H3[TB]';
INSERT INTO bHit4 SELECT DISTINCT * FROM bHit WHERE detectorName RLIKE 'H4[TB]';

OPTIMIZE TABLE bHit1, bHit2, bHit3, bHit4;

#### Level1 emulation ####
# plus-top
INSERT INTO L1_result_'''+str(options.roadset)+'''(spillID, eventID, roadID)
SELECT h1.spillID, h1.eventID, tr.roadID
FROM tmp_TriggerRoad AS tr 
JOIN bHit1 AS h1 
JOIN bHit2 AS h2 
ON h1.eventID = h2.eventID AND h1.spillID = h2.spillID
JOIN bHit3 AS h3 
ON h1.eventID = h3.eventID AND h1.spillID = h3.spillID
JOIN bHit4 AS h4 
ON h1.eventID = h4.eventID AND h1.spillID = h4.spillID
WHERE tr.St1DetectorName = h1.detectorName AND tr.St1elementID = h1.elementID 
AND tr.St2DetectorName = h2.detectorName AND tr.St2elementID = h2.elementID 
AND tr.St3DetectorName = h3.detectorName AND tr.St3elementID = h3.elementID 
AND tr.St4DetectorName = h4.detectorName AND tr.St4elementID = h4.elementID;

DROP TABLE IF EXISTS bHit, bHit1, bHit2, bHit3, bHit4, tmp_TriggerRoad;
USE test_MasterTriggerInfo;'''
 
        dropQuery = '''USE test_MasterTriggerInfo;
DROP TABLE IF EXISTS L1_result_'''+str(options.roadset)+''';
CREATE TABLE L1_result_'''+str(options.roadset)+'''(spillID INT, eventID INT, roadID INT );'''

        indexQuery = '''USE test_MasterTriggerInfo;
Alter table L1_result_'''+str(options.roadset)+''' Add Index (`spillID`, `eventID`);
OPTIMIZE TABLE L1_result_'''+str(options.roadset)+''';'''

        if spill == options.first:
            query = dropQuery+sim1Query
        elif spill == options.last:
            query = sim1Query+indexQuery;
        else:
            query = sim1Query

        with open('query.sql', 'w') as sqlfile:
            sqlfile.write(query)

        print "Begin Spill", spill, time.time() - startTime
        os.system("mysql -u seaguest --password='qqbar2mu+mu-' --port="+str(port)+" -h "+options.host+" < query.sql > results.out")
	print "End Spill", spill, time.time() - startTime
        os.remove("./query.sql")
        os.remove("./results.out")
        #end of loop over spillList


    if options.copy == True:
        copyQuery = '''DROP TABLE IF EXISTS '''+options.schema+'''.TriggerRoadsTHitEvent'''+str(options.roadset)+''';
CREATE TABLE '''+options.schema+'''.TriggerRoadsTHitEvent'''+str(options.roadset)+''' LIKE test_MasterTriggerInfo.L1_result_'''+str(options.roadset)+'''; 
INSERT INTO '''+options.schema+'''.TriggerRoadsTHitEvent'''+str(options.roadset)+''' SELECT * FROM test_MasterTriggerInfo.L1_result_'''+str(options.roadset)+''';'''
        with open('copyQuery.sql', 'w') as sqlcopy:
            sqlcopy.write(copyQuery)
	print "Begin Copy Query", time.time() - startTime
        os.system("mysql -u production --password='qqbar2mu+mu-' --port="+str(port)+" -h "+options.host+" < copyQuery.sql > copy.out")
	print "End Copy Query", time.time() - startTime
        os.remove("./copyQuery.sql")
        os.remove("./copy.out")


if options.event == True:
    for spill in spillList:

        eventDimuons = '''use test_MasterTriggerInfo;

drop table if exists eventRoads, eventRoads2, pairs;

create temporary table eventRoads
select te.spillID, te.eventID, te.roadID, r.charge, r.pXbin, r.side from '''+options.schema+'''.TriggerRoadsTHitEvent'''+str(options.roadset)+''' te
left join test_MasterTriggerInfo.TriggerRoads_'''+str(options.roadset)+''' r
on te.roadID = r.roadID
where te.spillID='''+str(spill)+''';

Alter table eventRoads Add Index (`spillID`, `eventID`);
OPTIMIZE TABLE eventRoads;

create temporary table eventRoads2 like eventRoads;
insert into eventRoads2 select * from eventRoads;

create temporary table pairs
select p1.spillID, p1.eventID, p1.roadID as roadID1, p2.roadID as roadID2,
concat('X', p1.side, IF(p1.charge=1,'p','m')) as sideCharge1, p1.pXbin as pXbin1,
concat('X', p2.side, IF(p2.charge=1,'p','m')) as sideCharge2, p2.pXbin as pXbin2
from eventRoads p1 left join eventRoads2 p2
on p1.spillID=p2.spillID and p1.eventID=p2.eventID
where p1.roadID!=p2.roadID;

drop table if exists trigged;
create temporary table trigged
select x.spillID, x.eventID, z.trig
from pairs x
left join
test_MasterTriggerInfo.Level2_'''+str(options.L2)+''' z
using(sideCharge1, pXbin1, sideCharge2, pXbin2)
where z.type = 'dimuon'
group by eventID, trig;

SET SQL_SAFE_UPDATES = 0;

UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e
        inner join trigged t
            ON e.spillID=t.spillID and e.eventID = t.eventID
SET     MATRIX1=1
where t.trig=1;

UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e
        inner join trigged t
            ON e.spillID=t.spillID and e.eventID = t.eventID
SET     MATRIX2=1
where t.trig=2;

UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e
        inner join trigged t
            ON e.spillID=t.spillID and e.eventID = t.eventID
SET     MATRIX3=1
where t.trig=3;'''

        clearDimuons = '''use test_MasterTriggerInfo;
DROP TABLE IF EXISTS Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''';
CREATE TABLE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' like '''+options.schema+'''.Event;
INSERT INTO Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' select * from '''+options.schema+'''.Event;
SET SQL_SAFE_UPDATES = 0;
UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e Set MATRIX1=0;
UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e Set MATRIX2=0;
UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e Set MATRIX3=0;'''

        eventSingles = '''use test_MasterTriggerInfo;

drop table if exists eventRoads;

create temporary table eventRoads
select te.spillID, te.eventID, te.roadID, concat('X', r.side, IF(r.charge=1,'p','m')) as sideCharge1, r.pXbin as pXbin1
from '''+options.schema+'''.TriggerRoadsTHitEvent'''+str(options.roadset)+''' te
left join test_MasterTriggerInfo.TriggerRoads_'''+str(options.roadset)+''' r
on te.roadID = r.roadID
where te.spillID='''+str(spill)+''';

drop table if exists trigged;
create temporary table trigged
select x.spillID, x.eventID, z.trig
from eventRoads x
left join
test_MasterTriggerInfo.Level2_'''+str(options.L2)+''' z
using(sideCharge1, pXbin1)
where z.type = 'single'
group by eventID, trig;

SET SQL_SAFE_UPDATES = 0;

UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e
        inner join trigged t
            ON e.spillID=t.spillID and e.eventID = t.eventID
SET     MATRIX4=1
where t.trig=4;

UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e
        inner join trigged t
            ON e.spillID=t.spillID and e.eventID = t.eventID
SET     MATRIX5=1
where t.trig=5;'''

        clearSingles = '''use test_MasterTriggerInfo;
SET SQL_SAFE_UPDATES = 0;
UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e Set MATRIX4=0;
UPDATE Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' e Set MATRIX5=0;'''

        if spill == options.first:
            dimuonQuery = clearDimuons+eventDimuons
            singleQuery = clearSingles+eventSingles
        else:
            dimuonQuery = eventDimuons
            singleQuery = eventSingles

        port = 3306
        if options.host == 'seaquel.physics.illinois.edu':
            port = 3283
        with open('dimuonQuery.sql', 'w') as sqlDimuons:
            sqlDimuons.write(dimuonQuery)
        print "Begin Dimuon Event Update Query. Spill =", spill, time.time() - startTime
        os.system("mysql -u production --password='qqbar2mu+mu-' --port="+str(port)+" -h "+options.host+" < dimuonQuery.sql > dimuon.out")
        print "End Dimuon Event Update Query. Spill =", spill, time.time() - startTime
        os.remove("./dimuonQuery.sql")
        os.remove("./dimuon.out")

        with open('singleQuery.sql', 'w') as sqlSingles:
            sqlSingles.write(singleQuery)
        print "Begin Singles Event Update Query. Spill =", spill, time.time() - startTime
        os.system("mysql -u production --password='qqbar2mu+mu-' --port="+str(port)+" -h "+options.host+" < singleQuery.sql > single.out")
        print "End Singles Event Update Query. Spill =", spill, time.time() - startTime
        os.remove("./singleQuery.sql")
        os.remove("./single.out")
        #end loop through spills/spills

    if options.copy == True:
        copyEQuery = '''DROP TABLE IF EXISTS '''+options.schema+'''.Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''';
CREATE TABLE '''+options.schema+'''.Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' LIKE test_MasterTriggerInfo.Event_'''+str(options.roadset)+'''_'''+str(options.L2)+'''; 
INSERT INTO '''+options.schema+'''.Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''' SELECT * FROM test_MasterTriggerInfo.Event_'''+str(options.roadset)+'''_'''+str(options.L2)+''';'''
        with open('copyEQuery.sql', 'w') as sqlcopy:
            sqlcopy.write(copyEQuery)
	print "Begin Event Copy Query", time.time() - startTime
        os.system("mysql -u production --password='qqbar2mu+mu-' --port="+str(port)+" -h "+options.host+" < copyEQuery.sql > copy.out")
	print "End Event Copy Query", time.time() - startTime
        os.remove("./copyEQuery.sql")
        os.remove("./copy.out")











