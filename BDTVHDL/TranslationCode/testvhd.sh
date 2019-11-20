#!/bin/bash
cp headertop.txt 450.vhd
echo "component Adder_type" >> 450.vhd
echo "	PORT" >> 450.vhd
echo "	(" >> 450.vhd
echo "		dataa		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);" >> 450.vhd
echo "		datab		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);" >> 450.vhd
echo "		overflow		: OUT STD_LOGIC_VECTOR ;" >> 450.vhd
echo "		result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)" >> 450.vhd
echo "	);" >> 450.vhd
echo "end component;" >> 450.vhd
cat vhd_text_top.txt >> 450.vhd
echo "BEGIN" >> 450.vhd
echo "	A (19 downto 0) <= A_DIN_L (19 downto 0);" >> 450.vhd
echo "	B (8 downto 0) <= A_DIN_L (28 downto 20);" >> 450.vhd
echo "	B (17 downto 9) <= B_DIN_L (8 downto 0);" >> 450.vhd
echo "	D (15 downto 0) <= B_DIN_L (24 downto 9);" >> 450.vhd
echo "	E (15 downto 0) <= D_DIN_L (31 downto 16);" >> 450.vhd
echo "	F_DOUT_L (7 downto 0) <= output (31 downto 0);" >> 450.vhd
echo "	C_DOUT_L (7 downto 0) <= output (31 downto 0);" >> 450.vhd
cat vhd_text_top_tables.txt>> 450.vhd
echo "end rtl;" >> 450.vhd
