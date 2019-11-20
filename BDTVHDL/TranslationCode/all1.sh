#!/bin/bash
cp headertop.txt 450.vhd
echo "component Adder_type" >> 450.vhd
echo "	PORT" >> 450.vhd
echo "	(" >> 450.vhd
echo "		dataa		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);" >> 450.vhd
echo "		datab		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);" >> 450.vhd
echo "		result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);" >> 450.vhd
echo "	);" >> 450.vhd
echo "end component;" >> 450.vhd
cat ram_Output_top_3.txt vhd_text_top.txt vhd_text_top_signal_3.txt >> 450.vhd
echo "BEGIN" >> 450.vhd
echo "	A (19 downto 0) <= A_DIN_L (19 downto 0);" >> 450.vhd
echo "	B (8 downto 0) <= B_DIN_L (11 downto 3);" >> 450.vhd
echo "	B (17 downto 9) <= B_DIN_L (27 downto 19);" >> 450.vhd
echo "	D (15 downto 0) <= D_DIN_L (15 downto 0);" >> 450.vhd
echo "	E (15 downto 0) <= D_DIN_L (31 downto 16);" >> 450.vhd
echo "	C_DOUT_L (31 downto 0) <= output (31 downto 0);" >> 450.vhd
echo "	F_DOUT_L (31 downto 0) <=  output (31 downto 0);" >> 450.vhd
cat vhd_text_top_tables.txt >> 450.vhd
echo "lookuptable_LV5 : process(c1)" >> 450.vhd
echo "begin" >> 450.vhd
echo " if c1'event and c1='1' then" >> 450.vhd
cat vhd_text_top_ovar_3.txt >> 450.vhd
echo " end if;" >> 450.vhd
echo "end process;" >> 450.vhd
cat  vhd_text_top_add_3.txt >> 450.vhd
cat aVarOutputtop.txt >> 450.vhd
echo "	results(3 downto 0) <= aVar7S0 (14 downto 11);" >> 450.vhd
echo 'cut <="1111";'>> 450.vhd
echo "lookuptable_LV6 : process(c1)" >> 450.vhd
echo "begin" >> 450.vhd
echo " if c1'event and c1='1' then" >> 450.vhd
echo "	if(aVar7S0(15)='0')then " >> 450.vhd
echo '		output(31 downto 0) <= "11111111111111111111111111111111";' >> 450.vhd
echo "	else if( results<cut )then " >> 450.vhd
echo '		output(31 downto 0) <= "11111111111111111111111111111111"; ' >> 450.vhd
echo "		else " >> 450.vhd
echo '		output(31 downto 0) <= "00000000000000000000000000000000"; ' >> 450.vhd
echo "		end if; " >> 450.vhd
echo " end if; " >> 450.vhd
echo "end if; " >> 450.vhd
echo "end process;" >> 450.vhd
echo "end rtl;" >> 450.vhd
