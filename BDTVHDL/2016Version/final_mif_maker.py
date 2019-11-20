# examines an ouput file (outputfile102.txt) and makes MIF files for the aVars (2nd and 3rd layer). Also prepares lines to be written in vhdl
# makes the MIFs in the  MIF files folder inside MIF folder inside Documents (/u/home/swaraj/Documents/MIF/mif_files)
# holds lines to be written in vhdl in lists with vhdl in the name:: avar_vector_vhdl, ovar_definitions_vhdl, ram_lines_vhdl

#grabs information from ouput file
outputFile = open('outputfile100.txt')#output_file_102.txt
#outputFile = open('output_file_102.txt')
mif_list = []
boost_values = []
avar1_values = []
boost_weights = {}
avar3_values = []
boost_weight_ovars = {}
ovar_or_statements = {}

#New definitions
treeHolder = []
boostWeightHolder = 128*['']

#length of or statements = 4 
for line in boost_values:#Not sure if this does anything
    boost_weights['boostWeight' + line[17:20]] =  line[25:len(line)]

#This sequence gooes through the teh file and outputs data to different arrays
for line in outputFile:
    #Searches for lines with boostWeight definitions
    if 'int boostWeight' in line or 'float boostWeight' in line:
        boost_values.append(line[0:len(line) - 2])
        tempStr1, tempStr2 = line.split('=')
        tempStr1 = tempStr1[len(tempStr1) - 5:]
        tempStr2 = tempStr2[1: tempStr2.find(';')]
        boostWeightHolder[int(tempStr1)] = tempStr2

    #Searches for !oVars statements
    #EX(if (!oVar1S2){boostWeight001 = -1.0*boostWeight001;})
    if '!oVar' in line:
        tempInt1 = line.find(' =') - 3
        tempInt2 = line.find('(!') + 2
        tempInt3 = line.find('){')
        boost_number = line[tempInt1: tempInt1 + 3]#Becomes the number(###) in the boosWeight###
        boost_weight_ovars[boost_number] = line[tempInt2:tempInt3]#line[tempInt2:tempInt3] is the oVar

    #Searches for oVar definition statements
    #EX(bool oVar1S0 = cVar1N054nsss||cVar1N054P046nsss||cVar1N054P046P051nsss||cVar1N054P046P051P048nsss;)
    if 'bool oVar' in line:
        tempInt1 = line.find('bool ') + 5
        tempInt2 = line.find(' =')
        tempInt3 = line.find(';')
        #First statement becomes the oVar being defined and the last part becomes the right hand side of the equation without the semilicolon
        ovar_or_statements[line[tempInt1: tempInt2]] = line[tempInt2+3:tempInt3]

    #Searches for aVar1 lines
    if 'int aVar1' in line:
        avar1_values.append(line[0:len(line) - 2])
        treeHolder.append(line[line.find(' = ') + 3: line.find(';')])

    #Searches for aVar2 lines
    if 'int aVar2' in line and '= aVar1' in line:
        mif_list.append(line[0:len(line) - 2])

    #Searches for aVar3 lines
    if 'int aVar3' in line and '= aVar2' in line:
        avar3_values.append(line[0:len(line) - 2])

outputFile.close()

#Sequence populates an tuple with the boostWeight### and the number that it equals
boost_weights = {}
for line in boost_values:
        tempInt1 = line.find('Weight') + 6
        tempInt2 = line.find('= ') + 2
        boost_weights['boostWeight' + line[tempInt1: tempInt1 + 3]] =  line[tempInt2:]

#Sequence populates a tuple with the aVar1 and the boostWeights that they equal to.
#EX(aVar1S# = boostweight### + boostWeight### and outputs: aVar1S = ['###','###'] or aVar1S = ['###'] if there is only one)
avar1_boost_numbers = {}
for line in avar1_values: 
    if '+' in line and '+0' not in line:
        tempInt1 = line.find('int ') + 4
        tempInt2 = line.find(' =')
        tempInt3 = line.find('+') - 3
        avar1_boost_numbers[line[tempInt1:tempInt2]] = [line[tempInt3: tempInt3 + 3], line[len(line) - 3:]]
    else:
        avar1_boost_numbers[line[tempInt1:tempInt2]] = [line[tempInt3:tempInt3 + 3]]

