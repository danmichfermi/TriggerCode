# examines an ouput file (outputfile102.txt) and makes MIF files for the aVars (2nd and 3rd layer). Also prepares lines to be written in vhdl
# makes the MIFs in the  MIF files folder inside MIF folder inside Documents (/u/home/swaraj/Documents/MIF/mif_files)
# holds lines to be written in vhdl in lists with vhdl in the name:: avar_vector_vhdl, ovar_definitions_vhdl, ram_lines_vhdl

#grabs information from ouput file
document2 = open('outputfile99.txt')
mif_list = []
boost_values = []
avar1_values = []
boost_weights = {}
avar3_values = []
boost_weight_ovars = {}
ovar_or_statements = {}
#length of or statements = 4 
for line in boost_values:
	boost_weights['boostWeight' + line[17:20]] =  line[25:len(line)]

for line in document2:
	if 'int aVar2' in line and '= aVar1' in line:
		mif_list.append(line[0:len(line) - 2])
	if 'float boostWeight' in line:
		boost_values.append(line[0:len(line) - 2])
	if 'int aVar1' in line:
		avar1_values.append(line[0:len(line) - 2])
	if 'int aVar3' in line and '= aVar2' in line:
		avar3_values.append(line[0:len(line) - 2])
	for num in range (0,10):
		boost_number = '00' + str(num)
		if '!oVar' in line and boost_number in line:
			part1, part2 = line.split(')')
			boost_weight_ovars[boost_number] =  part1[5:len(part1)]
	if 'bool oVar' in line:
		part1, part2 = line.split('=')
		ovar_or_statements[part1[5 : len(part1) - 1]] = part2[1:len(part2) - 2]

#print boost_weight_ovars, ovar_or_statements
#print mif_list, boost_values, 
#print mif_list, avar1_values
print avar3_values
boost_weights = {}
for line in boost_values:
	boost_weights['boostWeight' + line[17:20]] =  line[25:len(line)]

avar1_boost_numbers = {}
for line in avar1_values:
	if '+' in line:
		avar1_boost_numbers[line[4:11]] = [line[25:28], line[40:43]]
	else:
		avar1_boost_numbers[line[4:11]] = [line[25:28]]

print avar1_boost_numbers
avar2_boost_numbers = {}
for line in mif_list:
	avar2_boost_numbers[line[4:11]] = []
	if '+' in line:
		for boost_number in avar1_boost_numbers[line[14:21]]:
			avar2_boost_numbers[line[4:11]].append(boost_number) 
		for boost_number in avar1_boost_numbers[line[22:29]]:
			avar2_boost_numbers[line[4:11]].append(boost_number)
	else:
		for boost_number in avar1_boost_numbers[line[14:21]]:
			avar2_boost_numbers[line[4:11]].append(boost_number)


print avar2_boost_numbers
avar3_boost_numbers = {}
for line in avar3_values:
	avar3_boost_numbers[line[4:11]] = []
	if '+' in line:
		for boost_number in avar2_boost_numbers[line[14:21]]:
			avar3_boost_numbers[line[4:11]].append(boost_number) 
		for boost_number in avar2_boost_numbers[line[22:29]]:
			avar3_boost_numbers[line[4:11]].append(boost_number)
	else:
		for boost_number in avar2_boost_numbers[line[14:21]]:
			avar3_boost_numbers[line[4:11]].append(boost_number)

print avar3_boost_numbers
#print boost_weights
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

def binary_2(number):
	if number >= 0:
		result = str(bin(number)[ 2 : len(bin(number))])
		zeroes = bit_len - len(result)
		for number in range(0,zeroes):
			result = '0' + result
	if number < 0:
		zeroes = bit_len - len(result)
		subtractionnum=1
		for z in range(0,bit_len):
			subtractionnum=subtractionnum*2
		number=number+subtractionnum
		result = str(bin(number)[ 2 : len(bin(number))])
	return (result)


#makes MIF files
bit_len = 16  #set this
mif_number = 1
mif_lines = {}
for number in range(1,len(avar2_boost_numbers) + 1):
	mif_lines[number] = []

#print mif_lines
for line in mif_list:
	#document.write('Depth = 32;' + '\n' + 'Width = 8;' + '\n' + 'ADRESS RADIX = HEX;' + '\n' + 'DATA RADIX = BIN;' + '\n' + 'CONTENT ' + str(mif_number) + '\n' + 'BEGIN' + '\n')
	start_list = ['00','01', '02', '03', '04', '05', '06', '07', '08', '09', '0A', '0B', '0C', '0D', '0E', '0F']
	#             0000 0001  0010  0011  0100  0101  0110  0111  1000  1001  1010  1011  1100  1101  1110  1111
	binary_list = []
	value_list_scaled = []
	for number in start_list:
		binary_list.append(hex_to_binary(number))
	boost_weight_values = []
	boost_weight_numbers = avar2_boost_numbers[line[4:11]]
	for number in boost_weight_numbers:
		boost_weight_values.append(boost_weights['boostWeight' + number])
	#print boost_weight_numbers, boost_weight_values
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
			value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
	elif len(boost_weight_numbers) == 4:
		for num in binary_list:
			counter = 0
			avar_sum = 0
			for sign_indicator in num:
				if sign_indicator == '1':
					avar_sum += float(boost_weight_values[counter])
				if sign_indicator == '0':
					avar_sum += -1 * float(boost_weight_values[counter])
				counter += 1
			value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
	#print value_list
	for num in range(0,len(value_list_scaled)):
		line = start_list[num] + ' : ' + str(binary_2(value_list_scaled[num])) + ';'
		#print 'step1'
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
	boost_weight_values = []
	boost_weight_numbers = avar3_boost_numbers[line[4:11]]
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
			value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
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
			value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
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
			value_list_scaled.append(int(avar_sum * 252 / len(boost_weight_numbers)))
	for num in range(0,len(value_list_scaled)):
		line = start_list_3layer[num] + ' : ' + str(binary_2(value_list_scaled[num])) + ';'
		#print 'step1'
		mif_lines_3layer[mif_number_3layer].append(line)
	#document.write('end;' + '\n')



