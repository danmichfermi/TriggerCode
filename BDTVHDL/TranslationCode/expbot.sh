#!/bin/bash
cp headerbot.txt 440.vhd
echo "component Adder_type" >> 440.vhd
echo "	PORT" >> 440.vhd
echo "	(" >> 440.vhd
echo "		dataa		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);" >> 440.vhd
echo "		datab		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);" >> 440.vhd
echo "		result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)" >> 440.vhd
echo "	);" >> 440.vhd
echo "end component;" >> 440.vhd
cat ram_Output_bot_3.txt vhd_text_bot.txt vhd_text_bot_signal_3.txt >> 440.vhd
echo "BEGIN" >> 440.vhd
echo "	A (9 downto 0) <= A_DIN_L (12 downto 3);" >> 440.vhd
echo "	A (19 downto 10) <= A_DIN_L (28 downto 19);" >> 440.vhd
echo "	B (9 downto 0) <= B_DIN_L (12 downto 3);" >> 440.vhd
echo "	B (19 downto 10) <= B_DIN_L (28 downto 19);" >> 440.vhd
echo "	D (15 downto 0) <= D_DIN_L (15 downto 0);" >> 440.vhd
echo "	E (15 downto 0) <= D_DIN_L (31 downto 16);" >> 440.vhd
echo "	C_DOUT_L (15 downto 0) <= output (15 downto 0) ;" >> 440.vhd
echo "	 F_DOUT_L (15 downto 0) <= output (15 downto 0);" >> 440.vhd
cat vhd_text_bot_tables.txt >> 440.vhd
echo "lookuptable_LV5 : process(c1)" >> 440.vhd
echo "begin" >> 440.vhd
echo " if c1'event and c1='1' then" >> 440.vhd
cat vhd_text_bot_ovar_3.txt >> 440.vhd
echo " end if;" >> 440.vhd
echo "end process;" >> 440.vhd
cat  vhd_text_bot_add_3.txt >> 440.vhd
cat aVarOutputbot.txt >> 440.vhd
echo "	 output (15 downto 0)<= aVar7S0 (15 downto 0) ;" >> 440.vhd
echo "end rtl;" >> 440.vhd