#This sequence populates a tuple for aVar2s in the mif_list and the aVar1s that they are equal to.
#Then appends the avar2_boost_numbers Im still not completey sure why here.
#Mif_2Layer Routine
avar2_boost_numbers = {}
for line in mif_list:
    aBegin = line.find('aVar2')
    aEnd = line.find(' =')
    avar2_boost_numbers[line[aBegin:aEnd]] = []
    if '+' in line:
        tempInt1 = line.find('= ') + 2
        tempInt2 = line.find('+')
        for boost_number in avar1_boost_numbers[line[tempInt1:tempInt2]]:
            avar2_boost_numbers[line[aBegin:aEnd]].append(boost_number)
        for boost_number in avar1_boost_numbers[line[tempInt2 + 1:]]:
            avar2_boost_numbers[line[aBegin:aEnd]].append(boost_number)
    else:
        for boost_number in avar1_boost_numbers[line[line.find('= ') + 2:]]:
            avar2_boost_numbers[line[aBegin:aEnd]].append(boost_number)

#This sequence populates a tuple for aVar3s and the aVar2s that they are equal to.
#Then appends the avar3_boost_numbers Im still not completey sure why here.
#Mif_3Layer Routine
avar3_boost_numbers = {}
for line in avar3_values:
    aBegin = line.find('aVar3')
    aEnd = line.find(' =')
    avar3_boost_numbers[line[aBegin:aEnd]] = []
    if '+' in line:
        tempInt1 = line.find('= ') + 2
        tempInt2 = line.find('+')
        for boost_number in avar2_boost_numbers[line[tempInt1:tempInt2]]:
            avar3_boost_numbers[line[aBegin:aEnd]].append(boost_number) 
        for boost_number in avar2_boost_numbers[line[tempInt2 + 1:]]:
            avar3_boost_numbers[line[aBegin:aEnd]].append(boost_number)
    else:
        for boost_number in avar2_boost_numbers[line[line.find('= ') + 2:]]:
            avar3_boost_numbers[line[aBegin:aEnd]].append(boost_number)

#Binary and Hexidecimal Function definitions#####################
def hex_to_int(hexadecimal):
        return(int(hexadecimal,16))

def binary(number):
    result = str(bin(number)[ 2 : len(bin(number))])
    zeroes = 4 - len(result)
    for number in range(0,zeroes):
        result = '0' + result
    return (result)

def hex_to_binary(number):
    return binary(hex_to_int(number))

#def binary_2(number):
#    if number >= 0:
#        result = str(bin(number)[ 2 : len(bin(number))])
#        zeroes = bit_len - len(result)
#        for number in range(0,zeroes):
#            result = '0' + result
#    if number < 0:
#        result = str(bin(number)[ 3 : len(bin(number))])
#        zeroes = bit_len - len(result)
#        for number in range(1,zeroes):
#            result = '0' + result
#        result = '-' + result
#    return (result)

def binary_2(number):
    if number >= 0:
        result = str(bin(number)[ 2 : len(bin(number))])
        zeroes = bit_len - len(result)
        for number in range(0,zeroes):
            result = '0' + result
    if number < 0:
        #zeroes = bit_len - len(result)
        subtractionnum=1
        for z in range(0,bit_len):
            subtractionnum=subtractionnum*2
        number=number+subtractionnum
        result = str(bin(number)[ 2 : len(bin(number))])
    return (result)
###################################################################

#makes MIF files
bit_len = 16  #set this
mif_number = 1
mif_lines = {}
for number in range(1,len(avar2_boost_numbers) + 1):
    mif_lines[number] = []

