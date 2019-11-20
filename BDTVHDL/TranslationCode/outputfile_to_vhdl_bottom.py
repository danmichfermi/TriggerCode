#reads an ouput file (ouput_file_102.txt) and defines cVars and oVars as std_logic vectors in vhd_text_top
#also makes if statements to give the cVars and oVars their values
#takes a minute to write for a ouput file with 10 trees
#uses top weight file for conversion


#converting ivar to its hodoname. Uses weight file
#converting ivar to its hodoname
#cfile = 'top_highxt_run5_all.txt'
cfile = 'botfinal.txt'

def number_to_hodo(index_number):
#	document = open('weight_file_top.txt')
	document = open('LRtop_m2_true_sigma.xml')
	for line in document:
		if 'Internal="h' in line:  #identifying which lines have h
			variable,varindex,expression,label,title,unit,internal,type,min,max = line.split()
			phrase,value = expression.split('=')
			var,index = varindex.split('=')
			index = index[1: len(index) - 1]
			value = value[1: len(value) -1]
			if index == index_number:
				return(value)

## function convert_to_VHD: for converting a hodoname into the VHD name

def convert_to_VHD (hodoname):   #for example hodoname = 'H1R10'
	VHD_name = ''
	if hodoname[1] == '4': #H4's
		value = int(hodoname[5:7])
		if hodoname[3] == '1': #H4Y1's
			VHD_name = VHD_name + 'D'
			if hodoname[4] == 'L': #H4Y1L's
				VHD_value = 16 - value
				if VHD_value < 10:
					VHD_name = VHD_name + '0%d'  %VHD_value
				if VHD_value >= 10:
					VHD_name = VHD_name + '%d'  %VHD_value
			if hodoname[4] == 'R': #H4Y1R's
				VHD_value = 24 - value
				VHD_value
				if VHD_value < 10:
					VHD_name = VHD_name + '0%d'  %VHD_value
				if VHD_value >= 10:
					VHD_name = VHD_name + '%d'  %VHD_value
		if hodoname[3] == '2': #H4Y2's
			VHD_name = VHD_name + 'E'
			if hodoname[4] == 'L': #H4Y2L's
				VHD_value = 16 - value
				if VHD_value < 10:
					VHD_name = VHD_name + '0%d'  %VHD_value
				if VHD_value >= 10:
					VHD_name = VHD_name + '%d' %VHD_value
			if hodoname[4] == 'R': #H4Y2R's
				value
				VHD_value = 24 - value
				if VHD_value < 10:
					VHD_name = VHD_name + '0%d'  %VHD_value
				if VHD_value >= 10:
					VHD_name = VHD_name +'%d'  %VHD_value
	if hodoname[1] == '2': #H2's
		VHD_name = VHD_name + 'B'
		value = int(hodoname[3:6])
		if hodoname[2] == 'l': #H2L's
			VHD_value = 19 - value
			if VHD_value < 10:
				VHD_name = VHD_name + '0%d'  %VHD_value
			if VHD_value >= 10:
				VHD_name = VHD_name  +'%d' %VHD_value	
		if hodoname[2] == 'r': #H2R's
			VHD_value = 29 - value
			if VHD_value < 10:
				VHD_name = VHD_name + '0%d'  %VHD_value
			if VHD_value >= 10:
				VHD_name = VHD_name + '%d'  %VHD_value	
	if hodoname[1] == '1': #H1's
		VHD_name = VHD_name + 'A'
		value = int(hodoname[3:6])
		if hodoname[2] =='l': #H1L's
			VHD_value = 20 - value
			if VHD_value < 10:
				VHD_name = VHD_name + '0%d'  %VHD_value
			if VHD_value >= 10:
				VHD_name = VHD_name + '%d'  %VHD_value	
		if hodoname[2] == 'r': #H1R's
			VHD_value = 30 - value
			if VHD_value < 10:
				VHD_name = VHD_name + '0%d'  %VHD_value
			if VHD_value >= 10:
				VHD_name = VHD_name + '%d'  %VHD_value	
			
	return(VHD_name)

#removes leading zeroes of a 4 digit number
def remove_leading_zeroes(number):
	if number == '0' or number == '00' or number == '000' or number == '0000':
		return ('0')
	for num in number:
		if num == '0':
			number = number[1:len(number)]
		else: 
			return(number)

#combining programs into one
def number_to_VHD(number):
	return convert_to_VHD(number_to_hodo(remove_leading_zeroes(number)))


