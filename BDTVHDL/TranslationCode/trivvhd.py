vhdOutputFile = open('vhd_triv.txt','w') 
s1='1'
s0='0'
for x in range(0,32):
	if x%2:
		vhdOutputFile.write('if(A(%d'%x+')='+repr(s1)+') then\n')
	else:
		vhdOutputFile.write('if(B(%d'%(x)+')='+repr(s1)+') then\n')
	if x%3:
		vhdOutputFile.write('\t output(%d)<='%x+repr(s1)+ ';\n')
		vhdOutputFile.write('\t else \n')
		vhdOutputFile.write('\t output(%d)<='%x+repr(s0)+ ';\n')
		vhdOutputFile.write('end if;\n')
	else:
		vhdOutputFile.write('\t output(%d)<='%x+repr(s0)+ ';\n')
		vhdOutputFile.write('\t else \n')
		vhdOutputFile.write('\t output(%d)<='%x+repr(s1)+ ';\n')
		vhdOutputFile.write('end if;\n')
vhdOutputFile.write