#print mif_lines
#Sign indicator is for ram. So every possibility of positive and negative and when the addition is just picking one way or the other.
for line in mif_list:
    #document.write('Depth = 32;' + '\n' + 'Width = 8;' + '\n' + 'ADRESS RADIX = HEX;' + '\n' + 'DATA RADIX = BIN;' + '\n' + 'CONTENT ' + str(mif_number) + '\n' + 'BEGIN' + '\n')
    start_list = ['00','01', '02', '03', '04', '05', '06', '07', '08', '09', '0A', '0B', '0C', '0D', '0E', '0F']
    #             0000 0001  0010  0011  0100  0101  0110  0111  1000  1001  1010  1011  1100  1101  1110  1111
    binary_list = []
    value_list_scaled = []
    for number in start_list:
        binary_list.append(hex_to_binary(number))
    boost_weight_values = []
    boost_weight_numbers = avar2_boost_numbers[line[line.find('aVar2'):line.find(' =')]]#finds aVar2's
    #This is actually a tuple of the addition that goes into aVar2's.
    #EX: aVar2S1 = aVar1S1 + aVar1S2
    #    aVar1S1 = boostWeight001+boostWeight002
    #    aVar1S2 = boostWeight003+boostweight004
    #then boost_weight_numbers becomes ['001','002','003','004']
    #print boost_weight_numbers
    
    for number in boost_weight_numbers:
        boost_weight_values.append(boost_weights['boostWeight' + number])#finds the numbers corresponding to the boostWeights so ### in boostWeight###
    if len(boost_weight_numbers) == 2:
        for num in binary_list[0:4]:
            counter = 0
            avar_sum = 0
            for sign_indicator in num[2:4]:
                if sign_indicator == '1':
                    avar_sum += float(boost_weight_values[counter])
                if sign_indicator == '0':
                    avar_sum += -1 * float(boost_weight_values[counter])
                counter += 1
            #value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
            value_list_scaled.append(int(avar_sum))
        #print counter
    elif len(boost_weight_numbers) == 4:
        for num in binary_list:
            counter = 0
            avar_sum = 0
                 #Using 1 for negative and 0 for posiive 
            for sign_indicator in num:
                if sign_indicator == '1':
                    avar_sum += float(boost_weight_values[counter])
                if sign_indicator == '0':
                    avar_sum += -1 * float(boost_weight_values[counter])
                counter += 1
            #value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
            value_list_scaled.append(int(avar_sum))
    elif len(boost_weight_numbers) == 1:
        for num in binary_list:
            counter = 0
            avar_sum = 0
            for sign_indicator in num:
                if sign_indicator == '1':
                    avar_sum = float(boost_weight_values[counter])
                if sign_indicator == '0':
                    avar_sum = -1 * float(boost_weight_values[counter])
            #value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
            value_list_scaled.append(int(avar_sum))
    for num in range(0,len(value_list_scaled)):
        line = start_list[num] + ' : ' + str(binary_2(value_list_scaled[num])) + ';'
        mif_lines[mif_number].append(line)
    mif_number += 1


mif_number_3layer = 0
mif_lines_3layer = {}
start_list_3layer = []
for number in range(1,len(avar3_boost_numbers) + 1):
    mif_lines_3layer[number] = []

for num in range(0,256):
    hexa = hex(num)
    hexa = hexa[2:len(hexa)]
    if len(hexa) == 1:
        hexa = '0' + hexa
    start_list_3layer.append(hexa)

for line in avar3_values:
    mif_number_3layer += 1
    binary_list = []
    for number in start_list_3layer:
        binary_list.append(binary(hex_to_int(number)))
    tempInt1 = line.find('aVar3')
    tempInt2 = line.find(' =')
    #boost_weight_numbers = avar3_boost_numbers[line[4:11]]
    boost_weight_numbers = avar3_boost_numbers[line[tempInt1:tempInt2]]
    boost_weight_values = []
    for number in boost_weight_numbers:
        boost_weight_values.append(boost_weights['boostWeight' + number])

    value_list_scaled = []
    if len(boost_weight_numbers) == 2:
        for num in binary_list[0:4]:
            counter = 0
            avar_sum = 0
            for sign_indicator in num[2:4]:
                if sign_indicator == '1':
                    avar_sum += float(boost_weight_values[counter])
                if sign_indicator == '0':
                    avar_sum += -1 * float(boost_weight_values[counter])
                counter += 1
            #value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
            value_list_scaled.append(int(avar_sum))
    if len(boost_weight_numbers) == 4:
        for num in binary_list[0:16]:
            counter = 0
            avar_sum = 0
            for sign_indicator in num[0:4]:
                if sign_indicator == '1':
                    avar_sum += float(boost_weight_values[counter])
                if sign_indicator == '0':
                    avar_sum += -1 * float(boost_weight_values[counter])
                counter += 1
            #value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
            value_list_scaled.append(int(avar_sum))
    if len(boost_weight_numbers) == 8:
        for num in binary_list:
            counter = 0
            avar_sum = 0
            for sign_indicator in num:
                if sign_indicator == '1':
                    avar_sum += float(boost_weight_values[counter])
                if sign_indicator == '0':
                    avar_sum += -1 * float(boost_weight_values[counter])
                counter += 1
            #value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
            value_list_scaled.append(int(avar_sum))
    #added by Marshall Scott
    if len(boost_weight_numbers) == 7:
        for num in binary_list:
            counter = 0
            avar_sum = 0
            for sign_indicator in num:
                if sign_indicator == '1':
                    avar_sum += float(boost_weight_values[counter])
                if sign_indicator == '0':
                    avar_sum += -1 * float(boost_weight_values[counter])
                counter += 1
            #value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
            value_list_scaled.append(int(avar_sum))
    if len(boost_weight_numbers) == 1:#This shouldn't ever happen, but I'm adding just in case
        for num in binary_list:
            counter = 0
            avar_sum = 0
            for sign_indicator in num:
                if sign_indicator == '1':
                    avar_sum = float(boost_weight_values[counter])
                if sign_indicator == '0':
                    avar_sum = -1 * float(boost_weight_values[counter])
            #value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
            value_list_scaled.append(int(avar_sum))
    for num in range(0,len(value_list_scaled)):
        line = start_list_3layer[num] + ' : ' + str(binary_2(value_list_scaled[num])) + ';'
        mif_lines_3layer[mif_number_3layer].append(line)
    #document.write('end;' + '\n')