for number in range(1,len(mif_lines) + 1):
	#print '/u/home/swaraj/Documents/MIF/mif_files/mif_file_%d' %number + '.mif'
	document = open('/home/dhmorton/Downloads/files.Daniel/mif_files/mif_file_%d' %number + '.mif','w')
	document.write('Depth = %d' %len(mif_lines[number]) + ';' + '\n' + 'Width = ' + str(bit_len) + ';' + '\n' + 'ADRESS RADIX = HEX;' + '\n' + 'DATA RADIX = BIN;' + '\n' + 'CONTENT'  + '\n' + 'BEGIN' + '\n')
	for line in mif_lines[number]:
		document.write(line + '\n')
	document.write('end;')

for number in range(1,len(mif_lines_3layer) + 2):
	#print '/u/home/swaraj/Documents/MIF/mif_files/3_layer_mif_file_%d' %number + '.mif'
	try:
		document = open('/home/dhmorton/Downloads/files.Daniel/mif_files/3_layer_mif_file_%d' %number + '.mif','w')
		document.write('Depth = %d' %len(mif_lines_3layer[number]) + ';' + '\n' + 'Width = ' + str(bit_len) + ';' + '\n' + 'ADRESS RADIX = HEX;' + '\n' + 'DATA RADIX = BIN;' + '\n' + 'CONTENT'  + '\n' + 'BEGIN' + '\n')
		for line in mif_lines_3layer[number]:
			document.write(line + '\n')
		document.write('end;')
	except KeyError:
		break
 


#prepares information to be written in vhdl
avar_vector_vhdl = []
add_m4k_ovar = {}
for key in avar2_boost_numbers.keys():
	top_value = len(avar2_boost_numbers[key])  - 1
	#signal AddM4K1S2: std_logic_vector(   7 downto 0);
	add_m4k_name = 'ADDM4K' + key[len(key) -3:len(key)]
	add_m4k_ovar[add_m4k_name] = avar2_boost_numbers[key]
	line = 'signal ' + add_m4k_name + ': std_logic_vector(   ' + str(top_value) + ' downto 0);' + '\n'
	avar_vector_vhdl.append(line)

for key in avar3_boost_numbers.keys():
	top_value = len(avar3_boost_numbers[key])  - 1
	#signal AddM4K1S2: std_logic_vector(   7 downto 0);
	add_m4k_name = 'ADDM4K' + key[len(key) -3:len(key)]
	add_m4k_ovar[add_m4k_name] = avar3_boost_numbers[key]
	line = 'signal ' + add_m4k_name + ': std_logic_vector(   ' + str(top_value) + ' downto 0);' + '\n'
	avar_vector_vhdl.append(line)

#print avar_vector_vhdl, add_m4k_ovar
ovar_definitions_vhdl = []
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
		counter += 1

#Defining the variables needs to look like
#       if(STUFF='1' OR STUFF_2='1' )then
#       NEWSTATEMENT( 12)<='1'
#	else
 #      cVar1P018N009N006N019<='0';
  #     end if;
#print ovar_definitions_vhdl

ram_lines_vhdl = []
for key in add_m4k_ovar.keys():
	length = len(add_m4k_ovar[key])
	for number in range(0,length):
		line = ''
		line = key + '_%d' %number + ': ' + key + '_2_%d' %number + ' PORT MAP (' + "\n"
		line += ' ' * 16 + 'clock' + '	=> clock'  + '_%d' %number + '\n'
		line += ' ' * 16 + 'data' + '	=> data'  + '_%d' %number + '\n'
		line += ' ' * 16 + 'rdaddress' + '	=> ' + key   + '(%d' %number + ')' + '\n'
		line += ' ' * 16 + 'wraddress' + '	=> wraddress'  + '_%d' %number  + '\n'
		line += ' ' * 16 + 'wren' + '	=> wren'  + '_%d' %number + '\n'
		line += ' ' * 16 + 'q' + '	=> q'  + '_%d' %number + '\n'
		ram_lines_vhdl.append(line)

document2 = open('vhd_text2.txt','w')
for line in avar_vector_vhdl:
	document2.write(line)

for line in ovar_definitions_vhdl:
	document2.write(line)

for line in ram_lines_vhdl:
	document2.write(line)


#vhdl line: avar_vector_vhdl, ovar_definitions_vhdl, ram_lines_vhdl
     