#reading outputfile and translating lines where cVar = multiple ivars into vhdl language. Need to find notation for the cVars to finish righting it in VHDL
document = open(cfile)
document2 = open('vhd_text_bot.txt','w')
document3 = open('vhd_text_bot_tables.txt','w')

#define cvars and ovars in vhdl
for line in document:
	vhd_line = ''
	vars = {}
	if 'bool cVar' in line:
		bool, variable, equal_sign, ivars = line.split()
		#        signal PF_temp_lv1_00: std_logic_vector(   1 downto 0);
		document2.write(' ' * 8 + 'signal ' + variable + ': std_logic_vector(   0 downto 0);' + '\n')
	elif 'bool oVar' in line:
		bool, variable, equal_sign, ivars = line.split()
		document2.write(' ' * 8 + 'signal ' + variable + ': std_logic_vector(   0 downto 0);' + '\n')

document3.write("lookuptable_LV1 : process(c1)" + '\n' + 'begin' + '\n' + " if c1'event" + " and c1='1' then" + '\n')
document = open(cfile)
layer1=1
layer2=0
iterate=0
for line in document:
	iterate=iterate+1
	vhd_line = ''
	vars = {}
	if 'bool cVar' in line:
		bool, variable, equal_sign, ivars = line.split ()
		ivars = ivars[0: len(ivars) - 1]
		#splits up the cvar = ivars and cVars into sparate parts
		ivar_number = 0
		if variable.find('cVar1S')<0: 
			layer1=0
		for letter in ivars:
			if letter == 'v' or letter == 'V':
				ivar_number = ivar_number + 1
		for n in range(1,ivar_number+1):
			strtemp=str(n)
			vars['part' + strtemp] = ivars.split('&&')[n-1]
	if not layer1 and not layer2:
		layer2=1
		document3.write(' end if;' + '\n' + 'end process;' + '\n')
		document3.write("lookuptable_LV2 : process(c1)" + '\n' + 'begin' + '\n' + " if c1'event" + " and c1='1' then" + '\n')
	if 'int aVar' in line:
		int, variable, equal_sign, ivars = line.split()
#		if variable.find('3S')<0 and variable.find('2S')<0 and variable.find('1S')<0:
		if variable.find('2S')<0 and variable.find('1S')<0:
			document2.write(' ' * 8 + 'signal ' + variable + ': std_logic_vector(   15 downto 0);' + '\n')
	else :
		for n in range(1 , len(vars) + 1):
			part = 'part%d' % n
			if 'cVar' in vars[part]:
				vhd_line = vhd_line + vars[part] + "(0)='1' AND  "

			if 'ivar' in vars[part]:
				if vars[part][0] == '!':
					vhd_name = number_to_VHD(vars[part][5:])
					vhd_number = remove_leading_zeroes(vhd_name[1:])
					vhd_line = vhd_line + vhd_name[0:1] + '('  
					if len(vhd_number) == 1:
						vhd_line = vhd_line + ' ' + vhd_number + ")='0' "
					if len(vhd_number) == 2:
						vhd_line = vhd_line + vhd_number + ")='0' "
					if n < len(vars):
						vhd_line = vhd_line + 'AND '
				if vars[part][0] == 'i':
					vhd_name = number_to_VHD(vars[part][4:])
					vhd_number = remove_leading_zeroes(vhd_name[1:])
					vhd_line = vhd_line + vhd_name[0:1] + '('  
					if len(vhd_number) == 1:
						vhd_line = vhd_line + ' ' + vhd_number + ")='1' "
					if len(vhd_number) == 2:
						vhd_line = vhd_line + vhd_number + ")='1' "
					if n < len(vars):
						vhd_line = vhd_line + 'AND '
		if vhd_line != '':
			vhd_line = 'if(' + vhd_line + ')then'
			document3.write(' ' * 8 + vhd_line + '\n' + ' ' * 10 + variable + "(0) <='1';"+ '\n' + ' '*10 + 'else' + '\n' + ' '*10 + variable + "(0) <='0';" + '\n' + ' ' * 10 + 'end if;' + '\n')