for number in range(1, len(mif_lines) + 1):
    #print '/u/home/swaraj/Documents/MIF/mif_files/mif_file_%d' %number + '.mif'
    document = open('mif.files/mif_file_%d' %number + '.mif','w')
    document.write('Depth = %d' %len(mif_lines[number]) + ';' + '\n' + 'Width = ' + str(bit_len) + ';' + '\n' + 'ADRESS RADIX = HEX;' + '\n' + 'DATA RADIX = BIN;' + '\n' + 'CONTENT'  + '\n' + 'BEGIN' + '\n')
    for line in mif_lines[number]:
        document.write(line + '\n')
    document.write('end;')

for number in range(1, len(mif_lines_3layer) + 2):
    #print 'mif.files/3_layer_mif_file_%d' %number + '.mif'
    try:
        document = open('mif.files/3_layer_mif_file_%d' %number + '.mif','w')
        document.write('Depth = %d' %len(mif_lines_3layer[number]) + ';' + '\n' + 'Width = ' + str(bit_len) + ';' + '\n' + 'ADRESS RADIX = HEX;' + '\n' + 'DATA RADIX = BIN;' + '\n' + 'CONTENT'  + '\n' + 'BEGIN' + '\n')
        for line in mif_lines_3layer[number]:
            document.write(line + '\n')
        document.write('end;')
    except KeyError:
        break
    
#Newly added
count = 0
avarLevel1 = []
sign = []
sign.append('11')
sign.append('01')
sign.append('10')
sign.append('00')

for element in treeHolder:
    tempStr1, tempStr2 = element.split('+')
    tempStr1 = tempStr1[len(tempStr1) - 3 :]
    tempStr2 = tempStr2[len(tempStr2) - 3 :]
    for i in range(0, 4):
        avarLevel1.append(bin(count)[2: ].zfill(6) + sign[i] + " " + tempStr1 + " " + tempStr2)
    count = count + 1

#print avarLevel1
 
#prepares information to be written in vhdl
#avar2_boost_numbers.keys is the label of the avar2
#ex.avarboost_numbers[0] = 'aVar2S18': ['095', '047', '049', '061']
#The key would be aVar2S18, and the other nuumbers correspond to the boostweights
#used to sum to that number
#Note: the naming after ADDM4K is either #S## or S##
avar_vector_vhdl = []
add_m4k_ovar = {}
for key in avar2_boost_numbers.keys():
    top_value = len(avar2_boost_numbers[key])  - 1 #this is is always 3
    #signal AddM4K1S2: std_logic_vector(   7 downto 0);
    #add_m4k_name = 'ADDM4K' + key[len(key) -3:len(key)]
    tempName = key[key.find("aVar") + 4:]#added by marshall
    add_m4k_name = 'ADDM4K' + tempName
    add_m4k_ovar[add_m4k_name] = avar2_boost_numbers[key]
    line = 'signal ' + add_m4k_name + ': std_logic_vector(   ' + str(top_value) + ' downto 0);' + '\n'
    avar_vector_vhdl.append(line)
for key in avar3_boost_numbers.keys():
    top_value = len(avar3_boost_numbers[key])  - 1
    #signal AddM4K1S2: std_logic_vector(   7 downto 0);
    #add_m4k_name = 'ADDM4K' + key[len(key) -3:len(key)]
    tempName = key[key.find("aVar") + 4:]#added by marshall
    add_m4k_name = 'ADDM4K' + tempName
    add_m4k_ovar[add_m4k_name] = avar3_boost_numbers[key]
    line = 'signal ' + add_m4k_name + ': std_logic_vector(   ' + str(top_value) + ' downto 0);' + '\n'
    avar_vector_vhdl.append(line)

#print avar_vector_vhdl, add_m4k_ovar
ovar_definitions_vhdl = []
ovar_definitions_vhdl_2 = []
ovar_definitions_vhdl_3 = []
for key in add_m4k_ovar.keys():
    counter = 0
    for boost_weight in add_m4k_ovar[key]:
        line = ''
        ovar = boost_weight_ovars[boost_weight]
        or_statement = ovar_or_statements[ovar]
        part1, part2, part3, part4 = or_statement.split('||')
        or_statement_2 = 'if(' + part1 + "='1' OR " + part2 + "='1' OR " + part3 + "='1' OR " + part4 + "='1' )then"
        line += ' ' * 8 + or_statement_2 + '\n'  
        line += ' ' * 10 + key + '(%d' %counter + ")<='1'" + '\n'  
        line += ' ' * 10 + 'else' + '\n' 
        line += ' ' * 10 + key + '(%d' %counter + ")<='0'" + '\n' 
        line += ' ' * 10 + 'end if;' + '\n'
        ovar_definitions_vhdl.append(line)
        if key.find('2S') > 0:
            ovar_definitions_vhdl_2.append(line)
        if key.find('3S') > 0:
            ovar_definitions_vhdl_3.append(line)
        counter += 1
        #print key

#Defining the variables needs to look like
#       if(STUFF='1' OR STUFF_2='1' )then
#       NEWSTATEMENT( 12)<='1'
#    else
 #      cVar1P018N009N006N019<='0';
  #     end if;
#print ovar_definitions_vhdl

#Old ram_lines code
#ram_lines_vhdl = []
#for key in add_m4k_ovar.keys():
#    length = len(add_m4k_ovar[key])
#    for number in range(0,length):
#        line = ''
#        line = key + '_%d' %number + ': ' + key + '_2_%d' %number + ' PORT MAP (' + "\n"
#        line += ' ' * 16 + 'clock' + '    => clock'  + '_%d' %number + '\n'
#        line += ' ' * 16 + 'data' + '    => data'  + '_%d' %number + '\n'
#        line += ' ' * 16 + 'rdaddress' + '    => ' + key   + '(%d' %number + ')' + '\n'
#        line += ' ' * 16 + 'wraddress' + '    => wraddress'  + '_%d' %number  + '\n'
#        line += ' ' * 16 + 'wren' + '    => wren'  + '_%d' %number + '\n'
#        line += ' ' * 16 + 'q' + '    => q'  + '_%d' %number + '\n'
#        ram_lines_vhdl.append(line)
       
ram_lines_vhdl = []
for key in add_m4k_ovar.keys():
    line = ''
    line = key + ': ' + key + ' PORT MAP (' + "\n"
    line += ' ' * 16 + 'clock' + '    => c1'  + ',' + '\n' #changed to c1
    #line += ' ' * 16 + 'data' + '    => data'  + '\n'
    line += ' ' * 16 + 'rdaddress' + '    => ' + key  + ',' + '\n'
    #line += ' ' * 16 + 'wraddress' + '    => wraddress'  + '\n'
    #line += ' ' * 16 + 'wren' + '    => wren'  + '\n'
    line += ' ' * 16 + 'q' + '    => q'  + '\n'
    ram_lines_vhdl.append(line)

#VHDL and ram output Routine
vhdOutputFile = open('vhd_text.txt','w') 
vhdOutSig1    = open('vhd_text_signal_1.txt','w')
vhdOutSig3    = open('vhd_text_signal_3.txt','w')
vhdOutOvar2   = open('vhd_text_ovar_2.txt','w')
vhdOutOvar3   = open('vhd_text_ovar_3.txt','w')
vhdOutAdd2    = open('vhd_text_add_2.txt','w')
vhdOutAdd3    = open('vhd_text_add_3.txt','w')
ramOutputFile = open('ramOutput.txt', 'w')
ramOut_2      = open('ram_Output_2.txt', 'w')
ramOut_3      = open('ram_Output_3.txt', 'w')