document3.write(' end if;' + '\n' + 'end process;' + '\n')
document3.write("lookuptable_LV3 : process(c1)" + '\n' + 'begin' + '\n' + " if c1'event" + " and c1='1' then" + '\n')
document = open(cfile)
layer1=1
layer2=0
layer3=0
repeat=0
for line in document:
	vhd_line = ''
	vars = {}
	if 'bool oVar' in line:
		bool, variable, equal_sign, ivars = line.split ()
		ivars = ivars[0: len(ivars) - 1]
		if variable.find('oVar1S')<0:
			layer1=0
		if variable.find('oVar2S')<0:
			layer2=0
			if layer1==0:
				layer3=1
		#splits up the ovar = ivars and cVars into sparate parts
		ivar_number = 0
		for letter in ivars:
			if letter == 'v' or letter == 'V':
				ivar_number = ivar_number + 1
		for n in range(1,ivar_number+1):
			strtemp=str(n)
			vars['part' + strtemp] = ivars.split('||')[n-1]
	if not layer1 and not layer2 and not layer3 :
		layer2=1
		document3.write(' end if;' + '\n' + 'end process;' + '\n')
		document3.write("lookuptable_LV4 : process(c1)" + '\n' + 'begin' + '\n' + " if c1'event" + " and c1='1' then" + '\n')
	if layer3 and not repeat:
#		repeat=1
#		document3.write(' end if;' + '\n' + 'end process;' + '\n')
#		document3.write("lookuptable_LV5 : process(c1)" + '\n' + 'begin' + '\n' + " if c1'event" + " and c1='1' then" + '\n')
		continue
	if 'aVar' in line:
		continue
	else :
		for n in range(1 , len(vars) + 1):
			part = 'part%d' %n
			if vars[part][0] == '!':
				vhd_line = vhd_line + vars[part] + "='0' "
				if n < len(vars):
					vhd_line = vhd_line + 'OR '
			if vars[part][0] == 'c' or vars[part][0] == 'o':
				vhd_line = vhd_line + vars[part] + "(0)='1'  "
				if n < len(vars):
					vhd_line = vhd_line + 'OR '
		if vhd_line != '':
			vhd_line = 'if(' + vhd_line + ')then'
			document3.write(' ' * 8 + vhd_line + '\n' + ' ' * 10 + variable + "(0) <='1';"+ '\n' + ' '*10 + 'else' + '\n' + ' '*10 + variable + "(0) <='0';" + '\n' + ' ' * 10 + 'end if;' + '\n')
document3.write(' end if;' + '\n' + 'end process;' + '\n')

document.seek(0) #returns the cursor to the top of the output file
outFile = open('aVarOutputbot.txt', 'w') #this will be the file to write to
lineNum = 1 #this helps serialize the adders
pastl4 = 0
pastl5 = 0
pastl6 = 0
#outFile.write("lookuptable_LV_7 : process(c1)"+ '\n')
#outFile.write("begin"+ '\n')
#outFile.write(" if c1'event and c1='1' then"+ '\n')
for line in document:
    if ('aVar4S' in line) or ('aVar5S' in line) or \
    ('aVar6S' in line) or ('aVar7S' in line) and ('aVar7S0;' not in line):  
        tempStr = line
        a1 = tempStr[tempStr.find('aV') : tempStr.find('=') - 1]
        a2 = tempStr[tempStr.find('=') + 2 : tempStr.find('+')]
        a3 = tempStr[tempStr.find('+') + 1 : tempStr.find(';')]
#	if('5S' in a1 and not pastl4):
#		pastl4 = 1
#		outFile.write(" end if;"+ '\n')
#		outFile.write("end process;"+ '\n')
#		outFile.write("lookuptable_LV_8 : process(c1)"+ '\n')
#		outFile.write("begin"+ '\n')
#		outFile.write(" if c1'event and c1='1' then"+ '\n')
#	if('6S' in a1 and not pastl5):
#		pastl5 = 1
#		outFile.write(" end if;"+ '\n')
#		outFile.write("end process;"+ '\n')
#		outFile.write("lookuptable_LV_9 : process(c1)"+ '\n')
#		outFile.write("begin"+ '\n')
#		outFile.write(" if c1'event and c1='1' then"+ '\n')
#	if('7S' in a1 and not pastl6):
#		pastl6 = 1
#		outFile.write(" end if;"+ '\n')
#		outFile.write("end process;"+ '\n')
#		outFile.write("lookuptable_LV_10 : process(c1)"+ '\n')
#		outFile.write("begin"+ '\n')
#		outFile.write(" if c1'event and c1='1' then"+ '\n')
        outFile.write('Adder_' + str(lineNum) + ':' + ' Adder_type'+ '\n')
        outFile.write('port map(' + '\n')
        outFile.write('dataa' + ' => ' + a2  + ', \n')
        outFile.write('datab' + ' => ' + a3  + ', \n')
        outFile.write( 'result' + ' => ' +a1 + '\n')
        outFile.write(');' + '\n')
        outFile.write('\n')
        lineNum = lineNum + 1
#outFile.write(" end if;"+ '\n')
#outFile.write("end process;"+ '\n')
outFile.close()