for line in avar_vector_vhdl:
    if line[:6] == 'signal':
        if line.find('3S') > 0:
            vhdOutSig3.write(line)
        else:
            vhdOutSig1.write(line)
    vhdOutputFile.write(line)
vhdOutSig1.close()
vhdOutSig3.close()

#Old output routine
#for line in ovar_definitions_vhdl:
#    vhdOutputFile.write(line)

for line in ovar_definitions_vhdl_2:
        #if line.find('if(oVar') > 0:
            #if line.find('ADDM4K2S') > 0:
        vhdOutOvar2.write(line)
for line in ovar_definitions_vhdl_3:
        #if line.find('if(oVar') > 0:
         #   if line.find('ADDM4K3S') > 0:
        vhdOutOvar3.write(line)
vhdOutOvar2.close()
vhdOutOvar3.close()

for line in ram_lines_vhdl:
    if line[:3] == 'ADD':
        if line.find('2S') > 0:
            vhdOutAdd2.write(line)
            tempStr = line[line.find('ADD'): line.find(':')]
            ramOut_2.write('component ' + tempStr + '\n')
            ramOut_2.write('    PORT' + '\n')
            ramOut_2.write('    (' + '\n')
            ramOut_2.write('        clock        : IN STD_LOGIC ;' + '\n')
            ramOut_2.write('        data        : IN STD_LOGIC_VECTOR (15 DOWNTO 0);' + '\n')#was 7
            ramOut_2.write('        rdaddress        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);' + '\n')#was 8 
            ramOut_2.write('        wraddress        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);' + '\n')
            ramOut_2.write('        wren        : IN STD_LOGIC  := \'1\';' + '\n')
            ramOut_2.write('        q        : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)' + '\n')
            ramOut_2.write('    );' + '\n')
            ramOut_2.write('end component;' + '\n')
            ramOut_2.write('\n')
        if line.find('3S') > 0:
            vhdOutAdd3.write(line)
            tempStr = line[line.find('ADD'): line.find(':')]
            ramOut_3.write('component ' + tempStr + '\n')
            ramOut_3.write('    PORT' + '\n')
            ramOut_3.write('    (' + '\n')
            ramOut_3.write('        clock        : IN STD_LOGIC ;' + '\n')
            ramOut_3.write('        data        : IN STD_LOGIC_VECTOR (15 DOWNTO 0);' + '\n')#was 7
            ramOut_3.write('        rdaddress        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);' + '\n')#was 8 
            ramOut_3.write('        wraddress        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);' + '\n')
            ramOut_3.write('        wren        : IN STD_LOGIC  := \'1\';' + '\n')
            ramOut_3.write('        q        : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)' + '\n')
            ramOut_3.write('    );' + '\n')
            ramOut_3.write('end component;' + '\n')
            ramOut_3.write('\n')
    vhdOutputFile.write(line)
    
    #This outputs the ram lines with the correct syntax. This is the old code.
    if line[0:3] == 'ADD':
        tempStr = line[line.find('ADD'): line.find(':')]
        ramOutputFile.write('component ' + tempStr + '\n')
        ramOutputFile.write('    PORT' + '\n')
        ramOutputFile.write('    (' + '\n')
        ramOutputFile.write('        clock        : IN STD_LOGIC ;' + '\n')
        ramOutputFile.write('        data        : IN STD_LOGIC_VECTOR (15 DOWNTO 0);' + '\n')#was 7
        ramOutputFile.write('        rdaddress        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);' + '\n')#was 8 
        ramOutputFile.write('        wraddress        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);' + '\n')
        ramOutputFile.write('        wren        : IN STD_LOGIC  := \'1\';' + '\n')
        ramOutputFile.write('        q        : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)' + '\n')
        ramOutputFile.write('    );' + '\n')
        ramOutputFile.write('end component;' + '\n')
        ramOutputFile.write('\n')

vhdOutputFile.close()
ramOutputFile.close()
ramOut_2.close()
ramOut_3.close()

#vhdl line: avar_vector_vhdl, ovar_definitions_vhdl, ram_lines_vhdl
     




