LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
ENTITY code_450 IS
   PORT( 
      --*************************************************
      -- V1495 Front Panel Ports (PORT A,B,C,G)
      --*************************************************
      A_DIN_L       : IN     std_logic_vector (31 DOWNTO 0);  -- In A (32 x LVDS/ECL)
      B_DIN_L       : IN     std_logic_vector (31 DOWNTO 0);  -- In B (32 x LVDS/ECL)
      D_DIN_L       : IN     std_logic_vector (31 DOWNTO 0);  -- In D (32 x LVDS/ECL)
      E_DIN_L       : IN     std_logic_vector (31 DOWNTO 0);  -- In E (32 x LVDS/ECL)
      F_DOUT_L      : OUT    std_logic_vector (31 DOWNTO 0);  -- OUT F (32 x LVDS/ECL)
      C_DOUT_L      : OUT    std_logic_vector (31 DOWNTO 0);  -- Out C (32 x LVDS)
      c1            : IN STD_LOGIC                            -- the PLL1 output
   );
END code_450 ;
ARCHITECTURE rtl OF code_450 IS
        signal A     : std_logic_vector(31 downto 0);
        signal B     : std_logic_vector(31 downto 0);
        signal C     : std_logic_vector(31 downto 0);
        signal D     : std_logic_vector(31 downto 0);
        signal E     : std_logic_vector(31 downto 0);
        signal F     : std_logic_vector(31 downto 0);
        signal G     : std_logic_vector(1 downto 0);
        signal D0F_temp_lv1_0: std_logic_vector( 34 downto 0);
        signal D0F_temp_lv2_0: std_logic_vector(  8 downto 0);
        signal D0F_temp_lv3_0: std_logic_vector(  2 downto 0);
        signal D0F_temp_lv4_0: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv5_0: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv6_0: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv7_0: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv1_1: std_logic_vector( 44 downto 0);
        signal D0F_temp_lv2_1: std_logic_vector( 11 downto 0);
        signal D0F_temp_lv3_1: std_logic_vector(  2 downto 0);
        signal D0F_temp_lv4_1: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv5_1: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv6_1: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv7_1: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv1_2: std_logic_vector( 42 downto 0);
        signal D0F_temp_lv2_2: std_logic_vector( 10 downto 0);
        signal D0F_temp_lv3_2: std_logic_vector(  2 downto 0);
        signal D0F_temp_lv4_2: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv5_2: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv6_2: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv7_2: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv1_3: std_logic_vector( 37 downto 0);
        signal D0F_temp_lv2_3: std_logic_vector(  9 downto 0);
        signal D0F_temp_lv3_3: std_logic_vector(  2 downto 0);
        signal D0F_temp_lv4_3: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv5_3: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv6_3: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv7_3: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv1_4: std_logic_vector( 31 downto 0);
        signal D0F_temp_lv2_4: std_logic_vector(  7 downto 0);
        signal D0F_temp_lv3_4: std_logic_vector(  1 downto 0);
        signal D0F_temp_lv4_4: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv5_4: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv6_4: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv7_4: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv1_5: std_logic_vector( 43 downto 0);
        signal D0F_temp_lv2_5: std_logic_vector( 10 downto 0);
        signal D0F_temp_lv3_5: std_logic_vector(  2 downto 0);
        signal D0F_temp_lv4_5: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv5_5: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv6_5: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv7_5: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv1_6: std_logic_vector( 38 downto 0);
        signal D0F_temp_lv2_6: std_logic_vector(  9 downto 0);
        signal D0F_temp_lv3_6: std_logic_vector(  2 downto 0);
        signal D0F_temp_lv4_6: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv5_6: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv6_6: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv7_6: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv1_7: std_logic_vector( 37 downto 0);
        signal D0F_temp_lv2_7: std_logic_vector(  9 downto 0);
        signal D0F_temp_lv3_7: std_logic_vector(  2 downto 0);
        signal D0F_temp_lv4_7: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv5_7: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv6_7: std_logic_vector(  0 downto 0);
        signal D0F_temp_lv7_7: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv1_0: std_logic_vector( 17 downto 0);
        signal D1F_temp_lv2_0: std_logic_vector(  5 downto 0);
        signal D1F_temp_lv3_0: std_logic_vector(  1 downto 0);
        signal D1F_temp_lv4_0: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv5_0: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv6_0: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv7_0: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv1_1: std_logic_vector( 45 downto 0);
        signal D1F_temp_lv2_1: std_logic_vector( 19 downto 0);
        signal D1F_temp_lv3_1: std_logic_vector(  4 downto 0);
        signal D1F_temp_lv4_1: std_logic_vector(  1 downto 0);
        signal D1F_temp_lv5_1: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv6_1: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv7_1: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv1_2: std_logic_vector( 44 downto 0);
        signal D1F_temp_lv2_2: std_logic_vector( 22 downto 0);
        signal D1F_temp_lv3_2: std_logic_vector(  5 downto 0);
        signal D1F_temp_lv4_2: std_logic_vector(  1 downto 0);
        signal D1F_temp_lv5_2: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv6_2: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv7_2: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv1_3: std_logic_vector( 37 downto 0);
        signal D1F_temp_lv2_3: std_logic_vector( 18 downto 0);
        signal D1F_temp_lv3_3: std_logic_vector(  4 downto 0);
        signal D1F_temp_lv4_3: std_logic_vector(  1 downto 0);
        signal D1F_temp_lv5_3: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv6_3: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv7_3: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv1_4: std_logic_vector( 15 downto 0);
        signal D1F_temp_lv2_4: std_logic_vector(  5 downto 0);
        signal D1F_temp_lv3_4: std_logic_vector(  1 downto 0);
        signal D1F_temp_lv4_4: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv5_4: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv6_4: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv7_4: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv1_5: std_logic_vector( 43 downto 0);
        signal D1F_temp_lv2_5: std_logic_vector( 22 downto 0);
        signal D1F_temp_lv3_5: std_logic_vector(  5 downto 0);
        signal D1F_temp_lv4_5: std_logic_vector(  1 downto 0);
        signal D1F_temp_lv5_5: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv6_5: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv7_5: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv1_6: std_logic_vector( 45 downto 0);
        signal D1F_temp_lv2_6: std_logic_vector( 22 downto 0);
        signal D1F_temp_lv3_6: std_logic_vector(  5 downto 0);
        signal D1F_temp_lv4_6: std_logic_vector(  1 downto 0);
        signal D1F_temp_lv5_6: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv6_6: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv7_6: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv1_7: std_logic_vector( 38 downto 0);
        signal D1F_temp_lv2_7: std_logic_vector( 18 downto 0);
        signal D1F_temp_lv3_7: std_logic_vector(  4 downto 0);
        signal D1F_temp_lv4_7: std_logic_vector(  1 downto 0);
        signal D1F_temp_lv5_7: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv6_7: std_logic_vector(  0 downto 0);
        signal D1F_temp_lv7_7: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv1_0: std_logic_vector( 34 downto 0);
        signal D2F_temp_lv2_0: std_logic_vector( 18 downto 0);
        signal D2F_temp_lv3_0: std_logic_vector(  4 downto 0);
        signal D2F_temp_lv4_0: std_logic_vector(  1 downto 0);
        signal D2F_temp_lv5_0: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv6_0: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv7_0: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv1_1: std_logic_vector( 44 downto 0);
        signal D2F_temp_lv2_1: std_logic_vector( 20 downto 0);
        signal D2F_temp_lv3_1: std_logic_vector(  5 downto 0);
        signal D2F_temp_lv4_1: std_logic_vector(  1 downto 0);
        signal D2F_temp_lv5_1: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv6_1: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv7_1: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv1_2: std_logic_vector( 42 downto 0);
        signal D2F_temp_lv2_2: std_logic_vector( 20 downto 0);
        signal D2F_temp_lv3_2: std_logic_vector(  5 downto 0);
        signal D2F_temp_lv4_2: std_logic_vector(  1 downto 0);
        signal D2F_temp_lv5_2: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv6_2: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv7_2: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv1_3: std_logic_vector( 37 downto 0);
        signal D2F_temp_lv2_3: std_logic_vector( 17 downto 0);
        signal D2F_temp_lv3_3: std_logic_vector(  4 downto 0);
        signal D2F_temp_lv4_3: std_logic_vector(  1 downto 0);
        signal D2F_temp_lv5_3: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv6_3: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv7_3: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv1_4: std_logic_vector( 31 downto 0);
        signal D2F_temp_lv2_4: std_logic_vector( 15 downto 0);
        signal D2F_temp_lv3_4: std_logic_vector(  3 downto 0);
        signal D2F_temp_lv4_4: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv5_4: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv6_4: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv7_4: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv1_5: std_logic_vector( 43 downto 0);
        signal D2F_temp_lv2_5: std_logic_vector( 19 downto 0);
        signal D2F_temp_lv3_5: std_logic_vector(  4 downto 0);
        signal D2F_temp_lv4_5: std_logic_vector(  1 downto 0);
        signal D2F_temp_lv5_5: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv6_5: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv7_5: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv1_6: std_logic_vector( 38 downto 0);
        signal D2F_temp_lv2_6: std_logic_vector( 20 downto 0);
        signal D2F_temp_lv3_6: std_logic_vector(  5 downto 0);
        signal D2F_temp_lv4_6: std_logic_vector(  1 downto 0);
        signal D2F_temp_lv5_6: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv6_6: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv7_6: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv1_7: std_logic_vector( 37 downto 0);
        signal D2F_temp_lv2_7: std_logic_vector( 20 downto 0);
        signal D2F_temp_lv3_7: std_logic_vector(  5 downto 0);
        signal D2F_temp_lv4_7: std_logic_vector(  1 downto 0);
        signal D2F_temp_lv5_7: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv6_7: std_logic_vector(  0 downto 0);
        signal D2F_temp_lv7_7: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv1_0: std_logic_vector( 34 downto 0);
        signal D3F_temp_lv2_0: std_logic_vector( 13 downto 0);
        signal D3F_temp_lv3_0: std_logic_vector(  3 downto 0);
        signal D3F_temp_lv4_0: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv5_0: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv6_0: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv7_0: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv1_1: std_logic_vector( 44 downto 0);
        signal D3F_temp_lv2_1: std_logic_vector( 18 downto 0);
        signal D3F_temp_lv3_1: std_logic_vector(  4 downto 0);
        signal D3F_temp_lv4_1: std_logic_vector(  1 downto 0);
        signal D3F_temp_lv5_1: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv6_1: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv7_1: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv1_2: std_logic_vector( 42 downto 0);
        signal D3F_temp_lv2_2: std_logic_vector( 18 downto 0);
        signal D3F_temp_lv3_2: std_logic_vector(  4 downto 0);
        signal D3F_temp_lv4_2: std_logic_vector(  1 downto 0);
        signal D3F_temp_lv5_2: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv6_2: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv7_2: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv1_3: std_logic_vector( 37 downto 0);
        signal D3F_temp_lv2_3: std_logic_vector( 16 downto 0);
        signal D3F_temp_lv3_3: std_logic_vector(  4 downto 0);
        signal D3F_temp_lv4_3: std_logic_vector(  1 downto 0);
        signal D3F_temp_lv5_3: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv6_3: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv7_3: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv1_4: std_logic_vector( 31 downto 0);
        signal D3F_temp_lv2_4: std_logic_vector( 12 downto 0);
        signal D3F_temp_lv3_4: std_logic_vector(  3 downto 0);
        signal D3F_temp_lv4_4: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv5_4: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv6_4: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv7_4: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv1_5: std_logic_vector( 43 downto 0);
        signal D3F_temp_lv2_5: std_logic_vector( 17 downto 0);
        signal D3F_temp_lv3_5: std_logic_vector(  4 downto 0);
        signal D3F_temp_lv4_5: std_logic_vector(  1 downto 0);
        signal D3F_temp_lv5_5: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv6_5: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv7_5: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv1_6: std_logic_vector( 38 downto 0);
        signal D3F_temp_lv2_6: std_logic_vector( 16 downto 0);
        signal D3F_temp_lv3_6: std_logic_vector(  4 downto 0);
        signal D3F_temp_lv4_6: std_logic_vector(  1 downto 0);
        signal D3F_temp_lv5_6: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv6_6: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv7_6: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv1_7: std_logic_vector( 37 downto 0);
        signal D3F_temp_lv2_7: std_logic_vector( 14 downto 0);
        signal D3F_temp_lv3_7: std_logic_vector(  3 downto 0);
        signal D3F_temp_lv4_7: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv5_7: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv6_7: std_logic_vector(  0 downto 0);
        signal D3F_temp_lv7_7: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv1_0: std_logic_vector( 34 downto 0);
        signal D4F_temp_lv2_0: std_logic_vector( 13 downto 0);
        signal D4F_temp_lv3_0: std_logic_vector(  5 downto 0);
        signal D4F_temp_lv4_0: std_logic_vector(  1 downto 0);
        signal D4F_temp_lv5_0: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv6_0: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv7_0: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv1_1: std_logic_vector( 44 downto 0);
        signal D4F_temp_lv2_1: std_logic_vector( 14 downto 0);
        signal D4F_temp_lv3_1: std_logic_vector(  6 downto 0);
        signal D4F_temp_lv4_1: std_logic_vector(  1 downto 0);
        signal D4F_temp_lv5_1: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv6_1: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv7_1: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv1_2: std_logic_vector( 42 downto 0);
        signal D4F_temp_lv2_2: std_logic_vector( 15 downto 0);
        signal D4F_temp_lv3_2: std_logic_vector(  6 downto 0);
        signal D4F_temp_lv4_2: std_logic_vector(  1 downto 0);
        signal D4F_temp_lv5_2: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv6_2: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv7_2: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv1_3: std_logic_vector( 37 downto 0);
        signal D4F_temp_lv2_3: std_logic_vector( 13 downto 0);
        signal D4F_temp_lv3_3: std_logic_vector(  5 downto 0);
        signal D4F_temp_lv4_3: std_logic_vector(  1 downto 0);
        signal D4F_temp_lv5_3: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv6_3: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv7_3: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv1_4: std_logic_vector( 31 downto 0);
        signal D4F_temp_lv2_4: std_logic_vector( 12 downto 0);
        signal D4F_temp_lv3_4: std_logic_vector(  5 downto 0);
        signal D4F_temp_lv4_4: std_logic_vector(  1 downto 0);
        signal D4F_temp_lv5_4: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv6_4: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv7_4: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv1_5: std_logic_vector( 43 downto 0);
        signal D4F_temp_lv2_5: std_logic_vector( 15 downto 0);
        signal D4F_temp_lv3_5: std_logic_vector(  6 downto 0);
        signal D4F_temp_lv4_5: std_logic_vector(  1 downto 0);
        signal D4F_temp_lv5_5: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv6_5: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv7_5: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv1_6: std_logic_vector( 38 downto 0);
        signal D4F_temp_lv2_6: std_logic_vector( 13 downto 0);
        signal D4F_temp_lv3_6: std_logic_vector(  5 downto 0);
        signal D4F_temp_lv4_6: std_logic_vector(  1 downto 0);
        signal D4F_temp_lv5_6: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv6_6: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv7_6: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv1_7: std_logic_vector( 37 downto 0);
        signal D4F_temp_lv2_7: std_logic_vector( 11 downto 0);
        signal D4F_temp_lv3_7: std_logic_vector(  5 downto 0);
        signal D4F_temp_lv4_7: std_logic_vector(  1 downto 0);
        signal D4F_temp_lv5_7: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv6_7: std_logic_vector(  0 downto 0);
        signal D4F_temp_lv7_7: std_logic_vector(  0 downto 0);
        signal DF_temp_lv8: std_logic_vector(15 downto 0);
        signal DF_temp_lv9: std_logic_vector(7 downto 0);
BEGIN
   A (19 downto 0) <= A_DIN_L (19 downto 0);
   B (8 downto 0) <= A_DIN_L (28 downto 20);
   B (17 downto 9) <= B_DIN_L (8 downto 0);
   D (15 downto 0) <= B_DIN_L (24 downto 9);
   E (15 downto 0) <= D_DIN_L (31 downto 16);
   F_DOUT_L(7 downto 0) <= DF_temp_lv9(  7 downto 0);
   C_DOUT_L(7 downto 0) <= DF_temp_lv9(  7 downto 0);
lookuptable_LV1 : process(c1)    
begin  
 if c1'event and c1 = '1' then
        if(A( 0)='1' AND B( 0)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  0)<='1';
        else
        D0F_temp_lv1_0(  0)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  1)<='1';
        else
        D0F_temp_lv1_0(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  2)<='1';
        else
        D0F_temp_lv1_0(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  3)<='1';
        else
        D0F_temp_lv1_0(  3)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  4)<='1';
        else
        D0F_temp_lv1_0(  4)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  5)<='1';
        else
        D0F_temp_lv1_0(  5)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  6)<='1';
        else
        D0F_temp_lv1_0(  6)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  7)<='1';
        else
        D0F_temp_lv1_0(  7)<='0';
        end if;
        if(A(10)='1' AND B( 0)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  8)<='1';
        else
        D0F_temp_lv1_0(  8)<='0';
        end if;
        if(A(10)='1' AND B( 0)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0(  9)<='1';
        else
        D0F_temp_lv1_0(  9)<='0';
        end if;
        if(A(10)='1' AND B( 9)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 10)<='1';
        else
        D0F_temp_lv1_0( 10)<='0';
        end if;
        if(A(11)='1' AND B( 0)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 11)<='1';
        else
        D0F_temp_lv1_0( 11)<='0';
        end if;
        if(A(11)='1' AND B( 0)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 12)<='1';
        else
        D0F_temp_lv1_0( 12)<='0';
        end if;
        if(A(11)='1' AND B( 1)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 13)<='1';
        else
        D0F_temp_lv1_0( 13)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 14)<='1';
        else
        D0F_temp_lv1_0( 14)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 15)<='1';
        else
        D0F_temp_lv1_0( 15)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 8)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 16)<='1';
        else
        D0F_temp_lv1_0( 16)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 9)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 17)<='1';
        else
        D0F_temp_lv1_0( 17)<='0';
        end if;
        if(A(12)='1' AND B( 0)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 18)<='1';
        else
        D0F_temp_lv1_0( 18)<='0';
        end if;
        if(A(12)='1' AND B( 0)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 19)<='1';
        else
        D0F_temp_lv1_0( 19)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 20)<='1';
        else
        D0F_temp_lv1_0( 20)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 21)<='1';
        else
        D0F_temp_lv1_0( 21)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 22)<='1';
        else
        D0F_temp_lv1_0( 22)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 23)<='1';
        else
        D0F_temp_lv1_0( 23)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 8)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 24)<='1';
        else
        D0F_temp_lv1_0( 24)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 25)<='1';
        else
        D0F_temp_lv1_0( 25)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 26)<='1';
        else
        D0F_temp_lv1_0( 26)<='0';
        end if;
        if(A(13)='1' AND B( 0)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 27)<='1';
        else
        D0F_temp_lv1_0( 27)<='0';
        end if;
        if(A(13)='1' AND B( 1)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 28)<='1';
        else
        D0F_temp_lv1_0( 28)<='0';
        end if;
        if(A(13)='1' AND B( 1)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 29)<='1';
        else
        D0F_temp_lv1_0( 29)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 30)<='1';
        else
        D0F_temp_lv1_0( 30)<='0';
        end if;
        if(A(13)='1' AND B( 9)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 31)<='1';
        else
        D0F_temp_lv1_0( 31)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 32)<='1';
        else
        D0F_temp_lv1_0( 32)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 1)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 33)<='1';
        else
        D0F_temp_lv1_0( 33)<='0';
        end if;
        if(A(14)='1' AND B(10)='1' AND D( 0)='1' AND E( 0)='1' )then
        D0F_temp_lv1_0( 34)<='1';
        else
        D0F_temp_lv1_0( 34)<='0';
        end if;
        if(A( 0)='1' AND B( 1)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  0)<='1';
        else
        D0F_temp_lv1_1(  0)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  1)<='1';
        else
        D0F_temp_lv1_1(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  2)<='1';
        else
        D0F_temp_lv1_1(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  3)<='1';
        else
        D0F_temp_lv1_1(  3)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  4)<='1';
        else
        D0F_temp_lv1_1(  4)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  5)<='1';
        else
        D0F_temp_lv1_1(  5)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  6)<='1';
        else
        D0F_temp_lv1_1(  6)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  7)<='1';
        else
        D0F_temp_lv1_1(  7)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  8)<='1';
        else
        D0F_temp_lv1_1(  8)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1(  9)<='1';
        else
        D0F_temp_lv1_1(  9)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 10)<='1';
        else
        D0F_temp_lv1_1( 10)<='0';
        end if;
        if(A( 5)='1' AND B( 2)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 11)<='1';
        else
        D0F_temp_lv1_1( 11)<='0';
        end if;
        if(A( 6)='1' AND B( 2)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 12)<='1';
        else
        D0F_temp_lv1_1( 12)<='0';
        end if;
        if(A(10)='1' AND B( 1)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 13)<='1';
        else
        D0F_temp_lv1_1( 13)<='0';
        end if;
        if(A(11)='1' AND B( 0)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 14)<='1';
        else
        D0F_temp_lv1_1( 14)<='0';
        end if;
        if(A(11)='1' AND B( 1)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 15)<='1';
        else
        D0F_temp_lv1_1( 15)<='0';
        end if;
        if(A(11)='1' AND B(10)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 16)<='1';
        else
        D0F_temp_lv1_1( 16)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 17)<='1';
        else
        D0F_temp_lv1_1( 17)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 18)<='1';
        else
        D0F_temp_lv1_1( 18)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 19)<='1';
        else
        D0F_temp_lv1_1( 19)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 20)<='1';
        else
        D0F_temp_lv1_1( 20)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 21)<='1';
        else
        D0F_temp_lv1_1( 21)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 22)<='1';
        else
        D0F_temp_lv1_1( 22)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 9)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 23)<='1';
        else
        D0F_temp_lv1_1( 23)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 24)<='1';
        else
        D0F_temp_lv1_1( 24)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 25)<='1';
        else
        D0F_temp_lv1_1( 25)<='0';
        end if;
        if(A(13)='1' AND B( 1)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 26)<='1';
        else
        D0F_temp_lv1_1( 26)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 27)<='1';
        else
        D0F_temp_lv1_1( 27)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 28)<='1';
        else
        D0F_temp_lv1_1( 28)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 29)<='1';
        else
        D0F_temp_lv1_1( 29)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 9)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 30)<='1';
        else
        D0F_temp_lv1_1( 30)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 31)<='1';
        else
        D0F_temp_lv1_1( 31)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 32)<='1';
        else
        D0F_temp_lv1_1( 32)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 9)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 33)<='1';
        else
        D0F_temp_lv1_1( 33)<='0';
        end if;
        if(A(14)='1' AND B( 1)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 34)<='1';
        else
        D0F_temp_lv1_1( 34)<='0';
        end if;
        if(A(14)='1' AND B( 2)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 35)<='1';
        else
        D0F_temp_lv1_1( 35)<='0';
        end if;
        if(A(14)='1' AND B( 2)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 36)<='1';
        else
        D0F_temp_lv1_1( 36)<='0';
        end if;
        if(A(14)='1' AND B(10)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 37)<='1';
        else
        D0F_temp_lv1_1( 37)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 38)<='1';
        else
        D0F_temp_lv1_1( 38)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 39)<='1';
        else
        D0F_temp_lv1_1( 39)<='0';
        end if;
        if(A(15)='1' AND B( 2)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 40)<='1';
        else
        D0F_temp_lv1_1( 40)<='0';
        end if;
        if(A(15)='1' AND B( 2)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 41)<='1';
        else
        D0F_temp_lv1_1( 41)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND D( 1)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 42)<='1';
        else
        D0F_temp_lv1_1( 42)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND D( 2)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 43)<='1';
        else
        D0F_temp_lv1_1( 43)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND D(10)='1' AND E( 1)='1' )then
        D0F_temp_lv1_1( 44)<='1';
        else
        D0F_temp_lv1_1( 44)<='0';
        end if;
        if(A( 1)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  0)<='1';
        else
        D0F_temp_lv1_2(  0)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  1)<='1';
        else
        D0F_temp_lv1_2(  1)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  2)<='1';
        else
        D0F_temp_lv1_2(  2)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  3)<='1';
        else
        D0F_temp_lv1_2(  3)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  4)<='1';
        else
        D0F_temp_lv1_2(  4)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  5)<='1';
        else
        D0F_temp_lv1_2(  5)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  6)<='1';
        else
        D0F_temp_lv1_2(  6)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  7)<='1';
        else
        D0F_temp_lv1_2(  7)<='0';
        end if;
        if(A( 5)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  8)<='1';
        else
        D0F_temp_lv1_2(  8)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2(  9)<='1';
        else
        D0F_temp_lv1_2(  9)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 10)<='1';
        else
        D0F_temp_lv1_2( 10)<='0';
        end if;
        if(A( 6)='1' AND B( 3)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 11)<='1';
        else
        D0F_temp_lv1_2( 11)<='0';
        end if;
        if(A(11)='1' AND B( 1)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 12)<='1';
        else
        D0F_temp_lv1_2( 12)<='0';
        end if;
        if(A(11)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 13)<='1';
        else
        D0F_temp_lv1_2( 13)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 14)<='1';
        else
        D0F_temp_lv1_2( 14)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 15)<='1';
        else
        D0F_temp_lv1_2( 15)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 16)<='1';
        else
        D0F_temp_lv1_2( 16)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 17)<='1';
        else
        D0F_temp_lv1_2( 17)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 18)<='1';
        else
        D0F_temp_lv1_2( 18)<='0';
        end if;
        if(A(13)='1' AND B( 3)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 19)<='1';
        else
        D0F_temp_lv1_2( 19)<='0';
        end if;
        if(A(13)='1' AND B( 3)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 20)<='1';
        else
        D0F_temp_lv1_2( 20)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 21)<='1';
        else
        D0F_temp_lv1_2( 21)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D(10)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 22)<='1';
        else
        D0F_temp_lv1_2( 22)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 23)<='1';
        else
        D0F_temp_lv1_2( 23)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 24)<='1';
        else
        D0F_temp_lv1_2( 24)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D(10)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 25)<='1';
        else
        D0F_temp_lv1_2( 25)<='0';
        end if;
        if(A(14)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 26)<='1';
        else
        D0F_temp_lv1_2( 26)<='0';
        end if;
        if(A(14)='1' AND B( 3)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 27)<='1';
        else
        D0F_temp_lv1_2( 27)<='0';
        end if;
        if(A(14)='1' AND B( 3)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 28)<='1';
        else
        D0F_temp_lv1_2( 28)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 29)<='1';
        else
        D0F_temp_lv1_2( 29)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D(10)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 30)<='1';
        else
        D0F_temp_lv1_2( 30)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 31)<='1';
        else
        D0F_temp_lv1_2( 31)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 32)<='1';
        else
        D0F_temp_lv1_2( 32)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(10)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 33)<='1';
        else
        D0F_temp_lv1_2( 33)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(11)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 34)<='1';
        else
        D0F_temp_lv1_2( 34)<='0';
        end if;
        if(A(15)='1' AND B( 2)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 35)<='1';
        else
        D0F_temp_lv1_2( 35)<='0';
        end if;
        if(A(15)='1' AND B( 3)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 36)<='1';
        else
        D0F_temp_lv1_2( 36)<='0';
        end if;
        if(A(15)='1' AND B( 3)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 37)<='1';
        else
        D0F_temp_lv1_2( 37)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 38)<='1';
        else
        D0F_temp_lv1_2( 38)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 39)<='1';
        else
        D0F_temp_lv1_2( 39)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 40)<='1';
        else
        D0F_temp_lv1_2( 40)<='0';
        end if;
        if(A(16)='1' AND B( 3)='1' AND D( 2)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 41)<='1';
        else
        D0F_temp_lv1_2( 41)<='0';
        end if;
        if(A(16)='1' AND B( 4)='1' AND D( 3)='1' AND E( 2)='1' )then
        D0F_temp_lv1_2( 42)<='1';
        else
        D0F_temp_lv1_2( 42)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  0)<='1';
        else
        D0F_temp_lv1_3(  0)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  1)<='1';
        else
        D0F_temp_lv1_3(  1)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  2)<='1';
        else
        D0F_temp_lv1_3(  2)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  3)<='1';
        else
        D0F_temp_lv1_3(  3)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  4)<='1';
        else
        D0F_temp_lv1_3(  4)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  5)<='1';
        else
        D0F_temp_lv1_3(  5)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  6)<='1';
        else
        D0F_temp_lv1_3(  6)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  7)<='1';
        else
        D0F_temp_lv1_3(  7)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  8)<='1';
        else
        D0F_temp_lv1_3(  8)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3(  9)<='1';
        else
        D0F_temp_lv1_3(  9)<='0';
        end if;
        if(A(12)='1' AND B( 3)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 10)<='1';
        else
        D0F_temp_lv1_3( 10)<='0';
        end if;
        if(A(13)='1' AND B( 3)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 11)<='1';
        else
        D0F_temp_lv1_3( 11)<='0';
        end if;
        if(A(13)='1' AND B( 4)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 12)<='1';
        else
        D0F_temp_lv1_3( 12)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 13)<='1';
        else
        D0F_temp_lv1_3( 13)<='0';
        end if;
        if(A(14)='1' AND B( 3)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 14)<='1';
        else
        D0F_temp_lv1_3( 14)<='0';
        end if;
        if(A(14)='1' AND B( 4)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 15)<='1';
        else
        D0F_temp_lv1_3( 15)<='0';
        end if;
        if(A(14)='1' AND B( 4)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 16)<='1';
        else
        D0F_temp_lv1_3( 16)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 17)<='1';
        else
        D0F_temp_lv1_3( 17)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(11)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 18)<='1';
        else
        D0F_temp_lv1_3( 18)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 19)<='1';
        else
        D0F_temp_lv1_3( 19)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 20)<='1';
        else
        D0F_temp_lv1_3( 20)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND D(11)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 21)<='1';
        else
        D0F_temp_lv1_3( 21)<='0';
        end if;
        if(A(15)='1' AND B( 3)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 22)<='1';
        else
        D0F_temp_lv1_3( 22)<='0';
        end if;
        if(A(15)='1' AND B( 4)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 23)<='1';
        else
        D0F_temp_lv1_3( 23)<='0';
        end if;
        if(A(15)='1' AND B( 4)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 24)<='1';
        else
        D0F_temp_lv1_3( 24)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 25)<='1';
        else
        D0F_temp_lv1_3( 25)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D(11)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 26)<='1';
        else
        D0F_temp_lv1_3( 26)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 27)<='1';
        else
        D0F_temp_lv1_3( 27)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 28)<='1';
        else
        D0F_temp_lv1_3( 28)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND D(11)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 29)<='1';
        else
        D0F_temp_lv1_3( 29)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND D(12)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 30)<='1';
        else
        D0F_temp_lv1_3( 30)<='0';
        end if;
        if(A(16)='1' AND B( 4)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 31)<='1';
        else
        D0F_temp_lv1_3( 31)<='0';
        end if;
        if(A(16)='1' AND B( 4)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 32)<='1';
        else
        D0F_temp_lv1_3( 32)<='0';
        end if;
        if(A(16)='1' AND B( 5)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 33)<='1';
        else
        D0F_temp_lv1_3( 33)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 34)<='1';
        else
        D0F_temp_lv1_3( 34)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 35)<='1';
        else
        D0F_temp_lv1_3( 35)<='0';
        end if;
        if(A(17)='1' AND B( 4)='1' AND D( 3)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 36)<='1';
        else
        D0F_temp_lv1_3( 36)<='0';
        end if;
        if(A(17)='1' AND B( 5)='1' AND D( 4)='1' AND E( 3)='1' )then
        D0F_temp_lv1_3( 37)<='1';
        else
        D0F_temp_lv1_3( 37)<='0';
        end if;
        if(A( 0)='1' AND B( 9)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  0)<='1';
        else
        D0F_temp_lv1_4(  0)<='0';
        end if;
        if(A( 0)='1' AND B( 9)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  1)<='1';
        else
        D0F_temp_lv1_4(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 0)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  2)<='1';
        else
        D0F_temp_lv1_4(  2)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 1)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  3)<='1';
        else
        D0F_temp_lv1_4(  3)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  4)<='1';
        else
        D0F_temp_lv1_4(  4)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  5)<='1';
        else
        D0F_temp_lv1_4(  5)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  6)<='1';
        else
        D0F_temp_lv1_4(  6)<='0';
        end if;
        if(A( 1)='1' AND B( 9)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  7)<='1';
        else
        D0F_temp_lv1_4(  7)<='0';
        end if;
        if(A( 1)='1' AND B( 9)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  8)<='1';
        else
        D0F_temp_lv1_4(  8)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 0)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4(  9)<='1';
        else
        D0F_temp_lv1_4(  9)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 10)<='1';
        else
        D0F_temp_lv1_4( 10)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 11)<='1';
        else
        D0F_temp_lv1_4( 11)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 12)<='1';
        else
        D0F_temp_lv1_4( 12)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 13)<='1';
        else
        D0F_temp_lv1_4( 13)<='0';
        end if;
        if(A( 2)='1' AND B( 9)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 14)<='1';
        else
        D0F_temp_lv1_4( 14)<='0';
        end if;
        if(A( 2)='1' AND B( 9)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 15)<='1';
        else
        D0F_temp_lv1_4( 15)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 16)<='1';
        else
        D0F_temp_lv1_4( 16)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 17)<='1';
        else
        D0F_temp_lv1_4( 17)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 18)<='1';
        else
        D0F_temp_lv1_4( 18)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 19)<='1';
        else
        D0F_temp_lv1_4( 19)<='0';
        end if;
        if(A( 3)='1' AND B( 9)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 20)<='1';
        else
        D0F_temp_lv1_4( 20)<='0';
        end if;
        if(A( 3)='1' AND B(10)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 21)<='1';
        else
        D0F_temp_lv1_4( 21)<='0';
        end if;
        if(A( 3)='1' AND B(10)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 22)<='1';
        else
        D0F_temp_lv1_4( 22)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 23)<='1';
        else
        D0F_temp_lv1_4( 23)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 24)<='1';
        else
        D0F_temp_lv1_4( 24)<='0';
        end if;
        if(A(11)='1' AND B(10)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 25)<='1';
        else
        D0F_temp_lv1_4( 25)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 26)<='1';
        else
        D0F_temp_lv1_4( 26)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 27)<='1';
        else
        D0F_temp_lv1_4( 27)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 28)<='1';
        else
        D0F_temp_lv1_4( 28)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 29)<='1';
        else
        D0F_temp_lv1_4( 29)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 8)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 30)<='1';
        else
        D0F_temp_lv1_4( 30)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 9)='1' AND E( 8)='1' )then
        D0F_temp_lv1_4( 31)<='1';
        else
        D0F_temp_lv1_4( 31)<='0';
        end if;
        if(A( 0)='1' AND B( 1)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  0)<='1';
        else
        D0F_temp_lv1_5(  0)<='0';
        end if;
        if(A( 0)='1' AND B( 9)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  1)<='1';
        else
        D0F_temp_lv1_5(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  2)<='1';
        else
        D0F_temp_lv1_5(  2)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  3)<='1';
        else
        D0F_temp_lv1_5(  3)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  4)<='1';
        else
        D0F_temp_lv1_5(  4)<='0';
        end if;
        if(A( 1)='1' AND B( 9)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  5)<='1';
        else
        D0F_temp_lv1_5(  5)<='0';
        end if;
        if(A( 1)='1' AND B(10)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  6)<='1';
        else
        D0F_temp_lv1_5(  6)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 1)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  7)<='1';
        else
        D0F_temp_lv1_5(  7)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  8)<='1';
        else
        D0F_temp_lv1_5(  8)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5(  9)<='1';
        else
        D0F_temp_lv1_5(  9)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 10)<='1';
        else
        D0F_temp_lv1_5( 10)<='0';
        end if;
        if(A( 2)='1' AND B( 9)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 11)<='1';
        else
        D0F_temp_lv1_5( 11)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 12)<='1';
        else
        D0F_temp_lv1_5( 12)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 13)<='1';
        else
        D0F_temp_lv1_5( 13)<='0';
        end if;
        if(A( 2)='1' AND B(11)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 14)<='1';
        else
        D0F_temp_lv1_5( 14)<='0';
        end if;
        if(A( 2)='1' AND B(11)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 15)<='1';
        else
        D0F_temp_lv1_5( 15)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 1)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 16)<='1';
        else
        D0F_temp_lv1_5( 16)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 17)<='1';
        else
        D0F_temp_lv1_5( 17)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 2)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 18)<='1';
        else
        D0F_temp_lv1_5( 18)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 19)<='1';
        else
        D0F_temp_lv1_5( 19)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 20)<='1';
        else
        D0F_temp_lv1_5( 20)<='0';
        end if;
        if(A( 3)='1' AND B(10)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 21)<='1';
        else
        D0F_temp_lv1_5( 21)<='0';
        end if;
        if(A( 3)='1' AND B(11)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 22)<='1';
        else
        D0F_temp_lv1_5( 22)<='0';
        end if;
        if(A( 3)='1' AND B(11)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 23)<='1';
        else
        D0F_temp_lv1_5( 23)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 24)<='1';
        else
        D0F_temp_lv1_5( 24)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 25)<='1';
        else
        D0F_temp_lv1_5( 25)<='0';
        end if;
        if(A( 4)='1' AND B(10)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 26)<='1';
        else
        D0F_temp_lv1_5( 26)<='0';
        end if;
        if(A( 4)='1' AND B(11)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 27)<='1';
        else
        D0F_temp_lv1_5( 27)<='0';
        end if;
        if(A( 4)='1' AND B(11)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 28)<='1';
        else
        D0F_temp_lv1_5( 28)<='0';
        end if;
        if(A( 5)='1' AND B(11)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 29)<='1';
        else
        D0F_temp_lv1_5( 29)<='0';
        end if;
        if(A( 6)='1' AND B( 2)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 30)<='1';
        else
        D0F_temp_lv1_5( 30)<='0';
        end if;
        if(A( 6)='1' AND B(11)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 31)<='1';
        else
        D0F_temp_lv1_5( 31)<='0';
        end if;
        if(A( 6)='1' AND B(12)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 32)<='1';
        else
        D0F_temp_lv1_5( 32)<='0';
        end if;
        if(A( 8)='1' AND B(12)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 33)<='1';
        else
        D0F_temp_lv1_5( 33)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 34)<='1';
        else
        D0F_temp_lv1_5( 34)<='0';
        end if;
        if(A(11)='1' AND B(10)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 35)<='1';
        else
        D0F_temp_lv1_5( 35)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 36)<='1';
        else
        D0F_temp_lv1_5( 36)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 37)<='1';
        else
        D0F_temp_lv1_5( 37)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 38)<='1';
        else
        D0F_temp_lv1_5( 38)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 39)<='1';
        else
        D0F_temp_lv1_5( 39)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 40)<='1';
        else
        D0F_temp_lv1_5( 40)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 41)<='1';
        else
        D0F_temp_lv1_5( 41)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D( 9)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 42)<='1';
        else
        D0F_temp_lv1_5( 42)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D(10)='1' AND E( 9)='1' )then
        D0F_temp_lv1_5( 43)<='1';
        else
        D0F_temp_lv1_5( 43)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  0)<='1';
        else
        D0F_temp_lv1_6(  0)<='0';
        end if;
        if(A( 1)='1' AND B(11)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  1)<='1';
        else
        D0F_temp_lv1_6(  1)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  2)<='1';
        else
        D0F_temp_lv1_6(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D( 2)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  3)<='1';
        else
        D0F_temp_lv1_6(  3)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  4)<='1';
        else
        D0F_temp_lv1_6(  4)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  5)<='1';
        else
        D0F_temp_lv1_6(  5)<='0';
        end if;
        if(A( 2)='1' AND B(11)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  6)<='1';
        else
        D0F_temp_lv1_6(  6)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 2)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  7)<='1';
        else
        D0F_temp_lv1_6(  7)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  8)<='1';
        else
        D0F_temp_lv1_6(  8)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6(  9)<='1';
        else
        D0F_temp_lv1_6(  9)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 10)<='1';
        else
        D0F_temp_lv1_6( 10)<='0';
        end if;
        if(A( 3)='1' AND B(11)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 11)<='1';
        else
        D0F_temp_lv1_6( 11)<='0';
        end if;
        if(A( 3)='1' AND B(12)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 12)<='1';
        else
        D0F_temp_lv1_6( 12)<='0';
        end if;
        if(A( 3)='1' AND B(12)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 13)<='1';
        else
        D0F_temp_lv1_6( 13)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 14)<='1';
        else
        D0F_temp_lv1_6( 14)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 2)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 15)<='1';
        else
        D0F_temp_lv1_6( 15)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 3)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 16)<='1';
        else
        D0F_temp_lv1_6( 16)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 17)<='1';
        else
        D0F_temp_lv1_6( 17)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 18)<='1';
        else
        D0F_temp_lv1_6( 18)<='0';
        end if;
        if(A( 4)='1' AND B(11)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 19)<='1';
        else
        D0F_temp_lv1_6( 19)<='0';
        end if;
        if(A( 4)='1' AND B(12)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 20)<='1';
        else
        D0F_temp_lv1_6( 20)<='0';
        end if;
        if(A( 4)='1' AND B(12)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 21)<='1';
        else
        D0F_temp_lv1_6( 21)<='0';
        end if;
        if(A( 5)='1' AND B( 2)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 22)<='1';
        else
        D0F_temp_lv1_6( 22)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 23)<='1';
        else
        D0F_temp_lv1_6( 23)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 24)<='1';
        else
        D0F_temp_lv1_6( 24)<='0';
        end if;
        if(A( 5)='1' AND B(12)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 25)<='1';
        else
        D0F_temp_lv1_6( 25)<='0';
        end if;
        if(A( 5)='1' AND B(12)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 26)<='1';
        else
        D0F_temp_lv1_6( 26)<='0';
        end if;
        if(A( 6)='1' AND B( 3)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 27)<='1';
        else
        D0F_temp_lv1_6( 27)<='0';
        end if;
        if(A( 6)='1' AND B(12)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 28)<='1';
        else
        D0F_temp_lv1_6( 28)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 29)<='1';
        else
        D0F_temp_lv1_6( 29)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 30)<='1';
        else
        D0F_temp_lv1_6( 30)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 31)<='1';
        else
        D0F_temp_lv1_6( 31)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 32)<='1';
        else
        D0F_temp_lv1_6( 32)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 33)<='1';
        else
        D0F_temp_lv1_6( 33)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 34)<='1';
        else
        D0F_temp_lv1_6( 34)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 35)<='1';
        else
        D0F_temp_lv1_6( 35)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 36)<='1';
        else
        D0F_temp_lv1_6( 36)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D(10)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 37)<='1';
        else
        D0F_temp_lv1_6( 37)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D(11)='1' AND E(10)='1' )then
        D0F_temp_lv1_6( 38)<='1';
        else
        D0F_temp_lv1_6( 38)<='0';
        end if;
        if(A( 2)='1' AND B( 3)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  0)<='1';
        else
        D0F_temp_lv1_7(  0)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D( 3)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  1)<='1';
        else
        D0F_temp_lv1_7(  1)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  2)<='1';
        else
        D0F_temp_lv1_7(  2)<='0';
        end if;
        if(A( 3)='1' AND B( 4)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  3)<='1';
        else
        D0F_temp_lv1_7(  3)<='0';
        end if;
        if(A( 3)='1' AND B(12)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  4)<='1';
        else
        D0F_temp_lv1_7(  4)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 3)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  5)<='1';
        else
        D0F_temp_lv1_7(  5)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  6)<='1';
        else
        D0F_temp_lv1_7(  6)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND D( 3)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  7)<='1';
        else
        D0F_temp_lv1_7(  7)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  8)<='1';
        else
        D0F_temp_lv1_7(  8)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7(  9)<='1';
        else
        D0F_temp_lv1_7(  9)<='0';
        end if;
        if(A( 4)='1' AND B(12)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 10)<='1';
        else
        D0F_temp_lv1_7( 10)<='0';
        end if;
        if(A( 4)='1' AND B(13)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 11)<='1';
        else
        D0F_temp_lv1_7( 11)<='0';
        end if;
        if(A( 4)='1' AND B(13)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 12)<='1';
        else
        D0F_temp_lv1_7( 12)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 13)<='1';
        else
        D0F_temp_lv1_7( 13)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND D( 3)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 14)<='1';
        else
        D0F_temp_lv1_7( 14)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 15)<='1';
        else
        D0F_temp_lv1_7( 15)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 16)<='1';
        else
        D0F_temp_lv1_7( 16)<='0';
        end if;
        if(A( 5)='1' AND B(12)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 17)<='1';
        else
        D0F_temp_lv1_7( 17)<='0';
        end if;
        if(A( 5)='1' AND B(13)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 18)<='1';
        else
        D0F_temp_lv1_7( 18)<='0';
        end if;
        if(A( 5)='1' AND B(13)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 19)<='1';
        else
        D0F_temp_lv1_7( 19)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 20)<='1';
        else
        D0F_temp_lv1_7( 20)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 21)<='1';
        else
        D0F_temp_lv1_7( 21)<='0';
        end if;
        if(A( 6)='1' AND B(12)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 22)<='1';
        else
        D0F_temp_lv1_7( 22)<='0';
        end if;
        if(A( 6)='1' AND B(13)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 23)<='1';
        else
        D0F_temp_lv1_7( 23)<='0';
        end if;
        if(A( 6)='1' AND B(13)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 24)<='1';
        else
        D0F_temp_lv1_7( 24)<='0';
        end if;
        if(A( 7)='1' AND B(13)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 25)<='1';
        else
        D0F_temp_lv1_7( 25)<='0';
        end if;
        if(A( 7)='1' AND B(14)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 26)<='1';
        else
        D0F_temp_lv1_7( 26)<='0';
        end if;
        if(A( 8)='1' AND B(14)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 27)<='1';
        else
        D0F_temp_lv1_7( 27)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 28)<='1';
        else
        D0F_temp_lv1_7( 28)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 29)<='1';
        else
        D0F_temp_lv1_7( 29)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 30)<='1';
        else
        D0F_temp_lv1_7( 30)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 31)<='1';
        else
        D0F_temp_lv1_7( 31)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 32)<='1';
        else
        D0F_temp_lv1_7( 32)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 33)<='1';
        else
        D0F_temp_lv1_7( 33)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 34)<='1';
        else
        D0F_temp_lv1_7( 34)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 35)<='1';
        else
        D0F_temp_lv1_7( 35)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND D(12)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 36)<='1';
        else
        D0F_temp_lv1_7( 36)<='0';
        end if;
        if(A(17)='1' AND B(13)='1' AND D(11)='1' AND E(11)='1' )then
        D0F_temp_lv1_7( 37)<='1';
        else
        D0F_temp_lv1_7( 37)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0(  0)<='1';
        else
        D1F_temp_lv1_0(  0)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 0)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_0(  1)<='1';
        else
        D1F_temp_lv1_0(  1)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0(  2)<='1';
        else
        D1F_temp_lv1_0(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 0)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_0(  3)<='1';
        else
        D1F_temp_lv1_0(  3)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0(  4)<='1';
        else
        D1F_temp_lv1_0(  4)<='0';
        end if;
        if(A(10)='1' AND B( 0)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0(  5)<='1';
        else
        D1F_temp_lv1_0(  5)<='0';
        end if;
        if(A(10)='1' AND B( 9)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0(  6)<='1';
        else
        D1F_temp_lv1_0(  6)<='0';
        end if;
        if(A(11)='1' AND B( 0)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0(  7)<='1';
        else
        D1F_temp_lv1_0(  7)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0(  8)<='1';
        else
        D1F_temp_lv1_0(  8)<='0';
        end if;
        if(A(12)='1' AND B( 0)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0(  9)<='1';
        else
        D1F_temp_lv1_0(  9)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0( 10)<='1';
        else
        D1F_temp_lv1_0( 10)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0( 11)<='1';
        else
        D1F_temp_lv1_0( 11)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0( 12)<='1';
        else
        D1F_temp_lv1_0( 12)<='0';
        end if;
        if(A(13)='1' AND B( 0)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0( 13)<='1';
        else
        D1F_temp_lv1_0( 13)<='0';
        end if;
        if(A(13)='1' AND B( 1)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0( 14)<='1';
        else
        D1F_temp_lv1_0( 14)<='0';
        end if;
        if(A(13)='1' AND B( 9)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0( 15)<='1';
        else
        D1F_temp_lv1_0( 15)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0( 16)<='1';
        else
        D1F_temp_lv1_0( 16)<='0';
        end if;
        if(A(14)='1' AND B(10)='1' AND D( 0)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_0( 17)<='1';
        else
        D1F_temp_lv1_0( 17)<='0';
        end if;
        if(A( 0)='1' AND B( 0)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1(  0)<='1';
        else
        D1F_temp_lv1_1(  0)<='0';
        end if;
        if(A( 0)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1(  1)<='1';
        else
        D1F_temp_lv1_1(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1(  2)<='1';
        else
        D1F_temp_lv1_1(  2)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1(  3)<='1';
        else
        D1F_temp_lv1_1(  3)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 1)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_1(  4)<='1';
        else
        D1F_temp_lv1_1(  4)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1(  5)<='1';
        else
        D1F_temp_lv1_1(  5)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1(  6)<='1';
        else
        D1F_temp_lv1_1(  6)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1(  7)<='1';
        else
        D1F_temp_lv1_1(  7)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1(  8)<='1';
        else
        D1F_temp_lv1_1(  8)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_1(  9)<='1';
        else
        D1F_temp_lv1_1(  9)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 10)<='1';
        else
        D1F_temp_lv1_1( 10)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 11)<='1';
        else
        D1F_temp_lv1_1( 11)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 12)<='1';
        else
        D1F_temp_lv1_1( 12)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_1( 13)<='1';
        else
        D1F_temp_lv1_1( 13)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 14)<='1';
        else
        D1F_temp_lv1_1( 14)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 15)<='1';
        else
        D1F_temp_lv1_1( 15)<='0';
        end if;
        if(A( 6)='1' AND B( 2)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 16)<='1';
        else
        D1F_temp_lv1_1( 16)<='0';
        end if;
        if(A(10)='1' AND B( 0)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 17)<='1';
        else
        D1F_temp_lv1_1( 17)<='0';
        end if;
        if(A(10)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 18)<='1';
        else
        D1F_temp_lv1_1( 18)<='0';
        end if;
        if(A(11)='1' AND B( 0)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 19)<='1';
        else
        D1F_temp_lv1_1( 19)<='0';
        end if;
        if(A(11)='1' AND B( 0)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 20)<='1';
        else
        D1F_temp_lv1_1( 20)<='0';
        end if;
        if(A(11)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 21)<='1';
        else
        D1F_temp_lv1_1( 21)<='0';
        end if;
        if(A(11)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 22)<='1';
        else
        D1F_temp_lv1_1( 22)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 23)<='1';
        else
        D1F_temp_lv1_1( 23)<='0';
        end if;
        if(A(11)='1' AND B(10)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 24)<='1';
        else
        D1F_temp_lv1_1( 24)<='0';
        end if;
        if(A(12)='1' AND B( 0)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 25)<='1';
        else
        D1F_temp_lv1_1( 25)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 26)<='1';
        else
        D1F_temp_lv1_1( 26)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 27)<='1';
        else
        D1F_temp_lv1_1( 27)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 28)<='1';
        else
        D1F_temp_lv1_1( 28)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 29)<='1';
        else
        D1F_temp_lv1_1( 29)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 30)<='1';
        else
        D1F_temp_lv1_1( 30)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 31)<='1';
        else
        D1F_temp_lv1_1( 31)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 32)<='1';
        else
        D1F_temp_lv1_1( 32)<='0';
        end if;
        if(A(13)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 33)<='1';
        else
        D1F_temp_lv1_1( 33)<='0';
        end if;
        if(A(13)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 34)<='1';
        else
        D1F_temp_lv1_1( 34)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 35)<='1';
        else
        D1F_temp_lv1_1( 35)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 36)<='1';
        else
        D1F_temp_lv1_1( 36)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 1)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_1( 37)<='1';
        else
        D1F_temp_lv1_1( 37)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 38)<='1';
        else
        D1F_temp_lv1_1( 38)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 39)<='1';
        else
        D1F_temp_lv1_1( 39)<='0';
        end if;
        if(A(14)='1' AND B( 1)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 40)<='1';
        else
        D1F_temp_lv1_1( 40)<='0';
        end if;
        if(A(14)='1' AND B( 2)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 41)<='1';
        else
        D1F_temp_lv1_1( 41)<='0';
        end if;
        if(A(14)='1' AND B(10)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 42)<='1';
        else
        D1F_temp_lv1_1( 42)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 43)<='1';
        else
        D1F_temp_lv1_1( 43)<='0';
        end if;
        if(A(15)='1' AND B( 2)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 44)<='1';
        else
        D1F_temp_lv1_1( 44)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND D( 1)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_1( 45)<='1';
        else
        D1F_temp_lv1_1( 45)<='0';
        end if;
        if(A( 1)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2(  0)<='1';
        else
        D1F_temp_lv1_2(  0)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2(  1)<='1';
        else
        D1F_temp_lv1_2(  1)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2(  2)<='1';
        else
        D1F_temp_lv1_2(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2(  3)<='1';
        else
        D1F_temp_lv1_2(  3)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_2(  4)<='1';
        else
        D1F_temp_lv1_2(  4)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2(  5)<='1';
        else
        D1F_temp_lv1_2(  5)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2(  6)<='1';
        else
        D1F_temp_lv1_2(  6)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_2(  7)<='1';
        else
        D1F_temp_lv1_2(  7)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_2(  8)<='1';
        else
        D1F_temp_lv1_2(  8)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2(  9)<='1';
        else
        D1F_temp_lv1_2(  9)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 10)<='1';
        else
        D1F_temp_lv1_2( 10)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 11)<='1';
        else
        D1F_temp_lv1_2( 11)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 2)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_2( 12)<='1';
        else
        D1F_temp_lv1_2( 12)<='0';
        end if;
        if(A( 5)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 13)<='1';
        else
        D1F_temp_lv1_2( 13)<='0';
        end if;
        if(A( 5)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 14)<='1';
        else
        D1F_temp_lv1_2( 14)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 15)<='1';
        else
        D1F_temp_lv1_2( 15)<='0';
        end if;
        if(A( 6)='1' AND B( 3)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 16)<='1';
        else
        D1F_temp_lv1_2( 16)<='0';
        end if;
        if(A(11)='1' AND B( 1)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 17)<='1';
        else
        D1F_temp_lv1_2( 17)<='0';
        end if;
        if(A(11)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 18)<='1';
        else
        D1F_temp_lv1_2( 18)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 19)<='1';
        else
        D1F_temp_lv1_2( 19)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 20)<='1';
        else
        D1F_temp_lv1_2( 20)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 21)<='1';
        else
        D1F_temp_lv1_2( 21)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 22)<='1';
        else
        D1F_temp_lv1_2( 22)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 23)<='1';
        else
        D1F_temp_lv1_2( 23)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 24)<='1';
        else
        D1F_temp_lv1_2( 24)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 25)<='1';
        else
        D1F_temp_lv1_2( 25)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 26)<='1';
        else
        D1F_temp_lv1_2( 26)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 27)<='1';
        else
        D1F_temp_lv1_2( 27)<='0';
        end if;
        if(A(13)='1' AND B( 3)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 28)<='1';
        else
        D1F_temp_lv1_2( 28)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 29)<='1';
        else
        D1F_temp_lv1_2( 29)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 30)<='1';
        else
        D1F_temp_lv1_2( 30)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 31)<='1';
        else
        D1F_temp_lv1_2( 31)<='0';
        end if;
        if(A(14)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 32)<='1';
        else
        D1F_temp_lv1_2( 32)<='0';
        end if;
        if(A(14)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 33)<='1';
        else
        D1F_temp_lv1_2( 33)<='0';
        end if;
        if(A(14)='1' AND B( 3)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 34)<='1';
        else
        D1F_temp_lv1_2( 34)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 35)<='1';
        else
        D1F_temp_lv1_2( 35)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 36)<='1';
        else
        D1F_temp_lv1_2( 36)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 37)<='1';
        else
        D1F_temp_lv1_2( 37)<='0';
        end if;
        if(A(15)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 38)<='1';
        else
        D1F_temp_lv1_2( 38)<='0';
        end if;
        if(A(15)='1' AND B( 2)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 39)<='1';
        else
        D1F_temp_lv1_2( 39)<='0';
        end if;
        if(A(15)='1' AND B( 3)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 40)<='1';
        else
        D1F_temp_lv1_2( 40)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND D( 2)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_2( 41)<='1';
        else
        D1F_temp_lv1_2( 41)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 42)<='1';
        else
        D1F_temp_lv1_2( 42)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 43)<='1';
        else
        D1F_temp_lv1_2( 43)<='0';
        end if;
        if(A(16)='1' AND B( 3)='1' AND D( 2)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_2( 44)<='1';
        else
        D1F_temp_lv1_2( 44)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3(  0)<='1';
        else
        D1F_temp_lv1_3(  0)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3(  1)<='1';
        else
        D1F_temp_lv1_3(  1)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_3(  2)<='1';
        else
        D1F_temp_lv1_3(  2)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3(  3)<='1';
        else
        D1F_temp_lv1_3(  3)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3(  4)<='1';
        else
        D1F_temp_lv1_3(  4)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_3(  5)<='1';
        else
        D1F_temp_lv1_3(  5)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_3(  6)<='1';
        else
        D1F_temp_lv1_3(  6)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3(  7)<='1';
        else
        D1F_temp_lv1_3(  7)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_3(  8)<='1';
        else
        D1F_temp_lv1_3(  8)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3(  9)<='1';
        else
        D1F_temp_lv1_3(  9)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 10)<='1';
        else
        D1F_temp_lv1_3( 10)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 11)<='1';
        else
        D1F_temp_lv1_3( 11)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_3( 12)<='1';
        else
        D1F_temp_lv1_3( 12)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 13)<='1';
        else
        D1F_temp_lv1_3( 13)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 14)<='1';
        else
        D1F_temp_lv1_3( 14)<='0';
        end if;
        if(A(12)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 15)<='1';
        else
        D1F_temp_lv1_3( 15)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3( 16)<='1';
        else
        D1F_temp_lv1_3( 16)<='0';
        end if;
        if(A(13)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3( 17)<='1';
        else
        D1F_temp_lv1_3( 17)<='0';
        end if;
        if(A(13)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 18)<='1';
        else
        D1F_temp_lv1_3( 18)<='0';
        end if;
        if(A(13)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 19)<='1';
        else
        D1F_temp_lv1_3( 19)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3( 20)<='1';
        else
        D1F_temp_lv1_3( 20)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 21)<='1';
        else
        D1F_temp_lv1_3( 21)<='0';
        end if;
        if(A(14)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3( 22)<='1';
        else
        D1F_temp_lv1_3( 22)<='0';
        end if;
        if(A(14)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 23)<='1';
        else
        D1F_temp_lv1_3( 23)<='0';
        end if;
        if(A(14)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 24)<='1';
        else
        D1F_temp_lv1_3( 24)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3( 25)<='1';
        else
        D1F_temp_lv1_3( 25)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 26)<='1';
        else
        D1F_temp_lv1_3( 26)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 27)<='1';
        else
        D1F_temp_lv1_3( 27)<='0';
        end if;
        if(A(15)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3( 28)<='1';
        else
        D1F_temp_lv1_3( 28)<='0';
        end if;
        if(A(15)='1' AND B( 3)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 29)<='1';
        else
        D1F_temp_lv1_3( 29)<='0';
        end if;
        if(A(15)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 30)<='1';
        else
        D1F_temp_lv1_3( 30)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3( 31)<='1';
        else
        D1F_temp_lv1_3( 31)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 32)<='1';
        else
        D1F_temp_lv1_3( 32)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 33)<='1';
        else
        D1F_temp_lv1_3( 33)<='0';
        end if;
        if(A(16)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_3( 34)<='1';
        else
        D1F_temp_lv1_3( 34)<='0';
        end if;
        if(A(16)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 35)<='1';
        else
        D1F_temp_lv1_3( 35)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 36)<='1';
        else
        D1F_temp_lv1_3( 36)<='0';
        end if;
        if(A(17)='1' AND B( 4)='1' AND D( 3)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_3( 37)<='1';
        else
        D1F_temp_lv1_3( 37)<='0';
        end if;
        if(A( 0)='1' AND B( 9)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  0)<='1';
        else
        D1F_temp_lv1_4(  0)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  1)<='1';
        else
        D1F_temp_lv1_4(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 9)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  2)<='1';
        else
        D1F_temp_lv1_4(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  3)<='1';
        else
        D1F_temp_lv1_4(  3)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  4)<='1';
        else
        D1F_temp_lv1_4(  4)<='0';
        end if;
        if(A( 2)='1' AND B( 9)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  5)<='1';
        else
        D1F_temp_lv1_4(  5)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  6)<='1';
        else
        D1F_temp_lv1_4(  6)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  7)<='1';
        else
        D1F_temp_lv1_4(  7)<='0';
        end if;
        if(A( 3)='1' AND B( 9)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  8)<='1';
        else
        D1F_temp_lv1_4(  8)<='0';
        end if;
        if(A( 3)='1' AND B(10)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4(  9)<='1';
        else
        D1F_temp_lv1_4(  9)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 8)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_4( 10)<='1';
        else
        D1F_temp_lv1_4( 10)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4( 11)<='1';
        else
        D1F_temp_lv1_4( 11)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 8)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_4( 12)<='1';
        else
        D1F_temp_lv1_4( 12)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4( 13)<='1';
        else
        D1F_temp_lv1_4( 13)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4( 14)<='1';
        else
        D1F_temp_lv1_4( 14)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 8)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_4( 15)<='1';
        else
        D1F_temp_lv1_4( 15)<='0';
        end if;
        if(A( 0)='1' AND B( 1)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5(  0)<='1';
        else
        D1F_temp_lv1_5(  0)<='0';
        end if;
        if(A( 0)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5(  1)<='1';
        else
        D1F_temp_lv1_5(  1)<='0';
        end if;
        if(A( 0)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5(  2)<='1';
        else
        D1F_temp_lv1_5(  2)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5(  3)<='1';
        else
        D1F_temp_lv1_5(  3)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5(  4)<='1';
        else
        D1F_temp_lv1_5(  4)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5(  5)<='1';
        else
        D1F_temp_lv1_5(  5)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5(  6)<='1';
        else
        D1F_temp_lv1_5(  6)<='0';
        end if;
        if(A( 1)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5(  7)<='1';
        else
        D1F_temp_lv1_5(  7)<='0';
        end if;
        if(A( 1)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5(  8)<='1';
        else
        D1F_temp_lv1_5(  8)<='0';
        end if;
        if(A( 1)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5(  9)<='1';
        else
        D1F_temp_lv1_5(  9)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 10)<='1';
        else
        D1F_temp_lv1_5( 10)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 11)<='1';
        else
        D1F_temp_lv1_5( 11)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 12)<='1';
        else
        D1F_temp_lv1_5( 12)<='0';
        end if;
        if(A( 2)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 13)<='1';
        else
        D1F_temp_lv1_5( 13)<='0';
        end if;
        if(A( 2)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 14)<='1';
        else
        D1F_temp_lv1_5( 14)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 15)<='1';
        else
        D1F_temp_lv1_5( 15)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 16)<='1';
        else
        D1F_temp_lv1_5( 16)<='0';
        end if;
        if(A( 2)='1' AND B(11)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 17)<='1';
        else
        D1F_temp_lv1_5( 17)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 18)<='1';
        else
        D1F_temp_lv1_5( 18)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 19)<='1';
        else
        D1F_temp_lv1_5( 19)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 20)<='1';
        else
        D1F_temp_lv1_5( 20)<='0';
        end if;
        if(A( 3)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 21)<='1';
        else
        D1F_temp_lv1_5( 21)<='0';
        end if;
        if(A( 3)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 22)<='1';
        else
        D1F_temp_lv1_5( 22)<='0';
        end if;
        if(A( 3)='1' AND B(11)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 23)<='1';
        else
        D1F_temp_lv1_5( 23)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 24)<='1';
        else
        D1F_temp_lv1_5( 24)<='0';
        end if;
        if(A( 4)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 25)<='1';
        else
        D1F_temp_lv1_5( 25)<='0';
        end if;
        if(A( 4)='1' AND B(11)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 26)<='1';
        else
        D1F_temp_lv1_5( 26)<='0';
        end if;
        if(A( 6)='1' AND B( 2)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 27)<='1';
        else
        D1F_temp_lv1_5( 27)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 0)='1' )then
        D1F_temp_lv1_5( 28)<='1';
        else
        D1F_temp_lv1_5( 28)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 29)<='1';
        else
        D1F_temp_lv1_5( 29)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 30)<='1';
        else
        D1F_temp_lv1_5( 30)<='0';
        end if;
        if(A(11)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 31)<='1';
        else
        D1F_temp_lv1_5( 31)<='0';
        end if;
        if(A(11)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 32)<='1';
        else
        D1F_temp_lv1_5( 32)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 33)<='1';
        else
        D1F_temp_lv1_5( 33)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_5( 34)<='1';
        else
        D1F_temp_lv1_5( 34)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 35)<='1';
        else
        D1F_temp_lv1_5( 35)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 36)<='1';
        else
        D1F_temp_lv1_5( 36)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 37)<='1';
        else
        D1F_temp_lv1_5( 37)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_5( 38)<='1';
        else
        D1F_temp_lv1_5( 38)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 8)='1' )then
        D1F_temp_lv1_5( 39)<='1';
        else
        D1F_temp_lv1_5( 39)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 40)<='1';
        else
        D1F_temp_lv1_5( 40)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 9)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_5( 41)<='1';
        else
        D1F_temp_lv1_5( 41)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 42)<='1';
        else
        D1F_temp_lv1_5( 42)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D( 9)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_5( 43)<='1';
        else
        D1F_temp_lv1_5( 43)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6(  0)<='1';
        else
        D1F_temp_lv1_6(  0)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6(  1)<='1';
        else
        D1F_temp_lv1_6(  1)<='0';
        end if;
        if(A( 1)='1' AND B(11)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6(  2)<='1';
        else
        D1F_temp_lv1_6(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6(  3)<='1';
        else
        D1F_temp_lv1_6(  3)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6(  4)<='1';
        else
        D1F_temp_lv1_6(  4)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6(  5)<='1';
        else
        D1F_temp_lv1_6(  5)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6(  6)<='1';
        else
        D1F_temp_lv1_6(  6)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6(  7)<='1';
        else
        D1F_temp_lv1_6(  7)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6(  8)<='1';
        else
        D1F_temp_lv1_6(  8)<='0';
        end if;
        if(A( 2)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6(  9)<='1';
        else
        D1F_temp_lv1_6(  9)<='0';
        end if;
        if(A( 2)='1' AND B(11)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 10)<='1';
        else
        D1F_temp_lv1_6( 10)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 11)<='1';
        else
        D1F_temp_lv1_6( 11)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 12)<='1';
        else
        D1F_temp_lv1_6( 12)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 13)<='1';
        else
        D1F_temp_lv1_6( 13)<='0';
        end if;
        if(A( 3)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 14)<='1';
        else
        D1F_temp_lv1_6( 14)<='0';
        end if;
        if(A( 3)='1' AND B(11)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 15)<='1';
        else
        D1F_temp_lv1_6( 15)<='0';
        end if;
        if(A( 3)='1' AND B(12)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 16)<='1';
        else
        D1F_temp_lv1_6( 16)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 17)<='1';
        else
        D1F_temp_lv1_6( 17)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 18)<='1';
        else
        D1F_temp_lv1_6( 18)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 19)<='1';
        else
        D1F_temp_lv1_6( 19)<='0';
        end if;
        if(A( 4)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 20)<='1';
        else
        D1F_temp_lv1_6( 20)<='0';
        end if;
        if(A( 4)='1' AND B(11)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 21)<='1';
        else
        D1F_temp_lv1_6( 21)<='0';
        end if;
        if(A( 4)='1' AND B(12)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 22)<='1';
        else
        D1F_temp_lv1_6( 22)<='0';
        end if;
        if(A( 5)='1' AND B( 2)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 23)<='1';
        else
        D1F_temp_lv1_6( 23)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 24)<='1';
        else
        D1F_temp_lv1_6( 24)<='0';
        end if;
        if(A( 5)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 25)<='1';
        else
        D1F_temp_lv1_6( 25)<='0';
        end if;
        if(A( 5)='1' AND B(12)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 26)<='1';
        else
        D1F_temp_lv1_6( 26)<='0';
        end if;
        if(A( 6)='1' AND B( 3)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 27)<='1';
        else
        D1F_temp_lv1_6( 27)<='0';
        end if;
        if(A( 6)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 28)<='1';
        else
        D1F_temp_lv1_6( 28)<='0';
        end if;
        if(A( 6)='1' AND B(12)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 29)<='1';
        else
        D1F_temp_lv1_6( 29)<='0';
        end if;
        if(A( 6)='1' AND B(12)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 30)<='1';
        else
        D1F_temp_lv1_6( 30)<='0';
        end if;
        if(A( 8)='1' AND B(12)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 31)<='1';
        else
        D1F_temp_lv1_6( 31)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 32)<='1';
        else
        D1F_temp_lv1_6( 32)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 33)<='1';
        else
        D1F_temp_lv1_6( 33)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_6( 34)<='1';
        else
        D1F_temp_lv1_6( 34)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 35)<='1';
        else
        D1F_temp_lv1_6( 35)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 36)<='1';
        else
        D1F_temp_lv1_6( 36)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D(10)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_6( 37)<='1';
        else
        D1F_temp_lv1_6( 37)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 38)<='1';
        else
        D1F_temp_lv1_6( 38)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_6( 39)<='1';
        else
        D1F_temp_lv1_6( 39)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 9)='1' )then
        D1F_temp_lv1_6( 40)<='1';
        else
        D1F_temp_lv1_6( 40)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 41)<='1';
        else
        D1F_temp_lv1_6( 41)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(10)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_6( 42)<='1';
        else
        D1F_temp_lv1_6( 42)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 43)<='1';
        else
        D1F_temp_lv1_6( 43)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND D(10)='1' AND NOT E( 1)='1' )then
        D1F_temp_lv1_6( 44)<='1';
        else
        D1F_temp_lv1_6( 44)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D(10)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_6( 45)<='1';
        else
        D1F_temp_lv1_6( 45)<='0';
        end if;
        if(A( 2)='1' AND B( 3)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7(  0)<='1';
        else
        D1F_temp_lv1_7(  0)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7(  1)<='1';
        else
        D1F_temp_lv1_7(  1)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7(  2)<='1';
        else
        D1F_temp_lv1_7(  2)<='0';
        end if;
        if(A( 3)='1' AND B( 4)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7(  3)<='1';
        else
        D1F_temp_lv1_7(  3)<='0';
        end if;
        if(A( 3)='1' AND B(12)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7(  4)<='1';
        else
        D1F_temp_lv1_7(  4)<='0';
        end if;
        if(A( 3)='1' AND B(12)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7(  5)<='1';
        else
        D1F_temp_lv1_7(  5)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7(  6)<='1';
        else
        D1F_temp_lv1_7(  6)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7(  7)<='1';
        else
        D1F_temp_lv1_7(  7)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7(  8)<='1';
        else
        D1F_temp_lv1_7(  8)<='0';
        end if;
        if(A( 4)='1' AND B(12)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7(  9)<='1';
        else
        D1F_temp_lv1_7(  9)<='0';
        end if;
        if(A( 4)='1' AND B(12)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 10)<='1';
        else
        D1F_temp_lv1_7( 10)<='0';
        end if;
        if(A( 4)='1' AND B(13)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 11)<='1';
        else
        D1F_temp_lv1_7( 11)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7( 12)<='1';
        else
        D1F_temp_lv1_7( 12)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 13)<='1';
        else
        D1F_temp_lv1_7( 13)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 14)<='1';
        else
        D1F_temp_lv1_7( 14)<='0';
        end if;
        if(A( 5)='1' AND B(12)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7( 15)<='1';
        else
        D1F_temp_lv1_7( 15)<='0';
        end if;
        if(A( 5)='1' AND B(12)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 16)<='1';
        else
        D1F_temp_lv1_7( 16)<='0';
        end if;
        if(A( 5)='1' AND B(13)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 17)<='1';
        else
        D1F_temp_lv1_7( 17)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 18)<='1';
        else
        D1F_temp_lv1_7( 18)<='0';
        end if;
        if(A( 6)='1' AND B(12)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 19)<='1';
        else
        D1F_temp_lv1_7( 19)<='0';
        end if;
        if(A( 6)='1' AND B(13)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 20)<='1';
        else
        D1F_temp_lv1_7( 20)<='0';
        end if;
        if(A( 7)='1' AND B(13)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 21)<='1';
        else
        D1F_temp_lv1_7( 21)<='0';
        end if;
        if(A( 8)='1' AND B(14)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 22)<='1';
        else
        D1F_temp_lv1_7( 22)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7( 23)<='1';
        else
        D1F_temp_lv1_7( 23)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7( 24)<='1';
        else
        D1F_temp_lv1_7( 24)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 25)<='1';
        else
        D1F_temp_lv1_7( 25)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(11)='1' AND NOT E( 2)='1' )then
        D1F_temp_lv1_7( 26)<='1';
        else
        D1F_temp_lv1_7( 26)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(11)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_7( 27)<='1';
        else
        D1F_temp_lv1_7( 27)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7( 28)<='1';
        else
        D1F_temp_lv1_7( 28)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 29)<='1';
        else
        D1F_temp_lv1_7( 29)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND D(11)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_7( 30)<='1';
        else
        D1F_temp_lv1_7( 30)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 31)<='1';
        else
        D1F_temp_lv1_7( 31)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D(11)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_7( 32)<='1';
        else
        D1F_temp_lv1_7( 32)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D(11)='1' AND NOT E(10)='1' )then
        D1F_temp_lv1_7( 33)<='1';
        else
        D1F_temp_lv1_7( 33)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 34)<='1';
        else
        D1F_temp_lv1_7( 34)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND D(11)='1' AND NOT E( 3)='1' )then
        D1F_temp_lv1_7( 35)<='1';
        else
        D1F_temp_lv1_7( 35)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 36)<='1';
        else
        D1F_temp_lv1_7( 36)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 37)<='1';
        else
        D1F_temp_lv1_7( 37)<='0';
        end if;
        if(A(17)='1' AND B(13)='1' AND D(11)='1' AND NOT E(11)='1' )then
        D1F_temp_lv1_7( 38)<='1';
        else
        D1F_temp_lv1_7( 38)<='0';
        end if;
        if(A( 0)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0(  0)<='1';
        else
        D2F_temp_lv1_0(  0)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0(  1)<='1';
        else
        D2F_temp_lv1_0(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0(  2)<='1';
        else
        D2F_temp_lv1_0(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0(  3)<='1';
        else
        D2F_temp_lv1_0(  3)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0(  4)<='1';
        else
        D2F_temp_lv1_0(  4)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0(  5)<='1';
        else
        D2F_temp_lv1_0(  5)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0(  6)<='1';
        else
        D2F_temp_lv1_0(  6)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0(  7)<='1';
        else
        D2F_temp_lv1_0(  7)<='0';
        end if;
        if(A(10)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0(  8)<='1';
        else
        D2F_temp_lv1_0(  8)<='0';
        end if;
        if(A(10)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0(  9)<='1';
        else
        D2F_temp_lv1_0(  9)<='0';
        end if;
        if(A(10)='1' AND B( 9)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 10)<='1';
        else
        D2F_temp_lv1_0( 10)<='0';
        end if;
        if(A(11)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 11)<='1';
        else
        D2F_temp_lv1_0( 11)<='0';
        end if;
        if(A(11)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 12)<='1';
        else
        D2F_temp_lv1_0( 12)<='0';
        end if;
        if(A(11)='1' AND B( 1)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 13)<='1';
        else
        D2F_temp_lv1_0( 13)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 14)<='1';
        else
        D2F_temp_lv1_0( 14)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 15)<='1';
        else
        D2F_temp_lv1_0( 15)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND E( 0)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_0( 16)<='1';
        else
        D2F_temp_lv1_0( 16)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND E( 0)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_0( 17)<='1';
        else
        D2F_temp_lv1_0( 17)<='0';
        end if;
        if(A(12)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 18)<='1';
        else
        D2F_temp_lv1_0( 18)<='0';
        end if;
        if(A(12)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 19)<='1';
        else
        D2F_temp_lv1_0( 19)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 20)<='1';
        else
        D2F_temp_lv1_0( 20)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 21)<='1';
        else
        D2F_temp_lv1_0( 21)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 22)<='1';
        else
        D2F_temp_lv1_0( 22)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 23)<='1';
        else
        D2F_temp_lv1_0( 23)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND E( 0)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_0( 24)<='1';
        else
        D2F_temp_lv1_0( 24)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 25)<='1';
        else
        D2F_temp_lv1_0( 25)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 26)<='1';
        else
        D2F_temp_lv1_0( 26)<='0';
        end if;
        if(A(13)='1' AND B( 0)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 27)<='1';
        else
        D2F_temp_lv1_0( 27)<='0';
        end if;
        if(A(13)='1' AND B( 1)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 28)<='1';
        else
        D2F_temp_lv1_0( 28)<='0';
        end if;
        if(A(13)='1' AND B( 1)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 29)<='1';
        else
        D2F_temp_lv1_0( 29)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 30)<='1';
        else
        D2F_temp_lv1_0( 30)<='0';
        end if;
        if(A(13)='1' AND B( 9)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 31)<='1';
        else
        D2F_temp_lv1_0( 31)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 32)<='1';
        else
        D2F_temp_lv1_0( 32)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND E( 0)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_0( 33)<='1';
        else
        D2F_temp_lv1_0( 33)<='0';
        end if;
        if(A(14)='1' AND B(10)='1' AND E( 0)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_0( 34)<='1';
        else
        D2F_temp_lv1_0( 34)<='0';
        end if;
        if(A( 0)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1(  0)<='1';
        else
        D2F_temp_lv1_1(  0)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1(  1)<='1';
        else
        D2F_temp_lv1_1(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1(  2)<='1';
        else
        D2F_temp_lv1_1(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1(  3)<='1';
        else
        D2F_temp_lv1_1(  3)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1(  4)<='1';
        else
        D2F_temp_lv1_1(  4)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1(  5)<='1';
        else
        D2F_temp_lv1_1(  5)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1(  6)<='1';
        else
        D2F_temp_lv1_1(  6)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1(  7)<='1';
        else
        D2F_temp_lv1_1(  7)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1(  8)<='1';
        else
        D2F_temp_lv1_1(  8)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1(  9)<='1';
        else
        D2F_temp_lv1_1(  9)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 10)<='1';
        else
        D2F_temp_lv1_1( 10)<='0';
        end if;
        if(A( 5)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 11)<='1';
        else
        D2F_temp_lv1_1( 11)<='0';
        end if;
        if(A( 6)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 12)<='1';
        else
        D2F_temp_lv1_1( 12)<='0';
        end if;
        if(A(10)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 13)<='1';
        else
        D2F_temp_lv1_1( 13)<='0';
        end if;
        if(A(11)='1' AND B( 0)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 14)<='1';
        else
        D2F_temp_lv1_1( 14)<='0';
        end if;
        if(A(11)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 15)<='1';
        else
        D2F_temp_lv1_1( 15)<='0';
        end if;
        if(A(11)='1' AND B(10)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 16)<='1';
        else
        D2F_temp_lv1_1( 16)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 17)<='1';
        else
        D2F_temp_lv1_1( 17)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 18)<='1';
        else
        D2F_temp_lv1_1( 18)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 19)<='1';
        else
        D2F_temp_lv1_1( 19)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 20)<='1';
        else
        D2F_temp_lv1_1( 20)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 21)<='1';
        else
        D2F_temp_lv1_1( 21)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 22)<='1';
        else
        D2F_temp_lv1_1( 22)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND E( 1)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_1( 23)<='1';
        else
        D2F_temp_lv1_1( 23)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 24)<='1';
        else
        D2F_temp_lv1_1( 24)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 25)<='1';
        else
        D2F_temp_lv1_1( 25)<='0';
        end if;
        if(A(13)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 26)<='1';
        else
        D2F_temp_lv1_1( 26)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 27)<='1';
        else
        D2F_temp_lv1_1( 27)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 28)<='1';
        else
        D2F_temp_lv1_1( 28)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 29)<='1';
        else
        D2F_temp_lv1_1( 29)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND E( 1)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_1( 30)<='1';
        else
        D2F_temp_lv1_1( 30)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 31)<='1';
        else
        D2F_temp_lv1_1( 31)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 32)<='1';
        else
        D2F_temp_lv1_1( 32)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND E( 1)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_1( 33)<='1';
        else
        D2F_temp_lv1_1( 33)<='0';
        end if;
        if(A(14)='1' AND B( 1)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 34)<='1';
        else
        D2F_temp_lv1_1( 34)<='0';
        end if;
        if(A(14)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 35)<='1';
        else
        D2F_temp_lv1_1( 35)<='0';
        end if;
        if(A(14)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 36)<='1';
        else
        D2F_temp_lv1_1( 36)<='0';
        end if;
        if(A(14)='1' AND B(10)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 37)<='1';
        else
        D2F_temp_lv1_1( 37)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 38)<='1';
        else
        D2F_temp_lv1_1( 38)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 39)<='1';
        else
        D2F_temp_lv1_1( 39)<='0';
        end if;
        if(A(15)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 40)<='1';
        else
        D2F_temp_lv1_1( 40)<='0';
        end if;
        if(A(15)='1' AND B( 2)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 41)<='1';
        else
        D2F_temp_lv1_1( 41)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND E( 1)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_1( 42)<='1';
        else
        D2F_temp_lv1_1( 42)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND E( 1)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_1( 43)<='1';
        else
        D2F_temp_lv1_1( 43)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND E( 1)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_1( 44)<='1';
        else
        D2F_temp_lv1_1( 44)<='0';
        end if;
        if(A( 1)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2(  0)<='1';
        else
        D2F_temp_lv1_2(  0)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2(  1)<='1';
        else
        D2F_temp_lv1_2(  1)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2(  2)<='1';
        else
        D2F_temp_lv1_2(  2)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2(  3)<='1';
        else
        D2F_temp_lv1_2(  3)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2(  4)<='1';
        else
        D2F_temp_lv1_2(  4)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2(  5)<='1';
        else
        D2F_temp_lv1_2(  5)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2(  6)<='1';
        else
        D2F_temp_lv1_2(  6)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2(  7)<='1';
        else
        D2F_temp_lv1_2(  7)<='0';
        end if;
        if(A( 5)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2(  8)<='1';
        else
        D2F_temp_lv1_2(  8)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2(  9)<='1';
        else
        D2F_temp_lv1_2(  9)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2( 10)<='1';
        else
        D2F_temp_lv1_2( 10)<='0';
        end if;
        if(A( 6)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 11)<='1';
        else
        D2F_temp_lv1_2( 11)<='0';
        end if;
        if(A(11)='1' AND B( 1)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 12)<='1';
        else
        D2F_temp_lv1_2( 12)<='0';
        end if;
        if(A(11)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 13)<='1';
        else
        D2F_temp_lv1_2( 13)<='0';
        end if;
        if(A(12)='1' AND B( 1)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 14)<='1';
        else
        D2F_temp_lv1_2( 14)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 15)<='1';
        else
        D2F_temp_lv1_2( 15)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 16)<='1';
        else
        D2F_temp_lv1_2( 16)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 17)<='1';
        else
        D2F_temp_lv1_2( 17)<='0';
        end if;
        if(A(13)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2( 18)<='1';
        else
        D2F_temp_lv1_2( 18)<='0';
        end if;
        if(A(13)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 19)<='1';
        else
        D2F_temp_lv1_2( 19)<='0';
        end if;
        if(A(13)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2( 20)<='1';
        else
        D2F_temp_lv1_2( 20)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 21)<='1';
        else
        D2F_temp_lv1_2( 21)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND E( 2)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_2( 22)<='1';
        else
        D2F_temp_lv1_2( 22)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 23)<='1';
        else
        D2F_temp_lv1_2( 23)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2( 24)<='1';
        else
        D2F_temp_lv1_2( 24)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND E( 2)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_2( 25)<='1';
        else
        D2F_temp_lv1_2( 25)<='0';
        end if;
        if(A(14)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 26)<='1';
        else
        D2F_temp_lv1_2( 26)<='0';
        end if;
        if(A(14)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 27)<='1';
        else
        D2F_temp_lv1_2( 27)<='0';
        end if;
        if(A(14)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2( 28)<='1';
        else
        D2F_temp_lv1_2( 28)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 29)<='1';
        else
        D2F_temp_lv1_2( 29)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND E( 2)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_2( 30)<='1';
        else
        D2F_temp_lv1_2( 30)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 31)<='1';
        else
        D2F_temp_lv1_2( 31)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2( 32)<='1';
        else
        D2F_temp_lv1_2( 32)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND E( 2)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_2( 33)<='1';
        else
        D2F_temp_lv1_2( 33)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND E( 2)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_2( 34)<='1';
        else
        D2F_temp_lv1_2( 34)<='0';
        end if;
        if(A(15)='1' AND B( 2)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 35)<='1';
        else
        D2F_temp_lv1_2( 35)<='0';
        end if;
        if(A(15)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 36)<='1';
        else
        D2F_temp_lv1_2( 36)<='0';
        end if;
        if(A(15)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2( 37)<='1';
        else
        D2F_temp_lv1_2( 37)<='0';
        end if;
        if(A(15)='1' AND B(11)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 38)<='1';
        else
        D2F_temp_lv1_2( 38)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 39)<='1';
        else
        D2F_temp_lv1_2( 39)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2( 40)<='1';
        else
        D2F_temp_lv1_2( 40)<='0';
        end if;
        if(A(16)='1' AND B( 3)='1' AND E( 2)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_2( 41)<='1';
        else
        D2F_temp_lv1_2( 41)<='0';
        end if;
        if(A(16)='1' AND B( 4)='1' AND E( 2)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_2( 42)<='1';
        else
        D2F_temp_lv1_2( 42)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3(  0)<='1';
        else
        D2F_temp_lv1_3(  0)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3(  1)<='1';
        else
        D2F_temp_lv1_3(  1)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3(  2)<='1';
        else
        D2F_temp_lv1_3(  2)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3(  3)<='1';
        else
        D2F_temp_lv1_3(  3)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3(  4)<='1';
        else
        D2F_temp_lv1_3(  4)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3(  5)<='1';
        else
        D2F_temp_lv1_3(  5)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3(  6)<='1';
        else
        D2F_temp_lv1_3(  6)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3(  7)<='1';
        else
        D2F_temp_lv1_3(  7)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3(  8)<='1';
        else
        D2F_temp_lv1_3(  8)<='0';
        end if;
        if(A(12)='1' AND B( 2)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3(  9)<='1';
        else
        D2F_temp_lv1_3(  9)<='0';
        end if;
        if(A(12)='1' AND B( 3)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 10)<='1';
        else
        D2F_temp_lv1_3( 10)<='0';
        end if;
        if(A(13)='1' AND B( 3)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 11)<='1';
        else
        D2F_temp_lv1_3( 11)<='0';
        end if;
        if(A(13)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 12)<='1';
        else
        D2F_temp_lv1_3( 12)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 13)<='1';
        else
        D2F_temp_lv1_3( 13)<='0';
        end if;
        if(A(14)='1' AND B( 3)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 14)<='1';
        else
        D2F_temp_lv1_3( 14)<='0';
        end if;
        if(A(14)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 15)<='1';
        else
        D2F_temp_lv1_3( 15)<='0';
        end if;
        if(A(14)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3( 16)<='1';
        else
        D2F_temp_lv1_3( 16)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 17)<='1';
        else
        D2F_temp_lv1_3( 17)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND E( 3)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_3( 18)<='1';
        else
        D2F_temp_lv1_3( 18)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 19)<='1';
        else
        D2F_temp_lv1_3( 19)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3( 20)<='1';
        else
        D2F_temp_lv1_3( 20)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND E( 3)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_3( 21)<='1';
        else
        D2F_temp_lv1_3( 21)<='0';
        end if;
        if(A(15)='1' AND B( 3)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 22)<='1';
        else
        D2F_temp_lv1_3( 22)<='0';
        end if;
        if(A(15)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 23)<='1';
        else
        D2F_temp_lv1_3( 23)<='0';
        end if;
        if(A(15)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3( 24)<='1';
        else
        D2F_temp_lv1_3( 24)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 25)<='1';
        else
        D2F_temp_lv1_3( 25)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND E( 3)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_3( 26)<='1';
        else
        D2F_temp_lv1_3( 26)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 27)<='1';
        else
        D2F_temp_lv1_3( 27)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3( 28)<='1';
        else
        D2F_temp_lv1_3( 28)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND E( 3)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_3( 29)<='1';
        else
        D2F_temp_lv1_3( 29)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND E( 3)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_3( 30)<='1';
        else
        D2F_temp_lv1_3( 30)<='0';
        end if;
        if(A(16)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 31)<='1';
        else
        D2F_temp_lv1_3( 31)<='0';
        end if;
        if(A(16)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3( 32)<='1';
        else
        D2F_temp_lv1_3( 32)<='0';
        end if;
        if(A(16)='1' AND B( 5)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3( 33)<='1';
        else
        D2F_temp_lv1_3( 33)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 34)<='1';
        else
        D2F_temp_lv1_3( 34)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3( 35)<='1';
        else
        D2F_temp_lv1_3( 35)<='0';
        end if;
        if(A(17)='1' AND B( 4)='1' AND E( 3)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_3( 36)<='1';
        else
        D2F_temp_lv1_3( 36)<='0';
        end if;
        if(A(17)='1' AND B( 5)='1' AND E( 3)='1' AND NOT D( 4)='1' )then
        D2F_temp_lv1_3( 37)<='1';
        else
        D2F_temp_lv1_3( 37)<='0';
        end if;
        if(A( 0)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4(  0)<='1';
        else
        D2F_temp_lv1_4(  0)<='0';
        end if;
        if(A( 0)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4(  1)<='1';
        else
        D2F_temp_lv1_4(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND E( 8)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_4(  2)<='1';
        else
        D2F_temp_lv1_4(  2)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND E( 8)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_4(  3)<='1';
        else
        D2F_temp_lv1_4(  3)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4(  4)<='1';
        else
        D2F_temp_lv1_4(  4)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4(  5)<='1';
        else
        D2F_temp_lv1_4(  5)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4(  6)<='1';
        else
        D2F_temp_lv1_4(  6)<='0';
        end if;
        if(A( 1)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4(  7)<='1';
        else
        D2F_temp_lv1_4(  7)<='0';
        end if;
        if(A( 1)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4(  8)<='1';
        else
        D2F_temp_lv1_4(  8)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND E( 8)='1' AND NOT D( 0)='1' )then
        D2F_temp_lv1_4(  9)<='1';
        else
        D2F_temp_lv1_4(  9)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 10)<='1';
        else
        D2F_temp_lv1_4( 10)<='0';
        end if;
        if(A( 2)='1' AND B( 0)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 11)<='1';
        else
        D2F_temp_lv1_4( 11)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 12)<='1';
        else
        D2F_temp_lv1_4( 12)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 13)<='1';
        else
        D2F_temp_lv1_4( 13)<='0';
        end if;
        if(A( 2)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 14)<='1';
        else
        D2F_temp_lv1_4( 14)<='0';
        end if;
        if(A( 2)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 15)<='1';
        else
        D2F_temp_lv1_4( 15)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 16)<='1';
        else
        D2F_temp_lv1_4( 16)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 17)<='1';
        else
        D2F_temp_lv1_4( 17)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 18)<='1';
        else
        D2F_temp_lv1_4( 18)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 19)<='1';
        else
        D2F_temp_lv1_4( 19)<='0';
        end if;
        if(A( 3)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 20)<='1';
        else
        D2F_temp_lv1_4( 20)<='0';
        end if;
        if(A( 3)='1' AND B(10)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 21)<='1';
        else
        D2F_temp_lv1_4( 21)<='0';
        end if;
        if(A( 3)='1' AND B(10)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 22)<='1';
        else
        D2F_temp_lv1_4( 22)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 23)<='1';
        else
        D2F_temp_lv1_4( 23)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 24)<='1';
        else
        D2F_temp_lv1_4( 24)<='0';
        end if;
        if(A(11)='1' AND B(10)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 25)<='1';
        else
        D2F_temp_lv1_4( 25)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 26)<='1';
        else
        D2F_temp_lv1_4( 26)<='0';
        end if;
        if(A(12)='1' AND B( 9)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 27)<='1';
        else
        D2F_temp_lv1_4( 27)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 28)<='1';
        else
        D2F_temp_lv1_4( 28)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 29)<='1';
        else
        D2F_temp_lv1_4( 29)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND E( 8)='1' AND NOT D( 8)='1' )then
        D2F_temp_lv1_4( 30)<='1';
        else
        D2F_temp_lv1_4( 30)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND E( 8)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_4( 31)<='1';
        else
        D2F_temp_lv1_4( 31)<='0';
        end if;
        if(A( 0)='1' AND B( 1)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5(  0)<='1';
        else
        D2F_temp_lv1_5(  0)<='0';
        end if;
        if(A( 0)='1' AND B( 9)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5(  1)<='1';
        else
        D2F_temp_lv1_5(  1)<='0';
        end if;
        if(A( 1)='1' AND B( 0)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5(  2)<='1';
        else
        D2F_temp_lv1_5(  2)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5(  3)<='1';
        else
        D2F_temp_lv1_5(  3)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5(  4)<='1';
        else
        D2F_temp_lv1_5(  4)<='0';
        end if;
        if(A( 1)='1' AND B( 9)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5(  5)<='1';
        else
        D2F_temp_lv1_5(  5)<='0';
        end if;
        if(A( 1)='1' AND B(10)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5(  6)<='1';
        else
        D2F_temp_lv1_5(  6)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND E( 9)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_5(  7)<='1';
        else
        D2F_temp_lv1_5(  7)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5(  8)<='1';
        else
        D2F_temp_lv1_5(  8)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5(  9)<='1';
        else
        D2F_temp_lv1_5(  9)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 10)<='1';
        else
        D2F_temp_lv1_5( 10)<='0';
        end if;
        if(A( 2)='1' AND B( 9)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 11)<='1';
        else
        D2F_temp_lv1_5( 11)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 12)<='1';
        else
        D2F_temp_lv1_5( 12)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 13)<='1';
        else
        D2F_temp_lv1_5( 13)<='0';
        end if;
        if(A( 2)='1' AND B(11)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 14)<='1';
        else
        D2F_temp_lv1_5( 14)<='0';
        end if;
        if(A( 2)='1' AND B(11)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 15)<='1';
        else
        D2F_temp_lv1_5( 15)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND E( 9)='1' AND NOT D( 1)='1' )then
        D2F_temp_lv1_5( 16)<='1';
        else
        D2F_temp_lv1_5( 16)<='0';
        end if;
        if(A( 3)='1' AND B( 1)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 17)<='1';
        else
        D2F_temp_lv1_5( 17)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND E( 9)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_5( 18)<='1';
        else
        D2F_temp_lv1_5( 18)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 19)<='1';
        else
        D2F_temp_lv1_5( 19)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 20)<='1';
        else
        D2F_temp_lv1_5( 20)<='0';
        end if;
        if(A( 3)='1' AND B(10)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 21)<='1';
        else
        D2F_temp_lv1_5( 21)<='0';
        end if;
        if(A( 3)='1' AND B(11)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 22)<='1';
        else
        D2F_temp_lv1_5( 22)<='0';
        end if;
        if(A( 3)='1' AND B(11)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 23)<='1';
        else
        D2F_temp_lv1_5( 23)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 24)<='1';
        else
        D2F_temp_lv1_5( 24)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 25)<='1';
        else
        D2F_temp_lv1_5( 25)<='0';
        end if;
        if(A( 4)='1' AND B(10)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 26)<='1';
        else
        D2F_temp_lv1_5( 26)<='0';
        end if;
        if(A( 4)='1' AND B(11)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 27)<='1';
        else
        D2F_temp_lv1_5( 27)<='0';
        end if;
        if(A( 4)='1' AND B(11)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 28)<='1';
        else
        D2F_temp_lv1_5( 28)<='0';
        end if;
        if(A( 5)='1' AND B(11)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 29)<='1';
        else
        D2F_temp_lv1_5( 29)<='0';
        end if;
        if(A( 6)='1' AND B( 2)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 30)<='1';
        else
        D2F_temp_lv1_5( 30)<='0';
        end if;
        if(A( 6)='1' AND B(11)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 31)<='1';
        else
        D2F_temp_lv1_5( 31)<='0';
        end if;
        if(A( 6)='1' AND B(12)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 32)<='1';
        else
        D2F_temp_lv1_5( 32)<='0';
        end if;
        if(A( 8)='1' AND B(12)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 33)<='1';
        else
        D2F_temp_lv1_5( 33)<='0';
        end if;
        if(A(11)='1' AND B( 9)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 34)<='1';
        else
        D2F_temp_lv1_5( 34)<='0';
        end if;
        if(A(11)='1' AND B(10)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 35)<='1';
        else
        D2F_temp_lv1_5( 35)<='0';
        end if;
        if(A(12)='1' AND B(10)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 36)<='1';
        else
        D2F_temp_lv1_5( 36)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 37)<='1';
        else
        D2F_temp_lv1_5( 37)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 38)<='1';
        else
        D2F_temp_lv1_5( 38)<='0';
        end if;
        if(A(13)='1' AND B(10)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 39)<='1';
        else
        D2F_temp_lv1_5( 39)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 40)<='1';
        else
        D2F_temp_lv1_5( 40)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 41)<='1';
        else
        D2F_temp_lv1_5( 41)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND E( 9)='1' AND NOT D( 9)='1' )then
        D2F_temp_lv1_5( 42)<='1';
        else
        D2F_temp_lv1_5( 42)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND E( 9)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_5( 43)<='1';
        else
        D2F_temp_lv1_5( 43)<='0';
        end if;
        if(A( 1)='1' AND B( 1)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6(  0)<='1';
        else
        D2F_temp_lv1_6(  0)<='0';
        end if;
        if(A( 1)='1' AND B(11)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6(  1)<='1';
        else
        D2F_temp_lv1_6(  1)<='0';
        end if;
        if(A( 2)='1' AND B( 1)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6(  2)<='1';
        else
        D2F_temp_lv1_6(  2)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND E(10)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_6(  3)<='1';
        else
        D2F_temp_lv1_6(  3)<='0';
        end if;
        if(A( 2)='1' AND B( 2)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6(  4)<='1';
        else
        D2F_temp_lv1_6(  4)<='0';
        end if;
        if(A( 2)='1' AND B(10)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6(  5)<='1';
        else
        D2F_temp_lv1_6(  5)<='0';
        end if;
        if(A( 2)='1' AND B(11)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6(  6)<='1';
        else
        D2F_temp_lv1_6(  6)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND E(10)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_6(  7)<='1';
        else
        D2F_temp_lv1_6(  7)<='0';
        end if;
        if(A( 3)='1' AND B( 2)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6(  8)<='1';
        else
        D2F_temp_lv1_6(  8)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6(  9)<='1';
        else
        D2F_temp_lv1_6(  9)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 10)<='1';
        else
        D2F_temp_lv1_6( 10)<='0';
        end if;
        if(A( 3)='1' AND B(11)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 11)<='1';
        else
        D2F_temp_lv1_6( 11)<='0';
        end if;
        if(A( 3)='1' AND B(12)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 12)<='1';
        else
        D2F_temp_lv1_6( 12)<='0';
        end if;
        if(A( 3)='1' AND B(12)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 13)<='1';
        else
        D2F_temp_lv1_6( 13)<='0';
        end if;
        if(A( 4)='1' AND B( 2)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 14)<='1';
        else
        D2F_temp_lv1_6( 14)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND E(10)='1' AND NOT D( 2)='1' )then
        D2F_temp_lv1_6( 15)<='1';
        else
        D2F_temp_lv1_6( 15)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND E(10)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_6( 16)<='1';
        else
        D2F_temp_lv1_6( 16)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 17)<='1';
        else
        D2F_temp_lv1_6( 17)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 18)<='1';
        else
        D2F_temp_lv1_6( 18)<='0';
        end if;
        if(A( 4)='1' AND B(11)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 19)<='1';
        else
        D2F_temp_lv1_6( 19)<='0';
        end if;
        if(A( 4)='1' AND B(12)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 20)<='1';
        else
        D2F_temp_lv1_6( 20)<='0';
        end if;
        if(A( 4)='1' AND B(12)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 21)<='1';
        else
        D2F_temp_lv1_6( 21)<='0';
        end if;
        if(A( 5)='1' AND B( 2)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 22)<='1';
        else
        D2F_temp_lv1_6( 22)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 23)<='1';
        else
        D2F_temp_lv1_6( 23)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 24)<='1';
        else
        D2F_temp_lv1_6( 24)<='0';
        end if;
        if(A( 5)='1' AND B(12)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 25)<='1';
        else
        D2F_temp_lv1_6( 25)<='0';
        end if;
        if(A( 5)='1' AND B(12)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 26)<='1';
        else
        D2F_temp_lv1_6( 26)<='0';
        end if;
        if(A( 6)='1' AND B( 3)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 27)<='1';
        else
        D2F_temp_lv1_6( 27)<='0';
        end if;
        if(A( 6)='1' AND B(12)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 28)<='1';
        else
        D2F_temp_lv1_6( 28)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 29)<='1';
        else
        D2F_temp_lv1_6( 29)<='0';
        end if;
        if(A(12)='1' AND B(11)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 30)<='1';
        else
        D2F_temp_lv1_6( 30)<='0';
        end if;
        if(A(13)='1' AND B(11)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 31)<='1';
        else
        D2F_temp_lv1_6( 31)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 32)<='1';
        else
        D2F_temp_lv1_6( 32)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 33)<='1';
        else
        D2F_temp_lv1_6( 33)<='0';
        end if;
        if(A(14)='1' AND B(11)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 34)<='1';
        else
        D2F_temp_lv1_6( 34)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 35)<='1';
        else
        D2F_temp_lv1_6( 35)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 36)<='1';
        else
        D2F_temp_lv1_6( 36)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND E(10)='1' AND NOT D(10)='1' )then
        D2F_temp_lv1_6( 37)<='1';
        else
        D2F_temp_lv1_6( 37)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND E(10)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_6( 38)<='1';
        else
        D2F_temp_lv1_6( 38)<='0';
        end if;
        if(A( 2)='1' AND B( 3)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7(  0)<='1';
        else
        D2F_temp_lv1_7(  0)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND E(11)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_7(  1)<='1';
        else
        D2F_temp_lv1_7(  1)<='0';
        end if;
        if(A( 3)='1' AND B( 3)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7(  2)<='1';
        else
        D2F_temp_lv1_7(  2)<='0';
        end if;
        if(A( 3)='1' AND B( 4)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7(  3)<='1';
        else
        D2F_temp_lv1_7(  3)<='0';
        end if;
        if(A( 3)='1' AND B(12)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7(  4)<='1';
        else
        D2F_temp_lv1_7(  4)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND E(11)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_7(  5)<='1';
        else
        D2F_temp_lv1_7(  5)<='0';
        end if;
        if(A( 4)='1' AND B( 3)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7(  6)<='1';
        else
        D2F_temp_lv1_7(  6)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND E(11)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_7(  7)<='1';
        else
        D2F_temp_lv1_7(  7)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7(  8)<='1';
        else
        D2F_temp_lv1_7(  8)<='0';
        end if;
        if(A( 4)='1' AND B( 4)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7(  9)<='1';
        else
        D2F_temp_lv1_7(  9)<='0';
        end if;
        if(A( 4)='1' AND B(12)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 10)<='1';
        else
        D2F_temp_lv1_7( 10)<='0';
        end if;
        if(A( 4)='1' AND B(13)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 11)<='1';
        else
        D2F_temp_lv1_7( 11)<='0';
        end if;
        if(A( 4)='1' AND B(13)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7( 12)<='1';
        else
        D2F_temp_lv1_7( 12)<='0';
        end if;
        if(A( 5)='1' AND B( 3)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 13)<='1';
        else
        D2F_temp_lv1_7( 13)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND E(11)='1' AND NOT D( 3)='1' )then
        D2F_temp_lv1_7( 14)<='1';
        else
        D2F_temp_lv1_7( 14)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 15)<='1';
        else
        D2F_temp_lv1_7( 15)<='0';
        end if;
        if(A( 5)='1' AND B( 4)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7( 16)<='1';
        else
        D2F_temp_lv1_7( 16)<='0';
        end if;
        if(A( 5)='1' AND B(12)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 17)<='1';
        else
        D2F_temp_lv1_7( 17)<='0';
        end if;
        if(A( 5)='1' AND B(13)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 18)<='1';
        else
        D2F_temp_lv1_7( 18)<='0';
        end if;
        if(A( 5)='1' AND B(13)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7( 19)<='1';
        else
        D2F_temp_lv1_7( 19)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 20)<='1';
        else
        D2F_temp_lv1_7( 20)<='0';
        end if;
        if(A( 6)='1' AND B( 4)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7( 21)<='1';
        else
        D2F_temp_lv1_7( 21)<='0';
        end if;
        if(A( 6)='1' AND B(12)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 22)<='1';
        else
        D2F_temp_lv1_7( 22)<='0';
        end if;
        if(A( 6)='1' AND B(13)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 23)<='1';
        else
        D2F_temp_lv1_7( 23)<='0';
        end if;
        if(A( 6)='1' AND B(13)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7( 24)<='1';
        else
        D2F_temp_lv1_7( 24)<='0';
        end if;
        if(A( 7)='1' AND B(13)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 25)<='1';
        else
        D2F_temp_lv1_7( 25)<='0';
        end if;
        if(A( 7)='1' AND B(14)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7( 26)<='1';
        else
        D2F_temp_lv1_7( 26)<='0';
        end if;
        if(A( 8)='1' AND B(14)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 27)<='1';
        else
        D2F_temp_lv1_7( 27)<='0';
        end if;
        if(A(13)='1' AND B(12)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 28)<='1';
        else
        D2F_temp_lv1_7( 28)<='0';
        end if;
        if(A(14)='1' AND B(12)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 29)<='1';
        else
        D2F_temp_lv1_7( 29)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 30)<='1';
        else
        D2F_temp_lv1_7( 30)<='0';
        end if;
        if(A(14)='1' AND B(13)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7( 31)<='1';
        else
        D2F_temp_lv1_7( 31)<='0';
        end if;
        if(A(15)='1' AND B(12)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 32)<='1';
        else
        D2F_temp_lv1_7( 32)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 33)<='1';
        else
        D2F_temp_lv1_7( 33)<='0';
        end if;
        if(A(15)='1' AND B(13)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7( 34)<='1';
        else
        D2F_temp_lv1_7( 34)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 35)<='1';
        else
        D2F_temp_lv1_7( 35)<='0';
        end if;
        if(A(16)='1' AND B(13)='1' AND E(11)='1' AND NOT D(12)='1' )then
        D2F_temp_lv1_7( 36)<='1';
        else
        D2F_temp_lv1_7( 36)<='0';
        end if;
        if(A(17)='1' AND B(13)='1' AND E(11)='1' AND NOT D(11)='1' )then
        D2F_temp_lv1_7( 37)<='1';
        else
        D2F_temp_lv1_7( 37)<='0';
        end if;
        if(A( 0)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0(  0)<='1';
        else
        D3F_temp_lv1_0(  0)<='0';
        end if;
        if(A( 1)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0(  1)<='1';
        else
        D3F_temp_lv1_0(  1)<='0';
        end if;
        if(A( 1)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0(  2)<='1';
        else
        D3F_temp_lv1_0(  2)<='0';
        end if;
        if(A( 2)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0(  3)<='1';
        else
        D3F_temp_lv1_0(  3)<='0';
        end if;
        if(A( 2)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0(  4)<='1';
        else
        D3F_temp_lv1_0(  4)<='0';
        end if;
        if(A( 2)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_0(  5)<='1';
        else
        D3F_temp_lv1_0(  5)<='0';
        end if;
        if(A( 3)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_0(  6)<='1';
        else
        D3F_temp_lv1_0(  6)<='0';
        end if;
        if(A( 3)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_0(  7)<='1';
        else
        D3F_temp_lv1_0(  7)<='0';
        end if;
        if(A(10)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0(  8)<='1';
        else
        D3F_temp_lv1_0(  8)<='0';
        end if;
        if(A(10)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_0(  9)<='1';
        else
        D3F_temp_lv1_0(  9)<='0';
        end if;
        if(A(10)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0( 10)<='1';
        else
        D3F_temp_lv1_0( 10)<='0';
        end if;
        if(A(11)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0( 11)<='1';
        else
        D3F_temp_lv1_0( 11)<='0';
        end if;
        if(A(11)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_0( 12)<='1';
        else
        D3F_temp_lv1_0( 12)<='0';
        end if;
        if(A(11)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0( 13)<='1';
        else
        D3F_temp_lv1_0( 13)<='0';
        end if;
        if(A(11)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_0( 14)<='1';
        else
        D3F_temp_lv1_0( 14)<='0';
        end if;
        if(A(11)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_0( 15)<='1';
        else
        D3F_temp_lv1_0( 15)<='0';
        end if;
        if(A(11)='1' AND D( 8)='1' AND E( 0)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_0( 16)<='1';
        else
        D3F_temp_lv1_0( 16)<='0';
        end if;
        if(A(11)='1' AND D( 9)='1' AND E( 0)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_0( 17)<='1';
        else
        D3F_temp_lv1_0( 17)<='0';
        end if;
        if(A(12)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0( 18)<='1';
        else
        D3F_temp_lv1_0( 18)<='0';
        end if;
        if(A(12)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_0( 19)<='1';
        else
        D3F_temp_lv1_0( 19)<='0';
        end if;
        if(A(12)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_0( 20)<='1';
        else
        D3F_temp_lv1_0( 20)<='0';
        end if;
        if(A(12)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_0( 21)<='1';
        else
        D3F_temp_lv1_0( 21)<='0';
        end if;
        if(A(12)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0( 22)<='1';
        else
        D3F_temp_lv1_0( 22)<='0';
        end if;
        if(A(12)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_0( 23)<='1';
        else
        D3F_temp_lv1_0( 23)<='0';
        end if;
        if(A(12)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_0( 24)<='1';
        else
        D3F_temp_lv1_0( 24)<='0';
        end if;
        if(A(12)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_0( 25)<='1';
        else
        D3F_temp_lv1_0( 25)<='0';
        end if;
        if(A(12)='1' AND D( 8)='1' AND E( 0)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_0( 26)<='1';
        else
        D3F_temp_lv1_0( 26)<='0';
        end if;
        if(A(13)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_0( 27)<='1';
        else
        D3F_temp_lv1_0( 27)<='0';
        end if;
        if(A(13)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_0( 28)<='1';
        else
        D3F_temp_lv1_0( 28)<='0';
        end if;
        if(A(13)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_0( 29)<='1';
        else
        D3F_temp_lv1_0( 29)<='0';
        end if;
        if(A(13)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_0( 30)<='1';
        else
        D3F_temp_lv1_0( 30)<='0';
        end if;
        if(A(13)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_0( 31)<='1';
        else
        D3F_temp_lv1_0( 31)<='0';
        end if;
        if(A(13)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_0( 32)<='1';
        else
        D3F_temp_lv1_0( 32)<='0';
        end if;
        if(A(13)='1' AND D( 1)='1' AND E( 0)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_0( 33)<='1';
        else
        D3F_temp_lv1_0( 33)<='0';
        end if;
        if(A(14)='1' AND D( 0)='1' AND E( 0)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_0( 34)<='1';
        else
        D3F_temp_lv1_0( 34)<='0';
        end if;
        if(A( 0)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1(  0)<='1';
        else
        D3F_temp_lv1_1(  0)<='0';
        end if;
        if(A( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_1(  1)<='1';
        else
        D3F_temp_lv1_1(  1)<='0';
        end if;
        if(A( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1(  2)<='1';
        else
        D3F_temp_lv1_1(  2)<='0';
        end if;
        if(A( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1(  3)<='1';
        else
        D3F_temp_lv1_1(  3)<='0';
        end if;
        if(A( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1(  4)<='1';
        else
        D3F_temp_lv1_1(  4)<='0';
        end if;
        if(A( 2)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1(  5)<='1';
        else
        D3F_temp_lv1_1(  5)<='0';
        end if;
        if(A( 2)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1(  6)<='1';
        else
        D3F_temp_lv1_1(  6)<='0';
        end if;
        if(A( 3)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1(  7)<='1';
        else
        D3F_temp_lv1_1(  7)<='0';
        end if;
        if(A( 3)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1(  8)<='1';
        else
        D3F_temp_lv1_1(  8)<='0';
        end if;
        if(A( 3)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1(  9)<='1';
        else
        D3F_temp_lv1_1(  9)<='0';
        end if;
        if(A( 4)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 10)<='1';
        else
        D3F_temp_lv1_1( 10)<='0';
        end if;
        if(A( 5)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 11)<='1';
        else
        D3F_temp_lv1_1( 11)<='0';
        end if;
        if(A( 6)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 12)<='1';
        else
        D3F_temp_lv1_1( 12)<='0';
        end if;
        if(A(10)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1( 13)<='1';
        else
        D3F_temp_lv1_1( 13)<='0';
        end if;
        if(A(11)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_1( 14)<='1';
        else
        D3F_temp_lv1_1( 14)<='0';
        end if;
        if(A(11)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1( 15)<='1';
        else
        D3F_temp_lv1_1( 15)<='0';
        end if;
        if(A(11)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_1( 16)<='1';
        else
        D3F_temp_lv1_1( 16)<='0';
        end if;
        if(A(12)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1( 17)<='1';
        else
        D3F_temp_lv1_1( 17)<='0';
        end if;
        if(A(12)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 18)<='1';
        else
        D3F_temp_lv1_1( 18)<='0';
        end if;
        if(A(12)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_1( 19)<='1';
        else
        D3F_temp_lv1_1( 19)<='0';
        end if;
        if(A(12)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 20)<='1';
        else
        D3F_temp_lv1_1( 20)<='0';
        end if;
        if(A(12)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1( 21)<='1';
        else
        D3F_temp_lv1_1( 21)<='0';
        end if;
        if(A(12)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 22)<='1';
        else
        D3F_temp_lv1_1( 22)<='0';
        end if;
        if(A(12)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_1( 23)<='1';
        else
        D3F_temp_lv1_1( 23)<='0';
        end if;
        if(A(12)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 24)<='1';
        else
        D3F_temp_lv1_1( 24)<='0';
        end if;
        if(A(12)='1' AND D( 9)='1' AND E( 1)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_1( 25)<='1';
        else
        D3F_temp_lv1_1( 25)<='0';
        end if;
        if(A(13)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1( 26)<='1';
        else
        D3F_temp_lv1_1( 26)<='0';
        end if;
        if(A(13)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 27)<='1';
        else
        D3F_temp_lv1_1( 27)<='0';
        end if;
        if(A(13)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_1( 28)<='1';
        else
        D3F_temp_lv1_1( 28)<='0';
        end if;
        if(A(13)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 29)<='1';
        else
        D3F_temp_lv1_1( 29)<='0';
        end if;
        if(A(13)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 30)<='1';
        else
        D3F_temp_lv1_1( 30)<='0';
        end if;
        if(A(13)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 31)<='1';
        else
        D3F_temp_lv1_1( 31)<='0';
        end if;
        if(A(13)='1' AND D( 9)='1' AND E( 1)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_1( 32)<='1';
        else
        D3F_temp_lv1_1( 32)<='0';
        end if;
        if(A(13)='1' AND D( 9)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 33)<='1';
        else
        D3F_temp_lv1_1( 33)<='0';
        end if;
        if(A(14)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_1( 34)<='1';
        else
        D3F_temp_lv1_1( 34)<='0';
        end if;
        if(A(14)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 35)<='1';
        else
        D3F_temp_lv1_1( 35)<='0';
        end if;
        if(A(14)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_1( 36)<='1';
        else
        D3F_temp_lv1_1( 36)<='0';
        end if;
        if(A(14)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 37)<='1';
        else
        D3F_temp_lv1_1( 37)<='0';
        end if;
        if(A(14)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 38)<='1';
        else
        D3F_temp_lv1_1( 38)<='0';
        end if;
        if(A(14)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 39)<='1';
        else
        D3F_temp_lv1_1( 39)<='0';
        end if;
        if(A(15)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 40)<='1';
        else
        D3F_temp_lv1_1( 40)<='0';
        end if;
        if(A(15)='1' AND D( 1)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 41)<='1';
        else
        D3F_temp_lv1_1( 41)<='0';
        end if;
        if(A(15)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_1( 42)<='1';
        else
        D3F_temp_lv1_1( 42)<='0';
        end if;
        if(A(15)='1' AND D( 2)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 43)<='1';
        else
        D3F_temp_lv1_1( 43)<='0';
        end if;
        if(A(15)='1' AND D(10)='1' AND E( 1)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_1( 44)<='1';
        else
        D3F_temp_lv1_1( 44)<='0';
        end if;
        if(A( 1)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2(  0)<='1';
        else
        D3F_temp_lv1_2(  0)<='0';
        end if;
        if(A( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2(  1)<='1';
        else
        D3F_temp_lv1_2(  1)<='0';
        end if;
        if(A( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2(  2)<='1';
        else
        D3F_temp_lv1_2(  2)<='0';
        end if;
        if(A( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2(  3)<='1';
        else
        D3F_temp_lv1_2(  3)<='0';
        end if;
        if(A( 3)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2(  4)<='1';
        else
        D3F_temp_lv1_2(  4)<='0';
        end if;
        if(A( 4)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2(  5)<='1';
        else
        D3F_temp_lv1_2(  5)<='0';
        end if;
        if(A( 4)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2(  6)<='1';
        else
        D3F_temp_lv1_2(  6)<='0';
        end if;
        if(A( 4)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2(  7)<='1';
        else
        D3F_temp_lv1_2(  7)<='0';
        end if;
        if(A( 5)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2(  8)<='1';
        else
        D3F_temp_lv1_2(  8)<='0';
        end if;
        if(A( 5)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2(  9)<='1';
        else
        D3F_temp_lv1_2(  9)<='0';
        end if;
        if(A( 5)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2( 10)<='1';
        else
        D3F_temp_lv1_2( 10)<='0';
        end if;
        if(A( 6)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2( 11)<='1';
        else
        D3F_temp_lv1_2( 11)<='0';
        end if;
        if(A(11)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_2( 12)<='1';
        else
        D3F_temp_lv1_2( 12)<='0';
        end if;
        if(A(11)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2( 13)<='1';
        else
        D3F_temp_lv1_2( 13)<='0';
        end if;
        if(A(12)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_2( 14)<='1';
        else
        D3F_temp_lv1_2( 14)<='0';
        end if;
        if(A(12)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2( 15)<='1';
        else
        D3F_temp_lv1_2( 15)<='0';
        end if;
        if(A(12)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_2( 16)<='1';
        else
        D3F_temp_lv1_2( 16)<='0';
        end if;
        if(A(13)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2( 17)<='1';
        else
        D3F_temp_lv1_2( 17)<='0';
        end if;
        if(A(13)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2( 18)<='1';
        else
        D3F_temp_lv1_2( 18)<='0';
        end if;
        if(A(13)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_2( 19)<='1';
        else
        D3F_temp_lv1_2( 19)<='0';
        end if;
        if(A(13)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_2( 20)<='1';
        else
        D3F_temp_lv1_2( 20)<='0';
        end if;
        if(A(13)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2( 21)<='1';
        else
        D3F_temp_lv1_2( 21)<='0';
        end if;
        if(A(13)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2( 22)<='1';
        else
        D3F_temp_lv1_2( 22)<='0';
        end if;
        if(A(13)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_2( 23)<='1';
        else
        D3F_temp_lv1_2( 23)<='0';
        end if;
        if(A(13)='1' AND D(10)='1' AND E( 2)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_2( 24)<='1';
        else
        D3F_temp_lv1_2( 24)<='0';
        end if;
        if(A(13)='1' AND D(10)='1' AND E( 2)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_2( 25)<='1';
        else
        D3F_temp_lv1_2( 25)<='0';
        end if;
        if(A(14)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2( 26)<='1';
        else
        D3F_temp_lv1_2( 26)<='0';
        end if;
        if(A(14)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2( 27)<='1';
        else
        D3F_temp_lv1_2( 27)<='0';
        end if;
        if(A(14)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_2( 28)<='1';
        else
        D3F_temp_lv1_2( 28)<='0';
        end if;
        if(A(14)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_2( 29)<='1';
        else
        D3F_temp_lv1_2( 29)<='0';
        end if;
        if(A(14)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2( 30)<='1';
        else
        D3F_temp_lv1_2( 30)<='0';
        end if;
        if(A(14)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_2( 31)<='1';
        else
        D3F_temp_lv1_2( 31)<='0';
        end if;
        if(A(14)='1' AND D(10)='1' AND E( 2)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_2( 32)<='1';
        else
        D3F_temp_lv1_2( 32)<='0';
        end if;
        if(A(14)='1' AND D(10)='1' AND E( 2)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_2( 33)<='1';
        else
        D3F_temp_lv1_2( 33)<='0';
        end if;
        if(A(14)='1' AND D(11)='1' AND E( 2)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_2( 34)<='1';
        else
        D3F_temp_lv1_2( 34)<='0';
        end if;
        if(A(15)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_2( 35)<='1';
        else
        D3F_temp_lv1_2( 35)<='0';
        end if;
        if(A(15)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2( 36)<='1';
        else
        D3F_temp_lv1_2( 36)<='0';
        end if;
        if(A(15)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_2( 37)<='1';
        else
        D3F_temp_lv1_2( 37)<='0';
        end if;
        if(A(15)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_2( 38)<='1';
        else
        D3F_temp_lv1_2( 38)<='0';
        end if;
        if(A(15)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2( 39)<='1';
        else
        D3F_temp_lv1_2( 39)<='0';
        end if;
        if(A(15)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_2( 40)<='1';
        else
        D3F_temp_lv1_2( 40)<='0';
        end if;
        if(A(16)='1' AND D( 2)='1' AND E( 2)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_2( 41)<='1';
        else
        D3F_temp_lv1_2( 41)<='0';
        end if;
        if(A(16)='1' AND D( 3)='1' AND E( 2)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_2( 42)<='1';
        else
        D3F_temp_lv1_2( 42)<='0';
        end if;
        if(A( 3)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_3(  0)<='1';
        else
        D3F_temp_lv1_3(  0)<='0';
        end if;
        if(A( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_3(  1)<='1';
        else
        D3F_temp_lv1_3(  1)<='0';
        end if;
        if(A( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3(  2)<='1';
        else
        D3F_temp_lv1_3(  2)<='0';
        end if;
        if(A( 4)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3(  3)<='1';
        else
        D3F_temp_lv1_3(  3)<='0';
        end if;
        if(A( 5)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_3(  4)<='1';
        else
        D3F_temp_lv1_3(  4)<='0';
        end if;
        if(A( 5)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3(  5)<='1';
        else
        D3F_temp_lv1_3(  5)<='0';
        end if;
        if(A( 5)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3(  6)<='1';
        else
        D3F_temp_lv1_3(  6)<='0';
        end if;
        if(A( 6)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3(  7)<='1';
        else
        D3F_temp_lv1_3(  7)<='0';
        end if;
        if(A( 6)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3(  8)<='1';
        else
        D3F_temp_lv1_3(  8)<='0';
        end if;
        if(A(12)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_3(  9)<='1';
        else
        D3F_temp_lv1_3(  9)<='0';
        end if;
        if(A(12)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_3( 10)<='1';
        else
        D3F_temp_lv1_3( 10)<='0';
        end if;
        if(A(13)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_3( 11)<='1';
        else
        D3F_temp_lv1_3( 11)<='0';
        end if;
        if(A(13)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3( 12)<='1';
        else
        D3F_temp_lv1_3( 12)<='0';
        end if;
        if(A(13)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_3( 13)<='1';
        else
        D3F_temp_lv1_3( 13)<='0';
        end if;
        if(A(14)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_3( 14)<='1';
        else
        D3F_temp_lv1_3( 14)<='0';
        end if;
        if(A(14)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3( 15)<='1';
        else
        D3F_temp_lv1_3( 15)<='0';
        end if;
        if(A(14)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_3( 16)<='1';
        else
        D3F_temp_lv1_3( 16)<='0';
        end if;
        if(A(14)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_3( 17)<='1';
        else
        D3F_temp_lv1_3( 17)<='0';
        end if;
        if(A(14)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3( 18)<='1';
        else
        D3F_temp_lv1_3( 18)<='0';
        end if;
        if(A(14)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_3( 19)<='1';
        else
        D3F_temp_lv1_3( 19)<='0';
        end if;
        if(A(14)='1' AND D(11)='1' AND E( 3)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_3( 20)<='1';
        else
        D3F_temp_lv1_3( 20)<='0';
        end if;
        if(A(14)='1' AND D(11)='1' AND E( 3)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_3( 21)<='1';
        else
        D3F_temp_lv1_3( 21)<='0';
        end if;
        if(A(15)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_3( 22)<='1';
        else
        D3F_temp_lv1_3( 22)<='0';
        end if;
        if(A(15)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3( 23)<='1';
        else
        D3F_temp_lv1_3( 23)<='0';
        end if;
        if(A(15)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_3( 24)<='1';
        else
        D3F_temp_lv1_3( 24)<='0';
        end if;
        if(A(15)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_3( 25)<='1';
        else
        D3F_temp_lv1_3( 25)<='0';
        end if;
        if(A(15)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3( 26)<='1';
        else
        D3F_temp_lv1_3( 26)<='0';
        end if;
        if(A(15)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_3( 27)<='1';
        else
        D3F_temp_lv1_3( 27)<='0';
        end if;
        if(A(15)='1' AND D(11)='1' AND E( 3)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_3( 28)<='1';
        else
        D3F_temp_lv1_3( 28)<='0';
        end if;
        if(A(15)='1' AND D(11)='1' AND E( 3)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_3( 29)<='1';
        else
        D3F_temp_lv1_3( 29)<='0';
        end if;
        if(A(15)='1' AND D(12)='1' AND E( 3)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_3( 30)<='1';
        else
        D3F_temp_lv1_3( 30)<='0';
        end if;
        if(A(16)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3( 31)<='1';
        else
        D3F_temp_lv1_3( 31)<='0';
        end if;
        if(A(16)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_3( 32)<='1';
        else
        D3F_temp_lv1_3( 32)<='0';
        end if;
        if(A(16)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3( 33)<='1';
        else
        D3F_temp_lv1_3( 33)<='0';
        end if;
        if(A(16)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B( 5)='1' )then
        D3F_temp_lv1_3( 34)<='1';
        else
        D3F_temp_lv1_3( 34)<='0';
        end if;
        if(A(16)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_3( 35)<='1';
        else
        D3F_temp_lv1_3( 35)<='0';
        end if;
        if(A(17)='1' AND D( 3)='1' AND E( 3)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_3( 36)<='1';
        else
        D3F_temp_lv1_3( 36)<='0';
        end if;
        if(A(17)='1' AND D( 4)='1' AND E( 3)='1' AND NOT B( 5)='1' )then
        D3F_temp_lv1_3( 37)<='1';
        else
        D3F_temp_lv1_3( 37)<='0';
        end if;
        if(A( 0)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4(  0)<='1';
        else
        D3F_temp_lv1_4(  0)<='0';
        end if;
        if(A( 0)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4(  1)<='1';
        else
        D3F_temp_lv1_4(  1)<='0';
        end if;
        if(A( 1)='1' AND D( 0)='1' AND E( 8)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_4(  2)<='1';
        else
        D3F_temp_lv1_4(  2)<='0';
        end if;
        if(A( 1)='1' AND D( 1)='1' AND E( 8)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_4(  3)<='1';
        else
        D3F_temp_lv1_4(  3)<='0';
        end if;
        if(A( 1)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_4(  4)<='1';
        else
        D3F_temp_lv1_4(  4)<='0';
        end if;
        if(A( 1)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4(  5)<='1';
        else
        D3F_temp_lv1_4(  5)<='0';
        end if;
        if(A( 1)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_4(  6)<='1';
        else
        D3F_temp_lv1_4(  6)<='0';
        end if;
        if(A( 1)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_4(  7)<='1';
        else
        D3F_temp_lv1_4(  7)<='0';
        end if;
        if(A( 1)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4(  8)<='1';
        else
        D3F_temp_lv1_4(  8)<='0';
        end if;
        if(A( 2)='1' AND D( 0)='1' AND E( 8)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_4(  9)<='1';
        else
        D3F_temp_lv1_4(  9)<='0';
        end if;
        if(A( 2)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_4( 10)<='1';
        else
        D3F_temp_lv1_4( 10)<='0';
        end if;
        if(A( 2)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_4( 11)<='1';
        else
        D3F_temp_lv1_4( 11)<='0';
        end if;
        if(A( 2)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4( 12)<='1';
        else
        D3F_temp_lv1_4( 12)<='0';
        end if;
        if(A( 2)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_4( 13)<='1';
        else
        D3F_temp_lv1_4( 13)<='0';
        end if;
        if(A( 2)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_4( 14)<='1';
        else
        D3F_temp_lv1_4( 14)<='0';
        end if;
        if(A( 2)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_4( 15)<='1';
        else
        D3F_temp_lv1_4( 15)<='0';
        end if;
        if(A( 2)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4( 16)<='1';
        else
        D3F_temp_lv1_4( 16)<='0';
        end if;
        if(A( 2)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_4( 17)<='1';
        else
        D3F_temp_lv1_4( 17)<='0';
        end if;
        if(A( 3)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_4( 18)<='1';
        else
        D3F_temp_lv1_4( 18)<='0';
        end if;
        if(A( 3)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4( 19)<='1';
        else
        D3F_temp_lv1_4( 19)<='0';
        end if;
        if(A( 3)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_4( 20)<='1';
        else
        D3F_temp_lv1_4( 20)<='0';
        end if;
        if(A( 3)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_4( 21)<='1';
        else
        D3F_temp_lv1_4( 21)<='0';
        end if;
        if(A( 3)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_4( 22)<='1';
        else
        D3F_temp_lv1_4( 22)<='0';
        end if;
        if(A(11)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4( 23)<='1';
        else
        D3F_temp_lv1_4( 23)<='0';
        end if;
        if(A(11)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4( 24)<='1';
        else
        D3F_temp_lv1_4( 24)<='0';
        end if;
        if(A(11)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_4( 25)<='1';
        else
        D3F_temp_lv1_4( 25)<='0';
        end if;
        if(A(12)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4( 26)<='1';
        else
        D3F_temp_lv1_4( 26)<='0';
        end if;
        if(A(12)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_4( 27)<='1';
        else
        D3F_temp_lv1_4( 27)<='0';
        end if;
        if(A(12)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_4( 28)<='1';
        else
        D3F_temp_lv1_4( 28)<='0';
        end if;
        if(A(12)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_4( 29)<='1';
        else
        D3F_temp_lv1_4( 29)<='0';
        end if;
        if(A(13)='1' AND D( 8)='1' AND E( 8)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_4( 30)<='1';
        else
        D3F_temp_lv1_4( 30)<='0';
        end if;
        if(A(13)='1' AND D( 9)='1' AND E( 8)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_4( 31)<='1';
        else
        D3F_temp_lv1_4( 31)<='0';
        end if;
        if(A( 0)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_5(  0)<='1';
        else
        D3F_temp_lv1_5(  0)<='0';
        end if;
        if(A( 0)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_5(  1)<='1';
        else
        D3F_temp_lv1_5(  1)<='0';
        end if;
        if(A( 1)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 0)='1' )then
        D3F_temp_lv1_5(  2)<='1';
        else
        D3F_temp_lv1_5(  2)<='0';
        end if;
        if(A( 1)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_5(  3)<='1';
        else
        D3F_temp_lv1_5(  3)<='0';
        end if;
        if(A( 1)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_5(  4)<='1';
        else
        D3F_temp_lv1_5(  4)<='0';
        end if;
        if(A( 1)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_5(  5)<='1';
        else
        D3F_temp_lv1_5(  5)<='0';
        end if;
        if(A( 1)='1' AND D(10)='1' AND E( 9)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_5(  6)<='1';
        else
        D3F_temp_lv1_5(  6)<='0';
        end if;
        if(A( 2)='1' AND D( 1)='1' AND E( 9)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_5(  7)<='1';
        else
        D3F_temp_lv1_5(  7)<='0';
        end if;
        if(A( 2)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_5(  8)<='1';
        else
        D3F_temp_lv1_5(  8)<='0';
        end if;
        if(A( 2)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_5(  9)<='1';
        else
        D3F_temp_lv1_5(  9)<='0';
        end if;
        if(A( 2)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_5( 10)<='1';
        else
        D3F_temp_lv1_5( 10)<='0';
        end if;
        if(A( 2)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 11)<='1';
        else
        D3F_temp_lv1_5( 11)<='0';
        end if;
        if(A( 2)='1' AND D(10)='1' AND E( 9)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_5( 12)<='1';
        else
        D3F_temp_lv1_5( 12)<='0';
        end if;
        if(A( 2)='1' AND D(10)='1' AND E( 9)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_5( 13)<='1';
        else
        D3F_temp_lv1_5( 13)<='0';
        end if;
        if(A( 2)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_5( 14)<='1';
        else
        D3F_temp_lv1_5( 14)<='0';
        end if;
        if(A( 2)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 15)<='1';
        else
        D3F_temp_lv1_5( 15)<='0';
        end if;
        if(A( 3)='1' AND D( 1)='1' AND E( 9)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_5( 16)<='1';
        else
        D3F_temp_lv1_5( 16)<='0';
        end if;
        if(A( 3)='1' AND D( 2)='1' AND E( 9)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_5( 17)<='1';
        else
        D3F_temp_lv1_5( 17)<='0';
        end if;
        if(A( 3)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_5( 18)<='1';
        else
        D3F_temp_lv1_5( 18)<='0';
        end if;
        if(A( 3)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_5( 19)<='1';
        else
        D3F_temp_lv1_5( 19)<='0';
        end if;
        if(A( 3)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_5( 20)<='1';
        else
        D3F_temp_lv1_5( 20)<='0';
        end if;
        if(A( 3)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 21)<='1';
        else
        D3F_temp_lv1_5( 21)<='0';
        end if;
        if(A( 3)='1' AND D(10)='1' AND E( 9)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_5( 22)<='1';
        else
        D3F_temp_lv1_5( 22)<='0';
        end if;
        if(A( 3)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 23)<='1';
        else
        D3F_temp_lv1_5( 23)<='0';
        end if;
        if(A( 4)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_5( 24)<='1';
        else
        D3F_temp_lv1_5( 24)<='0';
        end if;
        if(A( 4)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_5( 25)<='1';
        else
        D3F_temp_lv1_5( 25)<='0';
        end if;
        if(A( 4)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 26)<='1';
        else
        D3F_temp_lv1_5( 26)<='0';
        end if;
        if(A( 4)='1' AND D(10)='1' AND E( 9)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_5( 27)<='1';
        else
        D3F_temp_lv1_5( 27)<='0';
        end if;
        if(A( 4)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 28)<='1';
        else
        D3F_temp_lv1_5( 28)<='0';
        end if;
        if(A( 5)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 29)<='1';
        else
        D3F_temp_lv1_5( 29)<='0';
        end if;
        if(A( 6)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_5( 30)<='1';
        else
        D3F_temp_lv1_5( 30)<='0';
        end if;
        if(A( 6)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 31)<='1';
        else
        D3F_temp_lv1_5( 31)<='0';
        end if;
        if(A( 6)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_5( 32)<='1';
        else
        D3F_temp_lv1_5( 32)<='0';
        end if;
        if(A( 8)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_5( 33)<='1';
        else
        D3F_temp_lv1_5( 33)<='0';
        end if;
        if(A(11)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B( 9)='1' )then
        D3F_temp_lv1_5( 34)<='1';
        else
        D3F_temp_lv1_5( 34)<='0';
        end if;
        if(A(11)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_5( 35)<='1';
        else
        D3F_temp_lv1_5( 35)<='0';
        end if;
        if(A(12)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_5( 36)<='1';
        else
        D3F_temp_lv1_5( 36)<='0';
        end if;
        if(A(12)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 37)<='1';
        else
        D3F_temp_lv1_5( 37)<='0';
        end if;
        if(A(12)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 38)<='1';
        else
        D3F_temp_lv1_5( 38)<='0';
        end if;
        if(A(13)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_5( 39)<='1';
        else
        D3F_temp_lv1_5( 39)<='0';
        end if;
        if(A(13)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 40)<='1';
        else
        D3F_temp_lv1_5( 40)<='0';
        end if;
        if(A(13)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 41)<='1';
        else
        D3F_temp_lv1_5( 41)<='0';
        end if;
        if(A(14)='1' AND D( 9)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 42)<='1';
        else
        D3F_temp_lv1_5( 42)<='0';
        end if;
        if(A(14)='1' AND D(10)='1' AND E( 9)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_5( 43)<='1';
        else
        D3F_temp_lv1_5( 43)<='0';
        end if;
        if(A( 1)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_6(  0)<='1';
        else
        D3F_temp_lv1_6(  0)<='0';
        end if;
        if(A( 1)='1' AND D(10)='1' AND E(10)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_6(  1)<='1';
        else
        D3F_temp_lv1_6(  1)<='0';
        end if;
        if(A( 2)='1' AND D( 2)='1' AND E(10)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_6(  2)<='1';
        else
        D3F_temp_lv1_6(  2)<='0';
        end if;
        if(A( 2)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 1)='1' )then
        D3F_temp_lv1_6(  3)<='1';
        else
        D3F_temp_lv1_6(  3)<='0';
        end if;
        if(A( 2)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_6(  4)<='1';
        else
        D3F_temp_lv1_6(  4)<='0';
        end if;
        if(A( 2)='1' AND D(10)='1' AND E(10)='1' AND NOT B(10)='1' )then
        D3F_temp_lv1_6(  5)<='1';
        else
        D3F_temp_lv1_6(  5)<='0';
        end if;
        if(A( 2)='1' AND D(10)='1' AND E(10)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_6(  6)<='1';
        else
        D3F_temp_lv1_6(  6)<='0';
        end if;
        if(A( 3)='1' AND D( 2)='1' AND E(10)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_6(  7)<='1';
        else
        D3F_temp_lv1_6(  7)<='0';
        end if;
        if(A( 3)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_6(  8)<='1';
        else
        D3F_temp_lv1_6(  8)<='0';
        end if;
        if(A( 3)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_6(  9)<='1';
        else
        D3F_temp_lv1_6(  9)<='0';
        end if;
        if(A( 3)='1' AND D(10)='1' AND E(10)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_6( 10)<='1';
        else
        D3F_temp_lv1_6( 10)<='0';
        end if;
        if(A( 3)='1' AND D(10)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 11)<='1';
        else
        D3F_temp_lv1_6( 11)<='0';
        end if;
        if(A( 3)='1' AND D(11)='1' AND E(10)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_6( 12)<='1';
        else
        D3F_temp_lv1_6( 12)<='0';
        end if;
        if(A( 3)='1' AND D(11)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 13)<='1';
        else
        D3F_temp_lv1_6( 13)<='0';
        end if;
        if(A( 4)='1' AND D( 2)='1' AND E(10)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_6( 14)<='1';
        else
        D3F_temp_lv1_6( 14)<='0';
        end if;
        if(A( 4)='1' AND D( 3)='1' AND E(10)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_6( 15)<='1';
        else
        D3F_temp_lv1_6( 15)<='0';
        end if;
        if(A( 4)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_6( 16)<='1';
        else
        D3F_temp_lv1_6( 16)<='0';
        end if;
        if(A( 4)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_6( 17)<='1';
        else
        D3F_temp_lv1_6( 17)<='0';
        end if;
        if(A( 4)='1' AND D(10)='1' AND E(10)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_6( 18)<='1';
        else
        D3F_temp_lv1_6( 18)<='0';
        end if;
        if(A( 4)='1' AND D(10)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 19)<='1';
        else
        D3F_temp_lv1_6( 19)<='0';
        end if;
        if(A( 4)='1' AND D(11)='1' AND E(10)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_6( 20)<='1';
        else
        D3F_temp_lv1_6( 20)<='0';
        end if;
        if(A( 4)='1' AND D(11)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 21)<='1';
        else
        D3F_temp_lv1_6( 21)<='0';
        end if;
        if(A( 5)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 2)='1' )then
        D3F_temp_lv1_6( 22)<='1';
        else
        D3F_temp_lv1_6( 22)<='0';
        end if;
        if(A( 5)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_6( 23)<='1';
        else
        D3F_temp_lv1_6( 23)<='0';
        end if;
        if(A( 5)='1' AND D(10)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 24)<='1';
        else
        D3F_temp_lv1_6( 24)<='0';
        end if;
        if(A( 5)='1' AND D(11)='1' AND E(10)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_6( 25)<='1';
        else
        D3F_temp_lv1_6( 25)<='0';
        end if;
        if(A( 5)='1' AND D(11)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 26)<='1';
        else
        D3F_temp_lv1_6( 26)<='0';
        end if;
        if(A( 6)='1' AND D(10)='1' AND E(10)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_6( 27)<='1';
        else
        D3F_temp_lv1_6( 27)<='0';
        end if;
        if(A( 6)='1' AND D(10)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 28)<='1';
        else
        D3F_temp_lv1_6( 28)<='0';
        end if;
        if(A(12)='1' AND D(10)='1' AND E(10)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_6( 29)<='1';
        else
        D3F_temp_lv1_6( 29)<='0';
        end if;
        if(A(12)='1' AND D(11)='1' AND E(10)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_6( 30)<='1';
        else
        D3F_temp_lv1_6( 30)<='0';
        end if;
        if(A(13)='1' AND D(10)='1' AND E(10)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_6( 31)<='1';
        else
        D3F_temp_lv1_6( 31)<='0';
        end if;
        if(A(13)='1' AND D(10)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 32)<='1';
        else
        D3F_temp_lv1_6( 32)<='0';
        end if;
        if(A(13)='1' AND D(11)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 33)<='1';
        else
        D3F_temp_lv1_6( 33)<='0';
        end if;
        if(A(14)='1' AND D(10)='1' AND E(10)='1' AND NOT B(11)='1' )then
        D3F_temp_lv1_6( 34)<='1';
        else
        D3F_temp_lv1_6( 34)<='0';
        end if;
        if(A(14)='1' AND D(10)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 35)<='1';
        else
        D3F_temp_lv1_6( 35)<='0';
        end if;
        if(A(14)='1' AND D(11)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 36)<='1';
        else
        D3F_temp_lv1_6( 36)<='0';
        end if;
        if(A(15)='1' AND D(10)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 37)<='1';
        else
        D3F_temp_lv1_6( 37)<='0';
        end if;
        if(A(15)='1' AND D(11)='1' AND E(10)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_6( 38)<='1';
        else
        D3F_temp_lv1_6( 38)<='0';
        end if;
        if(A( 2)='1' AND D(11)='1' AND E(11)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_7(  0)<='1';
        else
        D3F_temp_lv1_7(  0)<='0';
        end if;
        if(A( 3)='1' AND D( 3)='1' AND E(11)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_7(  1)<='1';
        else
        D3F_temp_lv1_7(  1)<='0';
        end if;
        if(A( 3)='1' AND D(11)='1' AND E(11)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_7(  2)<='1';
        else
        D3F_temp_lv1_7(  2)<='0';
        end if;
        if(A( 3)='1' AND D(11)='1' AND E(11)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_7(  3)<='1';
        else
        D3F_temp_lv1_7(  3)<='0';
        end if;
        if(A( 3)='1' AND D(11)='1' AND E(11)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_7(  4)<='1';
        else
        D3F_temp_lv1_7(  4)<='0';
        end if;
        if(A( 4)='1' AND D( 3)='1' AND E(11)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_7(  5)<='1';
        else
        D3F_temp_lv1_7(  5)<='0';
        end if;
        if(A( 4)='1' AND D( 3)='1' AND E(11)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_7(  6)<='1';
        else
        D3F_temp_lv1_7(  6)<='0';
        end if;
        if(A( 4)='1' AND D(11)='1' AND E(11)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_7(  7)<='1';
        else
        D3F_temp_lv1_7(  7)<='0';
        end if;
        if(A( 4)='1' AND D(11)='1' AND E(11)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_7(  8)<='1';
        else
        D3F_temp_lv1_7(  8)<='0';
        end if;
        if(A( 4)='1' AND D(11)='1' AND E(11)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_7(  9)<='1';
        else
        D3F_temp_lv1_7(  9)<='0';
        end if;
        if(A( 4)='1' AND D(11)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 10)<='1';
        else
        D3F_temp_lv1_7( 10)<='0';
        end if;
        if(A( 4)='1' AND D(12)='1' AND E(11)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_7( 11)<='1';
        else
        D3F_temp_lv1_7( 11)<='0';
        end if;
        if(A( 4)='1' AND D(12)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 12)<='1';
        else
        D3F_temp_lv1_7( 12)<='0';
        end if;
        if(A( 5)='1' AND D( 3)='1' AND E(11)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_7( 13)<='1';
        else
        D3F_temp_lv1_7( 13)<='0';
        end if;
        if(A( 5)='1' AND D(11)='1' AND E(11)='1' AND NOT B( 3)='1' )then
        D3F_temp_lv1_7( 14)<='1';
        else
        D3F_temp_lv1_7( 14)<='0';
        end if;
        if(A( 5)='1' AND D(11)='1' AND E(11)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_7( 15)<='1';
        else
        D3F_temp_lv1_7( 15)<='0';
        end if;
        if(A( 5)='1' AND D(11)='1' AND E(11)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_7( 16)<='1';
        else
        D3F_temp_lv1_7( 16)<='0';
        end if;
        if(A( 5)='1' AND D(11)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 17)<='1';
        else
        D3F_temp_lv1_7( 17)<='0';
        end if;
        if(A( 5)='1' AND D(12)='1' AND E(11)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_7( 18)<='1';
        else
        D3F_temp_lv1_7( 18)<='0';
        end if;
        if(A( 5)='1' AND D(12)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 19)<='1';
        else
        D3F_temp_lv1_7( 19)<='0';
        end if;
        if(A( 6)='1' AND D(11)='1' AND E(11)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_7( 20)<='1';
        else
        D3F_temp_lv1_7( 20)<='0';
        end if;
        if(A( 6)='1' AND D(11)='1' AND E(11)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_7( 21)<='1';
        else
        D3F_temp_lv1_7( 21)<='0';
        end if;
        if(A( 6)='1' AND D(11)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 22)<='1';
        else
        D3F_temp_lv1_7( 22)<='0';
        end if;
        if(A( 6)='1' AND D(12)='1' AND E(11)='1' AND NOT B( 4)='1' )then
        D3F_temp_lv1_7( 23)<='1';
        else
        D3F_temp_lv1_7( 23)<='0';
        end if;
        if(A( 6)='1' AND D(12)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 24)<='1';
        else
        D3F_temp_lv1_7( 24)<='0';
        end if;
        if(A( 7)='1' AND D(11)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 25)<='1';
        else
        D3F_temp_lv1_7( 25)<='0';
        end if;
        if(A( 7)='1' AND D(12)='1' AND E(11)='1' AND NOT B(14)='1' )then
        D3F_temp_lv1_7( 26)<='1';
        else
        D3F_temp_lv1_7( 26)<='0';
        end if;
        if(A( 8)='1' AND D(11)='1' AND E(11)='1' AND NOT B(14)='1' )then
        D3F_temp_lv1_7( 27)<='1';
        else
        D3F_temp_lv1_7( 27)<='0';
        end if;
        if(A(13)='1' AND D(11)='1' AND E(11)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_7( 28)<='1';
        else
        D3F_temp_lv1_7( 28)<='0';
        end if;
        if(A(14)='1' AND D(11)='1' AND E(11)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_7( 29)<='1';
        else
        D3F_temp_lv1_7( 29)<='0';
        end if;
        if(A(14)='1' AND D(11)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 30)<='1';
        else
        D3F_temp_lv1_7( 30)<='0';
        end if;
        if(A(14)='1' AND D(12)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 31)<='1';
        else
        D3F_temp_lv1_7( 31)<='0';
        end if;
        if(A(15)='1' AND D(11)='1' AND E(11)='1' AND NOT B(12)='1' )then
        D3F_temp_lv1_7( 32)<='1';
        else
        D3F_temp_lv1_7( 32)<='0';
        end if;
        if(A(15)='1' AND D(11)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 33)<='1';
        else
        D3F_temp_lv1_7( 33)<='0';
        end if;
        if(A(15)='1' AND D(12)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 34)<='1';
        else
        D3F_temp_lv1_7( 34)<='0';
        end if;
        if(A(16)='1' AND D(11)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 35)<='1';
        else
        D3F_temp_lv1_7( 35)<='0';
        end if;
        if(A(16)='1' AND D(12)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 36)<='1';
        else
        D3F_temp_lv1_7( 36)<='0';
        end if;
        if(A(17)='1' AND D(11)='1' AND E(11)='1' AND NOT B(13)='1' )then
        D3F_temp_lv1_7( 37)<='1';
        else
        D3F_temp_lv1_7( 37)<='0';
        end if;
        if(B( 0)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_0(  0)<='1';
        else
        D4F_temp_lv1_0(  0)<='0';
        end if;
        if(B( 0)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_0(  1)<='1';
        else
        D4F_temp_lv1_0(  1)<='0';
        end if;
        if(B( 0)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(10)='1' )then
        D4F_temp_lv1_0(  2)<='1';
        else
        D4F_temp_lv1_0(  2)<='0';
        end if;
        if(B( 0)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_0(  3)<='1';
        else
        D4F_temp_lv1_0(  3)<='0';
        end if;
        if(B( 0)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_0(  4)<='1';
        else
        D4F_temp_lv1_0(  4)<='0';
        end if;
        if(B( 0)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_0(  5)<='1';
        else
        D4F_temp_lv1_0(  5)<='0';
        end if;
        if(B( 0)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A( 0)='1' )then
        D4F_temp_lv1_0(  6)<='1';
        else
        D4F_temp_lv1_0(  6)<='0';
        end if;
        if(B( 0)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_0(  7)<='1';
        else
        D4F_temp_lv1_0(  7)<='0';
        end if;
        if(B( 0)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_0(  8)<='1';
        else
        D4F_temp_lv1_0(  8)<='0';
        end if;
        if(B( 0)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(10)='1' )then
        D4F_temp_lv1_0(  9)<='1';
        else
        D4F_temp_lv1_0(  9)<='0';
        end if;
        if(B( 0)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_0( 10)<='1';
        else
        D4F_temp_lv1_0( 10)<='0';
        end if;
        if(B( 0)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_0( 11)<='1';
        else
        D4F_temp_lv1_0( 11)<='0';
        end if;
        if(B( 1)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_0( 12)<='1';
        else
        D4F_temp_lv1_0( 12)<='0';
        end if;
        if(B( 1)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_0( 13)<='1';
        else
        D4F_temp_lv1_0( 13)<='0';
        end if;
        if(B( 1)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_0( 14)<='1';
        else
        D4F_temp_lv1_0( 14)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_0( 15)<='1';
        else
        D4F_temp_lv1_0( 15)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_0( 16)<='1';
        else
        D4F_temp_lv1_0( 16)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_0( 17)<='1';
        else
        D4F_temp_lv1_0( 17)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_0( 18)<='1';
        else
        D4F_temp_lv1_0( 18)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_0( 19)<='1';
        else
        D4F_temp_lv1_0( 19)<='0';
        end if;
        if(B( 2)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_0( 20)<='1';
        else
        D4F_temp_lv1_0( 20)<='0';
        end if;
        if(B( 9)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(10)='1' )then
        D4F_temp_lv1_0( 21)<='1';
        else
        D4F_temp_lv1_0( 21)<='0';
        end if;
        if(B( 9)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_0( 22)<='1';
        else
        D4F_temp_lv1_0( 22)<='0';
        end if;
        if(B( 9)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_0( 23)<='1';
        else
        D4F_temp_lv1_0( 23)<='0';
        end if;
        if(B( 9)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_0( 24)<='1';
        else
        D4F_temp_lv1_0( 24)<='0';
        end if;
        if(B( 9)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_0( 25)<='1';
        else
        D4F_temp_lv1_0( 25)<='0';
        end if;
        if(B( 9)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_0( 26)<='1';
        else
        D4F_temp_lv1_0( 26)<='0';
        end if;
        if(B( 9)='1' AND D( 8)='1' AND E( 0)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_0( 27)<='1';
        else
        D4F_temp_lv1_0( 27)<='0';
        end if;
        if(B( 9)='1' AND D( 8)='1' AND E( 0)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_0( 28)<='1';
        else
        D4F_temp_lv1_0( 28)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 0)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_0( 29)<='1';
        else
        D4F_temp_lv1_0( 29)<='0';
        end if;
        if(B(10)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_0( 30)<='1';
        else
        D4F_temp_lv1_0( 30)<='0';
        end if;
        if(B(10)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_0( 31)<='1';
        else
        D4F_temp_lv1_0( 31)<='0';
        end if;
        if(B(10)='1' AND D( 0)='1' AND E( 0)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_0( 32)<='1';
        else
        D4F_temp_lv1_0( 32)<='0';
        end if;
        if(B(10)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_0( 33)<='1';
        else
        D4F_temp_lv1_0( 33)<='0';
        end if;
        if(B(10)='1' AND D( 1)='1' AND E( 0)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_0( 34)<='1';
        else
        D4F_temp_lv1_0( 34)<='0';
        end if;
        if(B( 0)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_1(  0)<='1';
        else
        D4F_temp_lv1_1(  0)<='0';
        end if;
        if(B( 0)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_1(  1)<='1';
        else
        D4F_temp_lv1_1(  1)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A( 0)='1' )then
        D4F_temp_lv1_1(  2)<='1';
        else
        D4F_temp_lv1_1(  2)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_1(  3)<='1';
        else
        D4F_temp_lv1_1(  3)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_1(  4)<='1';
        else
        D4F_temp_lv1_1(  4)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_1(  5)<='1';
        else
        D4F_temp_lv1_1(  5)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(10)='1' )then
        D4F_temp_lv1_1(  6)<='1';
        else
        D4F_temp_lv1_1(  6)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_1(  7)<='1';
        else
        D4F_temp_lv1_1(  7)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_1(  8)<='1';
        else
        D4F_temp_lv1_1(  8)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_1(  9)<='1';
        else
        D4F_temp_lv1_1(  9)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_1( 10)<='1';
        else
        D4F_temp_lv1_1( 10)<='0';
        end if;
        if(B( 1)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_1( 11)<='1';
        else
        D4F_temp_lv1_1( 11)<='0';
        end if;
        if(B( 1)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_1( 12)<='1';
        else
        D4F_temp_lv1_1( 12)<='0';
        end if;
        if(B( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_1( 13)<='1';
        else
        D4F_temp_lv1_1( 13)<='0';
        end if;
        if(B( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_1( 14)<='1';
        else
        D4F_temp_lv1_1( 14)<='0';
        end if;
        if(B( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_1( 15)<='1';
        else
        D4F_temp_lv1_1( 15)<='0';
        end if;
        if(B( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_1( 16)<='1';
        else
        D4F_temp_lv1_1( 16)<='0';
        end if;
        if(B( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_1( 17)<='1';
        else
        D4F_temp_lv1_1( 17)<='0';
        end if;
        if(B( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_1( 18)<='1';
        else
        D4F_temp_lv1_1( 18)<='0';
        end if;
        if(B( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_1( 19)<='1';
        else
        D4F_temp_lv1_1( 19)<='0';
        end if;
        if(B( 2)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_1( 20)<='1';
        else
        D4F_temp_lv1_1( 20)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_1( 21)<='1';
        else
        D4F_temp_lv1_1( 21)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_1( 22)<='1';
        else
        D4F_temp_lv1_1( 22)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_1( 23)<='1';
        else
        D4F_temp_lv1_1( 23)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_1( 24)<='1';
        else
        D4F_temp_lv1_1( 24)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_1( 25)<='1';
        else
        D4F_temp_lv1_1( 25)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_1( 26)<='1';
        else
        D4F_temp_lv1_1( 26)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_1( 27)<='1';
        else
        D4F_temp_lv1_1( 27)<='0';
        end if;
        if(B(10)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_1( 28)<='1';
        else
        D4F_temp_lv1_1( 28)<='0';
        end if;
        if(B(10)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_1( 29)<='1';
        else
        D4F_temp_lv1_1( 29)<='0';
        end if;
        if(B(10)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_1( 30)<='1';
        else
        D4F_temp_lv1_1( 30)<='0';
        end if;
        if(B(10)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_1( 31)<='1';
        else
        D4F_temp_lv1_1( 31)<='0';
        end if;
        if(B(10)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_1( 32)<='1';
        else
        D4F_temp_lv1_1( 32)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 1)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_1( 33)<='1';
        else
        D4F_temp_lv1_1( 33)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 1)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_1( 34)<='1';
        else
        D4F_temp_lv1_1( 34)<='0';
        end if;
        if(B(11)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_1( 35)<='1';
        else
        D4F_temp_lv1_1( 35)<='0';
        end if;
        if(B(11)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_1( 36)<='1';
        else
        D4F_temp_lv1_1( 36)<='0';
        end if;
        if(B(11)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_1( 37)<='1';
        else
        D4F_temp_lv1_1( 37)<='0';
        end if;
        if(B(11)='1' AND D( 1)='1' AND E( 1)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_1( 38)<='1';
        else
        D4F_temp_lv1_1( 38)<='0';
        end if;
        if(B(11)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_1( 39)<='1';
        else
        D4F_temp_lv1_1( 39)<='0';
        end if;
        if(B(11)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_1( 40)<='1';
        else
        D4F_temp_lv1_1( 40)<='0';
        end if;
        if(B(11)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_1( 41)<='1';
        else
        D4F_temp_lv1_1( 41)<='0';
        end if;
        if(B(11)='1' AND D( 2)='1' AND E( 1)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_1( 42)<='1';
        else
        D4F_temp_lv1_1( 42)<='0';
        end if;
        if(B(11)='1' AND D( 9)='1' AND E( 1)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_1( 43)<='1';
        else
        D4F_temp_lv1_1( 43)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 1)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_1( 44)<='1';
        else
        D4F_temp_lv1_1( 44)<='0';
        end if;
        if(B( 1)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_2(  0)<='1';
        else
        D4F_temp_lv1_2(  0)<='0';
        end if;
        if(B( 1)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_2(  1)<='1';
        else
        D4F_temp_lv1_2(  1)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_2(  2)<='1';
        else
        D4F_temp_lv1_2(  2)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_2(  3)<='1';
        else
        D4F_temp_lv1_2(  3)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_2(  4)<='1';
        else
        D4F_temp_lv1_2(  4)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_2(  5)<='1';
        else
        D4F_temp_lv1_2(  5)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_2(  6)<='1';
        else
        D4F_temp_lv1_2(  6)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_2(  7)<='1';
        else
        D4F_temp_lv1_2(  7)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_2(  8)<='1';
        else
        D4F_temp_lv1_2(  8)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_2(  9)<='1';
        else
        D4F_temp_lv1_2(  9)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_2( 10)<='1';
        else
        D4F_temp_lv1_2( 10)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_2( 11)<='1';
        else
        D4F_temp_lv1_2( 11)<='0';
        end if;
        if(B( 2)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_2( 12)<='1';
        else
        D4F_temp_lv1_2( 12)<='0';
        end if;
        if(B( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_2( 13)<='1';
        else
        D4F_temp_lv1_2( 13)<='0';
        end if;
        if(B( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_2( 14)<='1';
        else
        D4F_temp_lv1_2( 14)<='0';
        end if;
        if(B( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_2( 15)<='1';
        else
        D4F_temp_lv1_2( 15)<='0';
        end if;
        if(B( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_2( 16)<='1';
        else
        D4F_temp_lv1_2( 16)<='0';
        end if;
        if(B( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_2( 17)<='1';
        else
        D4F_temp_lv1_2( 17)<='0';
        end if;
        if(B( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_2( 18)<='1';
        else
        D4F_temp_lv1_2( 18)<='0';
        end if;
        if(B( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_2( 19)<='1';
        else
        D4F_temp_lv1_2( 19)<='0';
        end if;
        if(B( 3)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(16)='1' )then
        D4F_temp_lv1_2( 20)<='1';
        else
        D4F_temp_lv1_2( 20)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_2( 21)<='1';
        else
        D4F_temp_lv1_2( 21)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_2( 22)<='1';
        else
        D4F_temp_lv1_2( 22)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_2( 23)<='1';
        else
        D4F_temp_lv1_2( 23)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_2( 24)<='1';
        else
        D4F_temp_lv1_2( 24)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_2( 25)<='1';
        else
        D4F_temp_lv1_2( 25)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_2( 26)<='1';
        else
        D4F_temp_lv1_2( 26)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A(16)='1' )then
        D4F_temp_lv1_2( 27)<='1';
        else
        D4F_temp_lv1_2( 27)<='0';
        end if;
        if(B(11)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_2( 28)<='1';
        else
        D4F_temp_lv1_2( 28)<='0';
        end if;
        if(B(11)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_2( 29)<='1';
        else
        D4F_temp_lv1_2( 29)<='0';
        end if;
        if(B(11)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_2( 30)<='1';
        else
        D4F_temp_lv1_2( 30)<='0';
        end if;
        if(B(11)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_2( 31)<='1';
        else
        D4F_temp_lv1_2( 31)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 2)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_2( 32)<='1';
        else
        D4F_temp_lv1_2( 32)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 2)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_2( 33)<='1';
        else
        D4F_temp_lv1_2( 33)<='0';
        end if;
        if(B(12)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_2( 34)<='1';
        else
        D4F_temp_lv1_2( 34)<='0';
        end if;
        if(B(12)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_2( 35)<='1';
        else
        D4F_temp_lv1_2( 35)<='0';
        end if;
        if(B(12)='1' AND D( 2)='1' AND E( 2)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_2( 36)<='1';
        else
        D4F_temp_lv1_2( 36)<='0';
        end if;
        if(B(12)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_2( 37)<='1';
        else
        D4F_temp_lv1_2( 37)<='0';
        end if;
        if(B(12)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_2( 38)<='1';
        else
        D4F_temp_lv1_2( 38)<='0';
        end if;
        if(B(12)='1' AND D( 3)='1' AND E( 2)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_2( 39)<='1';
        else
        D4F_temp_lv1_2( 39)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E( 2)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_2( 40)<='1';
        else
        D4F_temp_lv1_2( 40)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E( 2)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_2( 41)<='1';
        else
        D4F_temp_lv1_2( 41)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E( 2)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_2( 42)<='1';
        else
        D4F_temp_lv1_2( 42)<='0';
        end if;
        if(B( 2)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_3(  0)<='1';
        else
        D4F_temp_lv1_3(  0)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_3(  1)<='1';
        else
        D4F_temp_lv1_3(  1)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_3(  2)<='1';
        else
        D4F_temp_lv1_3(  2)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_3(  3)<='1';
        else
        D4F_temp_lv1_3(  3)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_3(  4)<='1';
        else
        D4F_temp_lv1_3(  4)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_3(  5)<='1';
        else
        D4F_temp_lv1_3(  5)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_3(  6)<='1';
        else
        D4F_temp_lv1_3(  6)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_3(  7)<='1';
        else
        D4F_temp_lv1_3(  7)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_3(  8)<='1';
        else
        D4F_temp_lv1_3(  8)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_3(  9)<='1';
        else
        D4F_temp_lv1_3(  9)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_3( 10)<='1';
        else
        D4F_temp_lv1_3( 10)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_3( 11)<='1';
        else
        D4F_temp_lv1_3( 11)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_3( 12)<='1';
        else
        D4F_temp_lv1_3( 12)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_3( 13)<='1';
        else
        D4F_temp_lv1_3( 13)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(16)='1' )then
        D4F_temp_lv1_3( 14)<='1';
        else
        D4F_temp_lv1_3( 14)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(17)='1' )then
        D4F_temp_lv1_3( 15)<='1';
        else
        D4F_temp_lv1_3( 15)<='0';
        end if;
        if(B( 4)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_3( 16)<='1';
        else
        D4F_temp_lv1_3( 16)<='0';
        end if;
        if(B( 4)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_3( 17)<='1';
        else
        D4F_temp_lv1_3( 17)<='0';
        end if;
        if(B( 4)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_3( 18)<='1';
        else
        D4F_temp_lv1_3( 18)<='0';
        end if;
        if(B( 4)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_3( 19)<='1';
        else
        D4F_temp_lv1_3( 19)<='0';
        end if;
        if(B( 4)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_3( 20)<='1';
        else
        D4F_temp_lv1_3( 20)<='0';
        end if;
        if(B( 4)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A(16)='1' )then
        D4F_temp_lv1_3( 21)<='1';
        else
        D4F_temp_lv1_3( 21)<='0';
        end if;
        if(B( 5)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A(16)='1' )then
        D4F_temp_lv1_3( 22)<='1';
        else
        D4F_temp_lv1_3( 22)<='0';
        end if;
        if(B( 5)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A(17)='1' )then
        D4F_temp_lv1_3( 23)<='1';
        else
        D4F_temp_lv1_3( 23)<='0';
        end if;
        if(B(12)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_3( 24)<='1';
        else
        D4F_temp_lv1_3( 24)<='0';
        end if;
        if(B(12)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_3( 25)<='1';
        else
        D4F_temp_lv1_3( 25)<='0';
        end if;
        if(B(12)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_3( 26)<='1';
        else
        D4F_temp_lv1_3( 26)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E( 3)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_3( 27)<='1';
        else
        D4F_temp_lv1_3( 27)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E( 3)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_3( 28)<='1';
        else
        D4F_temp_lv1_3( 28)<='0';
        end if;
        if(B(13)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_3( 29)<='1';
        else
        D4F_temp_lv1_3( 29)<='0';
        end if;
        if(B(13)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_3( 30)<='1';
        else
        D4F_temp_lv1_3( 30)<='0';
        end if;
        if(B(13)='1' AND D( 3)='1' AND E( 3)='1' AND NOT A(16)='1' )then
        D4F_temp_lv1_3( 31)<='1';
        else
        D4F_temp_lv1_3( 31)<='0';
        end if;
        if(B(13)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_3( 32)<='1';
        else
        D4F_temp_lv1_3( 32)<='0';
        end if;
        if(B(13)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_3( 33)<='1';
        else
        D4F_temp_lv1_3( 33)<='0';
        end if;
        if(B(13)='1' AND D( 4)='1' AND E( 3)='1' AND NOT A(16)='1' )then
        D4F_temp_lv1_3( 34)<='1';
        else
        D4F_temp_lv1_3( 34)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E( 3)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_3( 35)<='1';
        else
        D4F_temp_lv1_3( 35)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E( 3)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_3( 36)<='1';
        else
        D4F_temp_lv1_3( 36)<='0';
        end if;
        if(B(13)='1' AND D(12)='1' AND E( 3)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_3( 37)<='1';
        else
        D4F_temp_lv1_3( 37)<='0';
        end if;
        if(B( 0)='1' AND D( 0)='1' AND E( 8)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_4(  0)<='1';
        else
        D4F_temp_lv1_4(  0)<='0';
        end if;
        if(B( 0)='1' AND D( 0)='1' AND E( 8)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_4(  1)<='1';
        else
        D4F_temp_lv1_4(  1)<='0';
        end if;
        if(B( 0)='1' AND D( 1)='1' AND E( 8)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_4(  2)<='1';
        else
        D4F_temp_lv1_4(  2)<='0';
        end if;
        if(B( 0)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_4(  3)<='1';
        else
        D4F_temp_lv1_4(  3)<='0';
        end if;
        if(B( 0)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_4(  4)<='1';
        else
        D4F_temp_lv1_4(  4)<='0';
        end if;
        if(B( 0)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_4(  5)<='1';
        else
        D4F_temp_lv1_4(  5)<='0';
        end if;
        if(B( 0)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_4(  6)<='1';
        else
        D4F_temp_lv1_4(  6)<='0';
        end if;
        if(B( 1)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_4(  7)<='1';
        else
        D4F_temp_lv1_4(  7)<='0';
        end if;
        if(B( 1)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_4(  8)<='1';
        else
        D4F_temp_lv1_4(  8)<='0';
        end if;
        if(B( 1)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_4(  9)<='1';
        else
        D4F_temp_lv1_4(  9)<='0';
        end if;
        if(B( 1)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_4( 10)<='1';
        else
        D4F_temp_lv1_4( 10)<='0';
        end if;
        if(B( 1)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_4( 11)<='1';
        else
        D4F_temp_lv1_4( 11)<='0';
        end if;
        if(B( 9)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 0)='1' )then
        D4F_temp_lv1_4( 12)<='1';
        else
        D4F_temp_lv1_4( 12)<='0';
        end if;
        if(B( 9)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_4( 13)<='1';
        else
        D4F_temp_lv1_4( 13)<='0';
        end if;
        if(B( 9)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_4( 14)<='1';
        else
        D4F_temp_lv1_4( 14)<='0';
        end if;
        if(B( 9)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_4( 15)<='1';
        else
        D4F_temp_lv1_4( 15)<='0';
        end if;
        if(B( 9)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_4( 16)<='1';
        else
        D4F_temp_lv1_4( 16)<='0';
        end if;
        if(B( 9)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_4( 17)<='1';
        else
        D4F_temp_lv1_4( 17)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 0)='1' )then
        D4F_temp_lv1_4( 18)<='1';
        else
        D4F_temp_lv1_4( 18)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_4( 19)<='1';
        else
        D4F_temp_lv1_4( 19)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_4( 20)<='1';
        else
        D4F_temp_lv1_4( 20)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_4( 21)<='1';
        else
        D4F_temp_lv1_4( 21)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_4( 22)<='1';
        else
        D4F_temp_lv1_4( 22)<='0';
        end if;
        if(B(10)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_4( 23)<='1';
        else
        D4F_temp_lv1_4( 23)<='0';
        end if;
        if(B(10)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_4( 24)<='1';
        else
        D4F_temp_lv1_4( 24)<='0';
        end if;
        if(B(10)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_4( 25)<='1';
        else
        D4F_temp_lv1_4( 25)<='0';
        end if;
        if(B(10)='1' AND D( 8)='1' AND E( 8)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_4( 26)<='1';
        else
        D4F_temp_lv1_4( 26)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_4( 27)<='1';
        else
        D4F_temp_lv1_4( 27)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_4( 28)<='1';
        else
        D4F_temp_lv1_4( 28)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_4( 29)<='1';
        else
        D4F_temp_lv1_4( 29)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_4( 30)<='1';
        else
        D4F_temp_lv1_4( 30)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 8)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_4( 31)<='1';
        else
        D4F_temp_lv1_4( 31)<='0';
        end if;
        if(B( 0)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_5(  0)<='1';
        else
        D4F_temp_lv1_5(  0)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 9)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_5(  1)<='1';
        else
        D4F_temp_lv1_5(  1)<='0';
        end if;
        if(B( 1)='1' AND D( 1)='1' AND E( 9)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_5(  2)<='1';
        else
        D4F_temp_lv1_5(  2)<='0';
        end if;
        if(B( 1)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 0)='1' )then
        D4F_temp_lv1_5(  3)<='1';
        else
        D4F_temp_lv1_5(  3)<='0';
        end if;
        if(B( 1)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_5(  4)<='1';
        else
        D4F_temp_lv1_5(  4)<='0';
        end if;
        if(B( 1)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_5(  5)<='1';
        else
        D4F_temp_lv1_5(  5)<='0';
        end if;
        if(B( 1)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_5(  6)<='1';
        else
        D4F_temp_lv1_5(  6)<='0';
        end if;
        if(B( 1)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_5(  7)<='1';
        else
        D4F_temp_lv1_5(  7)<='0';
        end if;
        if(B( 1)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_5(  8)<='1';
        else
        D4F_temp_lv1_5(  8)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E( 9)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_5(  9)<='1';
        else
        D4F_temp_lv1_5(  9)<='0';
        end if;
        if(B( 2)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_5( 10)<='1';
        else
        D4F_temp_lv1_5( 10)<='0';
        end if;
        if(B( 2)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_5( 11)<='1';
        else
        D4F_temp_lv1_5( 11)<='0';
        end if;
        if(B( 2)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_5( 12)<='1';
        else
        D4F_temp_lv1_5( 12)<='0';
        end if;
        if(B( 2)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_5( 13)<='1';
        else
        D4F_temp_lv1_5( 13)<='0';
        end if;
        if(B( 2)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_5( 14)<='1';
        else
        D4F_temp_lv1_5( 14)<='0';
        end if;
        if(B( 2)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_5( 15)<='1';
        else
        D4F_temp_lv1_5( 15)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 0)='1' )then
        D4F_temp_lv1_5( 16)<='1';
        else
        D4F_temp_lv1_5( 16)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_5( 17)<='1';
        else
        D4F_temp_lv1_5( 17)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_5( 18)<='1';
        else
        D4F_temp_lv1_5( 18)<='0';
        end if;
        if(B( 9)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_5( 19)<='1';
        else
        D4F_temp_lv1_5( 19)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_5( 20)<='1';
        else
        D4F_temp_lv1_5( 20)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_5( 21)<='1';
        else
        D4F_temp_lv1_5( 21)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_5( 22)<='1';
        else
        D4F_temp_lv1_5( 22)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_5( 23)<='1';
        else
        D4F_temp_lv1_5( 23)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A(11)='1' )then
        D4F_temp_lv1_5( 24)<='1';
        else
        D4F_temp_lv1_5( 24)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_5( 25)<='1';
        else
        D4F_temp_lv1_5( 25)<='0';
        end if;
        if(B(10)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_5( 26)<='1';
        else
        D4F_temp_lv1_5( 26)<='0';
        end if;
        if(B(10)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_5( 27)<='1';
        else
        D4F_temp_lv1_5( 27)<='0';
        end if;
        if(B(11)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_5( 28)<='1';
        else
        D4F_temp_lv1_5( 28)<='0';
        end if;
        if(B(11)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_5( 29)<='1';
        else
        D4F_temp_lv1_5( 29)<='0';
        end if;
        if(B(11)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_5( 30)<='1';
        else
        D4F_temp_lv1_5( 30)<='0';
        end if;
        if(B(11)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_5( 31)<='1';
        else
        D4F_temp_lv1_5( 31)<='0';
        end if;
        if(B(11)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_5( 32)<='1';
        else
        D4F_temp_lv1_5( 32)<='0';
        end if;
        if(B(11)='1' AND D( 9)='1' AND E( 9)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_5( 33)<='1';
        else
        D4F_temp_lv1_5( 33)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_5( 34)<='1';
        else
        D4F_temp_lv1_5( 34)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_5( 35)<='1';
        else
        D4F_temp_lv1_5( 35)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_5( 36)<='1';
        else
        D4F_temp_lv1_5( 36)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_5( 37)<='1';
        else
        D4F_temp_lv1_5( 37)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_5( 38)<='1';
        else
        D4F_temp_lv1_5( 38)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 9)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_5( 39)<='1';
        else
        D4F_temp_lv1_5( 39)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 9)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_5( 40)<='1';
        else
        D4F_temp_lv1_5( 40)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E( 9)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_5( 41)<='1';
        else
        D4F_temp_lv1_5( 41)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_5( 42)<='1';
        else
        D4F_temp_lv1_5( 42)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E( 9)='1' AND NOT A( 8)='1' )then
        D4F_temp_lv1_5( 43)<='1';
        else
        D4F_temp_lv1_5( 43)<='0';
        end if;
        if(B( 1)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_6(  0)<='1';
        else
        D4F_temp_lv1_6(  0)<='0';
        end if;
        if(B( 1)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_6(  1)<='1';
        else
        D4F_temp_lv1_6(  1)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E(10)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_6(  2)<='1';
        else
        D4F_temp_lv1_6(  2)<='0';
        end if;
        if(B( 2)='1' AND D( 2)='1' AND E(10)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_6(  3)<='1';
        else
        D4F_temp_lv1_6(  3)<='0';
        end if;
        if(B( 2)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_6(  4)<='1';
        else
        D4F_temp_lv1_6(  4)<='0';
        end if;
        if(B( 2)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_6(  5)<='1';
        else
        D4F_temp_lv1_6(  5)<='0';
        end if;
        if(B( 2)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_6(  6)<='1';
        else
        D4F_temp_lv1_6(  6)<='0';
        end if;
        if(B( 2)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_6(  7)<='1';
        else
        D4F_temp_lv1_6(  7)<='0';
        end if;
        if(B( 3)='1' AND D( 2)='1' AND E(10)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_6(  8)<='1';
        else
        D4F_temp_lv1_6(  8)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E(10)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_6(  9)<='1';
        else
        D4F_temp_lv1_6(  9)<='0';
        end if;
        if(B( 3)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_6( 10)<='1';
        else
        D4F_temp_lv1_6( 10)<='0';
        end if;
        if(B( 3)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_6( 11)<='1';
        else
        D4F_temp_lv1_6( 11)<='0';
        end if;
        if(B( 3)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_6( 12)<='1';
        else
        D4F_temp_lv1_6( 12)<='0';
        end if;
        if(B( 3)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_6( 13)<='1';
        else
        D4F_temp_lv1_6( 13)<='0';
        end if;
        if(B( 3)='1' AND D(11)='1' AND E(10)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_6( 14)<='1';
        else
        D4F_temp_lv1_6( 14)<='0';
        end if;
        if(B( 3)='1' AND D(11)='1' AND E(10)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_6( 15)<='1';
        else
        D4F_temp_lv1_6( 15)<='0';
        end if;
        if(B( 3)='1' AND D(11)='1' AND E(10)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_6( 16)<='1';
        else
        D4F_temp_lv1_6( 16)<='0';
        end if;
        if(B(10)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_6( 17)<='1';
        else
        D4F_temp_lv1_6( 17)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 1)='1' )then
        D4F_temp_lv1_6( 18)<='1';
        else
        D4F_temp_lv1_6( 18)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_6( 19)<='1';
        else
        D4F_temp_lv1_6( 19)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_6( 20)<='1';
        else
        D4F_temp_lv1_6( 20)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_6( 21)<='1';
        else
        D4F_temp_lv1_6( 21)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E(10)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_6( 22)<='1';
        else
        D4F_temp_lv1_6( 22)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E(10)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_6( 23)<='1';
        else
        D4F_temp_lv1_6( 23)<='0';
        end if;
        if(B(11)='1' AND D(10)='1' AND E(10)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_6( 24)<='1';
        else
        D4F_temp_lv1_6( 24)<='0';
        end if;
        if(B(11)='1' AND D(11)='1' AND E(10)='1' AND NOT A(12)='1' )then
        D4F_temp_lv1_6( 25)<='1';
        else
        D4F_temp_lv1_6( 25)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_6( 26)<='1';
        else
        D4F_temp_lv1_6( 26)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_6( 27)<='1';
        else
        D4F_temp_lv1_6( 27)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_6( 28)<='1';
        else
        D4F_temp_lv1_6( 28)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E(10)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_6( 29)<='1';
        else
        D4F_temp_lv1_6( 29)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E(10)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_6( 30)<='1';
        else
        D4F_temp_lv1_6( 30)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E(10)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_6( 31)<='1';
        else
        D4F_temp_lv1_6( 31)<='0';
        end if;
        if(B(12)='1' AND D(10)='1' AND E(10)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_6( 32)<='1';
        else
        D4F_temp_lv1_6( 32)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(10)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_6( 33)<='1';
        else
        D4F_temp_lv1_6( 33)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(10)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_6( 34)<='1';
        else
        D4F_temp_lv1_6( 34)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(10)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_6( 35)<='1';
        else
        D4F_temp_lv1_6( 35)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(10)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_6( 36)<='1';
        else
        D4F_temp_lv1_6( 36)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(10)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_6( 37)<='1';
        else
        D4F_temp_lv1_6( 37)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(10)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_6( 38)<='1';
        else
        D4F_temp_lv1_6( 38)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E(11)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_7(  0)<='1';
        else
        D4F_temp_lv1_7(  0)<='0';
        end if;
        if(B( 3)='1' AND D( 3)='1' AND E(11)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_7(  1)<='1';
        else
        D4F_temp_lv1_7(  1)<='0';
        end if;
        if(B( 3)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 2)='1' )then
        D4F_temp_lv1_7(  2)<='1';
        else
        D4F_temp_lv1_7(  2)<='0';
        end if;
        if(B( 3)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_7(  3)<='1';
        else
        D4F_temp_lv1_7(  3)<='0';
        end if;
        if(B( 3)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_7(  4)<='1';
        else
        D4F_temp_lv1_7(  4)<='0';
        end if;
        if(B( 3)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_7(  5)<='1';
        else
        D4F_temp_lv1_7(  5)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E(11)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_7(  6)<='1';
        else
        D4F_temp_lv1_7(  6)<='0';
        end if;
        if(B( 4)='1' AND D( 3)='1' AND E(11)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_7(  7)<='1';
        else
        D4F_temp_lv1_7(  7)<='0';
        end if;
        if(B( 4)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_7(  8)<='1';
        else
        D4F_temp_lv1_7(  8)<='0';
        end if;
        if(B( 4)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_7(  9)<='1';
        else
        D4F_temp_lv1_7(  9)<='0';
        end if;
        if(B( 4)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_7( 10)<='1';
        else
        D4F_temp_lv1_7( 10)<='0';
        end if;
        if(B( 4)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_7( 11)<='1';
        else
        D4F_temp_lv1_7( 11)<='0';
        end if;
        if(B( 4)='1' AND D(12)='1' AND E(11)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_7( 12)<='1';
        else
        D4F_temp_lv1_7( 12)<='0';
        end if;
        if(B( 4)='1' AND D(12)='1' AND E(11)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_7( 13)<='1';
        else
        D4F_temp_lv1_7( 13)<='0';
        end if;
        if(B( 4)='1' AND D(12)='1' AND E(11)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_7( 14)<='1';
        else
        D4F_temp_lv1_7( 14)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 3)='1' )then
        D4F_temp_lv1_7( 15)<='1';
        else
        D4F_temp_lv1_7( 15)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_7( 16)<='1';
        else
        D4F_temp_lv1_7( 16)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_7( 17)<='1';
        else
        D4F_temp_lv1_7( 17)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_7( 18)<='1';
        else
        D4F_temp_lv1_7( 18)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(11)='1' AND NOT A(13)='1' )then
        D4F_temp_lv1_7( 19)<='1';
        else
        D4F_temp_lv1_7( 19)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(11)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_7( 20)<='1';
        else
        D4F_temp_lv1_7( 20)<='0';
        end if;
        if(B(12)='1' AND D(11)='1' AND E(11)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_7( 21)<='1';
        else
        D4F_temp_lv1_7( 21)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_7( 22)<='1';
        else
        D4F_temp_lv1_7( 22)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_7( 23)<='1';
        else
        D4F_temp_lv1_7( 23)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_7( 24)<='1';
        else
        D4F_temp_lv1_7( 24)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 7)='1' )then
        D4F_temp_lv1_7( 25)<='1';
        else
        D4F_temp_lv1_7( 25)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E(11)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_7( 26)<='1';
        else
        D4F_temp_lv1_7( 26)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E(11)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_7( 27)<='1';
        else
        D4F_temp_lv1_7( 27)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E(11)='1' AND NOT A(16)='1' )then
        D4F_temp_lv1_7( 28)<='1';
        else
        D4F_temp_lv1_7( 28)<='0';
        end if;
        if(B(13)='1' AND D(11)='1' AND E(11)='1' AND NOT A(17)='1' )then
        D4F_temp_lv1_7( 29)<='1';
        else
        D4F_temp_lv1_7( 29)<='0';
        end if;
        if(B(13)='1' AND D(12)='1' AND E(11)='1' AND NOT A( 4)='1' )then
        D4F_temp_lv1_7( 30)<='1';
        else
        D4F_temp_lv1_7( 30)<='0';
        end if;
        if(B(13)='1' AND D(12)='1' AND E(11)='1' AND NOT A( 5)='1' )then
        D4F_temp_lv1_7( 31)<='1';
        else
        D4F_temp_lv1_7( 31)<='0';
        end if;
        if(B(13)='1' AND D(12)='1' AND E(11)='1' AND NOT A( 6)='1' )then
        D4F_temp_lv1_7( 32)<='1';
        else
        D4F_temp_lv1_7( 32)<='0';
        end if;
        if(B(13)='1' AND D(12)='1' AND E(11)='1' AND NOT A(14)='1' )then
        D4F_temp_lv1_7( 33)<='1';
        else
        D4F_temp_lv1_7( 33)<='0';
        end if;
        if(B(13)='1' AND D(12)='1' AND E(11)='1' AND NOT A(15)='1' )then
        D4F_temp_lv1_7( 34)<='1';
        else
        D4F_temp_lv1_7( 34)<='0';
        end if;
        if(B(13)='1' AND D(12)='1' AND E(11)='1' AND NOT A(16)='1' )then
        D4F_temp_lv1_7( 35)<='1';
        else
        D4F_temp_lv1_7( 35)<='0';
        end if;
        if(B(14)='1' AND D(11)='1' AND E(11)='1' AND NOT A( 8)='1' )then
        D4F_temp_lv1_7( 36)<='1';
        else
        D4F_temp_lv1_7( 36)<='0';
        end if;
        if(B(14)='1' AND D(12)='1' AND E(11)='1' AND NOT A( 7)='1' )then
        D4F_temp_lv1_7( 37)<='1';
        else
        D4F_temp_lv1_7( 37)<='0';
        end if;
 end if;
 end process;	
 lookuptable_LV2 : process(c1)
 begin   
 if c1'event and c1='1' then
        if(D0F_temp_lv1_0(  0)='1' OR D0F_temp_lv1_0(  1)='1' OR D0F_temp_lv1_0(  2)='1' OR D0F_temp_lv1_0(  3)='1' )then
        D0F_temp_lv2_0(  0)<='1';
        else
        D0F_temp_lv2_0(  0)<='0';
        end if;
        if(D0F_temp_lv1_0(  4)='1' OR D0F_temp_lv1_0(  5)='1' OR D0F_temp_lv1_0(  6)='1' OR D0F_temp_lv1_0(  7)='1' )then
        D0F_temp_lv2_0(  1)<='1';
        else
        D0F_temp_lv2_0(  1)<='0';
        end if;
        if(D0F_temp_lv1_0(  8)='1' OR D0F_temp_lv1_0(  9)='1' OR D0F_temp_lv1_0( 10)='1' OR D0F_temp_lv1_0( 11)='1' )then
        D0F_temp_lv2_0(  2)<='1';
        else
        D0F_temp_lv2_0(  2)<='0';
        end if;
        if(D0F_temp_lv1_0( 12)='1' OR D0F_temp_lv1_0( 13)='1' OR D0F_temp_lv1_0( 14)='1' OR D0F_temp_lv1_0( 15)='1' )then
        D0F_temp_lv2_0(  3)<='1';
        else
        D0F_temp_lv2_0(  3)<='0';
        end if;
        if(D0F_temp_lv1_0( 16)='1' OR D0F_temp_lv1_0( 17)='1' OR D0F_temp_lv1_0( 18)='1' OR D0F_temp_lv1_0( 19)='1' )then
        D0F_temp_lv2_0(  4)<='1';
        else
        D0F_temp_lv2_0(  4)<='0';
        end if;
        if(D0F_temp_lv1_0( 20)='1' OR D0F_temp_lv1_0( 21)='1' OR D0F_temp_lv1_0( 22)='1' OR D0F_temp_lv1_0( 23)='1' )then
        D0F_temp_lv2_0(  5)<='1';
        else
        D0F_temp_lv2_0(  5)<='0';
        end if;
        if(D0F_temp_lv1_0( 24)='1' OR D0F_temp_lv1_0( 25)='1' OR D0F_temp_lv1_0( 26)='1' OR D0F_temp_lv1_0( 27)='1' )then
        D0F_temp_lv2_0(  6)<='1';
        else
        D0F_temp_lv2_0(  6)<='0';
        end if;
        if(D0F_temp_lv1_0( 28)='1' OR D0F_temp_lv1_0( 29)='1' OR D0F_temp_lv1_0( 30)='1' OR D0F_temp_lv1_0( 31)='1' )then
        D0F_temp_lv2_0(  7)<='1';
        else
        D0F_temp_lv2_0(  7)<='0';
        end if;
        if(D0F_temp_lv1_0( 32)='1' OR D0F_temp_lv1_0( 33)='1' OR D0F_temp_lv1_0( 34)='1' )then
        D0F_temp_lv2_0(  8)<='1';
        else
        D0F_temp_lv2_0(  8)<='0';
        end if;
        if(D0F_temp_lv1_1(  0)='1' OR D0F_temp_lv1_1(  1)='1' OR D0F_temp_lv1_1(  2)='1' OR D0F_temp_lv1_1(  3)='1' )then
        D0F_temp_lv2_1(  0)<='1';
        else
        D0F_temp_lv2_1(  0)<='0';
        end if;
        if(D0F_temp_lv1_1(  4)='1' OR D0F_temp_lv1_1(  5)='1' OR D0F_temp_lv1_1(  6)='1' OR D0F_temp_lv1_1(  7)='1' )then
        D0F_temp_lv2_1(  1)<='1';
        else
        D0F_temp_lv2_1(  1)<='0';
        end if;
        if(D0F_temp_lv1_1(  8)='1' OR D0F_temp_lv1_1(  9)='1' OR D0F_temp_lv1_1( 10)='1' OR D0F_temp_lv1_1( 11)='1' )then
        D0F_temp_lv2_1(  2)<='1';
        else
        D0F_temp_lv2_1(  2)<='0';
        end if;
        if(D0F_temp_lv1_1( 12)='1' OR D0F_temp_lv1_1( 13)='1' OR D0F_temp_lv1_1( 14)='1' OR D0F_temp_lv1_1( 15)='1' )then
        D0F_temp_lv2_1(  3)<='1';
        else
        D0F_temp_lv2_1(  3)<='0';
        end if;
        if(D0F_temp_lv1_1( 16)='1' OR D0F_temp_lv1_1( 17)='1' OR D0F_temp_lv1_1( 18)='1' OR D0F_temp_lv1_1( 19)='1' )then
        D0F_temp_lv2_1(  4)<='1';
        else
        D0F_temp_lv2_1(  4)<='0';
        end if;
        if(D0F_temp_lv1_1( 20)='1' OR D0F_temp_lv1_1( 21)='1' OR D0F_temp_lv1_1( 22)='1' OR D0F_temp_lv1_1( 23)='1' )then
        D0F_temp_lv2_1(  5)<='1';
        else
        D0F_temp_lv2_1(  5)<='0';
        end if;
        if(D0F_temp_lv1_1( 24)='1' OR D0F_temp_lv1_1( 25)='1' OR D0F_temp_lv1_1( 26)='1' OR D0F_temp_lv1_1( 27)='1' )then
        D0F_temp_lv2_1(  6)<='1';
        else
        D0F_temp_lv2_1(  6)<='0';
        end if;
        if(D0F_temp_lv1_1( 28)='1' OR D0F_temp_lv1_1( 29)='1' OR D0F_temp_lv1_1( 30)='1' OR D0F_temp_lv1_1( 31)='1' )then
        D0F_temp_lv2_1(  7)<='1';
        else
        D0F_temp_lv2_1(  7)<='0';
        end if;
        if(D0F_temp_lv1_1( 32)='1' OR D0F_temp_lv1_1( 33)='1' OR D0F_temp_lv1_1( 34)='1' OR D0F_temp_lv1_1( 35)='1' )then
        D0F_temp_lv2_1(  8)<='1';
        else
        D0F_temp_lv2_1(  8)<='0';
        end if;
        if(D0F_temp_lv1_1( 36)='1' OR D0F_temp_lv1_1( 37)='1' OR D0F_temp_lv1_1( 38)='1' OR D0F_temp_lv1_1( 39)='1' )then
        D0F_temp_lv2_1(  9)<='1';
        else
        D0F_temp_lv2_1(  9)<='0';
        end if;
        if(D0F_temp_lv1_1( 40)='1' OR D0F_temp_lv1_1( 41)='1' OR D0F_temp_lv1_1( 42)='1' OR D0F_temp_lv1_1( 43)='1' )then
        D0F_temp_lv2_1( 10)<='1';
        else
        D0F_temp_lv2_1( 10)<='0';
        end if;
        if(D0F_temp_lv1_1( 44)='1' )then
        D0F_temp_lv2_1( 11)<='1';
        else
        D0F_temp_lv2_1( 11)<='0';
        end if;
        if(D0F_temp_lv1_2(  0)='1' OR D0F_temp_lv1_2(  1)='1' OR D0F_temp_lv1_2(  2)='1' OR D0F_temp_lv1_2(  3)='1' )then
        D0F_temp_lv2_2(  0)<='1';
        else
        D0F_temp_lv2_2(  0)<='0';
        end if;
        if(D0F_temp_lv1_2(  4)='1' OR D0F_temp_lv1_2(  5)='1' OR D0F_temp_lv1_2(  6)='1' OR D0F_temp_lv1_2(  7)='1' )then
        D0F_temp_lv2_2(  1)<='1';
        else
        D0F_temp_lv2_2(  1)<='0';
        end if;
        if(D0F_temp_lv1_2(  8)='1' OR D0F_temp_lv1_2(  9)='1' OR D0F_temp_lv1_2( 10)='1' OR D0F_temp_lv1_2( 11)='1' )then
        D0F_temp_lv2_2(  2)<='1';
        else
        D0F_temp_lv2_2(  2)<='0';
        end if;
        if(D0F_temp_lv1_2( 12)='1' OR D0F_temp_lv1_2( 13)='1' OR D0F_temp_lv1_2( 14)='1' OR D0F_temp_lv1_2( 15)='1' )then
        D0F_temp_lv2_2(  3)<='1';
        else
        D0F_temp_lv2_2(  3)<='0';
        end if;
        if(D0F_temp_lv1_2( 16)='1' OR D0F_temp_lv1_2( 17)='1' OR D0F_temp_lv1_2( 18)='1' OR D0F_temp_lv1_2( 19)='1' )then
        D0F_temp_lv2_2(  4)<='1';
        else
        D0F_temp_lv2_2(  4)<='0';
        end if;
        if(D0F_temp_lv1_2( 20)='1' OR D0F_temp_lv1_2( 21)='1' OR D0F_temp_lv1_2( 22)='1' OR D0F_temp_lv1_2( 23)='1' )then
        D0F_temp_lv2_2(  5)<='1';
        else
        D0F_temp_lv2_2(  5)<='0';
        end if;
        if(D0F_temp_lv1_2( 24)='1' OR D0F_temp_lv1_2( 25)='1' OR D0F_temp_lv1_2( 26)='1' OR D0F_temp_lv1_2( 27)='1' )then
        D0F_temp_lv2_2(  6)<='1';
        else
        D0F_temp_lv2_2(  6)<='0';
        end if;
        if(D0F_temp_lv1_2( 28)='1' OR D0F_temp_lv1_2( 29)='1' OR D0F_temp_lv1_2( 30)='1' OR D0F_temp_lv1_2( 31)='1' )then
        D0F_temp_lv2_2(  7)<='1';
        else
        D0F_temp_lv2_2(  7)<='0';
        end if;
        if(D0F_temp_lv1_2( 32)='1' OR D0F_temp_lv1_2( 33)='1' OR D0F_temp_lv1_2( 34)='1' OR D0F_temp_lv1_2( 35)='1' )then
        D0F_temp_lv2_2(  8)<='1';
        else
        D0F_temp_lv2_2(  8)<='0';
        end if;
        if(D0F_temp_lv1_2( 36)='1' OR D0F_temp_lv1_2( 37)='1' OR D0F_temp_lv1_2( 38)='1' OR D0F_temp_lv1_2( 39)='1' )then
        D0F_temp_lv2_2(  9)<='1';
        else
        D0F_temp_lv2_2(  9)<='0';
        end if;
        if(D0F_temp_lv1_2( 40)='1' OR D0F_temp_lv1_2( 41)='1' OR D0F_temp_lv1_2( 42)='1' )then
        D0F_temp_lv2_2( 10)<='1';
        else
        D0F_temp_lv2_2( 10)<='0';
        end if;
        if(D0F_temp_lv1_3(  0)='1' OR D0F_temp_lv1_3(  1)='1' OR D0F_temp_lv1_3(  2)='1' OR D0F_temp_lv1_3(  3)='1' )then
        D0F_temp_lv2_3(  0)<='1';
        else
        D0F_temp_lv2_3(  0)<='0';
        end if;
        if(D0F_temp_lv1_3(  4)='1' OR D0F_temp_lv1_3(  5)='1' OR D0F_temp_lv1_3(  6)='1' OR D0F_temp_lv1_3(  7)='1' )then
        D0F_temp_lv2_3(  1)<='1';
        else
        D0F_temp_lv2_3(  1)<='0';
        end if;
        if(D0F_temp_lv1_3(  8)='1' OR D0F_temp_lv1_3(  9)='1' OR D0F_temp_lv1_3( 10)='1' OR D0F_temp_lv1_3( 11)='1' )then
        D0F_temp_lv2_3(  2)<='1';
        else
        D0F_temp_lv2_3(  2)<='0';
        end if;
        if(D0F_temp_lv1_3( 12)='1' OR D0F_temp_lv1_3( 13)='1' OR D0F_temp_lv1_3( 14)='1' OR D0F_temp_lv1_3( 15)='1' )then
        D0F_temp_lv2_3(  3)<='1';
        else
        D0F_temp_lv2_3(  3)<='0';
        end if;
        if(D0F_temp_lv1_3( 16)='1' OR D0F_temp_lv1_3( 17)='1' OR D0F_temp_lv1_3( 18)='1' OR D0F_temp_lv1_3( 19)='1' )then
        D0F_temp_lv2_3(  4)<='1';
        else
        D0F_temp_lv2_3(  4)<='0';
        end if;
        if(D0F_temp_lv1_3( 20)='1' OR D0F_temp_lv1_3( 21)='1' OR D0F_temp_lv1_3( 22)='1' OR D0F_temp_lv1_3( 23)='1' )then
        D0F_temp_lv2_3(  5)<='1';
        else
        D0F_temp_lv2_3(  5)<='0';
        end if;
        if(D0F_temp_lv1_3( 24)='1' OR D0F_temp_lv1_3( 25)='1' OR D0F_temp_lv1_3( 26)='1' OR D0F_temp_lv1_3( 27)='1' )then
        D0F_temp_lv2_3(  6)<='1';
        else
        D0F_temp_lv2_3(  6)<='0';
        end if;
        if(D0F_temp_lv1_3( 28)='1' OR D0F_temp_lv1_3( 29)='1' OR D0F_temp_lv1_3( 30)='1' OR D0F_temp_lv1_3( 31)='1' )then
        D0F_temp_lv2_3(  7)<='1';
        else
        D0F_temp_lv2_3(  7)<='0';
        end if;
        if(D0F_temp_lv1_3( 32)='1' OR D0F_temp_lv1_3( 33)='1' OR D0F_temp_lv1_3( 34)='1' OR D0F_temp_lv1_3( 35)='1' )then
        D0F_temp_lv2_3(  8)<='1';
        else
        D0F_temp_lv2_3(  8)<='0';
        end if;
        if(D0F_temp_lv1_3( 36)='1' OR D0F_temp_lv1_3( 37)='1' )then
        D0F_temp_lv2_3(  9)<='1';
        else
        D0F_temp_lv2_3(  9)<='0';
        end if;
        if(D0F_temp_lv1_4(  0)='1' OR D0F_temp_lv1_4(  1)='1' OR D0F_temp_lv1_4(  2)='1' OR D0F_temp_lv1_4(  3)='1' )then
        D0F_temp_lv2_4(  0)<='1';
        else
        D0F_temp_lv2_4(  0)<='0';
        end if;
        if(D0F_temp_lv1_4(  4)='1' OR D0F_temp_lv1_4(  5)='1' OR D0F_temp_lv1_4(  6)='1' OR D0F_temp_lv1_4(  7)='1' )then
        D0F_temp_lv2_4(  1)<='1';
        else
        D0F_temp_lv2_4(  1)<='0';
        end if;
        if(D0F_temp_lv1_4(  8)='1' OR D0F_temp_lv1_4(  9)='1' OR D0F_temp_lv1_4( 10)='1' OR D0F_temp_lv1_4( 11)='1' )then
        D0F_temp_lv2_4(  2)<='1';
        else
        D0F_temp_lv2_4(  2)<='0';
        end if;
        if(D0F_temp_lv1_4( 12)='1' OR D0F_temp_lv1_4( 13)='1' OR D0F_temp_lv1_4( 14)='1' OR D0F_temp_lv1_4( 15)='1' )then
        D0F_temp_lv2_4(  3)<='1';
        else
        D0F_temp_lv2_4(  3)<='0';
        end if;
        if(D0F_temp_lv1_4( 16)='1' OR D0F_temp_lv1_4( 17)='1' OR D0F_temp_lv1_4( 18)='1' OR D0F_temp_lv1_4( 19)='1' )then
        D0F_temp_lv2_4(  4)<='1';
        else
        D0F_temp_lv2_4(  4)<='0';
        end if;
        if(D0F_temp_lv1_4( 20)='1' OR D0F_temp_lv1_4( 21)='1' OR D0F_temp_lv1_4( 22)='1' OR D0F_temp_lv1_4( 23)='1' )then
        D0F_temp_lv2_4(  5)<='1';
        else
        D0F_temp_lv2_4(  5)<='0';
        end if;
        if(D0F_temp_lv1_4( 24)='1' OR D0F_temp_lv1_4( 25)='1' OR D0F_temp_lv1_4( 26)='1' OR D0F_temp_lv1_4( 27)='1' )then
        D0F_temp_lv2_4(  6)<='1';
        else
        D0F_temp_lv2_4(  6)<='0';
        end if;
        if(D0F_temp_lv1_4( 28)='1' OR D0F_temp_lv1_4( 29)='1' OR D0F_temp_lv1_4( 30)='1' OR D0F_temp_lv1_4( 31)='1' )then
        D0F_temp_lv2_4(  7)<='1';
        else
        D0F_temp_lv2_4(  7)<='0';
        end if;
        if(D0F_temp_lv1_5(  0)='1' OR D0F_temp_lv1_5(  1)='1' OR D0F_temp_lv1_5(  2)='1' OR D0F_temp_lv1_5(  3)='1' )then
        D0F_temp_lv2_5(  0)<='1';
        else
        D0F_temp_lv2_5(  0)<='0';
        end if;
        if(D0F_temp_lv1_5(  4)='1' OR D0F_temp_lv1_5(  5)='1' OR D0F_temp_lv1_5(  6)='1' OR D0F_temp_lv1_5(  7)='1' )then
        D0F_temp_lv2_5(  1)<='1';
        else
        D0F_temp_lv2_5(  1)<='0';
        end if;
        if(D0F_temp_lv1_5(  8)='1' OR D0F_temp_lv1_5(  9)='1' OR D0F_temp_lv1_5( 10)='1' OR D0F_temp_lv1_5( 11)='1' )then
        D0F_temp_lv2_5(  2)<='1';
        else
        D0F_temp_lv2_5(  2)<='0';
        end if;
        if(D0F_temp_lv1_5( 12)='1' OR D0F_temp_lv1_5( 13)='1' OR D0F_temp_lv1_5( 14)='1' OR D0F_temp_lv1_5( 15)='1' )then
        D0F_temp_lv2_5(  3)<='1';
        else
        D0F_temp_lv2_5(  3)<='0';
        end if;
        if(D0F_temp_lv1_5( 16)='1' OR D0F_temp_lv1_5( 17)='1' OR D0F_temp_lv1_5( 18)='1' OR D0F_temp_lv1_5( 19)='1' )then
        D0F_temp_lv2_5(  4)<='1';
        else
        D0F_temp_lv2_5(  4)<='0';
        end if;
        if(D0F_temp_lv1_5( 20)='1' OR D0F_temp_lv1_5( 21)='1' OR D0F_temp_lv1_5( 22)='1' OR D0F_temp_lv1_5( 23)='1' )then
        D0F_temp_lv2_5(  5)<='1';
        else
        D0F_temp_lv2_5(  5)<='0';
        end if;
        if(D0F_temp_lv1_5( 24)='1' OR D0F_temp_lv1_5( 25)='1' OR D0F_temp_lv1_5( 26)='1' OR D0F_temp_lv1_5( 27)='1' )then
        D0F_temp_lv2_5(  6)<='1';
        else
        D0F_temp_lv2_5(  6)<='0';
        end if;
        if(D0F_temp_lv1_5( 28)='1' OR D0F_temp_lv1_5( 29)='1' OR D0F_temp_lv1_5( 30)='1' OR D0F_temp_lv1_5( 31)='1' )then
        D0F_temp_lv2_5(  7)<='1';
        else
        D0F_temp_lv2_5(  7)<='0';
        end if;
        if(D0F_temp_lv1_5( 32)='1' OR D0F_temp_lv1_5( 33)='1' OR D0F_temp_lv1_5( 34)='1' OR D0F_temp_lv1_5( 35)='1' )then
        D0F_temp_lv2_5(  8)<='1';
        else
        D0F_temp_lv2_5(  8)<='0';
        end if;
        if(D0F_temp_lv1_5( 36)='1' OR D0F_temp_lv1_5( 37)='1' OR D0F_temp_lv1_5( 38)='1' OR D0F_temp_lv1_5( 39)='1' )then
        D0F_temp_lv2_5(  9)<='1';
        else
        D0F_temp_lv2_5(  9)<='0';
        end if;
        if(D0F_temp_lv1_5( 40)='1' OR D0F_temp_lv1_5( 41)='1' OR D0F_temp_lv1_5( 42)='1' OR D0F_temp_lv1_5( 43)='1' )then
        D0F_temp_lv2_5( 10)<='1';
        else
        D0F_temp_lv2_5( 10)<='0';
        end if;
        if(D0F_temp_lv1_6(  0)='1' OR D0F_temp_lv1_6(  1)='1' OR D0F_temp_lv1_6(  2)='1' OR D0F_temp_lv1_6(  3)='1' )then
        D0F_temp_lv2_6(  0)<='1';
        else
        D0F_temp_lv2_6(  0)<='0';
        end if;
        if(D0F_temp_lv1_6(  4)='1' OR D0F_temp_lv1_6(  5)='1' OR D0F_temp_lv1_6(  6)='1' OR D0F_temp_lv1_6(  7)='1' )then
        D0F_temp_lv2_6(  1)<='1';
        else
        D0F_temp_lv2_6(  1)<='0';
        end if;
        if(D0F_temp_lv1_6(  8)='1' OR D0F_temp_lv1_6(  9)='1' OR D0F_temp_lv1_6( 10)='1' OR D0F_temp_lv1_6( 11)='1' )then
        D0F_temp_lv2_6(  2)<='1';
        else
        D0F_temp_lv2_6(  2)<='0';
        end if;
        if(D0F_temp_lv1_6( 12)='1' OR D0F_temp_lv1_6( 13)='1' OR D0F_temp_lv1_6( 14)='1' OR D0F_temp_lv1_6( 15)='1' )then
        D0F_temp_lv2_6(  3)<='1';
        else
        D0F_temp_lv2_6(  3)<='0';
        end if;
        if(D0F_temp_lv1_6( 16)='1' OR D0F_temp_lv1_6( 17)='1' OR D0F_temp_lv1_6( 18)='1' OR D0F_temp_lv1_6( 19)='1' )then
        D0F_temp_lv2_6(  4)<='1';
        else
        D0F_temp_lv2_6(  4)<='0';
        end if;
        if(D0F_temp_lv1_6( 20)='1' OR D0F_temp_lv1_6( 21)='1' OR D0F_temp_lv1_6( 22)='1' OR D0F_temp_lv1_6( 23)='1' )then
        D0F_temp_lv2_6(  5)<='1';
        else
        D0F_temp_lv2_6(  5)<='0';
        end if;
        if(D0F_temp_lv1_6( 24)='1' OR D0F_temp_lv1_6( 25)='1' OR D0F_temp_lv1_6( 26)='1' OR D0F_temp_lv1_6( 27)='1' )then
        D0F_temp_lv2_6(  6)<='1';
        else
        D0F_temp_lv2_6(  6)<='0';
        end if;
        if(D0F_temp_lv1_6( 28)='1' OR D0F_temp_lv1_6( 29)='1' OR D0F_temp_lv1_6( 30)='1' OR D0F_temp_lv1_6( 31)='1' )then
        D0F_temp_lv2_6(  7)<='1';
        else
        D0F_temp_lv2_6(  7)<='0';
        end if;
        if(D0F_temp_lv1_6( 32)='1' OR D0F_temp_lv1_6( 33)='1' OR D0F_temp_lv1_6( 34)='1' OR D0F_temp_lv1_6( 35)='1' )then
        D0F_temp_lv2_6(  8)<='1';
        else
        D0F_temp_lv2_6(  8)<='0';
        end if;
        if(D0F_temp_lv1_6( 36)='1' OR D0F_temp_lv1_6( 37)='1' OR D0F_temp_lv1_6( 38)='1' )then
        D0F_temp_lv2_6(  9)<='1';
        else
        D0F_temp_lv2_6(  9)<='0';
        end if;
        if(D0F_temp_lv1_7(  0)='1' OR D0F_temp_lv1_7(  1)='1' OR D0F_temp_lv1_7(  2)='1' OR D0F_temp_lv1_7(  3)='1' )then
        D0F_temp_lv2_7(  0)<='1';
        else
        D0F_temp_lv2_7(  0)<='0';
        end if;
        if(D0F_temp_lv1_7(  4)='1' OR D0F_temp_lv1_7(  5)='1' OR D0F_temp_lv1_7(  6)='1' OR D0F_temp_lv1_7(  7)='1' )then
        D0F_temp_lv2_7(  1)<='1';
        else
        D0F_temp_lv2_7(  1)<='0';
        end if;
        if(D0F_temp_lv1_7(  8)='1' OR D0F_temp_lv1_7(  9)='1' OR D0F_temp_lv1_7( 10)='1' OR D0F_temp_lv1_7( 11)='1' )then
        D0F_temp_lv2_7(  2)<='1';
        else
        D0F_temp_lv2_7(  2)<='0';
        end if;
        if(D0F_temp_lv1_7( 12)='1' OR D0F_temp_lv1_7( 13)='1' OR D0F_temp_lv1_7( 14)='1' OR D0F_temp_lv1_7( 15)='1' )then
        D0F_temp_lv2_7(  3)<='1';
        else
        D0F_temp_lv2_7(  3)<='0';
        end if;
        if(D0F_temp_lv1_7( 16)='1' OR D0F_temp_lv1_7( 17)='1' OR D0F_temp_lv1_7( 18)='1' OR D0F_temp_lv1_7( 19)='1' )then
        D0F_temp_lv2_7(  4)<='1';
        else
        D0F_temp_lv2_7(  4)<='0';
        end if;
        if(D0F_temp_lv1_7( 20)='1' OR D0F_temp_lv1_7( 21)='1' OR D0F_temp_lv1_7( 22)='1' OR D0F_temp_lv1_7( 23)='1' )then
        D0F_temp_lv2_7(  5)<='1';
        else
        D0F_temp_lv2_7(  5)<='0';
        end if;
        if(D0F_temp_lv1_7( 24)='1' OR D0F_temp_lv1_7( 25)='1' OR D0F_temp_lv1_7( 26)='1' OR D0F_temp_lv1_7( 27)='1' )then
        D0F_temp_lv2_7(  6)<='1';
        else
        D0F_temp_lv2_7(  6)<='0';
        end if;
        if(D0F_temp_lv1_7( 28)='1' OR D0F_temp_lv1_7( 29)='1' OR D0F_temp_lv1_7( 30)='1' OR D0F_temp_lv1_7( 31)='1' )then
        D0F_temp_lv2_7(  7)<='1';
        else
        D0F_temp_lv2_7(  7)<='0';
        end if;
        if(D0F_temp_lv1_7( 32)='1' OR D0F_temp_lv1_7( 33)='1' OR D0F_temp_lv1_7( 34)='1' OR D0F_temp_lv1_7( 35)='1' )then
        D0F_temp_lv2_7(  8)<='1';
        else
        D0F_temp_lv2_7(  8)<='0';
        end if;
        if(D0F_temp_lv1_7( 36)='1' OR D0F_temp_lv1_7( 37)='1' )then
        D0F_temp_lv2_7(  9)<='1';
        else
        D0F_temp_lv2_7(  9)<='0';
        end if;
        if(D1F_temp_lv1_0(  0)='1' AND D1F_temp_lv1_0(  1)='1' )then
        D1F_temp_lv2_0(  0)<='1';
        else
        D1F_temp_lv2_0(  0)<='0';
        end if;
        if(D1F_temp_lv1_0(  2)='1' AND D1F_temp_lv1_0(  3)='1' )then
        D1F_temp_lv2_0(  1)<='1';
        else
        D1F_temp_lv2_0(  1)<='0';
        end if;
        if(D1F_temp_lv1_0(  4)='1' OR D1F_temp_lv1_0(  5)='1' OR D1F_temp_lv1_0(  6)='1' OR D1F_temp_lv1_0(  7)='1' )then
        D1F_temp_lv2_0(  2)<='1';
        else
        D1F_temp_lv2_0(  2)<='0';
        end if;
        if(D1F_temp_lv1_0(  8)='1' OR D1F_temp_lv1_0(  9)='1' OR D1F_temp_lv1_0( 10)='1' OR D1F_temp_lv1_0( 11)='1' )then
        D1F_temp_lv2_0(  3)<='1';
        else
        D1F_temp_lv2_0(  3)<='0';
        end if;
        if(D1F_temp_lv1_0( 12)='1' OR D1F_temp_lv1_0( 13)='1' OR D1F_temp_lv1_0( 14)='1' OR D1F_temp_lv1_0( 15)='1' )then
        D1F_temp_lv2_0(  4)<='1';
        else
        D1F_temp_lv2_0(  4)<='0';
        end if;
        if(D1F_temp_lv1_0( 16)='1' OR D1F_temp_lv1_0( 17)='1' )then
        D1F_temp_lv2_0(  5)<='1';
        else
        D1F_temp_lv2_0(  5)<='0';
        end if;
        if(D1F_temp_lv1_1(  0)='1' OR D1F_temp_lv1_1(  1)='1' )then
        D1F_temp_lv2_1(  0)<='1';
        else
        D1F_temp_lv2_1(  0)<='0';
        end if;
        if(D1F_temp_lv1_1(  2)='1' AND D1F_temp_lv1_1(  3)='1' AND D1F_temp_lv1_1(  4)='1' )then
        D1F_temp_lv2_1(  1)<='1';
        else
        D1F_temp_lv2_1(  1)<='0';
        end if;
        if(D1F_temp_lv1_1(  5)='1' OR D1F_temp_lv1_1(  6)='1' )then
        D1F_temp_lv2_1(  2)<='1';
        else
        D1F_temp_lv2_1(  2)<='0';
        end if;
        if(D1F_temp_lv1_1(  7)='1' AND D1F_temp_lv1_1(  8)='1' AND D1F_temp_lv1_1(  9)='1' )then
        D1F_temp_lv2_1(  3)<='1';
        else
        D1F_temp_lv2_1(  3)<='0';
        end if;
        if(D1F_temp_lv1_1( 10)='1' )then
        D1F_temp_lv2_1(  4)<='1';
        else
        D1F_temp_lv2_1(  4)<='0';
        end if;
        if(D1F_temp_lv1_1( 11)='1' AND D1F_temp_lv1_1( 12)='1' AND D1F_temp_lv1_1( 13)='1' )then
        D1F_temp_lv2_1(  5)<='1';
        else
        D1F_temp_lv2_1(  5)<='0';
        end if;
        if(D1F_temp_lv1_1( 14)='1' OR D1F_temp_lv1_1( 15)='1' OR D1F_temp_lv1_1( 16)='1' OR D1F_temp_lv1_1( 17)='1' )then
        D1F_temp_lv2_1(  6)<='1';
        else
        D1F_temp_lv2_1(  6)<='0';
        end if;
        if(D1F_temp_lv1_1( 18)='1' )then
        D1F_temp_lv2_1(  7)<='1';
        else
        D1F_temp_lv2_1(  7)<='0';
        end if;
        if(D1F_temp_lv1_1( 19)='1' AND D1F_temp_lv1_1( 20)='1' )then
        D1F_temp_lv2_1(  8)<='1';
        else
        D1F_temp_lv2_1(  8)<='0';
        end if;
        if(D1F_temp_lv1_1( 21)='1' AND D1F_temp_lv1_1( 22)='1' )then
        D1F_temp_lv2_1(  9)<='1';
        else
        D1F_temp_lv2_1(  9)<='0';
        end if;
        if(D1F_temp_lv1_1( 23)='1' OR D1F_temp_lv1_1( 24)='1' OR D1F_temp_lv1_1( 25)='1' )then
        D1F_temp_lv2_1( 10)<='1';
        else
        D1F_temp_lv2_1( 10)<='0';
        end if;
        if(D1F_temp_lv1_1( 26)='1' AND D1F_temp_lv1_1( 27)='1' )then
        D1F_temp_lv2_1( 11)<='1';
        else
        D1F_temp_lv2_1( 11)<='0';
        end if;
        if(D1F_temp_lv1_1( 28)='1' OR D1F_temp_lv1_1( 29)='1' )then
        D1F_temp_lv2_1( 12)<='1';
        else
        D1F_temp_lv2_1( 12)<='0';
        end if;
        if(D1F_temp_lv1_1( 30)='1' AND D1F_temp_lv1_1( 31)='1' )then
        D1F_temp_lv2_1( 13)<='1';
        else
        D1F_temp_lv2_1( 13)<='0';
        end if;
        if(D1F_temp_lv1_1( 32)='1' )then
        D1F_temp_lv2_1( 14)<='1';
        else
        D1F_temp_lv2_1( 14)<='0';
        end if;
        if(D1F_temp_lv1_1( 33)='1' AND D1F_temp_lv1_1( 34)='1' )then
        D1F_temp_lv2_1( 15)<='1';
        else
        D1F_temp_lv2_1( 15)<='0';
        end if;
        if(D1F_temp_lv1_1( 35)='1' AND D1F_temp_lv1_1( 36)='1' )then
        D1F_temp_lv2_1( 16)<='1';
        else
        D1F_temp_lv2_1( 16)<='0';
        end if;
        if(D1F_temp_lv1_1( 37)='1' AND D1F_temp_lv1_1( 38)='1' )then
        D1F_temp_lv2_1( 17)<='1';
        else
        D1F_temp_lv2_1( 17)<='0';
        end if;
        if(D1F_temp_lv1_1( 39)='1' OR D1F_temp_lv1_1( 40)='1' OR D1F_temp_lv1_1( 41)='1' OR D1F_temp_lv1_1( 42)='1' )then
        D1F_temp_lv2_1( 18)<='1';
        else
        D1F_temp_lv2_1( 18)<='0';
        end if;
        if(D1F_temp_lv1_1( 43)='1' OR D1F_temp_lv1_1( 44)='1' OR D1F_temp_lv1_1( 45)='1' )then
        D1F_temp_lv2_1( 19)<='1';
        else
        D1F_temp_lv2_1( 19)<='0';
        end if;
        if(D1F_temp_lv1_2(  0)='1' OR D1F_temp_lv1_2(  1)='1' )then
        D1F_temp_lv2_2(  0)<='1';
        else
        D1F_temp_lv2_2(  0)<='0';
        end if;
        if(D1F_temp_lv1_2(  2)='1' AND D1F_temp_lv1_2(  3)='1' AND D1F_temp_lv1_2(  4)='1' )then
        D1F_temp_lv2_2(  1)<='1';
        else
        D1F_temp_lv2_2(  1)<='0';
        end if;
        if(D1F_temp_lv1_2(  5)='1' AND D1F_temp_lv1_2(  6)='1' AND D1F_temp_lv1_2(  7)='1' AND D1F_temp_lv1_2(  8)='1' )then
        D1F_temp_lv2_2(  2)<='1';
        else
        D1F_temp_lv2_2(  2)<='0';
        end if;
        if(D1F_temp_lv1_2(  9)='1' OR D1F_temp_lv1_2( 10)='1' )then
        D1F_temp_lv2_2(  3)<='1';
        else
        D1F_temp_lv2_2(  3)<='0';
        end if;
        if(D1F_temp_lv1_2( 11)='1' AND D1F_temp_lv1_2( 12)='1' )then
        D1F_temp_lv2_2(  4)<='1';
        else
        D1F_temp_lv2_2(  4)<='0';
        end if;
        if(D1F_temp_lv1_2( 13)='1' AND D1F_temp_lv1_2( 14)='1' )then
        D1F_temp_lv2_2(  5)<='1';
        else
        D1F_temp_lv2_2(  5)<='0';
        end if;
        if(D1F_temp_lv1_2( 15)='1' OR D1F_temp_lv1_2( 16)='1' OR D1F_temp_lv1_2( 17)='1' OR D1F_temp_lv1_2( 18)='1' )then
        D1F_temp_lv2_2(  6)<='1';
        else
        D1F_temp_lv2_2(  6)<='0';
        end if;
        if(D1F_temp_lv1_2( 19)='1' AND D1F_temp_lv1_2( 20)='1' )then
        D1F_temp_lv2_2(  7)<='1';
        else
        D1F_temp_lv2_2(  7)<='0';
        end if;
        if(D1F_temp_lv1_2( 21)='1' AND D1F_temp_lv1_2( 22)='1' )then
        D1F_temp_lv2_2(  8)<='1';
        else
        D1F_temp_lv2_2(  8)<='0';
        end if;
        if(D1F_temp_lv1_2( 23)='1' )then
        D1F_temp_lv2_2(  9)<='1';
        else
        D1F_temp_lv2_2(  9)<='0';
        end if;
        if(D1F_temp_lv1_2( 24)='1' AND D1F_temp_lv1_2( 25)='1' )then
        D1F_temp_lv2_2( 10)<='1';
        else
        D1F_temp_lv2_2( 10)<='0';
        end if;
        if(D1F_temp_lv1_2( 26)='1' AND D1F_temp_lv1_2( 27)='1' )then
        D1F_temp_lv2_2( 11)<='1';
        else
        D1F_temp_lv2_2( 11)<='0';
        end if;
        if(D1F_temp_lv1_2( 28)='1' )then
        D1F_temp_lv2_2( 12)<='1';
        else
        D1F_temp_lv2_2( 12)<='0';
        end if;
        if(D1F_temp_lv1_2( 29)='1' AND D1F_temp_lv1_2( 30)='1' )then
        D1F_temp_lv2_2( 13)<='1';
        else
        D1F_temp_lv2_2( 13)<='0';
        end if;
        if(D1F_temp_lv1_2( 31)='1' )then
        D1F_temp_lv2_2( 14)<='1';
        else
        D1F_temp_lv2_2( 14)<='0';
        end if;
        if(D1F_temp_lv1_2( 32)='1' AND D1F_temp_lv1_2( 33)='1' )then
        D1F_temp_lv2_2( 15)<='1';
        else
        D1F_temp_lv2_2( 15)<='0';
        end if;
        if(D1F_temp_lv1_2( 34)='1' )then
        D1F_temp_lv2_2( 16)<='1';
        else
        D1F_temp_lv2_2( 16)<='0';
        end if;
        if(D1F_temp_lv1_2( 35)='1' AND D1F_temp_lv1_2( 36)='1' )then
        D1F_temp_lv2_2( 17)<='1';
        else
        D1F_temp_lv2_2( 17)<='0';
        end if;
        if(D1F_temp_lv1_2( 37)='1' )then
        D1F_temp_lv2_2( 18)<='1';
        else
        D1F_temp_lv2_2( 18)<='0';
        end if;
        if(D1F_temp_lv1_2( 38)='1' AND D1F_temp_lv1_2( 39)='1' )then
        D1F_temp_lv2_2( 19)<='1';
        else
        D1F_temp_lv2_2( 19)<='0';
        end if;
        if(D1F_temp_lv1_2( 40)='1' )then
        D1F_temp_lv2_2( 20)<='1';
        else
        D1F_temp_lv2_2( 20)<='0';
        end if;
        if(D1F_temp_lv1_2( 41)='1' AND D1F_temp_lv1_2( 42)='1' )then
        D1F_temp_lv2_2( 21)<='1';
        else
        D1F_temp_lv2_2( 21)<='0';
        end if;
        if(D1F_temp_lv1_2( 43)='1' OR D1F_temp_lv1_2( 44)='1' )then
        D1F_temp_lv2_2( 22)<='1';
        else
        D1F_temp_lv2_2( 22)<='0';
        end if;
        if(D1F_temp_lv1_3(  0)='1' AND D1F_temp_lv1_3(  1)='1' AND D1F_temp_lv1_3(  2)='1' )then
        D1F_temp_lv2_3(  0)<='1';
        else
        D1F_temp_lv2_3(  0)<='0';
        end if;
        if(D1F_temp_lv1_3(  3)='1' AND D1F_temp_lv1_3(  4)='1' AND D1F_temp_lv1_3(  5)='1' AND D1F_temp_lv1_3(  6)='1' )then
        D1F_temp_lv2_3(  1)<='1';
        else
        D1F_temp_lv2_3(  1)<='0';
        end if;
        if(D1F_temp_lv1_3(  7)='1' AND D1F_temp_lv1_3(  8)='1' )then
        D1F_temp_lv2_3(  2)<='1';
        else
        D1F_temp_lv2_3(  2)<='0';
        end if;
        if(D1F_temp_lv1_3(  9)='1' AND D1F_temp_lv1_3( 10)='1' )then
        D1F_temp_lv2_3(  3)<='1';
        else
        D1F_temp_lv2_3(  3)<='0';
        end if;
        if(D1F_temp_lv1_3( 11)='1' AND D1F_temp_lv1_3( 12)='1' )then
        D1F_temp_lv2_3(  4)<='1';
        else
        D1F_temp_lv2_3(  4)<='0';
        end if;
        if(D1F_temp_lv1_3( 13)='1' OR D1F_temp_lv1_3( 14)='1' OR D1F_temp_lv1_3( 15)='1' OR D1F_temp_lv1_3( 16)='1' )then
        D1F_temp_lv2_3(  5)<='1';
        else
        D1F_temp_lv2_3(  5)<='0';
        end if;
        if(D1F_temp_lv1_3( 17)='1' AND D1F_temp_lv1_3( 18)='1' )then
        D1F_temp_lv2_3(  6)<='1';
        else
        D1F_temp_lv2_3(  6)<='0';
        end if;
        if(D1F_temp_lv1_3( 19)='1' )then
        D1F_temp_lv2_3(  7)<='1';
        else
        D1F_temp_lv2_3(  7)<='0';
        end if;
        if(D1F_temp_lv1_3( 20)='1' AND D1F_temp_lv1_3( 21)='1' )then
        D1F_temp_lv2_3(  8)<='1';
        else
        D1F_temp_lv2_3(  8)<='0';
        end if;
        if(D1F_temp_lv1_3( 22)='1' AND D1F_temp_lv1_3( 23)='1' )then
        D1F_temp_lv2_3(  9)<='1';
        else
        D1F_temp_lv2_3(  9)<='0';
        end if;
        if(D1F_temp_lv1_3( 24)='1' )then
        D1F_temp_lv2_3( 10)<='1';
        else
        D1F_temp_lv2_3( 10)<='0';
        end if;
        if(D1F_temp_lv1_3( 25)='1' AND D1F_temp_lv1_3( 26)='1' )then
        D1F_temp_lv2_3( 11)<='1';
        else
        D1F_temp_lv2_3( 11)<='0';
        end if;
        if(D1F_temp_lv1_3( 27)='1' )then
        D1F_temp_lv2_3( 12)<='1';
        else
        D1F_temp_lv2_3( 12)<='0';
        end if;
        if(D1F_temp_lv1_3( 28)='1' AND D1F_temp_lv1_3( 29)='1' )then
        D1F_temp_lv2_3( 13)<='1';
        else
        D1F_temp_lv2_3( 13)<='0';
        end if;
        if(D1F_temp_lv1_3( 30)='1' )then
        D1F_temp_lv2_3( 14)<='1';
        else
        D1F_temp_lv2_3( 14)<='0';
        end if;
        if(D1F_temp_lv1_3( 31)='1' AND D1F_temp_lv1_3( 32)='1' )then
        D1F_temp_lv2_3( 15)<='1';
        else
        D1F_temp_lv2_3( 15)<='0';
        end if;
        if(D1F_temp_lv1_3( 33)='1' )then
        D1F_temp_lv2_3( 16)<='1';
        else
        D1F_temp_lv2_3( 16)<='0';
        end if;
        if(D1F_temp_lv1_3( 34)='1' AND D1F_temp_lv1_3( 35)='1' )then
        D1F_temp_lv2_3( 17)<='1';
        else
        D1F_temp_lv2_3( 17)<='0';
        end if;
        if(D1F_temp_lv1_3( 36)='1' OR D1F_temp_lv1_3( 37)='1' )then
        D1F_temp_lv2_3( 18)<='1';
        else
        D1F_temp_lv2_3( 18)<='0';
        end if;
        if(D1F_temp_lv1_4(  0)='1' OR D1F_temp_lv1_4(  1)='1' OR D1F_temp_lv1_4(  2)='1' OR D1F_temp_lv1_4(  3)='1' )then
        D1F_temp_lv2_4(  0)<='1';
        else
        D1F_temp_lv2_4(  0)<='0';
        end if;
        if(D1F_temp_lv1_4(  4)='1' OR D1F_temp_lv1_4(  5)='1' OR D1F_temp_lv1_4(  6)='1' OR D1F_temp_lv1_4(  7)='1' )then
        D1F_temp_lv2_4(  1)<='1';
        else
        D1F_temp_lv2_4(  1)<='0';
        end if;
        if(D1F_temp_lv1_4(  8)='1' OR D1F_temp_lv1_4(  9)='1' )then
        D1F_temp_lv2_4(  2)<='1';
        else
        D1F_temp_lv2_4(  2)<='0';
        end if;
        if(D1F_temp_lv1_4( 10)='1' AND D1F_temp_lv1_4( 11)='1' )then
        D1F_temp_lv2_4(  3)<='1';
        else
        D1F_temp_lv2_4(  3)<='0';
        end if;
        if(D1F_temp_lv1_4( 12)='1' AND D1F_temp_lv1_4( 13)='1' )then
        D1F_temp_lv2_4(  4)<='1';
        else
        D1F_temp_lv2_4(  4)<='0';
        end if;
        if(D1F_temp_lv1_4( 14)='1' OR D1F_temp_lv1_4( 15)='1' )then
        D1F_temp_lv2_4(  5)<='1';
        else
        D1F_temp_lv2_4(  5)<='0';
        end if;
        if(D1F_temp_lv1_5(  0)='1' )then
        D1F_temp_lv2_5(  0)<='1';
        else
        D1F_temp_lv2_5(  0)<='0';
        end if;
        if(D1F_temp_lv1_5(  1)='1' AND D1F_temp_lv1_5(  2)='1' )then
        D1F_temp_lv2_5(  1)<='1';
        else
        D1F_temp_lv2_5(  1)<='0';
        end if;
        if(D1F_temp_lv1_5(  3)='1' AND D1F_temp_lv1_5(  4)='1' )then
        D1F_temp_lv2_5(  2)<='1';
        else
        D1F_temp_lv2_5(  2)<='0';
        end if;
        if(D1F_temp_lv1_5(  5)='1' AND D1F_temp_lv1_5(  6)='1' )then
        D1F_temp_lv2_5(  3)<='1';
        else
        D1F_temp_lv2_5(  3)<='0';
        end if;
        if(D1F_temp_lv1_5(  7)='1' AND D1F_temp_lv1_5(  8)='1' )then
        D1F_temp_lv2_5(  4)<='1';
        else
        D1F_temp_lv2_5(  4)<='0';
        end if;
        if(D1F_temp_lv1_5(  9)='1' OR D1F_temp_lv1_5( 10)='1' )then
        D1F_temp_lv2_5(  5)<='1';
        else
        D1F_temp_lv2_5(  5)<='0';
        end if;
        if(D1F_temp_lv1_5( 11)='1' AND D1F_temp_lv1_5( 12)='1' )then
        D1F_temp_lv2_5(  6)<='1';
        else
        D1F_temp_lv2_5(  6)<='0';
        end if;
        if(D1F_temp_lv1_5( 13)='1' AND D1F_temp_lv1_5( 14)='1' )then
        D1F_temp_lv2_5(  7)<='1';
        else
        D1F_temp_lv2_5(  7)<='0';
        end if;
        if(D1F_temp_lv1_5( 15)='1' AND D1F_temp_lv1_5( 16)='1' )then
        D1F_temp_lv2_5(  8)<='1';
        else
        D1F_temp_lv2_5(  8)<='0';
        end if;
        if(D1F_temp_lv1_5( 17)='1' )then
        D1F_temp_lv2_5(  9)<='1';
        else
        D1F_temp_lv2_5(  9)<='0';
        end if;
        if(D1F_temp_lv1_5( 18)='1' AND D1F_temp_lv1_5( 19)='1' )then
        D1F_temp_lv2_5( 10)<='1';
        else
        D1F_temp_lv2_5( 10)<='0';
        end if;
        if(D1F_temp_lv1_5( 20)='1' )then
        D1F_temp_lv2_5( 11)<='1';
        else
        D1F_temp_lv2_5( 11)<='0';
        end if;
        if(D1F_temp_lv1_5( 21)='1' AND D1F_temp_lv1_5( 22)='1' )then
        D1F_temp_lv2_5( 12)<='1';
        else
        D1F_temp_lv2_5( 12)<='0';
        end if;
        if(D1F_temp_lv1_5( 23)='1' OR D1F_temp_lv1_5( 24)='1' OR D1F_temp_lv1_5( 25)='1' OR D1F_temp_lv1_5( 26)='1' )then
        D1F_temp_lv2_5( 13)<='1';
        else
        D1F_temp_lv2_5( 13)<='0';
        end if;
        if(D1F_temp_lv1_5( 27)='1' )then
        D1F_temp_lv2_5( 14)<='1';
        else
        D1F_temp_lv2_5( 14)<='0';
        end if;
        if(D1F_temp_lv1_5( 28)='1' AND D1F_temp_lv1_5( 29)='1' AND D1F_temp_lv1_5( 30)='1' )then
        D1F_temp_lv2_5( 15)<='1';
        else
        D1F_temp_lv2_5( 15)<='0';
        end if;
        if(D1F_temp_lv1_5( 31)='1' AND D1F_temp_lv1_5( 32)='1' )then
        D1F_temp_lv2_5( 16)<='1';
        else
        D1F_temp_lv2_5( 16)<='0';
        end if;
        if(D1F_temp_lv1_5( 33)='1' )then
        D1F_temp_lv2_5( 17)<='1';
        else
        D1F_temp_lv2_5( 17)<='0';
        end if;
        if(D1F_temp_lv1_5( 34)='1' AND D1F_temp_lv1_5( 35)='1' AND D1F_temp_lv1_5( 36)='1' )then
        D1F_temp_lv2_5( 18)<='1';
        else
        D1F_temp_lv2_5( 18)<='0';
        end if;
        if(D1F_temp_lv1_5( 37)='1' )then
        D1F_temp_lv2_5( 19)<='1';
        else
        D1F_temp_lv2_5( 19)<='0';
        end if;
        if(D1F_temp_lv1_5( 38)='1' AND D1F_temp_lv1_5( 39)='1' AND D1F_temp_lv1_5( 40)='1' )then
        D1F_temp_lv2_5( 20)<='1';
        else
        D1F_temp_lv2_5( 20)<='0';
        end if;
        if(D1F_temp_lv1_5( 41)='1' AND D1F_temp_lv1_5( 42)='1' )then
        D1F_temp_lv2_5( 21)<='1';
        else
        D1F_temp_lv2_5( 21)<='0';
        end if;
        if(D1F_temp_lv1_5( 43)='1' )then
        D1F_temp_lv2_5( 22)<='1';
        else
        D1F_temp_lv2_5( 22)<='0';
        end if;
        if(D1F_temp_lv1_6(  0)='1' AND D1F_temp_lv1_6(  1)='1' )then
        D1F_temp_lv2_6(  0)<='1';
        else
        D1F_temp_lv2_6(  0)<='0';
        end if;
        if(D1F_temp_lv1_6(  2)='1' )then
        D1F_temp_lv2_6(  1)<='1';
        else
        D1F_temp_lv2_6(  1)<='0';
        end if;
        if(D1F_temp_lv1_6(  3)='1' AND D1F_temp_lv1_6(  4)='1' )then
        D1F_temp_lv2_6(  2)<='1';
        else
        D1F_temp_lv2_6(  2)<='0';
        end if;
        if(D1F_temp_lv1_6(  5)='1' AND D1F_temp_lv1_6(  6)='1' )then
        D1F_temp_lv2_6(  3)<='1';
        else
        D1F_temp_lv2_6(  3)<='0';
        end if;
        if(D1F_temp_lv1_6(  7)='1' AND D1F_temp_lv1_6(  8)='1' )then
        D1F_temp_lv2_6(  4)<='1';
        else
        D1F_temp_lv2_6(  4)<='0';
        end if;
        if(D1F_temp_lv1_6(  9)='1' AND D1F_temp_lv1_6( 10)='1' )then
        D1F_temp_lv2_6(  5)<='1';
        else
        D1F_temp_lv2_6(  5)<='0';
        end if;
        if(D1F_temp_lv1_6( 11)='1' AND D1F_temp_lv1_6( 12)='1' )then
        D1F_temp_lv2_6(  6)<='1';
        else
        D1F_temp_lv2_6(  6)<='0';
        end if;
        if(D1F_temp_lv1_6( 13)='1' )then
        D1F_temp_lv2_6(  7)<='1';
        else
        D1F_temp_lv2_6(  7)<='0';
        end if;
        if(D1F_temp_lv1_6( 14)='1' AND D1F_temp_lv1_6( 15)='1' )then
        D1F_temp_lv2_6(  8)<='1';
        else
        D1F_temp_lv2_6(  8)<='0';
        end if;
        if(D1F_temp_lv1_6( 16)='1' )then
        D1F_temp_lv2_6(  9)<='1';
        else
        D1F_temp_lv2_6(  9)<='0';
        end if;
        if(D1F_temp_lv1_6( 17)='1' AND D1F_temp_lv1_6( 18)='1' )then
        D1F_temp_lv2_6( 10)<='1';
        else
        D1F_temp_lv2_6( 10)<='0';
        end if;
        if(D1F_temp_lv1_6( 19)='1' )then
        D1F_temp_lv2_6( 11)<='1';
        else
        D1F_temp_lv2_6( 11)<='0';
        end if;
        if(D1F_temp_lv1_6( 20)='1' AND D1F_temp_lv1_6( 21)='1' )then
        D1F_temp_lv2_6( 12)<='1';
        else
        D1F_temp_lv2_6( 12)<='0';
        end if;
        if(D1F_temp_lv1_6( 22)='1' OR D1F_temp_lv1_6( 23)='1' OR D1F_temp_lv1_6( 24)='1' OR D1F_temp_lv1_6( 25)='1' )then
        D1F_temp_lv2_6( 13)<='1';
        else
        D1F_temp_lv2_6( 13)<='0';
        end if;
        if(D1F_temp_lv1_6( 26)='1' OR D1F_temp_lv1_6( 27)='1' OR D1F_temp_lv1_6( 28)='1' )then
        D1F_temp_lv2_6( 14)<='1';
        else
        D1F_temp_lv2_6( 14)<='0';
        end if;
        if(D1F_temp_lv1_6( 29)='1' AND D1F_temp_lv1_6( 30)='1' )then
        D1F_temp_lv2_6( 15)<='1';
        else
        D1F_temp_lv2_6( 15)<='0';
        end if;
        if(D1F_temp_lv1_6( 31)='1' )then
        D1F_temp_lv2_6( 16)<='1';
        else
        D1F_temp_lv2_6( 16)<='0';
        end if;
        if(D1F_temp_lv1_6( 32)='1' AND D1F_temp_lv1_6( 33)='1' )then
        D1F_temp_lv2_6( 17)<='1';
        else
        D1F_temp_lv2_6( 17)<='0';
        end if;
        if(D1F_temp_lv1_6( 34)='1' AND D1F_temp_lv1_6( 35)='1' AND D1F_temp_lv1_6( 36)='1' )then
        D1F_temp_lv2_6( 18)<='1';
        else
        D1F_temp_lv2_6( 18)<='0';
        end if;
        if(D1F_temp_lv1_6( 37)='1' AND D1F_temp_lv1_6( 38)='1' )then
        D1F_temp_lv2_6( 19)<='1';
        else
        D1F_temp_lv2_6( 19)<='0';
        end if;
        if(D1F_temp_lv1_6( 39)='1' AND D1F_temp_lv1_6( 40)='1' AND D1F_temp_lv1_6( 41)='1' )then
        D1F_temp_lv2_6( 20)<='1';
        else
        D1F_temp_lv2_6( 20)<='0';
        end if;
        if(D1F_temp_lv1_6( 42)='1' AND D1F_temp_lv1_6( 43)='1' )then
        D1F_temp_lv2_6( 21)<='1';
        else
        D1F_temp_lv2_6( 21)<='0';
        end if;
        if(D1F_temp_lv1_6( 44)='1' OR D1F_temp_lv1_6( 45)='1' )then
        D1F_temp_lv2_6( 22)<='1';
        else
        D1F_temp_lv2_6( 22)<='0';
        end if;
        if(D1F_temp_lv1_7(  0)='1' )then
        D1F_temp_lv2_7(  0)<='1';
        else
        D1F_temp_lv2_7(  0)<='0';
        end if;
        if(D1F_temp_lv1_7(  1)='1' AND D1F_temp_lv1_7(  2)='1' )then
        D1F_temp_lv2_7(  1)<='1';
        else
        D1F_temp_lv2_7(  1)<='0';
        end if;
        if(D1F_temp_lv1_7(  3)='1' )then
        D1F_temp_lv2_7(  2)<='1';
        else
        D1F_temp_lv2_7(  2)<='0';
        end if;
        if(D1F_temp_lv1_7(  4)='1' AND D1F_temp_lv1_7(  5)='1' )then
        D1F_temp_lv2_7(  3)<='1';
        else
        D1F_temp_lv2_7(  3)<='0';
        end if;
        if(D1F_temp_lv1_7(  6)='1' AND D1F_temp_lv1_7(  7)='1' )then
        D1F_temp_lv2_7(  4)<='1';
        else
        D1F_temp_lv2_7(  4)<='0';
        end if;
        if(D1F_temp_lv1_7(  8)='1' )then
        D1F_temp_lv2_7(  5)<='1';
        else
        D1F_temp_lv2_7(  5)<='0';
        end if;
        if(D1F_temp_lv1_7(  9)='1' AND D1F_temp_lv1_7( 10)='1' )then
        D1F_temp_lv2_7(  6)<='1';
        else
        D1F_temp_lv2_7(  6)<='0';
        end if;
        if(D1F_temp_lv1_7( 11)='1' )then
        D1F_temp_lv2_7(  7)<='1';
        else
        D1F_temp_lv2_7(  7)<='0';
        end if;
        if(D1F_temp_lv1_7( 12)='1' AND D1F_temp_lv1_7( 13)='1' )then
        D1F_temp_lv2_7(  8)<='1';
        else
        D1F_temp_lv2_7(  8)<='0';
        end if;
        if(D1F_temp_lv1_7( 14)='1' )then
        D1F_temp_lv2_7(  9)<='1';
        else
        D1F_temp_lv2_7(  9)<='0';
        end if;
        if(D1F_temp_lv1_7( 15)='1' AND D1F_temp_lv1_7( 16)='1' )then
        D1F_temp_lv2_7( 10)<='1';
        else
        D1F_temp_lv2_7( 10)<='0';
        end if;
        if(D1F_temp_lv1_7( 17)='1' OR D1F_temp_lv1_7( 18)='1' OR D1F_temp_lv1_7( 19)='1' OR D1F_temp_lv1_7( 20)='1' )then
        D1F_temp_lv2_7( 11)<='1';
        else
        D1F_temp_lv2_7( 11)<='0';
        end if;
        if(D1F_temp_lv1_7( 21)='1' OR D1F_temp_lv1_7( 22)='1' OR D1F_temp_lv1_7( 23)='1' )then
        D1F_temp_lv2_7( 12)<='1';
        else
        D1F_temp_lv2_7( 12)<='0';
        end if;
        if(D1F_temp_lv1_7( 24)='1' AND D1F_temp_lv1_7( 25)='1' )then
        D1F_temp_lv2_7( 13)<='1';
        else
        D1F_temp_lv2_7( 13)<='0';
        end if;
        if(D1F_temp_lv1_7( 26)='1' AND D1F_temp_lv1_7( 27)='1' AND D1F_temp_lv1_7( 28)='1' AND D1F_temp_lv1_7( 29)='1' )then
        D1F_temp_lv2_7( 14)<='1';
        else
        D1F_temp_lv2_7( 14)<='0';
        end if;
        if(D1F_temp_lv1_7( 30)='1' AND D1F_temp_lv1_7( 31)='1' )then
        D1F_temp_lv2_7( 15)<='1';
        else
        D1F_temp_lv2_7( 15)<='0';
        end if;
        if(D1F_temp_lv1_7( 32)='1' AND D1F_temp_lv1_7( 33)='1' AND D1F_temp_lv1_7( 34)='1' )then
        D1F_temp_lv2_7( 16)<='1';
        else
        D1F_temp_lv2_7( 16)<='0';
        end if;
        if(D1F_temp_lv1_7( 35)='1' AND D1F_temp_lv1_7( 36)='1' )then
        D1F_temp_lv2_7( 17)<='1';
        else
        D1F_temp_lv2_7( 17)<='0';
        end if;
        if(D1F_temp_lv1_7( 37)='1' OR D1F_temp_lv1_7( 38)='1' )then
        D1F_temp_lv2_7( 18)<='1';
        else
        D1F_temp_lv2_7( 18)<='0';
        end if;
        if(D2F_temp_lv1_0(  0)='1' )then
        D2F_temp_lv2_0(  0)<='1';
        else
        D2F_temp_lv2_0(  0)<='0';
        end if;
        if(D2F_temp_lv1_0(  1)='1' AND D2F_temp_lv1_0(  2)='1' )then
        D2F_temp_lv2_0(  1)<='1';
        else
        D2F_temp_lv2_0(  1)<='0';
        end if;
        if(D2F_temp_lv1_0(  3)='1' AND D2F_temp_lv1_0(  4)='1' )then
        D2F_temp_lv2_0(  2)<='1';
        else
        D2F_temp_lv2_0(  2)<='0';
        end if;
        if(D2F_temp_lv1_0(  5)='1' )then
        D2F_temp_lv2_0(  3)<='1';
        else
        D2F_temp_lv2_0(  3)<='0';
        end if;
        if(D2F_temp_lv1_0(  6)='1' AND D2F_temp_lv1_0(  7)='1' )then
        D2F_temp_lv2_0(  4)<='1';
        else
        D2F_temp_lv2_0(  4)<='0';
        end if;
        if(D2F_temp_lv1_0(  8)='1' AND D2F_temp_lv1_0(  9)='1' )then
        D2F_temp_lv2_0(  5)<='1';
        else
        D2F_temp_lv2_0(  5)<='0';
        end if;
        if(D2F_temp_lv1_0( 10)='1' )then
        D2F_temp_lv2_0(  6)<='1';
        else
        D2F_temp_lv2_0(  6)<='0';
        end if;
        if(D2F_temp_lv1_0( 11)='1' AND D2F_temp_lv1_0( 12)='1' )then
        D2F_temp_lv2_0(  7)<='1';
        else
        D2F_temp_lv2_0(  7)<='0';
        end if;
        if(D2F_temp_lv1_0( 13)='1' )then
        D2F_temp_lv2_0(  8)<='1';
        else
        D2F_temp_lv2_0(  8)<='0';
        end if;
        if(D2F_temp_lv1_0( 14)='1' AND D2F_temp_lv1_0( 15)='1' AND D2F_temp_lv1_0( 16)='1' AND D2F_temp_lv1_0( 17)='1' )then
        D2F_temp_lv2_0(  9)<='1';
        else
        D2F_temp_lv2_0(  9)<='0';
        end if;
        if(D2F_temp_lv1_0( 18)='1' AND D2F_temp_lv1_0( 19)='1' )then
        D2F_temp_lv2_0( 10)<='1';
        else
        D2F_temp_lv2_0( 10)<='0';
        end if;
        if(D2F_temp_lv1_0( 20)='1' AND D2F_temp_lv1_0( 21)='1' )then
        D2F_temp_lv2_0( 11)<='1';
        else
        D2F_temp_lv2_0( 11)<='0';
        end if;
        if(D2F_temp_lv1_0( 22)='1' AND D2F_temp_lv1_0( 23)='1' AND D2F_temp_lv1_0( 24)='1' )then
        D2F_temp_lv2_0( 12)<='1';
        else
        D2F_temp_lv2_0( 12)<='0';
        end if;
        if(D2F_temp_lv1_0( 25)='1' AND D2F_temp_lv1_0( 26)='1' )then
        D2F_temp_lv2_0( 13)<='1';
        else
        D2F_temp_lv2_0( 13)<='0';
        end if;
        if(D2F_temp_lv1_0( 27)='1' )then
        D2F_temp_lv2_0( 14)<='1';
        else
        D2F_temp_lv2_0( 14)<='0';
        end if;
        if(D2F_temp_lv1_0( 28)='1' AND D2F_temp_lv1_0( 29)='1' )then
        D2F_temp_lv2_0( 15)<='1';
        else
        D2F_temp_lv2_0( 15)<='0';
        end if;
        if(D2F_temp_lv1_0( 30)='1' OR D2F_temp_lv1_0( 31)='1' )then
        D2F_temp_lv2_0( 16)<='1';
        else
        D2F_temp_lv2_0( 16)<='0';
        end if;
        if(D2F_temp_lv1_0( 32)='1' AND D2F_temp_lv1_0( 33)='1' )then
        D2F_temp_lv2_0( 17)<='1';
        else
        D2F_temp_lv2_0( 17)<='0';
        end if;
        if(D2F_temp_lv1_0( 34)='1' )then
        D2F_temp_lv2_0( 18)<='1';
        else
        D2F_temp_lv2_0( 18)<='0';
        end if;
        if(D2F_temp_lv1_1(  0)='1' OR D2F_temp_lv1_1(  1)='1' OR D2F_temp_lv1_1(  2)='1' )then
        D2F_temp_lv2_1(  0)<='1';
        else
        D2F_temp_lv2_1(  0)<='0';
        end if;
        if(D2F_temp_lv1_1(  3)='1' AND D2F_temp_lv1_1(  4)='1' )then
        D2F_temp_lv2_1(  1)<='1';
        else
        D2F_temp_lv2_1(  1)<='0';
        end if;
        if(D2F_temp_lv1_1(  5)='1' AND D2F_temp_lv1_1(  6)='1' )then
        D2F_temp_lv2_1(  2)<='1';
        else
        D2F_temp_lv2_1(  2)<='0';
        end if;
        if(D2F_temp_lv1_1(  7)='1' )then
        D2F_temp_lv2_1(  3)<='1';
        else
        D2F_temp_lv2_1(  3)<='0';
        end if;
        if(D2F_temp_lv1_1(  8)='1' AND D2F_temp_lv1_1(  9)='1' )then
        D2F_temp_lv2_1(  4)<='1';
        else
        D2F_temp_lv2_1(  4)<='0';
        end if;
        if(D2F_temp_lv1_1( 10)='1' OR D2F_temp_lv1_1( 11)='1' OR D2F_temp_lv1_1( 12)='1' OR D2F_temp_lv1_1( 13)='1' )then
        D2F_temp_lv2_1(  5)<='1';
        else
        D2F_temp_lv2_1(  5)<='0';
        end if;
        if(D2F_temp_lv1_1( 14)='1' OR D2F_temp_lv1_1( 15)='1' OR D2F_temp_lv1_1( 16)='1' )then
        D2F_temp_lv2_1(  6)<='1';
        else
        D2F_temp_lv2_1(  6)<='0';
        end if;
        if(D2F_temp_lv1_1( 17)='1' AND D2F_temp_lv1_1( 18)='1' )then
        D2F_temp_lv2_1(  7)<='1';
        else
        D2F_temp_lv2_1(  7)<='0';
        end if;
        if(D2F_temp_lv1_1( 19)='1' AND D2F_temp_lv1_1( 20)='1' )then
        D2F_temp_lv2_1(  8)<='1';
        else
        D2F_temp_lv2_1(  8)<='0';
        end if;
        if(D2F_temp_lv1_1( 21)='1' AND D2F_temp_lv1_1( 22)='1' AND D2F_temp_lv1_1( 23)='1' )then
        D2F_temp_lv2_1(  9)<='1';
        else
        D2F_temp_lv2_1(  9)<='0';
        end if;
        if(D2F_temp_lv1_1( 24)='1' AND D2F_temp_lv1_1( 25)='1' )then
        D2F_temp_lv2_1( 10)<='1';
        else
        D2F_temp_lv2_1( 10)<='0';
        end if;
        if(D2F_temp_lv1_1( 26)='1' )then
        D2F_temp_lv2_1( 11)<='1';
        else
        D2F_temp_lv2_1( 11)<='0';
        end if;
        if(D2F_temp_lv1_1( 27)='1' AND D2F_temp_lv1_1( 28)='1' )then
        D2F_temp_lv2_1( 12)<='1';
        else
        D2F_temp_lv2_1( 12)<='0';
        end if;
        if(D2F_temp_lv1_1( 29)='1' AND D2F_temp_lv1_1( 30)='1' )then
        D2F_temp_lv2_1( 13)<='1';
        else
        D2F_temp_lv2_1( 13)<='0';
        end if;
        if(D2F_temp_lv1_1( 31)='1' AND D2F_temp_lv1_1( 32)='1' AND D2F_temp_lv1_1( 33)='1' )then
        D2F_temp_lv2_1( 14)<='1';
        else
        D2F_temp_lv2_1( 14)<='0';
        end if;
        if(D2F_temp_lv1_1( 34)='1' )then
        D2F_temp_lv2_1( 15)<='1';
        else
        D2F_temp_lv2_1( 15)<='0';
        end if;
        if(D2F_temp_lv1_1( 35)='1' AND D2F_temp_lv1_1( 36)='1' )then
        D2F_temp_lv2_1( 16)<='1';
        else
        D2F_temp_lv2_1( 16)<='0';
        end if;
        if(D2F_temp_lv1_1( 37)='1' )then
        D2F_temp_lv2_1( 17)<='1';
        else
        D2F_temp_lv2_1( 17)<='0';
        end if;
        if(D2F_temp_lv1_1( 38)='1' AND D2F_temp_lv1_1( 39)='1' )then
        D2F_temp_lv2_1( 18)<='1';
        else
        D2F_temp_lv2_1( 18)<='0';
        end if;
        if(D2F_temp_lv1_1( 40)='1' AND D2F_temp_lv1_1( 41)='1' )then
        D2F_temp_lv2_1( 19)<='1';
        else
        D2F_temp_lv2_1( 19)<='0';
        end if;
        if(D2F_temp_lv1_1( 42)='1' AND D2F_temp_lv1_1( 43)='1' AND D2F_temp_lv1_1( 44)='1' )then
        D2F_temp_lv2_1( 20)<='1';
        else
        D2F_temp_lv2_1( 20)<='0';
        end if;
        if(D2F_temp_lv1_2(  0)='1' OR D2F_temp_lv1_2(  1)='1' OR D2F_temp_lv1_2(  2)='1' )then
        D2F_temp_lv2_2(  0)<='1';
        else
        D2F_temp_lv2_2(  0)<='0';
        end if;
        if(D2F_temp_lv1_2(  3)='1' AND D2F_temp_lv1_2(  4)='1' )then
        D2F_temp_lv2_2(  1)<='1';
        else
        D2F_temp_lv2_2(  1)<='0';
        end if;
        if(D2F_temp_lv1_2(  5)='1' )then
        D2F_temp_lv2_2(  2)<='1';
        else
        D2F_temp_lv2_2(  2)<='0';
        end if;
        if(D2F_temp_lv1_2(  6)='1' AND D2F_temp_lv1_2(  7)='1' )then
        D2F_temp_lv2_2(  3)<='1';
        else
        D2F_temp_lv2_2(  3)<='0';
        end if;
        if(D2F_temp_lv1_2(  8)='1' )then
        D2F_temp_lv2_2(  4)<='1';
        else
        D2F_temp_lv2_2(  4)<='0';
        end if;
        if(D2F_temp_lv1_2(  9)='1' AND D2F_temp_lv1_2( 10)='1' )then
        D2F_temp_lv2_2(  5)<='1';
        else
        D2F_temp_lv2_2(  5)<='0';
        end if;
        if(D2F_temp_lv1_2( 11)='1' OR D2F_temp_lv1_2( 12)='1' OR D2F_temp_lv1_2( 13)='1' OR D2F_temp_lv1_2( 14)='1' )then
        D2F_temp_lv2_2(  6)<='1';
        else
        D2F_temp_lv2_2(  6)<='0';
        end if;
        if(D2F_temp_lv1_2( 15)='1' OR D2F_temp_lv1_2( 16)='1' )then
        D2F_temp_lv2_2(  7)<='1';
        else
        D2F_temp_lv2_2(  7)<='0';
        end if;
        if(D2F_temp_lv1_2( 17)='1' AND D2F_temp_lv1_2( 18)='1' )then
        D2F_temp_lv2_2(  8)<='1';
        else
        D2F_temp_lv2_2(  8)<='0';
        end if;
        if(D2F_temp_lv1_2( 19)='1' AND D2F_temp_lv1_2( 20)='1' )then
        D2F_temp_lv2_2(  9)<='1';
        else
        D2F_temp_lv2_2(  9)<='0';
        end if;
        if(D2F_temp_lv1_2( 21)='1' AND D2F_temp_lv1_2( 22)='1' )then
        D2F_temp_lv2_2( 10)<='1';
        else
        D2F_temp_lv2_2( 10)<='0';
        end if;
        if(D2F_temp_lv1_2( 23)='1' AND D2F_temp_lv1_2( 24)='1' AND D2F_temp_lv1_2( 25)='1' )then
        D2F_temp_lv2_2( 11)<='1';
        else
        D2F_temp_lv2_2( 11)<='0';
        end if;
        if(D2F_temp_lv1_2( 26)='1' )then
        D2F_temp_lv2_2( 12)<='1';
        else
        D2F_temp_lv2_2( 12)<='0';
        end if;
        if(D2F_temp_lv1_2( 27)='1' AND D2F_temp_lv1_2( 28)='1' )then
        D2F_temp_lv2_2( 13)<='1';
        else
        D2F_temp_lv2_2( 13)<='0';
        end if;
        if(D2F_temp_lv1_2( 29)='1' AND D2F_temp_lv1_2( 30)='1' )then
        D2F_temp_lv2_2( 14)<='1';
        else
        D2F_temp_lv2_2( 14)<='0';
        end if;
        if(D2F_temp_lv1_2( 31)='1' AND D2F_temp_lv1_2( 32)='1' AND D2F_temp_lv1_2( 33)='1' AND D2F_temp_lv1_2( 34)='1' )then
        D2F_temp_lv2_2( 15)<='1';
        else
        D2F_temp_lv2_2( 15)<='0';
        end if;
        if(D2F_temp_lv1_2( 35)='1' )then
        D2F_temp_lv2_2( 16)<='1';
        else
        D2F_temp_lv2_2( 16)<='0';
        end if;
        if(D2F_temp_lv1_2( 36)='1' AND D2F_temp_lv1_2( 37)='1' )then
        D2F_temp_lv2_2( 17)<='1';
        else
        D2F_temp_lv2_2( 17)<='0';
        end if;
        if(D2F_temp_lv1_2( 38)='1' )then
        D2F_temp_lv2_2( 18)<='1';
        else
        D2F_temp_lv2_2( 18)<='0';
        end if;
        if(D2F_temp_lv1_2( 39)='1' AND D2F_temp_lv1_2( 40)='1' )then
        D2F_temp_lv2_2( 19)<='1';
        else
        D2F_temp_lv2_2( 19)<='0';
        end if;
        if(D2F_temp_lv1_2( 41)='1' OR D2F_temp_lv1_2( 42)='1' )then
        D2F_temp_lv2_2( 20)<='1';
        else
        D2F_temp_lv2_2( 20)<='0';
        end if;
        if(D2F_temp_lv1_3(  0)='1' OR D2F_temp_lv1_3(  1)='1' )then
        D2F_temp_lv2_3(  0)<='1';
        else
        D2F_temp_lv2_3(  0)<='0';
        end if;
        if(D2F_temp_lv1_3(  2)='1' AND D2F_temp_lv1_3(  3)='1' )then
        D2F_temp_lv2_3(  1)<='1';
        else
        D2F_temp_lv2_3(  1)<='0';
        end if;
        if(D2F_temp_lv1_3(  4)='1' )then
        D2F_temp_lv2_3(  2)<='1';
        else
        D2F_temp_lv2_3(  2)<='0';
        end if;
        if(D2F_temp_lv1_3(  5)='1' AND D2F_temp_lv1_3(  6)='1' )then
        D2F_temp_lv2_3(  3)<='1';
        else
        D2F_temp_lv2_3(  3)<='0';
        end if;
        if(D2F_temp_lv1_3(  7)='1' AND D2F_temp_lv1_3(  8)='1' )then
        D2F_temp_lv2_3(  4)<='1';
        else
        D2F_temp_lv2_3(  4)<='0';
        end if;
        if(D2F_temp_lv1_3(  9)='1' OR D2F_temp_lv1_3( 10)='1' OR D2F_temp_lv1_3( 11)='1' OR D2F_temp_lv1_3( 12)='1' )then
        D2F_temp_lv2_3(  5)<='1';
        else
        D2F_temp_lv2_3(  5)<='0';
        end if;
        if(D2F_temp_lv1_3( 13)='1' OR D2F_temp_lv1_3( 14)='1' )then
        D2F_temp_lv2_3(  6)<='1';
        else
        D2F_temp_lv2_3(  6)<='0';
        end if;
        if(D2F_temp_lv1_3( 15)='1' AND D2F_temp_lv1_3( 16)='1' )then
        D2F_temp_lv2_3(  7)<='1';
        else
        D2F_temp_lv2_3(  7)<='0';
        end if;
        if(D2F_temp_lv1_3( 17)='1' AND D2F_temp_lv1_3( 18)='1' )then
        D2F_temp_lv2_3(  8)<='1';
        else
        D2F_temp_lv2_3(  8)<='0';
        end if;
        if(D2F_temp_lv1_3( 19)='1' AND D2F_temp_lv1_3( 20)='1' AND D2F_temp_lv1_3( 21)='1' )then
        D2F_temp_lv2_3(  9)<='1';
        else
        D2F_temp_lv2_3(  9)<='0';
        end if;
        if(D2F_temp_lv1_3( 22)='1' )then
        D2F_temp_lv2_3( 10)<='1';
        else
        D2F_temp_lv2_3( 10)<='0';
        end if;
        if(D2F_temp_lv1_3( 23)='1' AND D2F_temp_lv1_3( 24)='1' )then
        D2F_temp_lv2_3( 11)<='1';
        else
        D2F_temp_lv2_3( 11)<='0';
        end if;
        if(D2F_temp_lv1_3( 25)='1' AND D2F_temp_lv1_3( 26)='1' )then
        D2F_temp_lv2_3( 12)<='1';
        else
        D2F_temp_lv2_3( 12)<='0';
        end if;
        if(D2F_temp_lv1_3( 27)='1' AND D2F_temp_lv1_3( 28)='1' AND D2F_temp_lv1_3( 29)='1' AND D2F_temp_lv1_3( 30)='1' )then
        D2F_temp_lv2_3( 13)<='1';
        else
        D2F_temp_lv2_3( 13)<='0';
        end if;
        if(D2F_temp_lv1_3( 31)='1' AND D2F_temp_lv1_3( 32)='1' )then
        D2F_temp_lv2_3( 14)<='1';
        else
        D2F_temp_lv2_3( 14)<='0';
        end if;
        if(D2F_temp_lv1_3( 33)='1' )then
        D2F_temp_lv2_3( 15)<='1';
        else
        D2F_temp_lv2_3( 15)<='0';
        end if;
        if(D2F_temp_lv1_3( 34)='1' AND D2F_temp_lv1_3( 35)='1' )then
        D2F_temp_lv2_3( 16)<='1';
        else
        D2F_temp_lv2_3( 16)<='0';
        end if;
        if(D2F_temp_lv1_3( 36)='1' OR D2F_temp_lv1_3( 37)='1' )then
        D2F_temp_lv2_3( 17)<='1';
        else
        D2F_temp_lv2_3( 17)<='0';
        end if;
        if(D2F_temp_lv1_4(  0)='1' AND D2F_temp_lv1_4(  1)='1' )then
        D2F_temp_lv2_4(  0)<='1';
        else
        D2F_temp_lv2_4(  0)<='0';
        end if;
        if(D2F_temp_lv1_4(  2)='1' AND D2F_temp_lv1_4(  3)='1' AND D2F_temp_lv1_4(  4)='1' AND D2F_temp_lv1_4(  5)='1' )then
        D2F_temp_lv2_4(  1)<='1';
        else
        D2F_temp_lv2_4(  1)<='0';
        end if;
        if(D2F_temp_lv1_4(  6)='1' )then
        D2F_temp_lv2_4(  2)<='1';
        else
        D2F_temp_lv2_4(  2)<='0';
        end if;
        if(D2F_temp_lv1_4(  7)='1' AND D2F_temp_lv1_4(  8)='1' )then
        D2F_temp_lv2_4(  3)<='1';
        else
        D2F_temp_lv2_4(  3)<='0';
        end if;
        if(D2F_temp_lv1_4(  9)='1' AND D2F_temp_lv1_4( 10)='1' AND D2F_temp_lv1_4( 11)='1' )then
        D2F_temp_lv2_4(  4)<='1';
        else
        D2F_temp_lv2_4(  4)<='0';
        end if;
        if(D2F_temp_lv1_4( 12)='1' AND D2F_temp_lv1_4( 13)='1' )then
        D2F_temp_lv2_4(  5)<='1';
        else
        D2F_temp_lv2_4(  5)<='0';
        end if;
        if(D2F_temp_lv1_4( 14)='1' AND D2F_temp_lv1_4( 15)='1' )then
        D2F_temp_lv2_4(  6)<='1';
        else
        D2F_temp_lv2_4(  6)<='0';
        end if;
        if(D2F_temp_lv1_4( 16)='1' AND D2F_temp_lv1_4( 17)='1' )then
        D2F_temp_lv2_4(  7)<='1';
        else
        D2F_temp_lv2_4(  7)<='0';
        end if;
        if(D2F_temp_lv1_4( 18)='1' AND D2F_temp_lv1_4( 19)='1' )then
        D2F_temp_lv2_4(  8)<='1';
        else
        D2F_temp_lv2_4(  8)<='0';
        end if;
        if(D2F_temp_lv1_4( 20)='1' )then
        D2F_temp_lv2_4(  9)<='1';
        else
        D2F_temp_lv2_4(  9)<='0';
        end if;
        if(D2F_temp_lv1_4( 21)='1' AND D2F_temp_lv1_4( 22)='1' )then
        D2F_temp_lv2_4( 10)<='1';
        else
        D2F_temp_lv2_4( 10)<='0';
        end if;
        if(D2F_temp_lv1_4( 23)='1' AND D2F_temp_lv1_4( 24)='1' )then
        D2F_temp_lv2_4( 11)<='1';
        else
        D2F_temp_lv2_4( 11)<='0';
        end if;
        if(D2F_temp_lv1_4( 25)='1' )then
        D2F_temp_lv2_4( 12)<='1';
        else
        D2F_temp_lv2_4( 12)<='0';
        end if;
        if(D2F_temp_lv1_4( 26)='1' AND D2F_temp_lv1_4( 27)='1' )then
        D2F_temp_lv2_4( 13)<='1';
        else
        D2F_temp_lv2_4( 13)<='0';
        end if;
        if(D2F_temp_lv1_4( 28)='1' AND D2F_temp_lv1_4( 29)='1' )then
        D2F_temp_lv2_4( 14)<='1';
        else
        D2F_temp_lv2_4( 14)<='0';
        end if;
        if(D2F_temp_lv1_4( 30)='1' AND D2F_temp_lv1_4( 31)='1' )then
        D2F_temp_lv2_4( 15)<='1';
        else
        D2F_temp_lv2_4( 15)<='0';
        end if;
        if(D2F_temp_lv1_5(  0)='1' OR D2F_temp_lv1_5(  1)='1' OR D2F_temp_lv1_5(  2)='1' )then
        D2F_temp_lv2_5(  0)<='1';
        else
        D2F_temp_lv2_5(  0)<='0';
        end if;
        if(D2F_temp_lv1_5(  3)='1' AND D2F_temp_lv1_5(  4)='1' )then
        D2F_temp_lv2_5(  1)<='1';
        else
        D2F_temp_lv2_5(  1)<='0';
        end if;
        if(D2F_temp_lv1_5(  5)='1' OR D2F_temp_lv1_5(  6)='1' )then
        D2F_temp_lv2_5(  2)<='1';
        else
        D2F_temp_lv2_5(  2)<='0';
        end if;
        if(D2F_temp_lv1_5(  7)='1' AND D2F_temp_lv1_5(  8)='1' AND D2F_temp_lv1_5(  9)='1' )then
        D2F_temp_lv2_5(  3)<='1';
        else
        D2F_temp_lv2_5(  3)<='0';
        end if;
        if(D2F_temp_lv1_5( 10)='1' OR D2F_temp_lv1_5( 11)='1' )then
        D2F_temp_lv2_5(  4)<='1';
        else
        D2F_temp_lv2_5(  4)<='0';
        end if;
        if(D2F_temp_lv1_5( 12)='1' AND D2F_temp_lv1_5( 13)='1' )then
        D2F_temp_lv2_5(  5)<='1';
        else
        D2F_temp_lv2_5(  5)<='0';
        end if;
        if(D2F_temp_lv1_5( 14)='1' AND D2F_temp_lv1_5( 15)='1' )then
        D2F_temp_lv2_5(  6)<='1';
        else
        D2F_temp_lv2_5(  6)<='0';
        end if;
        if(D2F_temp_lv1_5( 16)='1' AND D2F_temp_lv1_5( 17)='1' )then
        D2F_temp_lv2_5(  7)<='1';
        else
        D2F_temp_lv2_5(  7)<='0';
        end if;
        if(D2F_temp_lv1_5( 18)='1' AND D2F_temp_lv1_5( 19)='1' AND D2F_temp_lv1_5( 20)='1' )then
        D2F_temp_lv2_5(  8)<='1';
        else
        D2F_temp_lv2_5(  8)<='0';
        end if;
        if(D2F_temp_lv1_5( 21)='1' )then
        D2F_temp_lv2_5(  9)<='1';
        else
        D2F_temp_lv2_5(  9)<='0';
        end if;
        if(D2F_temp_lv1_5( 22)='1' AND D2F_temp_lv1_5( 23)='1' )then
        D2F_temp_lv2_5( 10)<='1';
        else
        D2F_temp_lv2_5( 10)<='0';
        end if;
        if(D2F_temp_lv1_5( 24)='1' AND D2F_temp_lv1_5( 25)='1' )then
        D2F_temp_lv2_5( 11)<='1';
        else
        D2F_temp_lv2_5( 11)<='0';
        end if;
        if(D2F_temp_lv1_5( 26)='1' )then
        D2F_temp_lv2_5( 12)<='1';
        else
        D2F_temp_lv2_5( 12)<='0';
        end if;
        if(D2F_temp_lv1_5( 27)='1' AND D2F_temp_lv1_5( 28)='1' )then
        D2F_temp_lv2_5( 13)<='1';
        else
        D2F_temp_lv2_5( 13)<='0';
        end if;
        if(D2F_temp_lv1_5( 29)='1' OR D2F_temp_lv1_5( 30)='1' OR D2F_temp_lv1_5( 31)='1' OR D2F_temp_lv1_5( 32)='1' )then
        D2F_temp_lv2_5( 14)<='1';
        else
        D2F_temp_lv2_5( 14)<='0';
        end if;
        if(D2F_temp_lv1_5( 33)='1' OR D2F_temp_lv1_5( 34)='1' OR D2F_temp_lv1_5( 35)='1' OR D2F_temp_lv1_5( 36)='1' )then
        D2F_temp_lv2_5( 15)<='1';
        else
        D2F_temp_lv2_5( 15)<='0';
        end if;
        if(D2F_temp_lv1_5( 37)='1' AND D2F_temp_lv1_5( 38)='1' )then
        D2F_temp_lv2_5( 16)<='1';
        else
        D2F_temp_lv2_5( 16)<='0';
        end if;
        if(D2F_temp_lv1_5( 39)='1' )then
        D2F_temp_lv2_5( 17)<='1';
        else
        D2F_temp_lv2_5( 17)<='0';
        end if;
        if(D2F_temp_lv1_5( 40)='1' AND D2F_temp_lv1_5( 41)='1' )then
        D2F_temp_lv2_5( 18)<='1';
        else
        D2F_temp_lv2_5( 18)<='0';
        end if;
        if(D2F_temp_lv1_5( 42)='1' AND D2F_temp_lv1_5( 43)='1' )then
        D2F_temp_lv2_5( 19)<='1';
        else
        D2F_temp_lv2_5( 19)<='0';
        end if;
        if(D2F_temp_lv1_6(  0)='1' OR D2F_temp_lv1_6(  1)='1' OR D2F_temp_lv1_6(  2)='1' )then
        D2F_temp_lv2_6(  0)<='1';
        else
        D2F_temp_lv2_6(  0)<='0';
        end if;
        if(D2F_temp_lv1_6(  3)='1' AND D2F_temp_lv1_6(  4)='1' )then
        D2F_temp_lv2_6(  1)<='1';
        else
        D2F_temp_lv2_6(  1)<='0';
        end if;
        if(D2F_temp_lv1_6(  5)='1' OR D2F_temp_lv1_6(  6)='1' )then
        D2F_temp_lv2_6(  2)<='1';
        else
        D2F_temp_lv2_6(  2)<='0';
        end if;
        if(D2F_temp_lv1_6(  7)='1' AND D2F_temp_lv1_6(  8)='1' )then
        D2F_temp_lv2_6(  3)<='1';
        else
        D2F_temp_lv2_6(  3)<='0';
        end if;
        if(D2F_temp_lv1_6(  9)='1' AND D2F_temp_lv1_6( 10)='1' )then
        D2F_temp_lv2_6(  4)<='1';
        else
        D2F_temp_lv2_6(  4)<='0';
        end if;
        if(D2F_temp_lv1_6( 11)='1' )then
        D2F_temp_lv2_6(  5)<='1';
        else
        D2F_temp_lv2_6(  5)<='0';
        end if;
        if(D2F_temp_lv1_6( 12)='1' AND D2F_temp_lv1_6( 13)='1' )then
        D2F_temp_lv2_6(  6)<='1';
        else
        D2F_temp_lv2_6(  6)<='0';
        end if;
        if(D2F_temp_lv1_6( 14)='1' )then
        D2F_temp_lv2_6(  7)<='1';
        else
        D2F_temp_lv2_6(  7)<='0';
        end if;
        if(D2F_temp_lv1_6( 15)='1' AND D2F_temp_lv1_6( 16)='1' AND D2F_temp_lv1_6( 17)='1' AND D2F_temp_lv1_6( 18)='1' )then
        D2F_temp_lv2_6(  8)<='1';
        else
        D2F_temp_lv2_6(  8)<='0';
        end if;
        if(D2F_temp_lv1_6( 19)='1' )then
        D2F_temp_lv2_6(  9)<='1';
        else
        D2F_temp_lv2_6(  9)<='0';
        end if;
        if(D2F_temp_lv1_6( 20)='1' AND D2F_temp_lv1_6( 21)='1' )then
        D2F_temp_lv2_6( 10)<='1';
        else
        D2F_temp_lv2_6( 10)<='0';
        end if;
        if(D2F_temp_lv1_6( 22)='1' )then
        D2F_temp_lv2_6( 11)<='1';
        else
        D2F_temp_lv2_6( 11)<='0';
        end if;
        if(D2F_temp_lv1_6( 23)='1' AND D2F_temp_lv1_6( 24)='1' )then
        D2F_temp_lv2_6( 12)<='1';
        else
        D2F_temp_lv2_6( 12)<='0';
        end if;
        if(D2F_temp_lv1_6( 25)='1' AND D2F_temp_lv1_6( 26)='1' )then
        D2F_temp_lv2_6( 13)<='1';
        else
        D2F_temp_lv2_6( 13)<='0';
        end if;
        if(D2F_temp_lv1_6( 27)='1' OR D2F_temp_lv1_6( 28)='1' )then
        D2F_temp_lv2_6( 14)<='1';
        else
        D2F_temp_lv2_6( 14)<='0';
        end if;
        if(D2F_temp_lv1_6( 29)='1' AND D2F_temp_lv1_6( 30)='1' )then
        D2F_temp_lv2_6( 15)<='1';
        else
        D2F_temp_lv2_6( 15)<='0';
        end if;
        if(D2F_temp_lv1_6( 31)='1' )then
        D2F_temp_lv2_6( 16)<='1';
        else
        D2F_temp_lv2_6( 16)<='0';
        end if;
        if(D2F_temp_lv1_6( 32)='1' AND D2F_temp_lv1_6( 33)='1' )then
        D2F_temp_lv2_6( 17)<='1';
        else
        D2F_temp_lv2_6( 17)<='0';
        end if;
        if(D2F_temp_lv1_6( 34)='1' )then
        D2F_temp_lv2_6( 18)<='1';
        else
        D2F_temp_lv2_6( 18)<='0';
        end if;
        if(D2F_temp_lv1_6( 35)='1' AND D2F_temp_lv1_6( 36)='1' )then
        D2F_temp_lv2_6( 19)<='1';
        else
        D2F_temp_lv2_6( 19)<='0';
        end if;
        if(D2F_temp_lv1_6( 37)='1' AND D2F_temp_lv1_6( 38)='1' )then
        D2F_temp_lv2_6( 20)<='1';
        else
        D2F_temp_lv2_6( 20)<='0';
        end if;
        if(D2F_temp_lv1_7(  0)='1' )then
        D2F_temp_lv2_7(  0)<='1';
        else
        D2F_temp_lv2_7(  0)<='0';
        end if;
        if(D2F_temp_lv1_7(  1)='1' AND D2F_temp_lv1_7(  2)='1' )then
        D2F_temp_lv2_7(  1)<='1';
        else
        D2F_temp_lv2_7(  1)<='0';
        end if;
        if(D2F_temp_lv1_7(  3)='1' OR D2F_temp_lv1_7(  4)='1' )then
        D2F_temp_lv2_7(  2)<='1';
        else
        D2F_temp_lv2_7(  2)<='0';
        end if;
        if(D2F_temp_lv1_7(  5)='1' AND D2F_temp_lv1_7(  6)='1' )then
        D2F_temp_lv2_7(  3)<='1';
        else
        D2F_temp_lv2_7(  3)<='0';
        end if;
        if(D2F_temp_lv1_7(  7)='1' AND D2F_temp_lv1_7(  8)='1' AND D2F_temp_lv1_7(  9)='1' )then
        D2F_temp_lv2_7(  4)<='1';
        else
        D2F_temp_lv2_7(  4)<='0';
        end if;
        if(D2F_temp_lv1_7( 10)='1' )then
        D2F_temp_lv2_7(  5)<='1';
        else
        D2F_temp_lv2_7(  5)<='0';
        end if;
        if(D2F_temp_lv1_7( 11)='1' AND D2F_temp_lv1_7( 12)='1' )then
        D2F_temp_lv2_7(  6)<='1';
        else
        D2F_temp_lv2_7(  6)<='0';
        end if;
        if(D2F_temp_lv1_7( 13)='1' )then
        D2F_temp_lv2_7(  7)<='1';
        else
        D2F_temp_lv2_7(  7)<='0';
        end if;
        if(D2F_temp_lv1_7( 14)='1' AND D2F_temp_lv1_7( 15)='1' AND D2F_temp_lv1_7( 16)='1' )then
        D2F_temp_lv2_7(  8)<='1';
        else
        D2F_temp_lv2_7(  8)<='0';
        end if;
        if(D2F_temp_lv1_7( 17)='1' )then
        D2F_temp_lv2_7(  9)<='1';
        else
        D2F_temp_lv2_7(  9)<='0';
        end if;
        if(D2F_temp_lv1_7( 18)='1' AND D2F_temp_lv1_7( 19)='1' )then
        D2F_temp_lv2_7( 10)<='1';
        else
        D2F_temp_lv2_7( 10)<='0';
        end if;
        if(D2F_temp_lv1_7( 20)='1' AND D2F_temp_lv1_7( 21)='1' )then
        D2F_temp_lv2_7( 11)<='1';
        else
        D2F_temp_lv2_7( 11)<='0';
        end if;
        if(D2F_temp_lv1_7( 22)='1' )then
        D2F_temp_lv2_7( 12)<='1';
        else
        D2F_temp_lv2_7( 12)<='0';
        end if;
        if(D2F_temp_lv1_7( 23)='1' AND D2F_temp_lv1_7( 24)='1' )then
        D2F_temp_lv2_7( 13)<='1';
        else
        D2F_temp_lv2_7( 13)<='0';
        end if;
        if(D2F_temp_lv1_7( 25)='1' OR D2F_temp_lv1_7( 26)='1' OR D2F_temp_lv1_7( 27)='1' OR D2F_temp_lv1_7( 28)='1' )then
        D2F_temp_lv2_7( 14)<='1';
        else
        D2F_temp_lv2_7( 14)<='0';
        end if;
        if(D2F_temp_lv1_7( 29)='1' )then
        D2F_temp_lv2_7( 15)<='1';
        else
        D2F_temp_lv2_7( 15)<='0';
        end if;
        if(D2F_temp_lv1_7( 30)='1' AND D2F_temp_lv1_7( 31)='1' )then
        D2F_temp_lv2_7( 16)<='1';
        else
        D2F_temp_lv2_7( 16)<='0';
        end if;
        if(D2F_temp_lv1_7( 32)='1' )then
        D2F_temp_lv2_7( 17)<='1';
        else
        D2F_temp_lv2_7( 17)<='0';
        end if;
        if(D2F_temp_lv1_7( 33)='1' AND D2F_temp_lv1_7( 34)='1' )then
        D2F_temp_lv2_7( 18)<='1';
        else
        D2F_temp_lv2_7( 18)<='0';
        end if;
        if(D2F_temp_lv1_7( 35)='1' AND D2F_temp_lv1_7( 36)='1' )then
        D2F_temp_lv2_7( 19)<='1';
        else
        D2F_temp_lv2_7( 19)<='0';
        end if;
        if(D2F_temp_lv1_7( 37)='1' )then
        D2F_temp_lv2_7( 20)<='1';
        else
        D2F_temp_lv2_7( 20)<='0';
        end if;
        if(D3F_temp_lv1_0(  0)='1' OR D3F_temp_lv1_0(  1)='1' OR D3F_temp_lv1_0(  2)='1' OR D3F_temp_lv1_0(  3)='1' )then
        D3F_temp_lv2_0(  0)<='1';
        else
        D3F_temp_lv2_0(  0)<='0';
        end if;
        if(D3F_temp_lv1_0(  4)='1' AND D3F_temp_lv1_0(  5)='1' )then
        D3F_temp_lv2_0(  1)<='1';
        else
        D3F_temp_lv2_0(  1)<='0';
        end if;
        if(D3F_temp_lv1_0(  6)='1' OR D3F_temp_lv1_0(  7)='1' )then
        D3F_temp_lv2_0(  2)<='1';
        else
        D3F_temp_lv2_0(  2)<='0';
        end if;
        if(D3F_temp_lv1_0(  8)='1' AND D3F_temp_lv1_0(  9)='1' )then
        D3F_temp_lv2_0(  3)<='1';
        else
        D3F_temp_lv2_0(  3)<='0';
        end if;
        if(D3F_temp_lv1_0( 10)='1' )then
        D3F_temp_lv2_0(  4)<='1';
        else
        D3F_temp_lv2_0(  4)<='0';
        end if;
        if(D3F_temp_lv1_0( 11)='1' AND D3F_temp_lv1_0( 12)='1' )then
        D3F_temp_lv2_0(  5)<='1';
        else
        D3F_temp_lv2_0(  5)<='0';
        end if;
        if(D3F_temp_lv1_0( 13)='1' AND D3F_temp_lv1_0( 14)='1' AND D3F_temp_lv1_0( 15)='1' )then
        D3F_temp_lv2_0(  6)<='1';
        else
        D3F_temp_lv2_0(  6)<='0';
        end if;
        if(D3F_temp_lv1_0( 16)='1' OR D3F_temp_lv1_0( 17)='1' )then
        D3F_temp_lv2_0(  7)<='1';
        else
        D3F_temp_lv2_0(  7)<='0';
        end if;
        if(D3F_temp_lv1_0( 18)='1' AND D3F_temp_lv1_0( 19)='1' AND D3F_temp_lv1_0( 20)='1' AND D3F_temp_lv1_0( 21)='1' )then
        D3F_temp_lv2_0(  8)<='1';
        else
        D3F_temp_lv2_0(  8)<='0';
        end if;
        if(D3F_temp_lv1_0( 22)='1' AND D3F_temp_lv1_0( 23)='1' AND D3F_temp_lv1_0( 24)='1' AND D3F_temp_lv1_0( 25)='1' )then
        D3F_temp_lv2_0(  9)<='1';
        else
        D3F_temp_lv2_0(  9)<='0';
        end if;
        if(D3F_temp_lv1_0( 26)='1' )then
        D3F_temp_lv2_0( 10)<='1';
        else
        D3F_temp_lv2_0( 10)<='0';
        end if;
        if(D3F_temp_lv1_0( 27)='1' AND D3F_temp_lv1_0( 28)='1' AND D3F_temp_lv1_0( 29)='1' AND D3F_temp_lv1_0( 30)='1' )then
        D3F_temp_lv2_0( 11)<='1';
        else
        D3F_temp_lv2_0( 11)<='0';
        end if;
        if(D3F_temp_lv1_0( 31)='1' AND D3F_temp_lv1_0( 32)='1' AND D3F_temp_lv1_0( 33)='1' )then
        D3F_temp_lv2_0( 12)<='1';
        else
        D3F_temp_lv2_0( 12)<='0';
        end if;
        if(D3F_temp_lv1_0( 34)='1' )then
        D3F_temp_lv2_0( 13)<='1';
        else
        D3F_temp_lv2_0( 13)<='0';
        end if;
        if(D3F_temp_lv1_1(  0)='1' )then
        D3F_temp_lv2_1(  0)<='1';
        else
        D3F_temp_lv2_1(  0)<='0';
        end if;
        if(D3F_temp_lv1_1(  1)='1' AND D3F_temp_lv1_1(  2)='1' )then
        D3F_temp_lv2_1(  1)<='1';
        else
        D3F_temp_lv2_1(  1)<='0';
        end if;
        if(D3F_temp_lv1_1(  3)='1' AND D3F_temp_lv1_1(  4)='1' )then
        D3F_temp_lv2_1(  2)<='1';
        else
        D3F_temp_lv2_1(  2)<='0';
        end if;
        if(D3F_temp_lv1_1(  5)='1' AND D3F_temp_lv1_1(  6)='1' )then
        D3F_temp_lv2_1(  3)<='1';
        else
        D3F_temp_lv2_1(  3)<='0';
        end if;
        if(D3F_temp_lv1_1(  7)='1' AND D3F_temp_lv1_1(  8)='1' )then
        D3F_temp_lv2_1(  4)<='1';
        else
        D3F_temp_lv2_1(  4)<='0';
        end if;
        if(D3F_temp_lv1_1(  9)='1' OR D3F_temp_lv1_1( 10)='1' OR D3F_temp_lv1_1( 11)='1' OR D3F_temp_lv1_1( 12)='1' )then
        D3F_temp_lv2_1(  5)<='1';
        else
        D3F_temp_lv2_1(  5)<='0';
        end if;
        if(D3F_temp_lv1_1( 13)='1' )then
        D3F_temp_lv2_1(  6)<='1';
        else
        D3F_temp_lv2_1(  6)<='0';
        end if;
        if(D3F_temp_lv1_1( 14)='1' AND D3F_temp_lv1_1( 15)='1' AND D3F_temp_lv1_1( 16)='1' )then
        D3F_temp_lv2_1(  7)<='1';
        else
        D3F_temp_lv2_1(  7)<='0';
        end if;
        if(D3F_temp_lv1_1( 17)='1' AND D3F_temp_lv1_1( 18)='1' AND D3F_temp_lv1_1( 19)='1' AND D3F_temp_lv1_1( 20)='1' )then
        D3F_temp_lv2_1(  8)<='1';
        else
        D3F_temp_lv2_1(  8)<='0';
        end if;
        if(D3F_temp_lv1_1( 21)='1' AND D3F_temp_lv1_1( 22)='1' AND D3F_temp_lv1_1( 23)='1' AND D3F_temp_lv1_1( 24)='1' )then
        D3F_temp_lv2_1(  9)<='1';
        else
        D3F_temp_lv2_1(  9)<='0';
        end if;
        if(D3F_temp_lv1_1( 25)='1' )then
        D3F_temp_lv2_1( 10)<='1';
        else
        D3F_temp_lv2_1( 10)<='0';
        end if;
        if(D3F_temp_lv1_1( 26)='1' AND D3F_temp_lv1_1( 27)='1' AND D3F_temp_lv1_1( 28)='1' AND D3F_temp_lv1_1( 29)='1' )then
        D3F_temp_lv2_1( 11)<='1';
        else
        D3F_temp_lv2_1( 11)<='0';
        end if;
        if(D3F_temp_lv1_1( 30)='1' AND D3F_temp_lv1_1( 31)='1' )then
        D3F_temp_lv2_1( 12)<='1';
        else
        D3F_temp_lv2_1( 12)<='0';
        end if;
        if(D3F_temp_lv1_1( 32)='1' AND D3F_temp_lv1_1( 33)='1' )then
        D3F_temp_lv2_1( 13)<='1';
        else
        D3F_temp_lv2_1( 13)<='0';
        end if;
        if(D3F_temp_lv1_1( 34)='1' AND D3F_temp_lv1_1( 35)='1' AND D3F_temp_lv1_1( 36)='1' AND D3F_temp_lv1_1( 37)='1' )then
        D3F_temp_lv2_1( 14)<='1';
        else
        D3F_temp_lv2_1( 14)<='0';
        end if;
        if(D3F_temp_lv1_1( 38)='1' AND D3F_temp_lv1_1( 39)='1' )then
        D3F_temp_lv2_1( 15)<='1';
        else
        D3F_temp_lv2_1( 15)<='0';
        end if;
        if(D3F_temp_lv1_1( 40)='1' AND D3F_temp_lv1_1( 41)='1' )then
        D3F_temp_lv2_1( 16)<='1';
        else
        D3F_temp_lv2_1( 16)<='0';
        end if;
        if(D3F_temp_lv1_1( 42)='1' AND D3F_temp_lv1_1( 43)='1' )then
        D3F_temp_lv2_1( 17)<='1';
        else
        D3F_temp_lv2_1( 17)<='0';
        end if;
        if(D3F_temp_lv1_1( 44)='1' )then
        D3F_temp_lv2_1( 18)<='1';
        else
        D3F_temp_lv2_1( 18)<='0';
        end if;
        if(D3F_temp_lv1_2(  0)='1' OR D3F_temp_lv1_2(  1)='1' )then
        D3F_temp_lv2_2(  0)<='1';
        else
        D3F_temp_lv2_2(  0)<='0';
        end if;
        if(D3F_temp_lv1_2(  2)='1' AND D3F_temp_lv1_2(  3)='1' )then
        D3F_temp_lv2_2(  1)<='1';
        else
        D3F_temp_lv2_2(  1)<='0';
        end if;
        if(D3F_temp_lv1_2(  4)='1' )then
        D3F_temp_lv2_2(  2)<='1';
        else
        D3F_temp_lv2_2(  2)<='0';
        end if;
        if(D3F_temp_lv1_2(  5)='1' AND D3F_temp_lv1_2(  6)='1' )then
        D3F_temp_lv2_2(  3)<='1';
        else
        D3F_temp_lv2_2(  3)<='0';
        end if;
        if(D3F_temp_lv1_2(  7)='1' )then
        D3F_temp_lv2_2(  4)<='1';
        else
        D3F_temp_lv2_2(  4)<='0';
        end if;
        if(D3F_temp_lv1_2(  8)='1' AND D3F_temp_lv1_2(  9)='1' )then
        D3F_temp_lv2_2(  5)<='1';
        else
        D3F_temp_lv2_2(  5)<='0';
        end if;
        if(D3F_temp_lv1_2( 10)='1' OR D3F_temp_lv1_2( 11)='1' )then
        D3F_temp_lv2_2(  6)<='1';
        else
        D3F_temp_lv2_2(  6)<='0';
        end if;
        if(D3F_temp_lv1_2( 12)='1' AND D3F_temp_lv1_2( 13)='1' )then
        D3F_temp_lv2_2(  7)<='1';
        else
        D3F_temp_lv2_2(  7)<='0';
        end if;
        if(D3F_temp_lv1_2( 14)='1' AND D3F_temp_lv1_2( 15)='1' AND D3F_temp_lv1_2( 16)='1' )then
        D3F_temp_lv2_2(  8)<='1';
        else
        D3F_temp_lv2_2(  8)<='0';
        end if;
        if(D3F_temp_lv1_2( 17)='1' AND D3F_temp_lv1_2( 18)='1' AND D3F_temp_lv1_2( 19)='1' AND D3F_temp_lv1_2( 20)='1' )then
        D3F_temp_lv2_2(  9)<='1';
        else
        D3F_temp_lv2_2(  9)<='0';
        end if;
        if(D3F_temp_lv1_2( 21)='1' AND D3F_temp_lv1_2( 22)='1' AND D3F_temp_lv1_2( 23)='1' )then
        D3F_temp_lv2_2( 10)<='1';
        else
        D3F_temp_lv2_2( 10)<='0';
        end if;
        if(D3F_temp_lv1_2( 24)='1' AND D3F_temp_lv1_2( 25)='1' )then
        D3F_temp_lv2_2( 11)<='1';
        else
        D3F_temp_lv2_2( 11)<='0';
        end if;
        if(D3F_temp_lv1_2( 26)='1' AND D3F_temp_lv1_2( 27)='1' AND D3F_temp_lv1_2( 28)='1' AND D3F_temp_lv1_2( 29)='1' )then
        D3F_temp_lv2_2( 12)<='1';
        else
        D3F_temp_lv2_2( 12)<='0';
        end if;
        if(D3F_temp_lv1_2( 30)='1' AND D3F_temp_lv1_2( 31)='1' )then
        D3F_temp_lv2_2( 13)<='1';
        else
        D3F_temp_lv2_2( 13)<='0';
        end if;
        if(D3F_temp_lv1_2( 32)='1' AND D3F_temp_lv1_2( 33)='1' )then
        D3F_temp_lv2_2( 14)<='1';
        else
        D3F_temp_lv2_2( 14)<='0';
        end if;
        if(D3F_temp_lv1_2( 34)='1' )then
        D3F_temp_lv2_2( 15)<='1';
        else
        D3F_temp_lv2_2( 15)<='0';
        end if;
        if(D3F_temp_lv1_2( 35)='1' AND D3F_temp_lv1_2( 36)='1' AND D3F_temp_lv1_2( 37)='1' AND D3F_temp_lv1_2( 38)='1' )then
        D3F_temp_lv2_2( 16)<='1';
        else
        D3F_temp_lv2_2( 16)<='0';
        end if;
        if(D3F_temp_lv1_2( 39)='1' AND D3F_temp_lv1_2( 40)='1' )then
        D3F_temp_lv2_2( 17)<='1';
        else
        D3F_temp_lv2_2( 17)<='0';
        end if;
        if(D3F_temp_lv1_2( 41)='1' OR D3F_temp_lv1_2( 42)='1' )then
        D3F_temp_lv2_2( 18)<='1';
        else
        D3F_temp_lv2_2( 18)<='0';
        end if;
        if(D3F_temp_lv1_3(  0)='1' )then
        D3F_temp_lv2_3(  0)<='1';
        else
        D3F_temp_lv2_3(  0)<='0';
        end if;
        if(D3F_temp_lv1_3(  1)='1' AND D3F_temp_lv1_3(  2)='1' )then
        D3F_temp_lv2_3(  1)<='1';
        else
        D3F_temp_lv2_3(  1)<='0';
        end if;
        if(D3F_temp_lv1_3(  3)='1' )then
        D3F_temp_lv2_3(  2)<='1';
        else
        D3F_temp_lv2_3(  2)<='0';
        end if;
        if(D3F_temp_lv1_3(  4)='1' AND D3F_temp_lv1_3(  5)='1' )then
        D3F_temp_lv2_3(  3)<='1';
        else
        D3F_temp_lv2_3(  3)<='0';
        end if;
        if(D3F_temp_lv1_3(  6)='1' OR D3F_temp_lv1_3(  7)='1' OR D3F_temp_lv1_3(  8)='1' )then
        D3F_temp_lv2_3(  4)<='1';
        else
        D3F_temp_lv2_3(  4)<='0';
        end if;
        if(D3F_temp_lv1_3(  9)='1' AND D3F_temp_lv1_3( 10)='1' )then
        D3F_temp_lv2_3(  5)<='1';
        else
        D3F_temp_lv2_3(  5)<='0';
        end if;
        if(D3F_temp_lv1_3( 11)='1' AND D3F_temp_lv1_3( 12)='1' AND D3F_temp_lv1_3( 13)='1' )then
        D3F_temp_lv2_3(  6)<='1';
        else
        D3F_temp_lv2_3(  6)<='0';
        end if;
        if(D3F_temp_lv1_3( 14)='1' AND D3F_temp_lv1_3( 15)='1' AND D3F_temp_lv1_3( 16)='1' AND D3F_temp_lv1_3( 17)='1' )then
        D3F_temp_lv2_3(  7)<='1';
        else
        D3F_temp_lv2_3(  7)<='0';
        end if;
        if(D3F_temp_lv1_3( 18)='1' AND D3F_temp_lv1_3( 19)='1' )then
        D3F_temp_lv2_3(  8)<='1';
        else
        D3F_temp_lv2_3(  8)<='0';
        end if;
        if(D3F_temp_lv1_3( 20)='1' AND D3F_temp_lv1_3( 21)='1' )then
        D3F_temp_lv2_3(  9)<='1';
        else
        D3F_temp_lv2_3(  9)<='0';
        end if;
        if(D3F_temp_lv1_3( 22)='1' AND D3F_temp_lv1_3( 23)='1' AND D3F_temp_lv1_3( 24)='1' AND D3F_temp_lv1_3( 25)='1' )then
        D3F_temp_lv2_3( 10)<='1';
        else
        D3F_temp_lv2_3( 10)<='0';
        end if;
        if(D3F_temp_lv1_3( 26)='1' AND D3F_temp_lv1_3( 27)='1' )then
        D3F_temp_lv2_3( 11)<='1';
        else
        D3F_temp_lv2_3( 11)<='0';
        end if;
        if(D3F_temp_lv1_3( 28)='1' AND D3F_temp_lv1_3( 29)='1' )then
        D3F_temp_lv2_3( 12)<='1';
        else
        D3F_temp_lv2_3( 12)<='0';
        end if;
        if(D3F_temp_lv1_3( 30)='1' )then
        D3F_temp_lv2_3( 13)<='1';
        else
        D3F_temp_lv2_3( 13)<='0';
        end if;
        if(D3F_temp_lv1_3( 31)='1' AND D3F_temp_lv1_3( 32)='1' )then
        D3F_temp_lv2_3( 14)<='1';
        else
        D3F_temp_lv2_3( 14)<='0';
        end if;
        if(D3F_temp_lv1_3( 33)='1' AND D3F_temp_lv1_3( 34)='1' AND D3F_temp_lv1_3( 35)='1' )then
        D3F_temp_lv2_3( 15)<='1';
        else
        D3F_temp_lv2_3( 15)<='0';
        end if;
        if(D3F_temp_lv1_3( 36)='1' OR D3F_temp_lv1_3( 37)='1' )then
        D3F_temp_lv2_3( 16)<='1';
        else
        D3F_temp_lv2_3( 16)<='0';
        end if;
        if(D3F_temp_lv1_4(  0)='1' OR D3F_temp_lv1_4(  1)='1' OR D3F_temp_lv1_4(  2)='1' OR D3F_temp_lv1_4(  3)='1' )then
        D3F_temp_lv2_4(  0)<='1';
        else
        D3F_temp_lv2_4(  0)<='0';
        end if;
        if(D3F_temp_lv1_4(  4)='1' AND D3F_temp_lv1_4(  5)='1' )then
        D3F_temp_lv2_4(  1)<='1';
        else
        D3F_temp_lv2_4(  1)<='0';
        end if;
        if(D3F_temp_lv1_4(  6)='1' AND D3F_temp_lv1_4(  7)='1' AND D3F_temp_lv1_4(  8)='1' )then
        D3F_temp_lv2_4(  2)<='1';
        else
        D3F_temp_lv2_4(  2)<='0';
        end if;
        if(D3F_temp_lv1_4(  9)='1' )then
        D3F_temp_lv2_4(  3)<='1';
        else
        D3F_temp_lv2_4(  3)<='0';
        end if;
        if(D3F_temp_lv1_4( 10)='1' AND D3F_temp_lv1_4( 11)='1' AND D3F_temp_lv1_4( 12)='1' AND D3F_temp_lv1_4( 13)='1' )then
        D3F_temp_lv2_4(  4)<='1';
        else
        D3F_temp_lv2_4(  4)<='0';
        end if;
        if(D3F_temp_lv1_4( 14)='1' AND D3F_temp_lv1_4( 15)='1' AND D3F_temp_lv1_4( 16)='1' AND D3F_temp_lv1_4( 17)='1' )then
        D3F_temp_lv2_4(  5)<='1';
        else
        D3F_temp_lv2_4(  5)<='0';
        end if;
        if(D3F_temp_lv1_4( 18)='1' AND D3F_temp_lv1_4( 19)='1' AND D3F_temp_lv1_4( 20)='1' )then
        D3F_temp_lv2_4(  6)<='1';
        else
        D3F_temp_lv2_4(  6)<='0';
        end if;
        if(D3F_temp_lv1_4( 21)='1' AND D3F_temp_lv1_4( 22)='1' )then
        D3F_temp_lv2_4(  7)<='1';
        else
        D3F_temp_lv2_4(  7)<='0';
        end if;
        if(D3F_temp_lv1_4( 23)='1' )then
        D3F_temp_lv2_4(  8)<='1';
        else
        D3F_temp_lv2_4(  8)<='0';
        end if;
        if(D3F_temp_lv1_4( 24)='1' AND D3F_temp_lv1_4( 25)='1' )then
        D3F_temp_lv2_4(  9)<='1';
        else
        D3F_temp_lv2_4(  9)<='0';
        end if;
        if(D3F_temp_lv1_4( 26)='1' AND D3F_temp_lv1_4( 27)='1' )then
        D3F_temp_lv2_4( 10)<='1';
        else
        D3F_temp_lv2_4( 10)<='0';
        end if;
        if(D3F_temp_lv1_4( 28)='1' AND D3F_temp_lv1_4( 29)='1' )then
        D3F_temp_lv2_4( 11)<='1';
        else
        D3F_temp_lv2_4( 11)<='0';
        end if;
        if(D3F_temp_lv1_4( 30)='1' OR D3F_temp_lv1_4( 31)='1' )then
        D3F_temp_lv2_4( 12)<='1';
        else
        D3F_temp_lv2_4( 12)<='0';
        end if;
        if(D3F_temp_lv1_5(  0)='1' AND D3F_temp_lv1_5(  1)='1' )then
        D3F_temp_lv2_5(  0)<='1';
        else
        D3F_temp_lv2_5(  0)<='0';
        end if;
        if(D3F_temp_lv1_5(  2)='1' AND D3F_temp_lv1_5(  3)='1' AND D3F_temp_lv1_5(  4)='1' AND D3F_temp_lv1_5(  5)='1' )then
        D3F_temp_lv2_5(  1)<='1';
        else
        D3F_temp_lv2_5(  1)<='0';
        end if;
        if(D3F_temp_lv1_5(  6)='1' OR D3F_temp_lv1_5(  7)='1' )then
        D3F_temp_lv2_5(  2)<='1';
        else
        D3F_temp_lv2_5(  2)<='0';
        end if;
        if(D3F_temp_lv1_5(  8)='1' AND D3F_temp_lv1_5(  9)='1' AND D3F_temp_lv1_5( 10)='1' AND D3F_temp_lv1_5( 11)='1' )then
        D3F_temp_lv2_5(  3)<='1';
        else
        D3F_temp_lv2_5(  3)<='0';
        end if;
        if(D3F_temp_lv1_5( 12)='1' AND D3F_temp_lv1_5( 13)='1' AND D3F_temp_lv1_5( 14)='1' AND D3F_temp_lv1_5( 15)='1' )then
        D3F_temp_lv2_5(  4)<='1';
        else
        D3F_temp_lv2_5(  4)<='0';
        end if;
        if(D3F_temp_lv1_5( 16)='1' OR D3F_temp_lv1_5( 17)='1' )then
        D3F_temp_lv2_5(  5)<='1';
        else
        D3F_temp_lv2_5(  5)<='0';
        end if;
        if(D3F_temp_lv1_5( 18)='1' AND D3F_temp_lv1_5( 19)='1' AND D3F_temp_lv1_5( 20)='1' AND D3F_temp_lv1_5( 21)='1' )then
        D3F_temp_lv2_5(  6)<='1';
        else
        D3F_temp_lv2_5(  6)<='0';
        end if;
        if(D3F_temp_lv1_5( 22)='1' AND D3F_temp_lv1_5( 23)='1' )then
        D3F_temp_lv2_5(  7)<='1';
        else
        D3F_temp_lv2_5(  7)<='0';
        end if;
        if(D3F_temp_lv1_5( 24)='1' AND D3F_temp_lv1_5( 25)='1' AND D3F_temp_lv1_5( 26)='1' )then
        D3F_temp_lv2_5(  8)<='1';
        else
        D3F_temp_lv2_5(  8)<='0';
        end if;
        if(D3F_temp_lv1_5( 27)='1' AND D3F_temp_lv1_5( 28)='1' )then
        D3F_temp_lv2_5(  9)<='1';
        else
        D3F_temp_lv2_5(  9)<='0';
        end if;
        if(D3F_temp_lv1_5( 29)='1' OR D3F_temp_lv1_5( 30)='1' )then
        D3F_temp_lv2_5( 10)<='1';
        else
        D3F_temp_lv2_5( 10)<='0';
        end if;
        if(D3F_temp_lv1_5( 31)='1' AND D3F_temp_lv1_5( 32)='1' )then
        D3F_temp_lv2_5( 11)<='1';
        else
        D3F_temp_lv2_5( 11)<='0';
        end if;
        if(D3F_temp_lv1_5( 33)='1' )then
        D3F_temp_lv2_5( 12)<='1';
        else
        D3F_temp_lv2_5( 12)<='0';
        end if;
        if(D3F_temp_lv1_5( 34)='1' AND D3F_temp_lv1_5( 35)='1' )then
        D3F_temp_lv2_5( 13)<='1';
        else
        D3F_temp_lv2_5( 13)<='0';
        end if;
        if(D3F_temp_lv1_5( 36)='1' AND D3F_temp_lv1_5( 37)='1' )then
        D3F_temp_lv2_5( 14)<='1';
        else
        D3F_temp_lv2_5( 14)<='0';
        end if;
        if(D3F_temp_lv1_5( 38)='1' )then
        D3F_temp_lv2_5( 15)<='1';
        else
        D3F_temp_lv2_5( 15)<='0';
        end if;
        if(D3F_temp_lv1_5( 39)='1' AND D3F_temp_lv1_5( 40)='1' )then
        D3F_temp_lv2_5( 16)<='1';
        else
        D3F_temp_lv2_5( 16)<='0';
        end if;
        if(D3F_temp_lv1_5( 41)='1' OR D3F_temp_lv1_5( 42)='1' OR D3F_temp_lv1_5( 43)='1' )then
        D3F_temp_lv2_5( 17)<='1';
        else
        D3F_temp_lv2_5( 17)<='0';
        end if;
        if(D3F_temp_lv1_6(  0)='1' AND D3F_temp_lv1_6(  1)='1' )then
        D3F_temp_lv2_6(  0)<='1';
        else
        D3F_temp_lv2_6(  0)<='0';
        end if;
        if(D3F_temp_lv1_6(  2)='1' )then
        D3F_temp_lv2_6(  1)<='1';
        else
        D3F_temp_lv2_6(  1)<='0';
        end if;
        if(D3F_temp_lv1_6(  3)='1' AND D3F_temp_lv1_6(  4)='1' AND D3F_temp_lv1_6(  5)='1' AND D3F_temp_lv1_6(  6)='1' )then
        D3F_temp_lv2_6(  2)<='1';
        else
        D3F_temp_lv2_6(  2)<='0';
        end if;
        if(D3F_temp_lv1_6(  7)='1' )then
        D3F_temp_lv2_6(  3)<='1';
        else
        D3F_temp_lv2_6(  3)<='0';
        end if;
        if(D3F_temp_lv1_6(  8)='1' AND D3F_temp_lv1_6(  9)='1' AND D3F_temp_lv1_6( 10)='1' AND D3F_temp_lv1_6( 11)='1' )then
        D3F_temp_lv2_6(  4)<='1';
        else
        D3F_temp_lv2_6(  4)<='0';
        end if;
        if(D3F_temp_lv1_6( 12)='1' AND D3F_temp_lv1_6( 13)='1' )then
        D3F_temp_lv2_6(  5)<='1';
        else
        D3F_temp_lv2_6(  5)<='0';
        end if;
        if(D3F_temp_lv1_6( 14)='1' OR D3F_temp_lv1_6( 15)='1' )then
        D3F_temp_lv2_6(  6)<='1';
        else
        D3F_temp_lv2_6(  6)<='0';
        end if;
        if(D3F_temp_lv1_6( 16)='1' AND D3F_temp_lv1_6( 17)='1' AND D3F_temp_lv1_6( 18)='1' AND D3F_temp_lv1_6( 19)='1' )then
        D3F_temp_lv2_6(  7)<='1';
        else
        D3F_temp_lv2_6(  7)<='0';
        end if;
        if(D3F_temp_lv1_6( 20)='1' AND D3F_temp_lv1_6( 21)='1' )then
        D3F_temp_lv2_6(  8)<='1';
        else
        D3F_temp_lv2_6(  8)<='0';
        end if;
        if(D3F_temp_lv1_6( 22)='1' AND D3F_temp_lv1_6( 23)='1' AND D3F_temp_lv1_6( 24)='1' )then
        D3F_temp_lv2_6(  9)<='1';
        else
        D3F_temp_lv2_6(  9)<='0';
        end if;
        if(D3F_temp_lv1_6( 25)='1' AND D3F_temp_lv1_6( 26)='1' )then
        D3F_temp_lv2_6( 10)<='1';
        else
        D3F_temp_lv2_6( 10)<='0';
        end if;
        if(D3F_temp_lv1_6( 27)='1' AND D3F_temp_lv1_6( 28)='1' )then
        D3F_temp_lv2_6( 11)<='1';
        else
        D3F_temp_lv2_6( 11)<='0';
        end if;
        if(D3F_temp_lv1_6( 29)='1' OR D3F_temp_lv1_6( 30)='1' )then
        D3F_temp_lv2_6( 12)<='1';
        else
        D3F_temp_lv2_6( 12)<='0';
        end if;
        if(D3F_temp_lv1_6( 31)='1' AND D3F_temp_lv1_6( 32)='1' )then
        D3F_temp_lv2_6( 13)<='1';
        else
        D3F_temp_lv2_6( 13)<='0';
        end if;
        if(D3F_temp_lv1_6( 33)='1' )then
        D3F_temp_lv2_6( 14)<='1';
        else
        D3F_temp_lv2_6( 14)<='0';
        end if;
        if(D3F_temp_lv1_6( 34)='1' AND D3F_temp_lv1_6( 35)='1' )then
        D3F_temp_lv2_6( 15)<='1';
        else
        D3F_temp_lv2_6( 15)<='0';
        end if;
        if(D3F_temp_lv1_6( 36)='1' OR D3F_temp_lv1_6( 37)='1' OR D3F_temp_lv1_6( 38)='1' )then
        D3F_temp_lv2_6( 16)<='1';
        else
        D3F_temp_lv2_6( 16)<='0';
        end if;
        if(D3F_temp_lv1_7(  0)='1' OR D3F_temp_lv1_7(  1)='1' )then
        D3F_temp_lv2_7(  0)<='1';
        else
        D3F_temp_lv2_7(  0)<='0';
        end if;
        if(D3F_temp_lv1_7(  2)='1' AND D3F_temp_lv1_7(  3)='1' AND D3F_temp_lv1_7(  4)='1' )then
        D3F_temp_lv2_7(  1)<='1';
        else
        D3F_temp_lv2_7(  1)<='0';
        end if;
        if(D3F_temp_lv1_7(  5)='1' AND D3F_temp_lv1_7(  6)='1' )then
        D3F_temp_lv2_7(  2)<='1';
        else
        D3F_temp_lv2_7(  2)<='0';
        end if;
        if(D3F_temp_lv1_7(  7)='1' AND D3F_temp_lv1_7(  8)='1' AND D3F_temp_lv1_7(  9)='1' AND D3F_temp_lv1_7( 10)='1' )then
        D3F_temp_lv2_7(  3)<='1';
        else
        D3F_temp_lv2_7(  3)<='0';
        end if;
        if(D3F_temp_lv1_7( 11)='1' AND D3F_temp_lv1_7( 12)='1' )then
        D3F_temp_lv2_7(  4)<='1';
        else
        D3F_temp_lv2_7(  4)<='0';
        end if;
        if(D3F_temp_lv1_7( 13)='1' )then
        D3F_temp_lv2_7(  5)<='1';
        else
        D3F_temp_lv2_7(  5)<='0';
        end if;
        if(D3F_temp_lv1_7( 14)='1' AND D3F_temp_lv1_7( 15)='1' AND D3F_temp_lv1_7( 16)='1' AND D3F_temp_lv1_7( 17)='1' )then
        D3F_temp_lv2_7(  6)<='1';
        else
        D3F_temp_lv2_7(  6)<='0';
        end if;
        if(D3F_temp_lv1_7( 18)='1' AND D3F_temp_lv1_7( 19)='1' )then
        D3F_temp_lv2_7(  7)<='1';
        else
        D3F_temp_lv2_7(  7)<='0';
        end if;
        if(D3F_temp_lv1_7( 20)='1' AND D3F_temp_lv1_7( 21)='1' AND D3F_temp_lv1_7( 22)='1' )then
        D3F_temp_lv2_7(  8)<='1';
        else
        D3F_temp_lv2_7(  8)<='0';
        end if;
        if(D3F_temp_lv1_7( 23)='1' AND D3F_temp_lv1_7( 24)='1' )then
        D3F_temp_lv2_7(  9)<='1';
        else
        D3F_temp_lv2_7(  9)<='0';
        end if;
        if(D3F_temp_lv1_7( 25)='1' OR D3F_temp_lv1_7( 26)='1' OR D3F_temp_lv1_7( 27)='1' OR D3F_temp_lv1_7( 28)='1' )then
        D3F_temp_lv2_7( 10)<='1';
        else
        D3F_temp_lv2_7( 10)<='0';
        end if;
        if(D3F_temp_lv1_7( 29)='1' AND D3F_temp_lv1_7( 30)='1' )then
        D3F_temp_lv2_7( 11)<='1';
        else
        D3F_temp_lv2_7( 11)<='0';
        end if;
        if(D3F_temp_lv1_7( 31)='1' )then
        D3F_temp_lv2_7( 12)<='1';
        else
        D3F_temp_lv2_7( 12)<='0';
        end if;
        if(D3F_temp_lv1_7( 32)='1' AND D3F_temp_lv1_7( 33)='1' )then
        D3F_temp_lv2_7( 13)<='1';
        else
        D3F_temp_lv2_7( 13)<='0';
        end if;
        if(D3F_temp_lv1_7( 34)='1' OR D3F_temp_lv1_7( 35)='1' OR D3F_temp_lv1_7( 36)='1' OR D3F_temp_lv1_7( 37)='1' )then
        D3F_temp_lv2_7( 14)<='1';
        else
        D3F_temp_lv2_7( 14)<='0';
        end if;
        if(D4F_temp_lv1_0(  0)='1' AND D4F_temp_lv1_0(  1)='1' AND D4F_temp_lv1_0(  2)='1' AND D4F_temp_lv1_0(  3)='1' )then
        D4F_temp_lv2_0(  0)<='1';
        else
        D4F_temp_lv2_0(  0)<='0';
        end if;
        if(D4F_temp_lv1_0(  4)='1' AND D4F_temp_lv1_0(  5)='1' )then
        D4F_temp_lv2_0(  1)<='1';
        else
        D4F_temp_lv2_0(  1)<='0';
        end if;
        if(D4F_temp_lv1_0(  6)='1' AND D4F_temp_lv1_0(  7)='1' AND D4F_temp_lv1_0(  8)='1' AND D4F_temp_lv1_0(  9)='1' )then
        D4F_temp_lv2_0(  2)<='1';
        else
        D4F_temp_lv2_0(  2)<='0';
        end if;
        if(D4F_temp_lv1_0( 10)='1' AND D4F_temp_lv1_0( 11)='1' )then
        D4F_temp_lv2_0(  3)<='1';
        else
        D4F_temp_lv2_0(  3)<='0';
        end if;
        if(D4F_temp_lv1_0( 12)='1' AND D4F_temp_lv1_0( 13)='1' AND D4F_temp_lv1_0( 14)='1' )then
        D4F_temp_lv2_0(  4)<='1';
        else
        D4F_temp_lv2_0(  4)<='0';
        end if;
        if(D4F_temp_lv1_0( 15)='1' AND D4F_temp_lv1_0( 16)='1' AND D4F_temp_lv1_0( 17)='1' AND D4F_temp_lv1_0( 18)='1' )then
        D4F_temp_lv2_0(  5)<='1';
        else
        D4F_temp_lv2_0(  5)<='0';
        end if;
        if(D4F_temp_lv1_0( 19)='1' )then
        D4F_temp_lv2_0(  6)<='1';
        else
        D4F_temp_lv2_0(  6)<='0';
        end if;
        if(D4F_temp_lv1_0( 20)='1' )then
        D4F_temp_lv2_0(  7)<='1';
        else
        D4F_temp_lv2_0(  7)<='0';
        end if;
        if(D4F_temp_lv1_0( 21)='1' AND D4F_temp_lv1_0( 22)='1' AND D4F_temp_lv1_0( 23)='1' AND D4F_temp_lv1_0( 24)='1' )then
        D4F_temp_lv2_0(  8)<='1';
        else
        D4F_temp_lv2_0(  8)<='0';
        end if;
        if(D4F_temp_lv1_0( 25)='1' AND D4F_temp_lv1_0( 26)='1' )then
        D4F_temp_lv2_0(  9)<='1';
        else
        D4F_temp_lv2_0(  9)<='0';
        end if;
        if(D4F_temp_lv1_0( 27)='1' AND D4F_temp_lv1_0( 28)='1' )then
        D4F_temp_lv2_0( 10)<='1';
        else
        D4F_temp_lv2_0( 10)<='0';
        end if;
        if(D4F_temp_lv1_0( 29)='1' )then
        D4F_temp_lv2_0( 11)<='1';
        else
        D4F_temp_lv2_0( 11)<='0';
        end if;
        if(D4F_temp_lv1_0( 30)='1' AND D4F_temp_lv1_0( 31)='1' AND D4F_temp_lv1_0( 32)='1' )then
        D4F_temp_lv2_0( 12)<='1';
        else
        D4F_temp_lv2_0( 12)<='0';
        end if;
        if(D4F_temp_lv1_0( 33)='1' AND D4F_temp_lv1_0( 34)='1' )then
        D4F_temp_lv2_0( 13)<='1';
        else
        D4F_temp_lv2_0( 13)<='0';
        end if;
        if(D4F_temp_lv1_1(  0)='1' AND D4F_temp_lv1_1(  1)='1' )then
        D4F_temp_lv2_1(  0)<='1';
        else
        D4F_temp_lv2_1(  0)<='0';
        end if;
        if(D4F_temp_lv1_1(  2)='1' AND D4F_temp_lv1_1(  3)='1' AND D4F_temp_lv1_1(  4)='1' AND D4F_temp_lv1_1(  5)='1' )then
        D4F_temp_lv2_1(  1)<='1';
        else
        D4F_temp_lv2_1(  1)<='0';
        end if;
        if(D4F_temp_lv1_1(  6)='1' AND D4F_temp_lv1_1(  7)='1' AND D4F_temp_lv1_1(  8)='1' AND D4F_temp_lv1_1(  9)='1' )then
        D4F_temp_lv2_1(  2)<='1';
        else
        D4F_temp_lv2_1(  2)<='0';
        end if;
        if(D4F_temp_lv1_1( 10)='1' )then
        D4F_temp_lv2_1(  3)<='1';
        else
        D4F_temp_lv2_1(  3)<='0';
        end if;
        if(D4F_temp_lv1_1( 11)='1' AND D4F_temp_lv1_1( 12)='1' )then
        D4F_temp_lv2_1(  4)<='1';
        else
        D4F_temp_lv2_1(  4)<='0';
        end if;
        if(D4F_temp_lv1_1( 13)='1' AND D4F_temp_lv1_1( 14)='1' AND D4F_temp_lv1_1( 15)='1' AND D4F_temp_lv1_1( 16)='1' )then
        D4F_temp_lv2_1(  5)<='1';
        else
        D4F_temp_lv2_1(  5)<='0';
        end if;
        if(D4F_temp_lv1_1( 17)='1' AND D4F_temp_lv1_1( 18)='1' AND D4F_temp_lv1_1( 19)='1' AND D4F_temp_lv1_1( 20)='1' )then
        D4F_temp_lv2_1(  6)<='1';
        else
        D4F_temp_lv2_1(  6)<='0';
        end if;
        if(D4F_temp_lv1_1( 21)='1' AND D4F_temp_lv1_1( 22)='1' AND D4F_temp_lv1_1( 23)='1' AND D4F_temp_lv1_1( 24)='1' )then
        D4F_temp_lv2_1(  7)<='1';
        else
        D4F_temp_lv2_1(  7)<='0';
        end if;
        if(D4F_temp_lv1_1( 25)='1' AND D4F_temp_lv1_1( 26)='1' AND D4F_temp_lv1_1( 27)='1' )then
        D4F_temp_lv2_1(  8)<='1';
        else
        D4F_temp_lv2_1(  8)<='0';
        end if;
        if(D4F_temp_lv1_1( 28)='1' AND D4F_temp_lv1_1( 29)='1' AND D4F_temp_lv1_1( 30)='1' AND D4F_temp_lv1_1( 31)='1' )then
        D4F_temp_lv2_1(  9)<='1';
        else
        D4F_temp_lv2_1(  9)<='0';
        end if;
        if(D4F_temp_lv1_1( 32)='1' )then
        D4F_temp_lv2_1( 10)<='1';
        else
        D4F_temp_lv2_1( 10)<='0';
        end if;
        if(D4F_temp_lv1_1( 33)='1' AND D4F_temp_lv1_1( 34)='1' )then
        D4F_temp_lv2_1( 11)<='1';
        else
        D4F_temp_lv2_1( 11)<='0';
        end if;
        if(D4F_temp_lv1_1( 35)='1' AND D4F_temp_lv1_1( 36)='1' AND D4F_temp_lv1_1( 37)='1' AND D4F_temp_lv1_1( 38)='1' )then
        D4F_temp_lv2_1( 12)<='1';
        else
        D4F_temp_lv2_1( 12)<='0';
        end if;
        if(D4F_temp_lv1_1( 39)='1' AND D4F_temp_lv1_1( 40)='1' AND D4F_temp_lv1_1( 41)='1' AND D4F_temp_lv1_1( 42)='1' )then
        D4F_temp_lv2_1( 13)<='1';
        else
        D4F_temp_lv2_1( 13)<='0';
        end if;
        if(D4F_temp_lv1_1( 43)='1' OR D4F_temp_lv1_1( 44)='1' )then
        D4F_temp_lv2_1( 14)<='1';
        else
        D4F_temp_lv2_1( 14)<='0';
        end if;
        if(D4F_temp_lv1_2(  0)='1' AND D4F_temp_lv1_2(  1)='1' )then
        D4F_temp_lv2_2(  0)<='1';
        else
        D4F_temp_lv2_2(  0)<='0';
        end if;
        if(D4F_temp_lv1_2(  2)='1' AND D4F_temp_lv1_2(  3)='1' AND D4F_temp_lv1_2(  4)='1' AND D4F_temp_lv1_2(  5)='1' )then
        D4F_temp_lv2_2(  1)<='1';
        else
        D4F_temp_lv2_2(  1)<='0';
        end if;
        if(D4F_temp_lv1_2(  6)='1' AND D4F_temp_lv1_2(  7)='1' AND D4F_temp_lv1_2(  8)='1' AND D4F_temp_lv1_2(  9)='1' )then
        D4F_temp_lv2_2(  2)<='1';
        else
        D4F_temp_lv2_2(  2)<='0';
        end if;
        if(D4F_temp_lv1_2( 10)='1' AND D4F_temp_lv1_2( 11)='1' )then
        D4F_temp_lv2_2(  3)<='1';
        else
        D4F_temp_lv2_2(  3)<='0';
        end if;
        if(D4F_temp_lv1_2( 12)='1' )then
        D4F_temp_lv2_2(  4)<='1';
        else
        D4F_temp_lv2_2(  4)<='0';
        end if;
        if(D4F_temp_lv1_2( 13)='1' AND D4F_temp_lv1_2( 14)='1' AND D4F_temp_lv1_2( 15)='1' AND D4F_temp_lv1_2( 16)='1' )then
        D4F_temp_lv2_2(  5)<='1';
        else
        D4F_temp_lv2_2(  5)<='0';
        end if;
        if(D4F_temp_lv1_2( 17)='1' AND D4F_temp_lv1_2( 18)='1' AND D4F_temp_lv1_2( 19)='1' AND D4F_temp_lv1_2( 20)='1' )then
        D4F_temp_lv2_2(  6)<='1';
        else
        D4F_temp_lv2_2(  6)<='0';
        end if;
        if(D4F_temp_lv1_2( 21)='1' AND D4F_temp_lv1_2( 22)='1' AND D4F_temp_lv1_2( 23)='1' AND D4F_temp_lv1_2( 24)='1' )then
        D4F_temp_lv2_2(  7)<='1';
        else
        D4F_temp_lv2_2(  7)<='0';
        end if;
        if(D4F_temp_lv1_2( 25)='1' AND D4F_temp_lv1_2( 26)='1' )then
        D4F_temp_lv2_2(  8)<='1';
        else
        D4F_temp_lv2_2(  8)<='0';
        end if;
        if(D4F_temp_lv1_2( 27)='1' )then
        D4F_temp_lv2_2(  9)<='1';
        else
        D4F_temp_lv2_2(  9)<='0';
        end if;
        if(D4F_temp_lv1_2( 28)='1' AND D4F_temp_lv1_2( 29)='1' AND D4F_temp_lv1_2( 30)='1' AND D4F_temp_lv1_2( 31)='1' )then
        D4F_temp_lv2_2( 10)<='1';
        else
        D4F_temp_lv2_2( 10)<='0';
        end if;
        if(D4F_temp_lv1_2( 32)='1' AND D4F_temp_lv1_2( 33)='1' )then
        D4F_temp_lv2_2( 11)<='1';
        else
        D4F_temp_lv2_2( 11)<='0';
        end if;
        if(D4F_temp_lv1_2( 34)='1' AND D4F_temp_lv1_2( 35)='1' AND D4F_temp_lv1_2( 36)='1' )then
        D4F_temp_lv2_2( 12)<='1';
        else
        D4F_temp_lv2_2( 12)<='0';
        end if;
        if(D4F_temp_lv1_2( 37)='1' AND D4F_temp_lv1_2( 38)='1' AND D4F_temp_lv1_2( 39)='1' )then
        D4F_temp_lv2_2( 13)<='1';
        else
        D4F_temp_lv2_2( 13)<='0';
        end if;
        if(D4F_temp_lv1_2( 40)='1' AND D4F_temp_lv1_2( 41)='1' )then
        D4F_temp_lv2_2( 14)<='1';
        else
        D4F_temp_lv2_2( 14)<='0';
        end if;
        if(D4F_temp_lv1_2( 42)='1' )then
        D4F_temp_lv2_2( 15)<='1';
        else
        D4F_temp_lv2_2( 15)<='0';
        end if;
        if(D4F_temp_lv1_3(  0)='1' )then
        D4F_temp_lv2_3(  0)<='1';
        else
        D4F_temp_lv2_3(  0)<='0';
        end if;
        if(D4F_temp_lv1_3(  1)='1' AND D4F_temp_lv1_3(  2)='1' AND D4F_temp_lv1_3(  3)='1' AND D4F_temp_lv1_3(  4)='1' )then
        D4F_temp_lv2_3(  1)<='1';
        else
        D4F_temp_lv2_3(  1)<='0';
        end if;
        if(D4F_temp_lv1_3(  5)='1' AND D4F_temp_lv1_3(  6)='1' AND D4F_temp_lv1_3(  7)='1' )then
        D4F_temp_lv2_3(  2)<='1';
        else
        D4F_temp_lv2_3(  2)<='0';
        end if;
        if(D4F_temp_lv1_3(  8)='1' AND D4F_temp_lv1_3(  9)='1' AND D4F_temp_lv1_3( 10)='1' AND D4F_temp_lv1_3( 11)='1' )then
        D4F_temp_lv2_3(  3)<='1';
        else
        D4F_temp_lv2_3(  3)<='0';
        end if;
        if(D4F_temp_lv1_3( 12)='1' AND D4F_temp_lv1_3( 13)='1' AND D4F_temp_lv1_3( 14)='1' AND D4F_temp_lv1_3( 15)='1' )then
        D4F_temp_lv2_3(  4)<='1';
        else
        D4F_temp_lv2_3(  4)<='0';
        end if;
        if(D4F_temp_lv1_3( 16)='1' AND D4F_temp_lv1_3( 17)='1' AND D4F_temp_lv1_3( 18)='1' AND D4F_temp_lv1_3( 19)='1' )then
        D4F_temp_lv2_3(  5)<='1';
        else
        D4F_temp_lv2_3(  5)<='0';
        end if;
        if(D4F_temp_lv1_3( 20)='1' AND D4F_temp_lv1_3( 21)='1' )then
        D4F_temp_lv2_3(  6)<='1';
        else
        D4F_temp_lv2_3(  6)<='0';
        end if;
        if(D4F_temp_lv1_3( 22)='1' AND D4F_temp_lv1_3( 23)='1' )then
        D4F_temp_lv2_3(  7)<='1';
        else
        D4F_temp_lv2_3(  7)<='0';
        end if;
        if(D4F_temp_lv1_3( 24)='1' AND D4F_temp_lv1_3( 25)='1' AND D4F_temp_lv1_3( 26)='1' )then
        D4F_temp_lv2_3(  8)<='1';
        else
        D4F_temp_lv2_3(  8)<='0';
        end if;
        if(D4F_temp_lv1_3( 27)='1' AND D4F_temp_lv1_3( 28)='1' )then
        D4F_temp_lv2_3(  9)<='1';
        else
        D4F_temp_lv2_3(  9)<='0';
        end if;
        if(D4F_temp_lv1_3( 29)='1' AND D4F_temp_lv1_3( 30)='1' AND D4F_temp_lv1_3( 31)='1' )then
        D4F_temp_lv2_3( 10)<='1';
        else
        D4F_temp_lv2_3( 10)<='0';
        end if;
        if(D4F_temp_lv1_3( 32)='1' AND D4F_temp_lv1_3( 33)='1' AND D4F_temp_lv1_3( 34)='1' )then
        D4F_temp_lv2_3( 11)<='1';
        else
        D4F_temp_lv2_3( 11)<='0';
        end if;
        if(D4F_temp_lv1_3( 35)='1' AND D4F_temp_lv1_3( 36)='1' )then
        D4F_temp_lv2_3( 12)<='1';
        else
        D4F_temp_lv2_3( 12)<='0';
        end if;
        if(D4F_temp_lv1_3( 37)='1' )then
        D4F_temp_lv2_3( 13)<='1';
        else
        D4F_temp_lv2_3( 13)<='0';
        end if;
        if(D4F_temp_lv1_4(  0)='1' AND D4F_temp_lv1_4(  1)='1' )then
        D4F_temp_lv2_4(  0)<='1';
        else
        D4F_temp_lv2_4(  0)<='0';
        end if;
        if(D4F_temp_lv1_4(  2)='1' )then
        D4F_temp_lv2_4(  1)<='1';
        else
        D4F_temp_lv2_4(  1)<='0';
        end if;
        if(D4F_temp_lv1_4(  3)='1' AND D4F_temp_lv1_4(  4)='1' )then
        D4F_temp_lv2_4(  2)<='1';
        else
        D4F_temp_lv2_4(  2)<='0';
        end if;
        if(D4F_temp_lv1_4(  5)='1' AND D4F_temp_lv1_4(  6)='1' )then
        D4F_temp_lv2_4(  3)<='1';
        else
        D4F_temp_lv2_4(  3)<='0';
        end if;
        if(D4F_temp_lv1_4(  7)='1' AND D4F_temp_lv1_4(  8)='1' )then
        D4F_temp_lv2_4(  4)<='1';
        else
        D4F_temp_lv2_4(  4)<='0';
        end if;
        if(D4F_temp_lv1_4(  9)='1' AND D4F_temp_lv1_4( 10)='1' AND D4F_temp_lv1_4( 11)='1' )then
        D4F_temp_lv2_4(  5)<='1';
        else
        D4F_temp_lv2_4(  5)<='0';
        end if;
        if(D4F_temp_lv1_4( 12)='1' AND D4F_temp_lv1_4( 13)='1' AND D4F_temp_lv1_4( 14)='1' AND D4F_temp_lv1_4( 15)='1' )then
        D4F_temp_lv2_4(  6)<='1';
        else
        D4F_temp_lv2_4(  6)<='0';
        end if;
        if(D4F_temp_lv1_4( 16)='1' AND D4F_temp_lv1_4( 17)='1' )then
        D4F_temp_lv2_4(  7)<='1';
        else
        D4F_temp_lv2_4(  7)<='0';
        end if;
        if(D4F_temp_lv1_4( 18)='1' AND D4F_temp_lv1_4( 19)='1' AND D4F_temp_lv1_4( 20)='1' AND D4F_temp_lv1_4( 21)='1' )then
        D4F_temp_lv2_4(  8)<='1';
        else
        D4F_temp_lv2_4(  8)<='0';
        end if;
        if(D4F_temp_lv1_4( 22)='1' )then
        D4F_temp_lv2_4(  9)<='1';
        else
        D4F_temp_lv2_4(  9)<='0';
        end if;
        if(D4F_temp_lv1_4( 23)='1' AND D4F_temp_lv1_4( 24)='1' AND D4F_temp_lv1_4( 25)='1' AND D4F_temp_lv1_4( 26)='1' )then
        D4F_temp_lv2_4( 10)<='1';
        else
        D4F_temp_lv2_4( 10)<='0';
        end if;
        if(D4F_temp_lv1_4( 27)='1' AND D4F_temp_lv1_4( 28)='1' AND D4F_temp_lv1_4( 29)='1' AND D4F_temp_lv1_4( 30)='1' )then
        D4F_temp_lv2_4( 11)<='1';
        else
        D4F_temp_lv2_4( 11)<='0';
        end if;
        if(D4F_temp_lv1_4( 31)='1' )then
        D4F_temp_lv2_4( 12)<='1';
        else
        D4F_temp_lv2_4( 12)<='0';
        end if;
        if(D4F_temp_lv1_5(  0)='1' )then
        D4F_temp_lv2_5(  0)<='1';
        else
        D4F_temp_lv2_5(  0)<='0';
        end if;
        if(D4F_temp_lv1_5(  1)='1' AND D4F_temp_lv1_5(  2)='1' )then
        D4F_temp_lv2_5(  1)<='1';
        else
        D4F_temp_lv2_5(  1)<='0';
        end if;
        if(D4F_temp_lv1_5(  3)='1' AND D4F_temp_lv1_5(  4)='1' AND D4F_temp_lv1_5(  5)='1' AND D4F_temp_lv1_5(  6)='1' )then
        D4F_temp_lv2_5(  2)<='1';
        else
        D4F_temp_lv2_5(  2)<='0';
        end if;
        if(D4F_temp_lv1_5(  7)='1' AND D4F_temp_lv1_5(  8)='1' )then
        D4F_temp_lv2_5(  3)<='1';
        else
        D4F_temp_lv2_5(  3)<='0';
        end if;
        if(D4F_temp_lv1_5(  9)='1' )then
        D4F_temp_lv2_5(  4)<='1';
        else
        D4F_temp_lv2_5(  4)<='0';
        end if;
        if(D4F_temp_lv1_5( 10)='1' AND D4F_temp_lv1_5( 11)='1' AND D4F_temp_lv1_5( 12)='1' )then
        D4F_temp_lv2_5(  5)<='1';
        else
        D4F_temp_lv2_5(  5)<='0';
        end if;
        if(D4F_temp_lv1_5( 13)='1' AND D4F_temp_lv1_5( 14)='1' AND D4F_temp_lv1_5( 15)='1' )then
        D4F_temp_lv2_5(  6)<='1';
        else
        D4F_temp_lv2_5(  6)<='0';
        end if;
        if(D4F_temp_lv1_5( 16)='1' AND D4F_temp_lv1_5( 17)='1' AND D4F_temp_lv1_5( 18)='1' AND D4F_temp_lv1_5( 19)='1' )then
        D4F_temp_lv2_5(  7)<='1';
        else
        D4F_temp_lv2_5(  7)<='0';
        end if;
        if(D4F_temp_lv1_5( 20)='1' AND D4F_temp_lv1_5( 21)='1' AND D4F_temp_lv1_5( 22)='1' AND D4F_temp_lv1_5( 23)='1' )then
        D4F_temp_lv2_5(  8)<='1';
        else
        D4F_temp_lv2_5(  8)<='0';
        end if;
        if(D4F_temp_lv1_5( 24)='1' AND D4F_temp_lv1_5( 25)='1' AND D4F_temp_lv1_5( 26)='1' )then
        D4F_temp_lv2_5(  9)<='1';
        else
        D4F_temp_lv2_5(  9)<='0';
        end if;
        if(D4F_temp_lv1_5( 27)='1' )then
        D4F_temp_lv2_5( 10)<='1';
        else
        D4F_temp_lv2_5( 10)<='0';
        end if;
        if(D4F_temp_lv1_5( 28)='1' AND D4F_temp_lv1_5( 29)='1' AND D4F_temp_lv1_5( 30)='1' AND D4F_temp_lv1_5( 31)='1' )then
        D4F_temp_lv2_5( 11)<='1';
        else
        D4F_temp_lv2_5( 11)<='0';
        end if;
        if(D4F_temp_lv1_5( 32)='1' AND D4F_temp_lv1_5( 33)='1' )then
        D4F_temp_lv2_5( 12)<='1';
        else
        D4F_temp_lv2_5( 12)<='0';
        end if;
        if(D4F_temp_lv1_5( 34)='1' AND D4F_temp_lv1_5( 35)='1' AND D4F_temp_lv1_5( 36)='1' AND D4F_temp_lv1_5( 37)='1' )then
        D4F_temp_lv2_5( 13)<='1';
        else
        D4F_temp_lv2_5( 13)<='0';
        end if;
        if(D4F_temp_lv1_5( 38)='1' AND D4F_temp_lv1_5( 39)='1' AND D4F_temp_lv1_5( 40)='1' AND D4F_temp_lv1_5( 41)='1' )then
        D4F_temp_lv2_5( 14)<='1';
        else
        D4F_temp_lv2_5( 14)<='0';
        end if;
        if(D4F_temp_lv1_5( 42)='1' AND D4F_temp_lv1_5( 43)='1' )then
        D4F_temp_lv2_5( 15)<='1';
        else
        D4F_temp_lv2_5( 15)<='0';
        end if;
        if(D4F_temp_lv1_6(  0)='1' AND D4F_temp_lv1_6(  1)='1' )then
        D4F_temp_lv2_6(  0)<='1';
        else
        D4F_temp_lv2_6(  0)<='0';
        end if;
        if(D4F_temp_lv1_6(  2)='1' AND D4F_temp_lv1_6(  3)='1' )then
        D4F_temp_lv2_6(  1)<='1';
        else
        D4F_temp_lv2_6(  1)<='0';
        end if;
        if(D4F_temp_lv1_6(  4)='1' AND D4F_temp_lv1_6(  5)='1' AND D4F_temp_lv1_6(  6)='1' AND D4F_temp_lv1_6(  7)='1' )then
        D4F_temp_lv2_6(  2)<='1';
        else
        D4F_temp_lv2_6(  2)<='0';
        end if;
        if(D4F_temp_lv1_6(  8)='1' OR D4F_temp_lv1_6(  9)='1' )then
        D4F_temp_lv2_6(  3)<='1';
        else
        D4F_temp_lv2_6(  3)<='0';
        end if;
        if(D4F_temp_lv1_6( 10)='1' AND D4F_temp_lv1_6( 11)='1' AND D4F_temp_lv1_6( 12)='1' AND D4F_temp_lv1_6( 13)='1' )then
        D4F_temp_lv2_6(  4)<='1';
        else
        D4F_temp_lv2_6(  4)<='0';
        end if;
        if(D4F_temp_lv1_6( 14)='1' AND D4F_temp_lv1_6( 15)='1' AND D4F_temp_lv1_6( 16)='1' )then
        D4F_temp_lv2_6(  5)<='1';
        else
        D4F_temp_lv2_6(  5)<='0';
        end if;
        if(D4F_temp_lv1_6( 17)='1' )then
        D4F_temp_lv2_6(  6)<='1';
        else
        D4F_temp_lv2_6(  6)<='0';
        end if;
        if(D4F_temp_lv1_6( 18)='1' AND D4F_temp_lv1_6( 19)='1' AND D4F_temp_lv1_6( 20)='1' AND D4F_temp_lv1_6( 21)='1' )then
        D4F_temp_lv2_6(  7)<='1';
        else
        D4F_temp_lv2_6(  7)<='0';
        end if;
        if(D4F_temp_lv1_6( 22)='1' AND D4F_temp_lv1_6( 23)='1' AND D4F_temp_lv1_6( 24)='1' )then
        D4F_temp_lv2_6(  8)<='1';
        else
        D4F_temp_lv2_6(  8)<='0';
        end if;
        if(D4F_temp_lv1_6( 25)='1' )then
        D4F_temp_lv2_6(  9)<='1';
        else
        D4F_temp_lv2_6(  9)<='0';
        end if;
        if(D4F_temp_lv1_6( 26)='1' AND D4F_temp_lv1_6( 27)='1' AND D4F_temp_lv1_6( 28)='1' AND D4F_temp_lv1_6( 29)='1' )then
        D4F_temp_lv2_6( 10)<='1';
        else
        D4F_temp_lv2_6( 10)<='0';
        end if;
        if(D4F_temp_lv1_6( 30)='1' AND D4F_temp_lv1_6( 31)='1' AND D4F_temp_lv1_6( 32)='1' )then
        D4F_temp_lv2_6( 11)<='1';
        else
        D4F_temp_lv2_6( 11)<='0';
        end if;
        if(D4F_temp_lv1_6( 33)='1' AND D4F_temp_lv1_6( 34)='1' AND D4F_temp_lv1_6( 35)='1' AND D4F_temp_lv1_6( 36)='1' )then
        D4F_temp_lv2_6( 12)<='1';
        else
        D4F_temp_lv2_6( 12)<='0';
        end if;
        if(D4F_temp_lv1_6( 37)='1' AND D4F_temp_lv1_6( 38)='1' )then
        D4F_temp_lv2_6( 13)<='1';
        else
        D4F_temp_lv2_6( 13)<='0';
        end if;
        if(D4F_temp_lv1_7(  0)='1' AND D4F_temp_lv1_7(  1)='1' )then
        D4F_temp_lv2_7(  0)<='1';
        else
        D4F_temp_lv2_7(  0)<='0';
        end if;
        if(D4F_temp_lv1_7(  2)='1' AND D4F_temp_lv1_7(  3)='1' AND D4F_temp_lv1_7(  4)='1' AND D4F_temp_lv1_7(  5)='1' )then
        D4F_temp_lv2_7(  1)<='1';
        else
        D4F_temp_lv2_7(  1)<='0';
        end if;
        if(D4F_temp_lv1_7(  6)='1' AND D4F_temp_lv1_7(  7)='1' )then
        D4F_temp_lv2_7(  2)<='1';
        else
        D4F_temp_lv2_7(  2)<='0';
        end if;
        if(D4F_temp_lv1_7(  8)='1' AND D4F_temp_lv1_7(  9)='1' AND D4F_temp_lv1_7( 10)='1' AND D4F_temp_lv1_7( 11)='1' )then
        D4F_temp_lv2_7(  3)<='1';
        else
        D4F_temp_lv2_7(  3)<='0';
        end if;
        if(D4F_temp_lv1_7( 12)='1' AND D4F_temp_lv1_7( 13)='1' AND D4F_temp_lv1_7( 14)='1' )then
        D4F_temp_lv2_7(  4)<='1';
        else
        D4F_temp_lv2_7(  4)<='0';
        end if;
        if(D4F_temp_lv1_7( 15)='1' AND D4F_temp_lv1_7( 16)='1' AND D4F_temp_lv1_7( 17)='1' AND D4F_temp_lv1_7( 18)='1' )then
        D4F_temp_lv2_7(  5)<='1';
        else
        D4F_temp_lv2_7(  5)<='0';
        end if;
        if(D4F_temp_lv1_7( 19)='1' AND D4F_temp_lv1_7( 20)='1' AND D4F_temp_lv1_7( 21)='1' )then
        D4F_temp_lv2_7(  6)<='1';
        else
        D4F_temp_lv2_7(  6)<='0';
        end if;
        if(D4F_temp_lv1_7( 22)='1' AND D4F_temp_lv1_7( 23)='1' AND D4F_temp_lv1_7( 24)='1' AND D4F_temp_lv1_7( 25)='1' )then
        D4F_temp_lv2_7(  7)<='1';
        else
        D4F_temp_lv2_7(  7)<='0';
        end if;
        if(D4F_temp_lv1_7( 26)='1' AND D4F_temp_lv1_7( 27)='1' AND D4F_temp_lv1_7( 28)='1' AND D4F_temp_lv1_7( 29)='1' )then
        D4F_temp_lv2_7(  8)<='1';
        else
        D4F_temp_lv2_7(  8)<='0';
        end if;
        if(D4F_temp_lv1_7( 30)='1' AND D4F_temp_lv1_7( 31)='1' AND D4F_temp_lv1_7( 32)='1' AND D4F_temp_lv1_7( 33)='1' )then
        D4F_temp_lv2_7(  9)<='1';
        else
        D4F_temp_lv2_7(  9)<='0';
        end if;
        if(D4F_temp_lv1_7( 34)='1' AND D4F_temp_lv1_7( 35)='1' )then
        D4F_temp_lv2_7( 10)<='1';
        else
        D4F_temp_lv2_7( 10)<='0';
        end if;
        if(D4F_temp_lv1_7( 36)='1' OR D4F_temp_lv1_7( 37)='1' )then
        D4F_temp_lv2_7( 11)<='1';
        else
        D4F_temp_lv2_7( 11)<='0';
        end if;
 end if;
end process;
lookuptable_LV3 : process(c1)    
begin
 if c1'event and c1='1' then
        if(D0F_temp_lv2_0(  0)='1' OR D0F_temp_lv2_0(  1)='1' OR D0F_temp_lv2_0(  2)='1' OR D0F_temp_lv2_0(  3)='1' )then
        D0F_temp_lv3_0(  0)<='1';
        else
        D0F_temp_lv3_0(  0)<='0';
        end if;
        if(D0F_temp_lv2_0(  4)='1' OR D0F_temp_lv2_0(  5)='1' OR D0F_temp_lv2_0(  6)='1' OR D0F_temp_lv2_0(  7)='1' )then
        D0F_temp_lv3_0(  1)<='1';
        else
        D0F_temp_lv3_0(  1)<='0';
        end if;
        if(D0F_temp_lv2_0(  8)='1' )then
        D0F_temp_lv3_0(  2)<='1';
        else
        D0F_temp_lv3_0(  2)<='0';
        end if;
        if(D0F_temp_lv2_1(  0)='1' OR D0F_temp_lv2_1(  1)='1' OR D0F_temp_lv2_1(  2)='1' OR D0F_temp_lv2_1(  3)='1' )then
        D0F_temp_lv3_1(  0)<='1';
        else
        D0F_temp_lv3_1(  0)<='0';
        end if;
        if(D0F_temp_lv2_1(  4)='1' OR D0F_temp_lv2_1(  5)='1' OR D0F_temp_lv2_1(  6)='1' OR D0F_temp_lv2_1(  7)='1' )then
        D0F_temp_lv3_1(  1)<='1';
        else
        D0F_temp_lv3_1(  1)<='0';
        end if;
        if(D0F_temp_lv2_1(  8)='1' OR D0F_temp_lv2_1(  9)='1' OR D0F_temp_lv2_1( 10)='1' OR D0F_temp_lv2_1( 11)='1' )then
        D0F_temp_lv3_1(  2)<='1';
        else
        D0F_temp_lv3_1(  2)<='0';
        end if;
        if(D0F_temp_lv2_2(  0)='1' OR D0F_temp_lv2_2(  1)='1' OR D0F_temp_lv2_2(  2)='1' OR D0F_temp_lv2_2(  3)='1' )then
        D0F_temp_lv3_2(  0)<='1';
        else
        D0F_temp_lv3_2(  0)<='0';
        end if;
        if(D0F_temp_lv2_2(  4)='1' OR D0F_temp_lv2_2(  5)='1' OR D0F_temp_lv2_2(  6)='1' OR D0F_temp_lv2_2(  7)='1' )then
        D0F_temp_lv3_2(  1)<='1';
        else
        D0F_temp_lv3_2(  1)<='0';
        end if;
        if(D0F_temp_lv2_2(  8)='1' OR D0F_temp_lv2_2(  9)='1' OR D0F_temp_lv2_2( 10)='1' )then
        D0F_temp_lv3_2(  2)<='1';
        else
        D0F_temp_lv3_2(  2)<='0';
        end if;
        if(D0F_temp_lv2_3(  0)='1' OR D0F_temp_lv2_3(  1)='1' OR D0F_temp_lv2_3(  2)='1' OR D0F_temp_lv2_3(  3)='1' )then
        D0F_temp_lv3_3(  0)<='1';
        else
        D0F_temp_lv3_3(  0)<='0';
        end if;
        if(D0F_temp_lv2_3(  4)='1' OR D0F_temp_lv2_3(  5)='1' OR D0F_temp_lv2_3(  6)='1' OR D0F_temp_lv2_3(  7)='1' )then
        D0F_temp_lv3_3(  1)<='1';
        else
        D0F_temp_lv3_3(  1)<='0';
        end if;
        if(D0F_temp_lv2_3(  8)='1' OR D0F_temp_lv2_3(  9)='1' )then
        D0F_temp_lv3_3(  2)<='1';
        else
        D0F_temp_lv3_3(  2)<='0';
        end if;
        if(D0F_temp_lv2_4(  0)='1' OR D0F_temp_lv2_4(  1)='1' OR D0F_temp_lv2_4(  2)='1' OR D0F_temp_lv2_4(  3)='1' )then
        D0F_temp_lv3_4(  0)<='1';
        else
        D0F_temp_lv3_4(  0)<='0';
        end if;
        if(D0F_temp_lv2_4(  4)='1' OR D0F_temp_lv2_4(  5)='1' OR D0F_temp_lv2_4(  6)='1' OR D0F_temp_lv2_4(  7)='1' )then
        D0F_temp_lv3_4(  1)<='1';
        else
        D0F_temp_lv3_4(  1)<='0';
        end if;
        if(D0F_temp_lv2_5(  0)='1' OR D0F_temp_lv2_5(  1)='1' OR D0F_temp_lv2_5(  2)='1' OR D0F_temp_lv2_5(  3)='1' )then
        D0F_temp_lv3_5(  0)<='1';
        else
        D0F_temp_lv3_5(  0)<='0';
        end if;
        if(D0F_temp_lv2_5(  4)='1' OR D0F_temp_lv2_5(  5)='1' OR D0F_temp_lv2_5(  6)='1' OR D0F_temp_lv2_5(  7)='1' )then
        D0F_temp_lv3_5(  1)<='1';
        else
        D0F_temp_lv3_5(  1)<='0';
        end if;
        if(D0F_temp_lv2_5(  8)='1' OR D0F_temp_lv2_5(  9)='1' OR D0F_temp_lv2_5( 10)='1' )then
        D0F_temp_lv3_5(  2)<='1';
        else
        D0F_temp_lv3_5(  2)<='0';
        end if;
        if(D0F_temp_lv2_6(  0)='1' OR D0F_temp_lv2_6(  1)='1' OR D0F_temp_lv2_6(  2)='1' OR D0F_temp_lv2_6(  3)='1' )then
        D0F_temp_lv3_6(  0)<='1';
        else
        D0F_temp_lv3_6(  0)<='0';
        end if;
        if(D0F_temp_lv2_6(  4)='1' OR D0F_temp_lv2_6(  5)='1' OR D0F_temp_lv2_6(  6)='1' OR D0F_temp_lv2_6(  7)='1' )then
        D0F_temp_lv3_6(  1)<='1';
        else
        D0F_temp_lv3_6(  1)<='0';
        end if;
        if(D0F_temp_lv2_6(  8)='1' OR D0F_temp_lv2_6(  9)='1' )then
        D0F_temp_lv3_6(  2)<='1';
        else
        D0F_temp_lv3_6(  2)<='0';
        end if;
        if(D0F_temp_lv2_7(  0)='1' OR D0F_temp_lv2_7(  1)='1' OR D0F_temp_lv2_7(  2)='1' OR D0F_temp_lv2_7(  3)='1' )then
        D0F_temp_lv3_7(  0)<='1';
        else
        D0F_temp_lv3_7(  0)<='0';
        end if;
        if(D0F_temp_lv2_7(  4)='1' OR D0F_temp_lv2_7(  5)='1' OR D0F_temp_lv2_7(  6)='1' OR D0F_temp_lv2_7(  7)='1' )then
        D0F_temp_lv3_7(  1)<='1';
        else
        D0F_temp_lv3_7(  1)<='0';
        end if;
        if(D0F_temp_lv2_7(  8)='1' OR D0F_temp_lv2_7(  9)='1' )then
        D0F_temp_lv3_7(  2)<='1';
        else
        D0F_temp_lv3_7(  2)<='0';
        end if;
        if(D1F_temp_lv2_0(  0)='1' OR D1F_temp_lv2_0(  1)='1' OR D1F_temp_lv2_0(  2)='1' OR D1F_temp_lv2_0(  3)='1' )then
        D1F_temp_lv3_0(  0)<='1';
        else
        D1F_temp_lv3_0(  0)<='0';
        end if;
        if(D1F_temp_lv2_0(  4)='1' OR D1F_temp_lv2_0(  5)='1' )then
        D1F_temp_lv3_0(  1)<='1';
        else
        D1F_temp_lv3_0(  1)<='0';
        end if;
        if(D1F_temp_lv2_1(  0)='1' OR D1F_temp_lv2_1(  1)='1' OR D1F_temp_lv2_1(  2)='1' OR D1F_temp_lv2_1(  3)='1' )then
        D1F_temp_lv3_1(  0)<='1';
        else
        D1F_temp_lv3_1(  0)<='0';
        end if;
        if(D1F_temp_lv2_1(  4)='1' OR D1F_temp_lv2_1(  5)='1' OR D1F_temp_lv2_1(  6)='1' OR D1F_temp_lv2_1(  7)='1' )then
        D1F_temp_lv3_1(  1)<='1';
        else
        D1F_temp_lv3_1(  1)<='0';
        end if;
        if(D1F_temp_lv2_1(  8)='1' OR D1F_temp_lv2_1(  9)='1' OR D1F_temp_lv2_1( 10)='1' OR D1F_temp_lv2_1( 11)='1' )then
        D1F_temp_lv3_1(  2)<='1';
        else
        D1F_temp_lv3_1(  2)<='0';
        end if;
        if(D1F_temp_lv2_1( 12)='1' OR D1F_temp_lv2_1( 13)='1' OR D1F_temp_lv2_1( 14)='1' OR D1F_temp_lv2_1( 15)='1' )then
        D1F_temp_lv3_1(  3)<='1';
        else
        D1F_temp_lv3_1(  3)<='0';
        end if;
        if(D1F_temp_lv2_1( 16)='1' OR D1F_temp_lv2_1( 17)='1' OR D1F_temp_lv2_1( 18)='1' OR D1F_temp_lv2_1( 19)='1' )then
        D1F_temp_lv3_1(  4)<='1';
        else
        D1F_temp_lv3_1(  4)<='0';
        end if;
        if(D1F_temp_lv2_2(  0)='1' OR D1F_temp_lv2_2(  1)='1' OR D1F_temp_lv2_2(  2)='1' OR D1F_temp_lv2_2(  3)='1' )then
        D1F_temp_lv3_2(  0)<='1';
        else
        D1F_temp_lv3_2(  0)<='0';
        end if;
        if(D1F_temp_lv2_2(  4)='1' OR D1F_temp_lv2_2(  5)='1' OR D1F_temp_lv2_2(  6)='1' OR D1F_temp_lv2_2(  7)='1' )then
        D1F_temp_lv3_2(  1)<='1';
        else
        D1F_temp_lv3_2(  1)<='0';
        end if;
        if(D1F_temp_lv2_2(  8)='1' OR D1F_temp_lv2_2(  9)='1' OR D1F_temp_lv2_2( 10)='1' OR D1F_temp_lv2_2( 11)='1' )then
        D1F_temp_lv3_2(  2)<='1';
        else
        D1F_temp_lv3_2(  2)<='0';
        end if;
        if(D1F_temp_lv2_2( 12)='1' OR D1F_temp_lv2_2( 13)='1' OR D1F_temp_lv2_2( 14)='1' OR D1F_temp_lv2_2( 15)='1' )then
        D1F_temp_lv3_2(  3)<='1';
        else
        D1F_temp_lv3_2(  3)<='0';
        end if;
        if(D1F_temp_lv2_2( 16)='1' OR D1F_temp_lv2_2( 17)='1' OR D1F_temp_lv2_2( 18)='1' OR D1F_temp_lv2_2( 19)='1' )then
        D1F_temp_lv3_2(  4)<='1';
        else
        D1F_temp_lv3_2(  4)<='0';
        end if;
        if(D1F_temp_lv2_2( 20)='1' OR D1F_temp_lv2_2( 21)='1' OR D1F_temp_lv2_2( 22)='1' )then
        D1F_temp_lv3_2(  5)<='1';
        else
        D1F_temp_lv3_2(  5)<='0';
        end if;
        if(D1F_temp_lv2_3(  0)='1' OR D1F_temp_lv2_3(  1)='1' OR D1F_temp_lv2_3(  2)='1' OR D1F_temp_lv2_3(  3)='1' )then
        D1F_temp_lv3_3(  0)<='1';
        else
        D1F_temp_lv3_3(  0)<='0';
        end if;
        if(D1F_temp_lv2_3(  4)='1' OR D1F_temp_lv2_3(  5)='1' OR D1F_temp_lv2_3(  6)='1' OR D1F_temp_lv2_3(  7)='1' )then
        D1F_temp_lv3_3(  1)<='1';
        else
        D1F_temp_lv3_3(  1)<='0';
        end if;
        if(D1F_temp_lv2_3(  8)='1' OR D1F_temp_lv2_3(  9)='1' OR D1F_temp_lv2_3( 10)='1' OR D1F_temp_lv2_3( 11)='1' )then
        D1F_temp_lv3_3(  2)<='1';
        else
        D1F_temp_lv3_3(  2)<='0';
        end if;
        if(D1F_temp_lv2_3( 12)='1' OR D1F_temp_lv2_3( 13)='1' OR D1F_temp_lv2_3( 14)='1' OR D1F_temp_lv2_3( 15)='1' )then
        D1F_temp_lv3_3(  3)<='1';
        else
        D1F_temp_lv3_3(  3)<='0';
        end if;
        if(D1F_temp_lv2_3( 16)='1' OR D1F_temp_lv2_3( 17)='1' OR D1F_temp_lv2_3( 18)='1' )then
        D1F_temp_lv3_3(  4)<='1';
        else
        D1F_temp_lv3_3(  4)<='0';
        end if;
        if(D1F_temp_lv2_4(  0)='1' OR D1F_temp_lv2_4(  1)='1' OR D1F_temp_lv2_4(  2)='1' OR D1F_temp_lv2_4(  3)='1' )then
        D1F_temp_lv3_4(  0)<='1';
        else
        D1F_temp_lv3_4(  0)<='0';
        end if;
        if(D1F_temp_lv2_4(  4)='1' OR D1F_temp_lv2_4(  5)='1' )then
        D1F_temp_lv3_4(  1)<='1';
        else
        D1F_temp_lv3_4(  1)<='0';
        end if;
        if(D1F_temp_lv2_5(  0)='1' OR D1F_temp_lv2_5(  1)='1' OR D1F_temp_lv2_5(  2)='1' OR D1F_temp_lv2_5(  3)='1' )then
        D1F_temp_lv3_5(  0)<='1';
        else
        D1F_temp_lv3_5(  0)<='0';
        end if;
        if(D1F_temp_lv2_5(  4)='1' OR D1F_temp_lv2_5(  5)='1' OR D1F_temp_lv2_5(  6)='1' OR D1F_temp_lv2_5(  7)='1' )then
        D1F_temp_lv3_5(  1)<='1';
        else
        D1F_temp_lv3_5(  1)<='0';
        end if;
        if(D1F_temp_lv2_5(  8)='1' OR D1F_temp_lv2_5(  9)='1' OR D1F_temp_lv2_5( 10)='1' OR D1F_temp_lv2_5( 11)='1' )then
        D1F_temp_lv3_5(  2)<='1';
        else
        D1F_temp_lv3_5(  2)<='0';
        end if;
        if(D1F_temp_lv2_5( 12)='1' OR D1F_temp_lv2_5( 13)='1' OR D1F_temp_lv2_5( 14)='1' OR D1F_temp_lv2_5( 15)='1' )then
        D1F_temp_lv3_5(  3)<='1';
        else
        D1F_temp_lv3_5(  3)<='0';
        end if;
        if(D1F_temp_lv2_5( 16)='1' OR D1F_temp_lv2_5( 17)='1' OR D1F_temp_lv2_5( 18)='1' OR D1F_temp_lv2_5( 19)='1' )then
        D1F_temp_lv3_5(  4)<='1';
        else
        D1F_temp_lv3_5(  4)<='0';
        end if;
        if(D1F_temp_lv2_5( 20)='1' OR D1F_temp_lv2_5( 21)='1' OR D1F_temp_lv2_5( 22)='1' )then
        D1F_temp_lv3_5(  5)<='1';
        else
        D1F_temp_lv3_5(  5)<='0';
        end if;
        if(D1F_temp_lv2_6(  0)='1' OR D1F_temp_lv2_6(  1)='1' OR D1F_temp_lv2_6(  2)='1' OR D1F_temp_lv2_6(  3)='1' )then
        D1F_temp_lv3_6(  0)<='1';
        else
        D1F_temp_lv3_6(  0)<='0';
        end if;
        if(D1F_temp_lv2_6(  4)='1' OR D1F_temp_lv2_6(  5)='1' OR D1F_temp_lv2_6(  6)='1' OR D1F_temp_lv2_6(  7)='1' )then
        D1F_temp_lv3_6(  1)<='1';
        else
        D1F_temp_lv3_6(  1)<='0';
        end if;
        if(D1F_temp_lv2_6(  8)='1' OR D1F_temp_lv2_6(  9)='1' OR D1F_temp_lv2_6( 10)='1' OR D1F_temp_lv2_6( 11)='1' )then
        D1F_temp_lv3_6(  2)<='1';
        else
        D1F_temp_lv3_6(  2)<='0';
        end if;
        if(D1F_temp_lv2_6( 12)='1' OR D1F_temp_lv2_6( 13)='1' OR D1F_temp_lv2_6( 14)='1' OR D1F_temp_lv2_6( 15)='1' )then
        D1F_temp_lv3_6(  3)<='1';
        else
        D1F_temp_lv3_6(  3)<='0';
        end if;
        if(D1F_temp_lv2_6( 16)='1' OR D1F_temp_lv2_6( 17)='1' OR D1F_temp_lv2_6( 18)='1' OR D1F_temp_lv2_6( 19)='1' )then
        D1F_temp_lv3_6(  4)<='1';
        else
        D1F_temp_lv3_6(  4)<='0';
        end if;
        if(D1F_temp_lv2_6( 20)='1' OR D1F_temp_lv2_6( 21)='1' OR D1F_temp_lv2_6( 22)='1' )then
        D1F_temp_lv3_6(  5)<='1';
        else
        D1F_temp_lv3_6(  5)<='0';
        end if;
        if(D1F_temp_lv2_7(  0)='1' OR D1F_temp_lv2_7(  1)='1' OR D1F_temp_lv2_7(  2)='1' OR D1F_temp_lv2_7(  3)='1' )then
        D1F_temp_lv3_7(  0)<='1';
        else
        D1F_temp_lv3_7(  0)<='0';
        end if;
        if(D1F_temp_lv2_7(  4)='1' OR D1F_temp_lv2_7(  5)='1' OR D1F_temp_lv2_7(  6)='1' OR D1F_temp_lv2_7(  7)='1' )then
        D1F_temp_lv3_7(  1)<='1';
        else
        D1F_temp_lv3_7(  1)<='0';
        end if;
        if(D1F_temp_lv2_7(  8)='1' OR D1F_temp_lv2_7(  9)='1' OR D1F_temp_lv2_7( 10)='1' OR D1F_temp_lv2_7( 11)='1' )then
        D1F_temp_lv3_7(  2)<='1';
        else
        D1F_temp_lv3_7(  2)<='0';
        end if;
        if(D1F_temp_lv2_7( 12)='1' OR D1F_temp_lv2_7( 13)='1' OR D1F_temp_lv2_7( 14)='1' OR D1F_temp_lv2_7( 15)='1' )then
        D1F_temp_lv3_7(  3)<='1';
        else
        D1F_temp_lv3_7(  3)<='0';
        end if;
        if(D1F_temp_lv2_7( 16)='1' OR D1F_temp_lv2_7( 17)='1' OR D1F_temp_lv2_7( 18)='1' )then
        D1F_temp_lv3_7(  4)<='1';
        else
        D1F_temp_lv3_7(  4)<='0';
        end if;
        if(D2F_temp_lv2_0(  0)='1' OR D2F_temp_lv2_0(  1)='1' OR D2F_temp_lv2_0(  2)='1' OR D2F_temp_lv2_0(  3)='1' )then
        D2F_temp_lv3_0(  0)<='1';
        else
        D2F_temp_lv3_0(  0)<='0';
        end if;
        if(D2F_temp_lv2_0(  4)='1' OR D2F_temp_lv2_0(  5)='1' OR D2F_temp_lv2_0(  6)='1' OR D2F_temp_lv2_0(  7)='1' )then
        D2F_temp_lv3_0(  1)<='1';
        else
        D2F_temp_lv3_0(  1)<='0';
        end if;
        if(D2F_temp_lv2_0(  8)='1' OR D2F_temp_lv2_0(  9)='1' OR D2F_temp_lv2_0( 10)='1' OR D2F_temp_lv2_0( 11)='1' )then
        D2F_temp_lv3_0(  2)<='1';
        else
        D2F_temp_lv3_0(  2)<='0';
        end if;
        if(D2F_temp_lv2_0( 12)='1' OR D2F_temp_lv2_0( 13)='1' OR D2F_temp_lv2_0( 14)='1' OR D2F_temp_lv2_0( 15)='1' )then
        D2F_temp_lv3_0(  3)<='1';
        else
        D2F_temp_lv3_0(  3)<='0';
        end if;
        if(D2F_temp_lv2_0( 16)='1' OR D2F_temp_lv2_0( 17)='1' OR D2F_temp_lv2_0( 18)='1' )then
        D2F_temp_lv3_0(  4)<='1';
        else
        D2F_temp_lv3_0(  4)<='0';
        end if;
        if(D2F_temp_lv2_1(  0)='1' OR D2F_temp_lv2_1(  1)='1' OR D2F_temp_lv2_1(  2)='1' OR D2F_temp_lv2_1(  3)='1' )then
        D2F_temp_lv3_1(  0)<='1';
        else
        D2F_temp_lv3_1(  0)<='0';
        end if;
        if(D2F_temp_lv2_1(  4)='1' OR D2F_temp_lv2_1(  5)='1' OR D2F_temp_lv2_1(  6)='1' OR D2F_temp_lv2_1(  7)='1' )then
        D2F_temp_lv3_1(  1)<='1';
        else
        D2F_temp_lv3_1(  1)<='0';
        end if;
        if(D2F_temp_lv2_1(  8)='1' OR D2F_temp_lv2_1(  9)='1' OR D2F_temp_lv2_1( 10)='1' OR D2F_temp_lv2_1( 11)='1' )then
        D2F_temp_lv3_1(  2)<='1';
        else
        D2F_temp_lv3_1(  2)<='0';
        end if;
        if(D2F_temp_lv2_1( 12)='1' OR D2F_temp_lv2_1( 13)='1' OR D2F_temp_lv2_1( 14)='1' OR D2F_temp_lv2_1( 15)='1' )then
        D2F_temp_lv3_1(  3)<='1';
        else
        D2F_temp_lv3_1(  3)<='0';
        end if;
        if(D2F_temp_lv2_1( 16)='1' OR D2F_temp_lv2_1( 17)='1' OR D2F_temp_lv2_1( 18)='1' OR D2F_temp_lv2_1( 19)='1' )then
        D2F_temp_lv3_1(  4)<='1';
        else
        D2F_temp_lv3_1(  4)<='0';
        end if;
        if(D2F_temp_lv2_1( 20)='1' )then
        D2F_temp_lv3_1(  5)<='1';
        else
        D2F_temp_lv3_1(  5)<='0';
        end if;
        if(D2F_temp_lv2_2(  0)='1' OR D2F_temp_lv2_2(  1)='1' OR D2F_temp_lv2_2(  2)='1' OR D2F_temp_lv2_2(  3)='1' )then
        D2F_temp_lv3_2(  0)<='1';
        else
        D2F_temp_lv3_2(  0)<='0';
        end if;
        if(D2F_temp_lv2_2(  4)='1' OR D2F_temp_lv2_2(  5)='1' OR D2F_temp_lv2_2(  6)='1' OR D2F_temp_lv2_2(  7)='1' )then
        D2F_temp_lv3_2(  1)<='1';
        else
        D2F_temp_lv3_2(  1)<='0';
        end if;
        if(D2F_temp_lv2_2(  8)='1' OR D2F_temp_lv2_2(  9)='1' OR D2F_temp_lv2_2( 10)='1' OR D2F_temp_lv2_2( 11)='1' )then
        D2F_temp_lv3_2(  2)<='1';
        else
        D2F_temp_lv3_2(  2)<='0';
        end if;
        if(D2F_temp_lv2_2( 12)='1' OR D2F_temp_lv2_2( 13)='1' OR D2F_temp_lv2_2( 14)='1' OR D2F_temp_lv2_2( 15)='1' )then
        D2F_temp_lv3_2(  3)<='1';
        else
        D2F_temp_lv3_2(  3)<='0';
        end if;
        if(D2F_temp_lv2_2( 16)='1' OR D2F_temp_lv2_2( 17)='1' OR D2F_temp_lv2_2( 18)='1' OR D2F_temp_lv2_2( 19)='1' )then
        D2F_temp_lv3_2(  4)<='1';
        else
        D2F_temp_lv3_2(  4)<='0';
        end if;
        if(D2F_temp_lv2_2( 20)='1' )then
        D2F_temp_lv3_2(  5)<='1';
        else
        D2F_temp_lv3_2(  5)<='0';
        end if;
        if(D2F_temp_lv2_3(  0)='1' OR D2F_temp_lv2_3(  1)='1' OR D2F_temp_lv2_3(  2)='1' OR D2F_temp_lv2_3(  3)='1' )then
        D2F_temp_lv3_3(  0)<='1';
        else
        D2F_temp_lv3_3(  0)<='0';
        end if;
        if(D2F_temp_lv2_3(  4)='1' OR D2F_temp_lv2_3(  5)='1' OR D2F_temp_lv2_3(  6)='1' OR D2F_temp_lv2_3(  7)='1' )then
        D2F_temp_lv3_3(  1)<='1';
        else
        D2F_temp_lv3_3(  1)<='0';
        end if;
        if(D2F_temp_lv2_3(  8)='1' OR D2F_temp_lv2_3(  9)='1' OR D2F_temp_lv2_3( 10)='1' OR D2F_temp_lv2_3( 11)='1' )then
        D2F_temp_lv3_3(  2)<='1';
        else
        D2F_temp_lv3_3(  2)<='0';
        end if;
        if(D2F_temp_lv2_3( 12)='1' OR D2F_temp_lv2_3( 13)='1' OR D2F_temp_lv2_3( 14)='1' OR D2F_temp_lv2_3( 15)='1' )then
        D2F_temp_lv3_3(  3)<='1';
        else
        D2F_temp_lv3_3(  3)<='0';
        end if;
        if(D2F_temp_lv2_3( 16)='1' OR D2F_temp_lv2_3( 17)='1' )then
        D2F_temp_lv3_3(  4)<='1';
        else
        D2F_temp_lv3_3(  4)<='0';
        end if;
        if(D2F_temp_lv2_4(  0)='1' OR D2F_temp_lv2_4(  1)='1' OR D2F_temp_lv2_4(  2)='1' OR D2F_temp_lv2_4(  3)='1' )then
        D2F_temp_lv3_4(  0)<='1';
        else
        D2F_temp_lv3_4(  0)<='0';
        end if;
        if(D2F_temp_lv2_4(  4)='1' OR D2F_temp_lv2_4(  5)='1' OR D2F_temp_lv2_4(  6)='1' OR D2F_temp_lv2_4(  7)='1' )then
        D2F_temp_lv3_4(  1)<='1';
        else
        D2F_temp_lv3_4(  1)<='0';
        end if;
        if(D2F_temp_lv2_4(  8)='1' OR D2F_temp_lv2_4(  9)='1' OR D2F_temp_lv2_4( 10)='1' OR D2F_temp_lv2_4( 11)='1' )then
        D2F_temp_lv3_4(  2)<='1';
        else
        D2F_temp_lv3_4(  2)<='0';
        end if;
        if(D2F_temp_lv2_4( 12)='1' OR D2F_temp_lv2_4( 13)='1' OR D2F_temp_lv2_4( 14)='1' OR D2F_temp_lv2_4( 15)='1' )then
        D2F_temp_lv3_4(  3)<='1';
        else
        D2F_temp_lv3_4(  3)<='0';
        end if;
        if(D2F_temp_lv2_5(  0)='1' OR D2F_temp_lv2_5(  1)='1' OR D2F_temp_lv2_5(  2)='1' OR D2F_temp_lv2_5(  3)='1' )then
        D2F_temp_lv3_5(  0)<='1';
        else
        D2F_temp_lv3_5(  0)<='0';
        end if;
        if(D2F_temp_lv2_5(  4)='1' OR D2F_temp_lv2_5(  5)='1' OR D2F_temp_lv2_5(  6)='1' OR D2F_temp_lv2_5(  7)='1' )then
        D2F_temp_lv3_5(  1)<='1';
        else
        D2F_temp_lv3_5(  1)<='0';
        end if;
        if(D2F_temp_lv2_5(  8)='1' OR D2F_temp_lv2_5(  9)='1' OR D2F_temp_lv2_5( 10)='1' OR D2F_temp_lv2_5( 11)='1' )then
        D2F_temp_lv3_5(  2)<='1';
        else
        D2F_temp_lv3_5(  2)<='0';
        end if;
        if(D2F_temp_lv2_5( 12)='1' OR D2F_temp_lv2_5( 13)='1' OR D2F_temp_lv2_5( 14)='1' OR D2F_temp_lv2_5( 15)='1' )then
        D2F_temp_lv3_5(  3)<='1';
        else
        D2F_temp_lv3_5(  3)<='0';
        end if;
        if(D2F_temp_lv2_5( 16)='1' OR D2F_temp_lv2_5( 17)='1' OR D2F_temp_lv2_5( 18)='1' OR D2F_temp_lv2_5( 19)='1' )then
        D2F_temp_lv3_5(  4)<='1';
        else
        D2F_temp_lv3_5(  4)<='0';
        end if;
        if(D2F_temp_lv2_6(  0)='1' OR D2F_temp_lv2_6(  1)='1' OR D2F_temp_lv2_6(  2)='1' OR D2F_temp_lv2_6(  3)='1' )then
        D2F_temp_lv3_6(  0)<='1';
        else
        D2F_temp_lv3_6(  0)<='0';
        end if;
        if(D2F_temp_lv2_6(  4)='1' OR D2F_temp_lv2_6(  5)='1' OR D2F_temp_lv2_6(  6)='1' OR D2F_temp_lv2_6(  7)='1' )then
        D2F_temp_lv3_6(  1)<='1';
        else
        D2F_temp_lv3_6(  1)<='0';
        end if;
        if(D2F_temp_lv2_6(  8)='1' OR D2F_temp_lv2_6(  9)='1' OR D2F_temp_lv2_6( 10)='1' OR D2F_temp_lv2_6( 11)='1' )then
        D2F_temp_lv3_6(  2)<='1';
        else
        D2F_temp_lv3_6(  2)<='0';
        end if;
        if(D2F_temp_lv2_6( 12)='1' OR D2F_temp_lv2_6( 13)='1' OR D2F_temp_lv2_6( 14)='1' OR D2F_temp_lv2_6( 15)='1' )then
        D2F_temp_lv3_6(  3)<='1';
        else
        D2F_temp_lv3_6(  3)<='0';
        end if;
        if(D2F_temp_lv2_6( 16)='1' OR D2F_temp_lv2_6( 17)='1' OR D2F_temp_lv2_6( 18)='1' OR D2F_temp_lv2_6( 19)='1' )then
        D2F_temp_lv3_6(  4)<='1';
        else
        D2F_temp_lv3_6(  4)<='0';
        end if;
        if(D2F_temp_lv2_6( 20)='1' )then
        D2F_temp_lv3_6(  5)<='1';
        else
        D2F_temp_lv3_6(  5)<='0';
        end if;
        if(D2F_temp_lv2_7(  0)='1' OR D2F_temp_lv2_7(  1)='1' OR D2F_temp_lv2_7(  2)='1' OR D2F_temp_lv2_7(  3)='1' )then
        D2F_temp_lv3_7(  0)<='1';
        else
        D2F_temp_lv3_7(  0)<='0';
        end if;
        if(D2F_temp_lv2_7(  4)='1' OR D2F_temp_lv2_7(  5)='1' OR D2F_temp_lv2_7(  6)='1' OR D2F_temp_lv2_7(  7)='1' )then
        D2F_temp_lv3_7(  1)<='1';
        else
        D2F_temp_lv3_7(  1)<='0';
        end if;
        if(D2F_temp_lv2_7(  8)='1' OR D2F_temp_lv2_7(  9)='1' OR D2F_temp_lv2_7( 10)='1' OR D2F_temp_lv2_7( 11)='1' )then
        D2F_temp_lv3_7(  2)<='1';
        else
        D2F_temp_lv3_7(  2)<='0';
        end if;
        if(D2F_temp_lv2_7( 12)='1' OR D2F_temp_lv2_7( 13)='1' OR D2F_temp_lv2_7( 14)='1' OR D2F_temp_lv2_7( 15)='1' )then
        D2F_temp_lv3_7(  3)<='1';
        else
        D2F_temp_lv3_7(  3)<='0';
        end if;
        if(D2F_temp_lv2_7( 16)='1' OR D2F_temp_lv2_7( 17)='1' OR D2F_temp_lv2_7( 18)='1' OR D2F_temp_lv2_7( 19)='1' )then
        D2F_temp_lv3_7(  4)<='1';
        else
        D2F_temp_lv3_7(  4)<='0';
        end if;
        if(D2F_temp_lv2_7( 20)='1' )then
        D2F_temp_lv3_7(  5)<='1';
        else
        D2F_temp_lv3_7(  5)<='0';
        end if;
        if(D3F_temp_lv2_0(  0)='1' OR D3F_temp_lv2_0(  1)='1' OR D3F_temp_lv2_0(  2)='1' OR D3F_temp_lv2_0(  3)='1' )then
        D3F_temp_lv3_0(  0)<='1';
        else
        D3F_temp_lv3_0(  0)<='0';
        end if;
        if(D3F_temp_lv2_0(  4)='1' OR D3F_temp_lv2_0(  5)='1' OR D3F_temp_lv2_0(  6)='1' OR D3F_temp_lv2_0(  7)='1' )then
        D3F_temp_lv3_0(  1)<='1';
        else
        D3F_temp_lv3_0(  1)<='0';
        end if;
        if(D3F_temp_lv2_0(  8)='1' OR D3F_temp_lv2_0(  9)='1' OR D3F_temp_lv2_0( 10)='1' OR D3F_temp_lv2_0( 11)='1' )then
        D3F_temp_lv3_0(  2)<='1';
        else
        D3F_temp_lv3_0(  2)<='0';
        end if;
        if(D3F_temp_lv2_0( 12)='1' OR D3F_temp_lv2_0( 13)='1' )then
        D3F_temp_lv3_0(  3)<='1';
        else
        D3F_temp_lv3_0(  3)<='0';
        end if;
        if(D3F_temp_lv2_1(  0)='1' OR D3F_temp_lv2_1(  1)='1' OR D3F_temp_lv2_1(  2)='1' OR D3F_temp_lv2_1(  3)='1' )then
        D3F_temp_lv3_1(  0)<='1';
        else
        D3F_temp_lv3_1(  0)<='0';
        end if;
        if(D3F_temp_lv2_1(  4)='1' OR D3F_temp_lv2_1(  5)='1' OR D3F_temp_lv2_1(  6)='1' OR D3F_temp_lv2_1(  7)='1' )then
        D3F_temp_lv3_1(  1)<='1';
        else
        D3F_temp_lv3_1(  1)<='0';
        end if;
        if(D3F_temp_lv2_1(  8)='1' OR D3F_temp_lv2_1(  9)='1' OR D3F_temp_lv2_1( 10)='1' OR D3F_temp_lv2_1( 11)='1' )then
        D3F_temp_lv3_1(  2)<='1';
        else
        D3F_temp_lv3_1(  2)<='0';
        end if;
        if(D3F_temp_lv2_1( 12)='1' OR D3F_temp_lv2_1( 13)='1' OR D3F_temp_lv2_1( 14)='1' OR D3F_temp_lv2_1( 15)='1' )then
        D3F_temp_lv3_1(  3)<='1';
        else
        D3F_temp_lv3_1(  3)<='0';
        end if;
        if(D3F_temp_lv2_1( 16)='1' OR D3F_temp_lv2_1( 17)='1' OR D3F_temp_lv2_1( 18)='1' )then
        D3F_temp_lv3_1(  4)<='1';
        else
        D3F_temp_lv3_1(  4)<='0';
        end if;
        if(D3F_temp_lv2_2(  0)='1' OR D3F_temp_lv2_2(  1)='1' OR D3F_temp_lv2_2(  2)='1' OR D3F_temp_lv2_2(  3)='1' )then
        D3F_temp_lv3_2(  0)<='1';
        else
        D3F_temp_lv3_2(  0)<='0';
        end if;
        if(D3F_temp_lv2_2(  4)='1' OR D3F_temp_lv2_2(  5)='1' OR D3F_temp_lv2_2(  6)='1' OR D3F_temp_lv2_2(  7)='1' )then
        D3F_temp_lv3_2(  1)<='1';
        else
        D3F_temp_lv3_2(  1)<='0';
        end if;
        if(D3F_temp_lv2_2(  8)='1' OR D3F_temp_lv2_2(  9)='1' OR D3F_temp_lv2_2( 10)='1' OR D3F_temp_lv2_2( 11)='1' )then
        D3F_temp_lv3_2(  2)<='1';
        else
        D3F_temp_lv3_2(  2)<='0';
        end if;
        if(D3F_temp_lv2_2( 12)='1' OR D3F_temp_lv2_2( 13)='1' OR D3F_temp_lv2_2( 14)='1' OR D3F_temp_lv2_2( 15)='1' )then
        D3F_temp_lv3_2(  3)<='1';
        else
        D3F_temp_lv3_2(  3)<='0';
        end if;
        if(D3F_temp_lv2_2( 16)='1' OR D3F_temp_lv2_2( 17)='1' OR D3F_temp_lv2_2( 18)='1' )then
        D3F_temp_lv3_2(  4)<='1';
        else
        D3F_temp_lv3_2(  4)<='0';
        end if;
        if(D3F_temp_lv2_3(  0)='1' OR D3F_temp_lv2_3(  1)='1' OR D3F_temp_lv2_3(  2)='1' OR D3F_temp_lv2_3(  3)='1' )then
        D3F_temp_lv3_3(  0)<='1';
        else
        D3F_temp_lv3_3(  0)<='0';
        end if;
        if(D3F_temp_lv2_3(  4)='1' OR D3F_temp_lv2_3(  5)='1' OR D3F_temp_lv2_3(  6)='1' OR D3F_temp_lv2_3(  7)='1' )then
        D3F_temp_lv3_3(  1)<='1';
        else
        D3F_temp_lv3_3(  1)<='0';
        end if;
        if(D3F_temp_lv2_3(  8)='1' OR D3F_temp_lv2_3(  9)='1' OR D3F_temp_lv2_3( 10)='1' OR D3F_temp_lv2_3( 11)='1' )then
        D3F_temp_lv3_3(  2)<='1';
        else
        D3F_temp_lv3_3(  2)<='0';
        end if;
        if(D3F_temp_lv2_3( 12)='1' OR D3F_temp_lv2_3( 13)='1' OR D3F_temp_lv2_3( 14)='1' OR D3F_temp_lv2_3( 15)='1' )then
        D3F_temp_lv3_3(  3)<='1';
        else
        D3F_temp_lv3_3(  3)<='0';
        end if;
        if(D3F_temp_lv2_3( 16)='1' )then
        D3F_temp_lv3_3(  4)<='1';
        else
        D3F_temp_lv3_3(  4)<='0';
        end if;
        if(D3F_temp_lv2_4(  0)='1' OR D3F_temp_lv2_4(  1)='1' OR D3F_temp_lv2_4(  2)='1' OR D3F_temp_lv2_4(  3)='1' )then
        D3F_temp_lv3_4(  0)<='1';
        else
        D3F_temp_lv3_4(  0)<='0';
        end if;
        if(D3F_temp_lv2_4(  4)='1' OR D3F_temp_lv2_4(  5)='1' OR D3F_temp_lv2_4(  6)='1' OR D3F_temp_lv2_4(  7)='1' )then
        D3F_temp_lv3_4(  1)<='1';
        else
        D3F_temp_lv3_4(  1)<='0';
        end if;
        if(D3F_temp_lv2_4(  8)='1' OR D3F_temp_lv2_4(  9)='1' OR D3F_temp_lv2_4( 10)='1' OR D3F_temp_lv2_4( 11)='1' )then
        D3F_temp_lv3_4(  2)<='1';
        else
        D3F_temp_lv3_4(  2)<='0';
        end if;
        if(D3F_temp_lv2_4( 12)='1' )then
        D3F_temp_lv3_4(  3)<='1';
        else
        D3F_temp_lv3_4(  3)<='0';
        end if;
        if(D3F_temp_lv2_5(  0)='1' OR D3F_temp_lv2_5(  1)='1' OR D3F_temp_lv2_5(  2)='1' OR D3F_temp_lv2_5(  3)='1' )then
        D3F_temp_lv3_5(  0)<='1';
        else
        D3F_temp_lv3_5(  0)<='0';
        end if;
        if(D3F_temp_lv2_5(  4)='1' OR D3F_temp_lv2_5(  5)='1' OR D3F_temp_lv2_5(  6)='1' OR D3F_temp_lv2_5(  7)='1' )then
        D3F_temp_lv3_5(  1)<='1';
        else
        D3F_temp_lv3_5(  1)<='0';
        end if;
        if(D3F_temp_lv2_5(  8)='1' OR D3F_temp_lv2_5(  9)='1' OR D3F_temp_lv2_5( 10)='1' OR D3F_temp_lv2_5( 11)='1' )then
        D3F_temp_lv3_5(  2)<='1';
        else
        D3F_temp_lv3_5(  2)<='0';
        end if;
        if(D3F_temp_lv2_5( 12)='1' OR D3F_temp_lv2_5( 13)='1' OR D3F_temp_lv2_5( 14)='1' OR D3F_temp_lv2_5( 15)='1' )then
        D3F_temp_lv3_5(  3)<='1';
        else
        D3F_temp_lv3_5(  3)<='0';
        end if;
        if(D3F_temp_lv2_5( 16)='1' OR D3F_temp_lv2_5( 17)='1' )then
        D3F_temp_lv3_5(  4)<='1';
        else
        D3F_temp_lv3_5(  4)<='0';
        end if;
        if(D3F_temp_lv2_6(  0)='1' OR D3F_temp_lv2_6(  1)='1' OR D3F_temp_lv2_6(  2)='1' OR D3F_temp_lv2_6(  3)='1' )then
        D3F_temp_lv3_6(  0)<='1';
        else
        D3F_temp_lv3_6(  0)<='0';
        end if;
        if(D3F_temp_lv2_6(  4)='1' OR D3F_temp_lv2_6(  5)='1' OR D3F_temp_lv2_6(  6)='1' OR D3F_temp_lv2_6(  7)='1' )then
        D3F_temp_lv3_6(  1)<='1';
        else
        D3F_temp_lv3_6(  1)<='0';
        end if;
        if(D3F_temp_lv2_6(  8)='1' OR D3F_temp_lv2_6(  9)='1' OR D3F_temp_lv2_6( 10)='1' OR D3F_temp_lv2_6( 11)='1' )then
        D3F_temp_lv3_6(  2)<='1';
        else
        D3F_temp_lv3_6(  2)<='0';
        end if;
        if(D3F_temp_lv2_6( 12)='1' OR D3F_temp_lv2_6( 13)='1' OR D3F_temp_lv2_6( 14)='1' OR D3F_temp_lv2_6( 15)='1' )then
        D3F_temp_lv3_6(  3)<='1';
        else
        D3F_temp_lv3_6(  3)<='0';
        end if;
        if(D3F_temp_lv2_6( 16)='1' )then
        D3F_temp_lv3_6(  4)<='1';
        else
        D3F_temp_lv3_6(  4)<='0';
        end if;
        if(D3F_temp_lv2_7(  0)='1' OR D3F_temp_lv2_7(  1)='1' OR D3F_temp_lv2_7(  2)='1' OR D3F_temp_lv2_7(  3)='1' )then
        D3F_temp_lv3_7(  0)<='1';
        else
        D3F_temp_lv3_7(  0)<='0';
        end if;
        if(D3F_temp_lv2_7(  4)='1' OR D3F_temp_lv2_7(  5)='1' OR D3F_temp_lv2_7(  6)='1' OR D3F_temp_lv2_7(  7)='1' )then
        D3F_temp_lv3_7(  1)<='1';
        else
        D3F_temp_lv3_7(  1)<='0';
        end if;
        if(D3F_temp_lv2_7(  8)='1' OR D3F_temp_lv2_7(  9)='1' OR D3F_temp_lv2_7( 10)='1' OR D3F_temp_lv2_7( 11)='1' )then
        D3F_temp_lv3_7(  2)<='1';
        else
        D3F_temp_lv3_7(  2)<='0';
        end if;
        if(D3F_temp_lv2_7( 12)='1' OR D3F_temp_lv2_7( 13)='1' OR D3F_temp_lv2_7( 14)='1' )then
        D3F_temp_lv3_7(  3)<='1';
        else
        D3F_temp_lv3_7(  3)<='0';
        end if;
        if(D4F_temp_lv2_0(  0)='1' AND D4F_temp_lv2_0(  1)='1' )then
        D4F_temp_lv3_0(  0)<='1';
        else
        D4F_temp_lv3_0(  0)<='0';
        end if;
        if(D4F_temp_lv2_0(  2)='1' AND D4F_temp_lv2_0(  3)='1' )then
        D4F_temp_lv3_0(  1)<='1';
        else
        D4F_temp_lv3_0(  1)<='0';
        end if;
        if(D4F_temp_lv2_0(  4)='1' )then
        D4F_temp_lv3_0(  2)<='1';
        else
        D4F_temp_lv3_0(  2)<='0';
        end if;
        if(D4F_temp_lv2_0(  5)='1' AND D4F_temp_lv2_0(  6)='1' )then
        D4F_temp_lv3_0(  3)<='1';
        else
        D4F_temp_lv3_0(  3)<='0';
        end if;
        if(D4F_temp_lv2_0(  7)='1' OR D4F_temp_lv2_0(  8)='1' OR D4F_temp_lv2_0(  9)='1' OR D4F_temp_lv2_0( 10)='1' )then
        D4F_temp_lv3_0(  4)<='1';
        else
        D4F_temp_lv3_0(  4)<='0';
        end if;
        if(D4F_temp_lv2_0( 11)='1' OR D4F_temp_lv2_0( 12)='1' OR D4F_temp_lv2_0( 13)='1' )then
        D4F_temp_lv3_0(  5)<='1';
        else
        D4F_temp_lv3_0(  5)<='0';
        end if;
        if(D4F_temp_lv2_1(  0)='1' )then
        D4F_temp_lv3_1(  0)<='1';
        else
        D4F_temp_lv3_1(  0)<='0';
        end if;
        if(D4F_temp_lv2_1(  1)='1' AND D4F_temp_lv2_1(  2)='1' AND D4F_temp_lv2_1(  3)='1' )then
        D4F_temp_lv3_1(  1)<='1';
        else
        D4F_temp_lv3_1(  1)<='0';
        end if;
        if(D4F_temp_lv2_1(  4)='1' )then
        D4F_temp_lv3_1(  2)<='1';
        else
        D4F_temp_lv3_1(  2)<='0';
        end if;
        if(D4F_temp_lv2_1(  5)='1' AND D4F_temp_lv2_1(  6)='1' )then
        D4F_temp_lv3_1(  3)<='1';
        else
        D4F_temp_lv3_1(  3)<='0';
        end if;
        if(D4F_temp_lv2_1(  7)='1' AND D4F_temp_lv2_1(  8)='1' )then
        D4F_temp_lv3_1(  4)<='1';
        else
        D4F_temp_lv3_1(  4)<='0';
        end if;
        if(D4F_temp_lv2_1(  9)='1' OR D4F_temp_lv2_1( 10)='1' OR D4F_temp_lv2_1( 11)='1' OR D4F_temp_lv2_1( 12)='1' )then
        D4F_temp_lv3_1(  5)<='1';
        else
        D4F_temp_lv3_1(  5)<='0';
        end if;
        if(D4F_temp_lv2_1( 13)='1' OR D4F_temp_lv2_1( 14)='1' )then
        D4F_temp_lv3_1(  6)<='1';
        else
        D4F_temp_lv3_1(  6)<='0';
        end if;
        if(D4F_temp_lv2_2(  0)='1' )then
        D4F_temp_lv3_2(  0)<='1';
        else
        D4F_temp_lv3_2(  0)<='0';
        end if;
        if(D4F_temp_lv2_2(  1)='1' AND D4F_temp_lv2_2(  2)='1' AND D4F_temp_lv2_2(  3)='1' )then
        D4F_temp_lv3_2(  1)<='1';
        else
        D4F_temp_lv3_2(  1)<='0';
        end if;
        if(D4F_temp_lv2_2(  4)='1' )then
        D4F_temp_lv3_2(  2)<='1';
        else
        D4F_temp_lv3_2(  2)<='0';
        end if;
        if(D4F_temp_lv2_2(  5)='1' AND D4F_temp_lv2_2(  6)='1' )then
        D4F_temp_lv3_2(  3)<='1';
        else
        D4F_temp_lv3_2(  3)<='0';
        end if;
        if(D4F_temp_lv2_2(  7)='1' AND D4F_temp_lv2_2(  8)='1' )then
        D4F_temp_lv3_2(  4)<='1';
        else
        D4F_temp_lv3_2(  4)<='0';
        end if;
        if(D4F_temp_lv2_2(  9)='1' OR D4F_temp_lv2_2( 10)='1' OR D4F_temp_lv2_2( 11)='1' OR D4F_temp_lv2_2( 12)='1' )then
        D4F_temp_lv3_2(  5)<='1';
        else
        D4F_temp_lv3_2(  5)<='0';
        end if;
        if(D4F_temp_lv2_2( 13)='1' OR D4F_temp_lv2_2( 14)='1' OR D4F_temp_lv2_2( 15)='1' )then
        D4F_temp_lv3_2(  6)<='1';
        else
        D4F_temp_lv3_2(  6)<='0';
        end if;
        if(D4F_temp_lv2_3(  0)='1' )then
        D4F_temp_lv3_3(  0)<='1';
        else
        D4F_temp_lv3_3(  0)<='0';
        end if;
        if(D4F_temp_lv2_3(  1)='1' AND D4F_temp_lv2_3(  2)='1' )then
        D4F_temp_lv3_3(  1)<='1';
        else
        D4F_temp_lv3_3(  1)<='0';
        end if;
        if(D4F_temp_lv2_3(  3)='1' AND D4F_temp_lv2_3(  4)='1' )then
        D4F_temp_lv3_3(  2)<='1';
        else
        D4F_temp_lv3_3(  2)<='0';
        end if;
        if(D4F_temp_lv2_3(  5)='1' AND D4F_temp_lv2_3(  6)='1' )then
        D4F_temp_lv3_3(  3)<='1';
        else
        D4F_temp_lv3_3(  3)<='0';
        end if;
        if(D4F_temp_lv2_3(  7)='1' OR D4F_temp_lv2_3(  8)='1' OR D4F_temp_lv2_3(  9)='1' OR D4F_temp_lv2_3( 10)='1' )then
        D4F_temp_lv3_3(  4)<='1';
        else
        D4F_temp_lv3_3(  4)<='0';
        end if;
        if(D4F_temp_lv2_3( 11)='1' OR D4F_temp_lv2_3( 12)='1' OR D4F_temp_lv2_3( 13)='1' )then
        D4F_temp_lv3_3(  5)<='1';
        else
        D4F_temp_lv3_3(  5)<='0';
        end if;
        if(D4F_temp_lv2_4(  0)='1' OR D4F_temp_lv2_4(  1)='1' OR D4F_temp_lv2_4(  2)='1' OR D4F_temp_lv2_4(  3)='1' )then
        D4F_temp_lv3_4(  0)<='1';
        else
        D4F_temp_lv3_4(  0)<='0';
        end if;
        if(D4F_temp_lv2_4(  4)='1' OR D4F_temp_lv2_4(  5)='1' )then
        D4F_temp_lv3_4(  1)<='1';
        else
        D4F_temp_lv3_4(  1)<='0';
        end if;
        if(D4F_temp_lv2_4(  6)='1' AND D4F_temp_lv2_4(  7)='1' )then
        D4F_temp_lv3_4(  2)<='1';
        else
        D4F_temp_lv3_4(  2)<='0';
        end if;
        if(D4F_temp_lv2_4(  8)='1' AND D4F_temp_lv2_4(  9)='1' )then
        D4F_temp_lv3_4(  3)<='1';
        else
        D4F_temp_lv3_4(  3)<='0';
        end if;
        if(D4F_temp_lv2_4( 10)='1' )then
        D4F_temp_lv3_4(  4)<='1';
        else
        D4F_temp_lv3_4(  4)<='0';
        end if;
        if(D4F_temp_lv2_4( 11)='1' AND D4F_temp_lv2_4( 12)='1' )then
        D4F_temp_lv3_4(  5)<='1';
        else
        D4F_temp_lv3_4(  5)<='0';
        end if;
        if(D4F_temp_lv2_5(  0)='1' OR D4F_temp_lv2_5(  1)='1' OR D4F_temp_lv2_5(  2)='1' OR D4F_temp_lv2_5(  3)='1' )then
        D4F_temp_lv3_5(  0)<='1';
        else
        D4F_temp_lv3_5(  0)<='0';
        end if;
        if(D4F_temp_lv2_5(  4)='1' OR D4F_temp_lv2_5(  5)='1' OR D4F_temp_lv2_5(  6)='1' OR D4F_temp_lv2_5(  7)='1' )then
        D4F_temp_lv3_5(  1)<='1';
        else
        D4F_temp_lv3_5(  1)<='0';
        end if;
        if(D4F_temp_lv2_5(  8)='1' AND D4F_temp_lv2_5(  9)='1' )then
        D4F_temp_lv3_5(  2)<='1';
        else
        D4F_temp_lv3_5(  2)<='0';
        end if;
        if(D4F_temp_lv2_5( 10)='1' )then
        D4F_temp_lv3_5(  3)<='1';
        else
        D4F_temp_lv3_5(  3)<='0';
        end if;
        if(D4F_temp_lv2_5( 11)='1' AND D4F_temp_lv2_5( 12)='1' )then
        D4F_temp_lv3_5(  4)<='1';
        else
        D4F_temp_lv3_5(  4)<='0';
        end if;
        if(D4F_temp_lv2_5( 13)='1' AND D4F_temp_lv2_5( 14)='1' )then
        D4F_temp_lv3_5(  5)<='1';
        else
        D4F_temp_lv3_5(  5)<='0';
        end if;
        if(D4F_temp_lv2_5( 15)='1' )then
        D4F_temp_lv3_5(  6)<='1';
        else
        D4F_temp_lv3_5(  6)<='0';
        end if;
        if(D4F_temp_lv2_6(  0)='1' OR D4F_temp_lv2_6(  1)='1' OR D4F_temp_lv2_6(  2)='1' OR D4F_temp_lv2_6(  3)='1' )then
        D4F_temp_lv3_6(  0)<='1';
        else
        D4F_temp_lv3_6(  0)<='0';
        end if;
        if(D4F_temp_lv2_6(  4)='1' OR D4F_temp_lv2_6(  5)='1' OR D4F_temp_lv2_6(  6)='1' )then
        D4F_temp_lv3_6(  1)<='1';
        else
        D4F_temp_lv3_6(  1)<='0';
        end if;
        if(D4F_temp_lv2_6(  7)='1' AND D4F_temp_lv2_6(  8)='1' )then
        D4F_temp_lv3_6(  2)<='1';
        else
        D4F_temp_lv3_6(  2)<='0';
        end if;
        if(D4F_temp_lv2_6(  9)='1' )then
        D4F_temp_lv3_6(  3)<='1';
        else
        D4F_temp_lv3_6(  3)<='0';
        end if;
        if(D4F_temp_lv2_6( 10)='1' AND D4F_temp_lv2_6( 11)='1' )then
        D4F_temp_lv3_6(  4)<='1';
        else
        D4F_temp_lv3_6(  4)<='0';
        end if;
        if(D4F_temp_lv2_6( 12)='1' AND D4F_temp_lv2_6( 13)='1' )then
        D4F_temp_lv3_6(  5)<='1';
        else
        D4F_temp_lv3_6(  5)<='0';
        end if;
        if(D4F_temp_lv2_7(  0)='1' OR D4F_temp_lv2_7(  1)='1' OR D4F_temp_lv2_7(  2)='1' OR D4F_temp_lv2_7(  3)='1' )then
        D4F_temp_lv3_7(  0)<='1';
        else
        D4F_temp_lv3_7(  0)<='0';
        end if;
        if(D4F_temp_lv2_7(  4)='1' )then
        D4F_temp_lv3_7(  1)<='1';
        else
        D4F_temp_lv3_7(  1)<='0';
        end if;
        if(D4F_temp_lv2_7(  5)='1' AND D4F_temp_lv2_7(  6)='1' )then
        D4F_temp_lv3_7(  2)<='1';
        else
        D4F_temp_lv3_7(  2)<='0';
        end if;
        if(D4F_temp_lv2_7(  7)='1' AND D4F_temp_lv2_7(  8)='1' )then
        D4F_temp_lv3_7(  3)<='1';
        else
        D4F_temp_lv3_7(  3)<='0';
        end if;
        if(D4F_temp_lv2_7(  9)='1' AND D4F_temp_lv2_7( 10)='1' )then
        D4F_temp_lv3_7(  4)<='1';
        else
        D4F_temp_lv3_7(  4)<='0';
        end if;
        if(D4F_temp_lv2_7( 11)='1' )then
        D4F_temp_lv3_7(  5)<='1';
        else
        D4F_temp_lv3_7(  5)<='0';
        end if;
 end if;
end process;
lookuptable_LV4 : process(c1)    
begin
 if c1'event and c1='1' then
        if(D0F_temp_lv3_0(  0)='1' OR D0F_temp_lv3_0(  1)='1' OR D0F_temp_lv3_0(  2)='1' )then
        D0F_temp_lv4_0(  0)<='1';
        else
        D0F_temp_lv4_0(  0)<='0';
        end if;
        if(D0F_temp_lv3_1(  0)='1' OR D0F_temp_lv3_1(  1)='1' OR D0F_temp_lv3_1(  2)='1' )then
        D0F_temp_lv4_1(  0)<='1';
        else
        D0F_temp_lv4_1(  0)<='0';
        end if;
        if(D0F_temp_lv3_2(  0)='1' OR D0F_temp_lv3_2(  1)='1' OR D0F_temp_lv3_2(  2)='1' )then
        D0F_temp_lv4_2(  0)<='1';
        else
        D0F_temp_lv4_2(  0)<='0';
        end if;
        if(D0F_temp_lv3_3(  0)='1' OR D0F_temp_lv3_3(  1)='1' OR D0F_temp_lv3_3(  2)='1' )then
        D0F_temp_lv4_3(  0)<='1';
        else
        D0F_temp_lv4_3(  0)<='0';
        end if;
        if(D0F_temp_lv3_4(  0)='1' OR D0F_temp_lv3_4(  1)='1' )then
        D0F_temp_lv4_4(  0)<='1';
        else
        D0F_temp_lv4_4(  0)<='0';
        end if;
        if(D0F_temp_lv3_5(  0)='1' OR D0F_temp_lv3_5(  1)='1' OR D0F_temp_lv3_5(  2)='1' )then
        D0F_temp_lv4_5(  0)<='1';
        else
        D0F_temp_lv4_5(  0)<='0';
        end if;
        if(D0F_temp_lv3_6(  0)='1' OR D0F_temp_lv3_6(  1)='1' OR D0F_temp_lv3_6(  2)='1' )then
        D0F_temp_lv4_6(  0)<='1';
        else
        D0F_temp_lv4_6(  0)<='0';
        end if;
        if(D0F_temp_lv3_7(  0)='1' OR D0F_temp_lv3_7(  1)='1' OR D0F_temp_lv3_7(  2)='1' )then
        D0F_temp_lv4_7(  0)<='1';
        else
        D0F_temp_lv4_7(  0)<='0';
        end if;
        if(D1F_temp_lv3_0(  0)='1' OR D1F_temp_lv3_0(  1)='1' )then
        D1F_temp_lv4_0(  0)<='1';
        else
        D1F_temp_lv4_0(  0)<='0';
        end if;
        if(D1F_temp_lv3_1(  0)='1' OR D1F_temp_lv3_1(  1)='1' OR D1F_temp_lv3_1(  2)='1' OR D1F_temp_lv3_1(  3)='1' )then
        D1F_temp_lv4_1(  0)<='1';
        else
        D1F_temp_lv4_1(  0)<='0';
        end if;
        if(D1F_temp_lv3_1(  4)='1' )then
        D1F_temp_lv4_1(  1)<='1';
        else
        D1F_temp_lv4_1(  1)<='0';
        end if;
        if(D1F_temp_lv3_2(  0)='1' OR D1F_temp_lv3_2(  1)='1' OR D1F_temp_lv3_2(  2)='1' OR D1F_temp_lv3_2(  3)='1' )then
        D1F_temp_lv4_2(  0)<='1';
        else
        D1F_temp_lv4_2(  0)<='0';
        end if;
        if(D1F_temp_lv3_2(  4)='1' OR D1F_temp_lv3_2(  5)='1' )then
        D1F_temp_lv4_2(  1)<='1';
        else
        D1F_temp_lv4_2(  1)<='0';
        end if;
        if(D1F_temp_lv3_3(  0)='1' OR D1F_temp_lv3_3(  1)='1' OR D1F_temp_lv3_3(  2)='1' OR D1F_temp_lv3_3(  3)='1' )then
        D1F_temp_lv4_3(  0)<='1';
        else
        D1F_temp_lv4_3(  0)<='0';
        end if;
        if(D1F_temp_lv3_3(  4)='1' )then
        D1F_temp_lv4_3(  1)<='1';
        else
        D1F_temp_lv4_3(  1)<='0';
        end if;
        if(D1F_temp_lv3_4(  0)='1' OR D1F_temp_lv3_4(  1)='1' )then
        D1F_temp_lv4_4(  0)<='1';
        else
        D1F_temp_lv4_4(  0)<='0';
        end if;
        if(D1F_temp_lv3_5(  0)='1' OR D1F_temp_lv3_5(  1)='1' OR D1F_temp_lv3_5(  2)='1' OR D1F_temp_lv3_5(  3)='1' )then
        D1F_temp_lv4_5(  0)<='1';
        else
        D1F_temp_lv4_5(  0)<='0';
        end if;
        if(D1F_temp_lv3_5(  4)='1' OR D1F_temp_lv3_5(  5)='1' )then
        D1F_temp_lv4_5(  1)<='1';
        else
        D1F_temp_lv4_5(  1)<='0';
        end if;
        if(D1F_temp_lv3_6(  0)='1' OR D1F_temp_lv3_6(  1)='1' OR D1F_temp_lv3_6(  2)='1' OR D1F_temp_lv3_6(  3)='1' )then
        D1F_temp_lv4_6(  0)<='1';
        else
        D1F_temp_lv4_6(  0)<='0';
        end if;
        if(D1F_temp_lv3_6(  4)='1' OR D1F_temp_lv3_6(  5)='1' )then
        D1F_temp_lv4_6(  1)<='1';
        else
        D1F_temp_lv4_6(  1)<='0';
        end if;
        if(D1F_temp_lv3_7(  0)='1' OR D1F_temp_lv3_7(  1)='1' OR D1F_temp_lv3_7(  2)='1' OR D1F_temp_lv3_7(  3)='1' )then
        D1F_temp_lv4_7(  0)<='1';
        else
        D1F_temp_lv4_7(  0)<='0';
        end if;
        if(D1F_temp_lv3_7(  4)='1' )then
        D1F_temp_lv4_7(  1)<='1';
        else
        D1F_temp_lv4_7(  1)<='0';
        end if;
        if(D2F_temp_lv3_0(  0)='1' OR D2F_temp_lv3_0(  1)='1' OR D2F_temp_lv3_0(  2)='1' OR D2F_temp_lv3_0(  3)='1' )then
        D2F_temp_lv4_0(  0)<='1';
        else
        D2F_temp_lv4_0(  0)<='0';
        end if;
        if(D2F_temp_lv3_0(  4)='1' )then
        D2F_temp_lv4_0(  1)<='1';
        else
        D2F_temp_lv4_0(  1)<='0';
        end if;
        if(D2F_temp_lv3_1(  0)='1' OR D2F_temp_lv3_1(  1)='1' OR D2F_temp_lv3_1(  2)='1' OR D2F_temp_lv3_1(  3)='1' )then
        D2F_temp_lv4_1(  0)<='1';
        else
        D2F_temp_lv4_1(  0)<='0';
        end if;
        if(D2F_temp_lv3_1(  4)='1' OR D2F_temp_lv3_1(  5)='1' )then
        D2F_temp_lv4_1(  1)<='1';
        else
        D2F_temp_lv4_1(  1)<='0';
        end if;
        if(D2F_temp_lv3_2(  0)='1' OR D2F_temp_lv3_2(  1)='1' OR D2F_temp_lv3_2(  2)='1' OR D2F_temp_lv3_2(  3)='1' )then
        D2F_temp_lv4_2(  0)<='1';
        else
        D2F_temp_lv4_2(  0)<='0';
        end if;
        if(D2F_temp_lv3_2(  4)='1' OR D2F_temp_lv3_2(  5)='1' )then
        D2F_temp_lv4_2(  1)<='1';
        else
        D2F_temp_lv4_2(  1)<='0';
        end if;
        if(D2F_temp_lv3_3(  0)='1' OR D2F_temp_lv3_3(  1)='1' OR D2F_temp_lv3_3(  2)='1' OR D2F_temp_lv3_3(  3)='1' )then
        D2F_temp_lv4_3(  0)<='1';
        else
        D2F_temp_lv4_3(  0)<='0';
        end if;
        if(D2F_temp_lv3_3(  4)='1' )then
        D2F_temp_lv4_3(  1)<='1';
        else
        D2F_temp_lv4_3(  1)<='0';
        end if;
        if(D2F_temp_lv3_4(  0)='1' OR D2F_temp_lv3_4(  1)='1' OR D2F_temp_lv3_4(  2)='1' OR D2F_temp_lv3_4(  3)='1' )then
        D2F_temp_lv4_4(  0)<='1';
        else
        D2F_temp_lv4_4(  0)<='0';
        end if;
        if(D2F_temp_lv3_5(  0)='1' OR D2F_temp_lv3_5(  1)='1' OR D2F_temp_lv3_5(  2)='1' OR D2F_temp_lv3_5(  3)='1' )then
        D2F_temp_lv4_5(  0)<='1';
        else
        D2F_temp_lv4_5(  0)<='0';
        end if;
        if(D2F_temp_lv3_5(  4)='1' )then
        D2F_temp_lv4_5(  1)<='1';
        else
        D2F_temp_lv4_5(  1)<='0';
        end if;
        if(D2F_temp_lv3_6(  0)='1' OR D2F_temp_lv3_6(  1)='1' OR D2F_temp_lv3_6(  2)='1' OR D2F_temp_lv3_6(  3)='1' )then
        D2F_temp_lv4_6(  0)<='1';
        else
        D2F_temp_lv4_6(  0)<='0';
        end if;
        if(D2F_temp_lv3_6(  4)='1' OR D2F_temp_lv3_6(  5)='1' )then
        D2F_temp_lv4_6(  1)<='1';
        else
        D2F_temp_lv4_6(  1)<='0';
        end if;
        if(D2F_temp_lv3_7(  0)='1' OR D2F_temp_lv3_7(  1)='1' OR D2F_temp_lv3_7(  2)='1' OR D2F_temp_lv3_7(  3)='1' )then
        D2F_temp_lv4_7(  0)<='1';
        else
        D2F_temp_lv4_7(  0)<='0';
        end if;
        if(D2F_temp_lv3_7(  4)='1' OR D2F_temp_lv3_7(  5)='1' )then
        D2F_temp_lv4_7(  1)<='1';
        else
        D2F_temp_lv4_7(  1)<='0';
        end if;
        if(D3F_temp_lv3_0(  0)='1' OR D3F_temp_lv3_0(  1)='1' OR D3F_temp_lv3_0(  2)='1' OR D3F_temp_lv3_0(  3)='1' )then
        D3F_temp_lv4_0(  0)<='1';
        else
        D3F_temp_lv4_0(  0)<='0';
        end if;
        if(D3F_temp_lv3_1(  0)='1' OR D3F_temp_lv3_1(  1)='1' OR D3F_temp_lv3_1(  2)='1' OR D3F_temp_lv3_1(  3)='1' )then
        D3F_temp_lv4_1(  0)<='1';
        else
        D3F_temp_lv4_1(  0)<='0';
        end if;
        if(D3F_temp_lv3_1(  4)='1' )then
        D3F_temp_lv4_1(  1)<='1';
        else
        D3F_temp_lv4_1(  1)<='0';
        end if;
        if(D3F_temp_lv3_2(  0)='1' OR D3F_temp_lv3_2(  1)='1' OR D3F_temp_lv3_2(  2)='1' OR D3F_temp_lv3_2(  3)='1' )then
        D3F_temp_lv4_2(  0)<='1';
        else
        D3F_temp_lv4_2(  0)<='0';
        end if;
        if(D3F_temp_lv3_2(  4)='1' )then
        D3F_temp_lv4_2(  1)<='1';
        else
        D3F_temp_lv4_2(  1)<='0';
        end if;
        if(D3F_temp_lv3_3(  0)='1' OR D3F_temp_lv3_3(  1)='1' OR D3F_temp_lv3_3(  2)='1' OR D3F_temp_lv3_3(  3)='1' )then
        D3F_temp_lv4_3(  0)<='1';
        else
        D3F_temp_lv4_3(  0)<='0';
        end if;
        if(D3F_temp_lv3_3(  4)='1' )then
        D3F_temp_lv4_3(  1)<='1';
        else
        D3F_temp_lv4_3(  1)<='0';
        end if;
        if(D3F_temp_lv3_4(  0)='1' OR D3F_temp_lv3_4(  1)='1' OR D3F_temp_lv3_4(  2)='1' OR D3F_temp_lv3_4(  3)='1' )then
        D3F_temp_lv4_4(  0)<='1';
        else
        D3F_temp_lv4_4(  0)<='0';
        end if;
        if(D3F_temp_lv3_5(  0)='1' OR D3F_temp_lv3_5(  1)='1' OR D3F_temp_lv3_5(  2)='1' OR D3F_temp_lv3_5(  3)='1' )then
        D3F_temp_lv4_5(  0)<='1';
        else
        D3F_temp_lv4_5(  0)<='0';
        end if;
        if(D3F_temp_lv3_5(  4)='1' )then
        D3F_temp_lv4_5(  1)<='1';
        else
        D3F_temp_lv4_5(  1)<='0';
        end if;
        if(D3F_temp_lv3_6(  0)='1' OR D3F_temp_lv3_6(  1)='1' OR D3F_temp_lv3_6(  2)='1' OR D3F_temp_lv3_6(  3)='1' )then
        D3F_temp_lv4_6(  0)<='1';
        else
        D3F_temp_lv4_6(  0)<='0';
        end if;
        if(D3F_temp_lv3_6(  4)='1' )then
        D3F_temp_lv4_6(  1)<='1';
        else
        D3F_temp_lv4_6(  1)<='0';
        end if;
        if(D3F_temp_lv3_7(  0)='1' OR D3F_temp_lv3_7(  1)='1' OR D3F_temp_lv3_7(  2)='1' OR D3F_temp_lv3_7(  3)='1' )then
        D3F_temp_lv4_7(  0)<='1';
        else
        D3F_temp_lv4_7(  0)<='0';
        end if;
        if(D4F_temp_lv3_0(  0)='1' OR D4F_temp_lv3_0(  1)='1' OR D4F_temp_lv3_0(  2)='1' OR D4F_temp_lv3_0(  3)='1' )then
        D4F_temp_lv4_0(  0)<='1';
        else
        D4F_temp_lv4_0(  0)<='0';
        end if;
        if(D4F_temp_lv3_0(  4)='1' OR D4F_temp_lv3_0(  5)='1' )then
        D4F_temp_lv4_0(  1)<='1';
        else
        D4F_temp_lv4_0(  1)<='0';
        end if;
        if(D4F_temp_lv3_1(  0)='1' OR D4F_temp_lv3_1(  1)='1' OR D4F_temp_lv3_1(  2)='1' OR D4F_temp_lv3_1(  3)='1' )then
        D4F_temp_lv4_1(  0)<='1';
        else
        D4F_temp_lv4_1(  0)<='0';
        end if;
        if(D4F_temp_lv3_1(  4)='1' OR D4F_temp_lv3_1(  5)='1' OR D4F_temp_lv3_1(  6)='1' )then
        D4F_temp_lv4_1(  1)<='1';
        else
        D4F_temp_lv4_1(  1)<='0';
        end if;
        if(D4F_temp_lv3_2(  0)='1' OR D4F_temp_lv3_2(  1)='1' OR D4F_temp_lv3_2(  2)='1' OR D4F_temp_lv3_2(  3)='1' )then
        D4F_temp_lv4_2(  0)<='1';
        else
        D4F_temp_lv4_2(  0)<='0';
        end if;
        if(D4F_temp_lv3_2(  4)='1' OR D4F_temp_lv3_2(  5)='1' OR D4F_temp_lv3_2(  6)='1' )then
        D4F_temp_lv4_2(  1)<='1';
        else
        D4F_temp_lv4_2(  1)<='0';
        end if;
        if(D4F_temp_lv3_3(  0)='1' OR D4F_temp_lv3_3(  1)='1' OR D4F_temp_lv3_3(  2)='1' OR D4F_temp_lv3_3(  3)='1' )then
        D4F_temp_lv4_3(  0)<='1';
        else
        D4F_temp_lv4_3(  0)<='0';
        end if;
        if(D4F_temp_lv3_3(  4)='1' OR D4F_temp_lv3_3(  5)='1' )then
        D4F_temp_lv4_3(  1)<='1';
        else
        D4F_temp_lv4_3(  1)<='0';
        end if;
        if(D4F_temp_lv3_4(  0)='1' OR D4F_temp_lv3_4(  1)='1' OR D4F_temp_lv3_4(  2)='1' OR D4F_temp_lv3_4(  3)='1' )then
        D4F_temp_lv4_4(  0)<='1';
        else
        D4F_temp_lv4_4(  0)<='0';
        end if;
        if(D4F_temp_lv3_4(  4)='1' OR D4F_temp_lv3_4(  5)='1' )then
        D4F_temp_lv4_4(  1)<='1';
        else
        D4F_temp_lv4_4(  1)<='0';
        end if;
        if(D4F_temp_lv3_5(  0)='1' OR D4F_temp_lv3_5(  1)='1' OR D4F_temp_lv3_5(  2)='1' OR D4F_temp_lv3_5(  3)='1' )then
        D4F_temp_lv4_5(  0)<='1';
        else
        D4F_temp_lv4_5(  0)<='0';
        end if;
        if(D4F_temp_lv3_5(  4)='1' OR D4F_temp_lv3_5(  5)='1' OR D4F_temp_lv3_5(  6)='1' )then
        D4F_temp_lv4_5(  1)<='1';
        else
        D4F_temp_lv4_5(  1)<='0';
        end if;
        if(D4F_temp_lv3_6(  0)='1' OR D4F_temp_lv3_6(  1)='1' OR D4F_temp_lv3_6(  2)='1' OR D4F_temp_lv3_6(  3)='1' )then
        D4F_temp_lv4_6(  0)<='1';
        else
        D4F_temp_lv4_6(  0)<='0';
        end if;
        if(D4F_temp_lv3_6(  4)='1' OR D4F_temp_lv3_6(  5)='1' )then
        D4F_temp_lv4_6(  1)<='1';
        else
        D4F_temp_lv4_6(  1)<='0';
        end if;
        if(D4F_temp_lv3_7(  0)='1' OR D4F_temp_lv3_7(  1)='1' OR D4F_temp_lv3_7(  2)='1' OR D4F_temp_lv3_7(  3)='1' )then
        D4F_temp_lv4_7(  0)<='1';
        else
        D4F_temp_lv4_7(  0)<='0';
        end if;
        if(D4F_temp_lv3_7(  4)='1' OR D4F_temp_lv3_7(  5)='1' )then
        D4F_temp_lv4_7(  1)<='1';
        else
        D4F_temp_lv4_7(  1)<='0';
        end if;
 end if;
end process;
lookuptable_LV5 : process(c1)    
begin
 if c1'event and c1='1' then
        if(D0F_temp_lv4_0(  0)='1' )then
        D0F_temp_lv5_0(  0)<='1';
        else
        D0F_temp_lv5_0(  0)<='0';
        end if;
        if(D0F_temp_lv4_1(  0)='1' )then
        D0F_temp_lv5_1(  0)<='1';
        else
        D0F_temp_lv5_1(  0)<='0';
        end if;
        if(D0F_temp_lv4_2(  0)='1' )then
        D0F_temp_lv5_2(  0)<='1';
        else
        D0F_temp_lv5_2(  0)<='0';
        end if;
        if(D0F_temp_lv4_3(  0)='1' )then
        D0F_temp_lv5_3(  0)<='1';
        else
        D0F_temp_lv5_3(  0)<='0';
        end if;
        if(D0F_temp_lv4_4(  0)='1' )then
        D0F_temp_lv5_4(  0)<='1';
        else
        D0F_temp_lv5_4(  0)<='0';
        end if;
        if(D0F_temp_lv4_5(  0)='1' )then
        D0F_temp_lv5_5(  0)<='1';
        else
        D0F_temp_lv5_5(  0)<='0';
        end if;
        if(D0F_temp_lv4_6(  0)='1' )then
        D0F_temp_lv5_6(  0)<='1';
        else
        D0F_temp_lv5_6(  0)<='0';
        end if;
        if(D0F_temp_lv4_7(  0)='1' )then
        D0F_temp_lv5_7(  0)<='1';
        else
        D0F_temp_lv5_7(  0)<='0';
        end if;
        if(D1F_temp_lv4_0(  0)='1' )then
        D1F_temp_lv5_0(  0)<='1';
        else
        D1F_temp_lv5_0(  0)<='0';
        end if;
        if(D1F_temp_lv4_1(  0)='1' OR D1F_temp_lv4_1(  1)='1' )then
        D1F_temp_lv5_1(  0)<='1';
        else
        D1F_temp_lv5_1(  0)<='0';
        end if;
        if(D1F_temp_lv4_2(  0)='1' OR D1F_temp_lv4_2(  1)='1' )then
        D1F_temp_lv5_2(  0)<='1';
        else
        D1F_temp_lv5_2(  0)<='0';
        end if;
        if(D1F_temp_lv4_3(  0)='1' OR D1F_temp_lv4_3(  1)='1' )then
        D1F_temp_lv5_3(  0)<='1';
        else
        D1F_temp_lv5_3(  0)<='0';
        end if;
        if(D1F_temp_lv4_4(  0)='1' )then
        D1F_temp_lv5_4(  0)<='1';
        else
        D1F_temp_lv5_4(  0)<='0';
        end if;
        if(D1F_temp_lv4_5(  0)='1' OR D1F_temp_lv4_5(  1)='1' )then
        D1F_temp_lv5_5(  0)<='1';
        else
        D1F_temp_lv5_5(  0)<='0';
        end if;
        if(D1F_temp_lv4_6(  0)='1' OR D1F_temp_lv4_6(  1)='1' )then
        D1F_temp_lv5_6(  0)<='1';
        else
        D1F_temp_lv5_6(  0)<='0';
        end if;
        if(D1F_temp_lv4_7(  0)='1' OR D1F_temp_lv4_7(  1)='1' )then
        D1F_temp_lv5_7(  0)<='1';
        else
        D1F_temp_lv5_7(  0)<='0';
        end if;
        if(D2F_temp_lv4_0(  0)='1' OR D2F_temp_lv4_0(  1)='1' )then
        D2F_temp_lv5_0(  0)<='1';
        else
        D2F_temp_lv5_0(  0)<='0';
        end if;
        if(D2F_temp_lv4_1(  0)='1' OR D2F_temp_lv4_1(  1)='1' )then
        D2F_temp_lv5_1(  0)<='1';
        else
        D2F_temp_lv5_1(  0)<='0';
        end if;
        if(D2F_temp_lv4_2(  0)='1' OR D2F_temp_lv4_2(  1)='1' )then
        D2F_temp_lv5_2(  0)<='1';
        else
        D2F_temp_lv5_2(  0)<='0';
        end if;
        if(D2F_temp_lv4_3(  0)='1' OR D2F_temp_lv4_3(  1)='1' )then
        D2F_temp_lv5_3(  0)<='1';
        else
        D2F_temp_lv5_3(  0)<='0';
        end if;
        if(D2F_temp_lv4_4(  0)='1' )then
        D2F_temp_lv5_4(  0)<='1';
        else
        D2F_temp_lv5_4(  0)<='0';
        end if;
        if(D2F_temp_lv4_5(  0)='1' OR D2F_temp_lv4_5(  1)='1' )then
        D2F_temp_lv5_5(  0)<='1';
        else
        D2F_temp_lv5_5(  0)<='0';
        end if;
        if(D2F_temp_lv4_6(  0)='1' OR D2F_temp_lv4_6(  1)='1' )then
        D2F_temp_lv5_6(  0)<='1';
        else
        D2F_temp_lv5_6(  0)<='0';
        end if;
        if(D2F_temp_lv4_7(  0)='1' OR D2F_temp_lv4_7(  1)='1' )then
        D2F_temp_lv5_7(  0)<='1';
        else
        D2F_temp_lv5_7(  0)<='0';
        end if;
        if(D3F_temp_lv4_0(  0)='1' )then
        D3F_temp_lv5_0(  0)<='1';
        else
        D3F_temp_lv5_0(  0)<='0';
        end if;
        if(D3F_temp_lv4_1(  0)='1' OR D3F_temp_lv4_1(  1)='1' )then
        D3F_temp_lv5_1(  0)<='1';
        else
        D3F_temp_lv5_1(  0)<='0';
        end if;
        if(D3F_temp_lv4_2(  0)='1' OR D3F_temp_lv4_2(  1)='1' )then
        D3F_temp_lv5_2(  0)<='1';
        else
        D3F_temp_lv5_2(  0)<='0';
        end if;
        if(D3F_temp_lv4_3(  0)='1' OR D3F_temp_lv4_3(  1)='1' )then
        D3F_temp_lv5_3(  0)<='1';
        else
        D3F_temp_lv5_3(  0)<='0';
        end if;
        if(D3F_temp_lv4_4(  0)='1' )then
        D3F_temp_lv5_4(  0)<='1';
        else
        D3F_temp_lv5_4(  0)<='0';
        end if;
        if(D3F_temp_lv4_5(  0)='1' OR D3F_temp_lv4_5(  1)='1' )then
        D3F_temp_lv5_5(  0)<='1';
        else
        D3F_temp_lv5_5(  0)<='0';
        end if;
        if(D3F_temp_lv4_6(  0)='1' OR D3F_temp_lv4_6(  1)='1' )then
        D3F_temp_lv5_6(  0)<='1';
        else
        D3F_temp_lv5_6(  0)<='0';
        end if;
        if(D3F_temp_lv4_7(  0)='1' )then
        D3F_temp_lv5_7(  0)<='1';
        else
        D3F_temp_lv5_7(  0)<='0';
        end if;
        if(D4F_temp_lv4_0(  0)='1' OR D4F_temp_lv4_0(  1)='1' )then
        D4F_temp_lv5_0(  0)<='1';
        else
        D4F_temp_lv5_0(  0)<='0';
        end if;
        if(D4F_temp_lv4_1(  0)='1' OR D4F_temp_lv4_1(  1)='1' )then
        D4F_temp_lv5_1(  0)<='1';
        else
        D4F_temp_lv5_1(  0)<='0';
        end if;
        if(D4F_temp_lv4_2(  0)='1' OR D4F_temp_lv4_2(  1)='1' )then
        D4F_temp_lv5_2(  0)<='1';
        else
        D4F_temp_lv5_2(  0)<='0';
        end if;
        if(D4F_temp_lv4_3(  0)='1' OR D4F_temp_lv4_3(  1)='1' )then
        D4F_temp_lv5_3(  0)<='1';
        else
        D4F_temp_lv5_3(  0)<='0';
        end if;
        if(D4F_temp_lv4_4(  0)='1' OR D4F_temp_lv4_4(  1)='1' )then
        D4F_temp_lv5_4(  0)<='1';
        else
        D4F_temp_lv5_4(  0)<='0';
        end if;
        if(D4F_temp_lv4_5(  0)='1' OR D4F_temp_lv4_5(  1)='1' )then
        D4F_temp_lv5_5(  0)<='1';
        else
        D4F_temp_lv5_5(  0)<='0';
        end if;
        if(D4F_temp_lv4_6(  0)='1' OR D4F_temp_lv4_6(  1)='1' )then
        D4F_temp_lv5_6(  0)<='1';
        else
        D4F_temp_lv5_6(  0)<='0';
        end if;
        if(D4F_temp_lv4_7(  0)='1' OR D4F_temp_lv4_7(  1)='1' )then
        D4F_temp_lv5_7(  0)<='1';
        else
        D4F_temp_lv5_7(  0)<='0';
        end if;
 end if;
end process;
lookuptable_LV6 : process(c1)    
begin
 if c1'event and c1='1' then
        if(D0F_temp_lv5_0(  0)='1' )then
        D0F_temp_lv6_0(  0)<='1';
        else
        D0F_temp_lv6_0(  0)<='0';
        end if;
        if(D0F_temp_lv5_1(  0)='1' )then
        D0F_temp_lv6_1(  0)<='1';
        else
        D0F_temp_lv6_1(  0)<='0';
        end if;
        if(D0F_temp_lv5_2(  0)='1' )then
        D0F_temp_lv6_2(  0)<='1';
        else
        D0F_temp_lv6_2(  0)<='0';
        end if;
        if(D0F_temp_lv5_3(  0)='1' )then
        D0F_temp_lv6_3(  0)<='1';
        else
        D0F_temp_lv6_3(  0)<='0';
        end if;
        if(D0F_temp_lv5_4(  0)='1' )then
        D0F_temp_lv6_4(  0)<='1';
        else
        D0F_temp_lv6_4(  0)<='0';
        end if;
        if(D0F_temp_lv5_5(  0)='1' )then
        D0F_temp_lv6_5(  0)<='1';
        else
        D0F_temp_lv6_5(  0)<='0';
        end if;
        if(D0F_temp_lv5_6(  0)='1' )then
        D0F_temp_lv6_6(  0)<='1';
        else
        D0F_temp_lv6_6(  0)<='0';
        end if;
        if(D0F_temp_lv5_7(  0)='1' )then
        D0F_temp_lv6_7(  0)<='1';
        else
        D0F_temp_lv6_7(  0)<='0';
        end if;
        if(D1F_temp_lv5_0(  0)='1' )then
        D1F_temp_lv6_0(  0)<='1';
        else
        D1F_temp_lv6_0(  0)<='0';
        end if;
        if(D1F_temp_lv5_1(  0)='1' )then
        D1F_temp_lv6_1(  0)<='1';
        else
        D1F_temp_lv6_1(  0)<='0';
        end if;
        if(D1F_temp_lv5_2(  0)='1' )then
        D1F_temp_lv6_2(  0)<='1';
        else
        D1F_temp_lv6_2(  0)<='0';
        end if;
        if(D1F_temp_lv5_3(  0)='1' )then
        D1F_temp_lv6_3(  0)<='1';
        else
        D1F_temp_lv6_3(  0)<='0';
        end if;
        if(D1F_temp_lv5_4(  0)='1' )then
        D1F_temp_lv6_4(  0)<='1';
        else
        D1F_temp_lv6_4(  0)<='0';
        end if;
        if(D1F_temp_lv5_5(  0)='1' )then
        D1F_temp_lv6_5(  0)<='1';
        else
        D1F_temp_lv6_5(  0)<='0';
        end if;
        if(D1F_temp_lv5_6(  0)='1' )then
        D1F_temp_lv6_6(  0)<='1';
        else
        D1F_temp_lv6_6(  0)<='0';
        end if;
        if(D1F_temp_lv5_7(  0)='1' )then
        D1F_temp_lv6_7(  0)<='1';
        else
        D1F_temp_lv6_7(  0)<='0';
        end if;
        if(D2F_temp_lv5_0(  0)='1' )then
        D2F_temp_lv6_0(  0)<='1';
        else
        D2F_temp_lv6_0(  0)<='0';
        end if;
        if(D2F_temp_lv5_1(  0)='1' )then
        D2F_temp_lv6_1(  0)<='1';
        else
        D2F_temp_lv6_1(  0)<='0';
        end if;
        if(D2F_temp_lv5_2(  0)='1' )then
        D2F_temp_lv6_2(  0)<='1';
        else
        D2F_temp_lv6_2(  0)<='0';
        end if;
        if(D2F_temp_lv5_3(  0)='1' )then
        D2F_temp_lv6_3(  0)<='1';
        else
        D2F_temp_lv6_3(  0)<='0';
        end if;
        if(D2F_temp_lv5_4(  0)='1' )then
        D2F_temp_lv6_4(  0)<='1';
        else
        D2F_temp_lv6_4(  0)<='0';
        end if;
        if(D2F_temp_lv5_5(  0)='1' )then
        D2F_temp_lv6_5(  0)<='1';
        else
        D2F_temp_lv6_5(  0)<='0';
        end if;
        if(D2F_temp_lv5_6(  0)='1' )then
        D2F_temp_lv6_6(  0)<='1';
        else
        D2F_temp_lv6_6(  0)<='0';
        end if;
        if(D2F_temp_lv5_7(  0)='1' )then
        D2F_temp_lv6_7(  0)<='1';
        else
        D2F_temp_lv6_7(  0)<='0';
        end if;
        if(D3F_temp_lv5_0(  0)='1' )then
        D3F_temp_lv6_0(  0)<='1';
        else
        D3F_temp_lv6_0(  0)<='0';
        end if;
        if(D3F_temp_lv5_1(  0)='1' )then
        D3F_temp_lv6_1(  0)<='1';
        else
        D3F_temp_lv6_1(  0)<='0';
        end if;
        if(D3F_temp_lv5_2(  0)='1' )then
        D3F_temp_lv6_2(  0)<='1';
        else
        D3F_temp_lv6_2(  0)<='0';
        end if;
        if(D3F_temp_lv5_3(  0)='1' )then
        D3F_temp_lv6_3(  0)<='1';
        else
        D3F_temp_lv6_3(  0)<='0';
        end if;
        if(D3F_temp_lv5_4(  0)='1' )then
        D3F_temp_lv6_4(  0)<='1';
        else
        D3F_temp_lv6_4(  0)<='0';
        end if;
        if(D3F_temp_lv5_5(  0)='1' )then
        D3F_temp_lv6_5(  0)<='1';
        else
        D3F_temp_lv6_5(  0)<='0';
        end if;
        if(D3F_temp_lv5_6(  0)='1' )then
        D3F_temp_lv6_6(  0)<='1';
        else
        D3F_temp_lv6_6(  0)<='0';
        end if;
        if(D3F_temp_lv5_7(  0)='1' )then
        D3F_temp_lv6_7(  0)<='1';
        else
        D3F_temp_lv6_7(  0)<='0';
        end if;
        if(D4F_temp_lv5_0(  0)='1' )then
        D4F_temp_lv6_0(  0)<='1';
        else
        D4F_temp_lv6_0(  0)<='0';
        end if;
        if(D4F_temp_lv5_1(  0)='1' )then
        D4F_temp_lv6_1(  0)<='1';
        else
        D4F_temp_lv6_1(  0)<='0';
        end if;
        if(D4F_temp_lv5_2(  0)='1' )then
        D4F_temp_lv6_2(  0)<='1';
        else
        D4F_temp_lv6_2(  0)<='0';
        end if;
        if(D4F_temp_lv5_3(  0)='1' )then
        D4F_temp_lv6_3(  0)<='1';
        else
        D4F_temp_lv6_3(  0)<='0';
        end if;
        if(D4F_temp_lv5_4(  0)='1' )then
        D4F_temp_lv6_4(  0)<='1';
        else
        D4F_temp_lv6_4(  0)<='0';
        end if;
        if(D4F_temp_lv5_5(  0)='1' )then
        D4F_temp_lv6_5(  0)<='1';
        else
        D4F_temp_lv6_5(  0)<='0';
        end if;
        if(D4F_temp_lv5_6(  0)='1' )then
        D4F_temp_lv6_6(  0)<='1';
        else
        D4F_temp_lv6_6(  0)<='0';
        end if;
        if(D4F_temp_lv5_7(  0)='1' )then
        D4F_temp_lv6_7(  0)<='1';
        else
        D4F_temp_lv6_7(  0)<='0';
        end if;
 end if;
end process;
lookuptable_LV7 : process(c1)    
begin
 if c1'event and c1='1' then
        if(D0F_temp_lv6_0(  0)='1' )then
        D0F_temp_lv7_0(  0)<='1';
        else
        D0F_temp_lv7_0(  0)<='0';
        end if;
        if(D0F_temp_lv6_1(  0)='1' )then
        D0F_temp_lv7_1(  0)<='1';
        else
        D0F_temp_lv7_1(  0)<='0';
        end if;
        if(D0F_temp_lv6_2(  0)='1' )then
        D0F_temp_lv7_2(  0)<='1';
        else
        D0F_temp_lv7_2(  0)<='0';
        end if;
        if(D0F_temp_lv6_3(  0)='1' )then
        D0F_temp_lv7_3(  0)<='1';
        else
        D0F_temp_lv7_3(  0)<='0';
        end if;
        if(D0F_temp_lv6_4(  0)='1' )then
        D0F_temp_lv7_4(  0)<='1';
        else
        D0F_temp_lv7_4(  0)<='0';
        end if;
        if(D0F_temp_lv6_5(  0)='1' )then
        D0F_temp_lv7_5(  0)<='1';
        else
        D0F_temp_lv7_5(  0)<='0';
        end if;
        if(D0F_temp_lv6_6(  0)='1' )then
        D0F_temp_lv7_6(  0)<='1';
        else
        D0F_temp_lv7_6(  0)<='0';
        end if;
        if(D0F_temp_lv6_7(  0)='1' )then
        D0F_temp_lv7_7(  0)<='1';
        else
        D0F_temp_lv7_7(  0)<='0';
        end if;
        if(D1F_temp_lv6_0(  0)='1' )then
        D1F_temp_lv7_0(  0)<='1';
        else
        D1F_temp_lv7_0(  0)<='0';
        end if;
        if(D1F_temp_lv6_1(  0)='1' )then
        D1F_temp_lv7_1(  0)<='1';
        else
        D1F_temp_lv7_1(  0)<='0';
        end if;
        if(D1F_temp_lv6_2(  0)='1' )then
        D1F_temp_lv7_2(  0)<='1';
        else
        D1F_temp_lv7_2(  0)<='0';
        end if;
        if(D1F_temp_lv6_3(  0)='1' )then
        D1F_temp_lv7_3(  0)<='1';
        else
        D1F_temp_lv7_3(  0)<='0';
        end if;
        if(D1F_temp_lv6_4(  0)='1' )then
        D1F_temp_lv7_4(  0)<='1';
        else
        D1F_temp_lv7_4(  0)<='0';
        end if;
        if(D1F_temp_lv6_5(  0)='1' )then
        D1F_temp_lv7_5(  0)<='1';
        else
        D1F_temp_lv7_5(  0)<='0';
        end if;
        if(D1F_temp_lv6_6(  0)='1' )then
        D1F_temp_lv7_6(  0)<='1';
        else
        D1F_temp_lv7_6(  0)<='0';
        end if;
        if(D1F_temp_lv6_7(  0)='1' )then
        D1F_temp_lv7_7(  0)<='1';
        else
        D1F_temp_lv7_7(  0)<='0';
        end if;
        if(D2F_temp_lv6_0(  0)='1' )then
        D2F_temp_lv7_0(  0)<='1';
        else
        D2F_temp_lv7_0(  0)<='0';
        end if;
        if(D2F_temp_lv6_1(  0)='1' )then
        D2F_temp_lv7_1(  0)<='1';
        else
        D2F_temp_lv7_1(  0)<='0';
        end if;
        if(D2F_temp_lv6_2(  0)='1' )then
        D2F_temp_lv7_2(  0)<='1';
        else
        D2F_temp_lv7_2(  0)<='0';
        end if;
        if(D2F_temp_lv6_3(  0)='1' )then
        D2F_temp_lv7_3(  0)<='1';
        else
        D2F_temp_lv7_3(  0)<='0';
        end if;
        if(D2F_temp_lv6_4(  0)='1' )then
        D2F_temp_lv7_4(  0)<='1';
        else
        D2F_temp_lv7_4(  0)<='0';
        end if;
        if(D2F_temp_lv6_5(  0)='1' )then
        D2F_temp_lv7_5(  0)<='1';
        else
        D2F_temp_lv7_5(  0)<='0';
        end if;
        if(D2F_temp_lv6_6(  0)='1' )then
        D2F_temp_lv7_6(  0)<='1';
        else
        D2F_temp_lv7_6(  0)<='0';
        end if;
        if(D2F_temp_lv6_7(  0)='1' )then
        D2F_temp_lv7_7(  0)<='1';
        else
        D2F_temp_lv7_7(  0)<='0';
        end if;
        if(D3F_temp_lv6_0(  0)='1' )then
        D3F_temp_lv7_0(  0)<='1';
        else
        D3F_temp_lv7_0(  0)<='0';
        end if;
        if(D3F_temp_lv6_1(  0)='1' )then
        D3F_temp_lv7_1(  0)<='1';
        else
        D3F_temp_lv7_1(  0)<='0';
        end if;
        if(D3F_temp_lv6_2(  0)='1' )then
        D3F_temp_lv7_2(  0)<='1';
        else
        D3F_temp_lv7_2(  0)<='0';
        end if;
        if(D3F_temp_lv6_3(  0)='1' )then
        D3F_temp_lv7_3(  0)<='1';
        else
        D3F_temp_lv7_3(  0)<='0';
        end if;
        if(D3F_temp_lv6_4(  0)='1' )then
        D3F_temp_lv7_4(  0)<='1';
        else
        D3F_temp_lv7_4(  0)<='0';
        end if;
        if(D3F_temp_lv6_5(  0)='1' )then
        D3F_temp_lv7_5(  0)<='1';
        else
        D3F_temp_lv7_5(  0)<='0';
        end if;
        if(D3F_temp_lv6_6(  0)='1' )then
        D3F_temp_lv7_6(  0)<='1';
        else
        D3F_temp_lv7_6(  0)<='0';
        end if;
        if(D3F_temp_lv6_7(  0)='1' )then
        D3F_temp_lv7_7(  0)<='1';
        else
        D3F_temp_lv7_7(  0)<='0';
        end if;
        if(D4F_temp_lv6_0(  0)='1' )then
        D4F_temp_lv7_0(  0)<='1';
        else
        D4F_temp_lv7_0(  0)<='0';
        end if;
        if(D4F_temp_lv6_1(  0)='1' )then
        D4F_temp_lv7_1(  0)<='1';
        else
        D4F_temp_lv7_1(  0)<='0';
        end if;
        if(D4F_temp_lv6_2(  0)='1' )then
        D4F_temp_lv7_2(  0)<='1';
        else
        D4F_temp_lv7_2(  0)<='0';
        end if;
        if(D4F_temp_lv6_3(  0)='1' )then
        D4F_temp_lv7_3(  0)<='1';
        else
        D4F_temp_lv7_3(  0)<='0';
        end if;
        if(D4F_temp_lv6_4(  0)='1' )then
        D4F_temp_lv7_4(  0)<='1';
        else
        D4F_temp_lv7_4(  0)<='0';
        end if;
        if(D4F_temp_lv6_5(  0)='1' )then
        D4F_temp_lv7_5(  0)<='1';
        else
        D4F_temp_lv7_5(  0)<='0';
        end if;
        if(D4F_temp_lv6_6(  0)='1' )then
        D4F_temp_lv7_6(  0)<='1';
        else
        D4F_temp_lv7_6(  0)<='0';
        end if;
        if(D4F_temp_lv6_7(  0)='1' )then
        D4F_temp_lv7_7(  0)<='1';
        else
        D4F_temp_lv7_7(  0)<='0';
        end if;
 end if;
end process;
lookuptable_LV8 : process(c1)    
begin
 if c1'event and c1='1' then
        if(D0F_temp_lv7_0(  0)='1') then
        DF_temp_lv8(0)<='1';
        else
        DF_temp_lv8(0)<='0';
        end if;
        if(D1F_temp_lv7_0(  0)='1' OR D2F_temp_lv7_0(  0)='1' OR D3F_temp_lv7_0(  0)='1' OR D4F_temp_lv7_0(  0)='1') then
        DF_temp_lv8(1)<='1';
        else
        DF_temp_lv8(1)<='0';
        end if;
        if(D0F_temp_lv7_1(  0)='1') then
        DF_temp_lv8(2)<='1';
        else
        DF_temp_lv8(2)<='0';
        end if;
        if(D1F_temp_lv7_1(  0)='1' OR D2F_temp_lv7_1(  0)='1' OR D3F_temp_lv7_1(  0)='1' OR D4F_temp_lv7_1(  0)='1') then
        DF_temp_lv8(3)<='1';
        else
        DF_temp_lv8(3)<='0';
        end if;
        if(D0F_temp_lv7_2(  0)='1') then
        DF_temp_lv8(4)<='1';
        else
        DF_temp_lv8(4)<='0';
        end if;
        if(D1F_temp_lv7_2(  0)='1' OR D2F_temp_lv7_2(  0)='1' OR D3F_temp_lv7_2(  0)='1' OR D4F_temp_lv7_2(  0)='1') then
        DF_temp_lv8(5)<='1';
        else
        DF_temp_lv8(5)<='0';
        end if;
        if(D0F_temp_lv7_3(  0)='1') then
        DF_temp_lv8(6)<='1'; 
        else
        DF_temp_lv8(6)<='0';
        end if;
        if(D1F_temp_lv7_3(  0)='1' OR D2F_temp_lv7_3(  0)='1' OR D3F_temp_lv7_3(  0)='1' OR D4F_temp_lv7_3(  0)='1') then
        DF_temp_lv8(7)<='1';
        else
        DF_temp_lv8(7)<='0';
        end if;
        if(D0F_temp_lv7_4(  0)='1') then
        DF_temp_lv8(8)<='1'; 
        else
        DF_temp_lv8(8)<='0';
        end if;
        if(D1F_temp_lv7_4(  0)='1' OR D2F_temp_lv7_4(  0)='1' OR D3F_temp_lv7_4(  0)='1' OR D4F_temp_lv7_4(  0)='1') then
        DF_temp_lv8(9)<='1';
        else
        DF_temp_lv8(9)<='0';
        end if;
        if(D0F_temp_lv7_5(  0)='1') then
        DF_temp_lv8(10)<='1'; 
        else
        DF_temp_lv8(10)<='0';
        end if;
        if(D1F_temp_lv7_5(  0)='1' OR D2F_temp_lv7_5(  0)='1' OR D3F_temp_lv7_5(  0)='1' OR D4F_temp_lv7_5(  0)='1') then
        DF_temp_lv8(11)<='1';
        else
        DF_temp_lv8(11)<='0';
        end if;
        if(D0F_temp_lv7_6(  0)='1') then
        DF_temp_lv8(12)<='1'; 
        else
        DF_temp_lv8(12)<='0';
        end if;
        if(D1F_temp_lv7_6(  0)='1' OR D2F_temp_lv7_6(  0)='1' OR D3F_temp_lv7_6(  0)='1' OR D4F_temp_lv7_6(  0)='1') then
        DF_temp_lv8(13)<='1';
        else
        DF_temp_lv8(13)<='0';
        end if;
        if(D0F_temp_lv7_7(  0)='1') then
        DF_temp_lv8(14)<='1'; 
        else
        DF_temp_lv8(14)<='0';
        end if;
        if(D1F_temp_lv7_7(  0)='1' OR D2F_temp_lv7_7(  0)='1' OR D3F_temp_lv7_7(  0)='1' OR D4F_temp_lv7_7(  0)='1') then
        DF_temp_lv8(15)<='1';
        else
        DF_temp_lv8(15)<='0';
        end if;
end if;
end process;
lookuptable_LV9 : process(c1)    
begin
 if c1'event and c1='1' then
        if(DF_temp_lv8(  0)='1' OR DF_temp_lv8(  1)='1') then
        DF_temp_lv9(0)<='1';
        else
        DF_temp_lv9(0)<='0';
        end if;
        if(DF_temp_lv8(  2)='1' OR DF_temp_lv8(  3)='1') then
        DF_temp_lv9(1)<='1';
        else
        DF_temp_lv9(1)<='0';
        end if;
        if(DF_temp_lv8(  4)='1' OR DF_temp_lv8(  5)='1') then
        DF_temp_lv9(2)<='1';
        else
        DF_temp_lv9(2)<='0';
        end if;
        if(DF_temp_lv8(  6)='1' OR DF_temp_lv8(  7)='1') then
        DF_temp_lv9(3)<='1';
        else
        DF_temp_lv9(3)<='0';
        end if;
        if(DF_temp_lv8(  8)='1' OR DF_temp_lv8(  9)='1') then
        DF_temp_lv9(4)<='1';
        else
        DF_temp_lv9(4)<='0';
        end if;
        if(DF_temp_lv8( 10)='1' OR DF_temp_lv8( 11)='1') then
        DF_temp_lv9(5)<='1';
        else
        DF_temp_lv9(5)<='0';
        end if;
        if(DF_temp_lv8( 12)='1' OR DF_temp_lv8( 13)='1') then
        DF_temp_lv9(6)<='1';
        else
        DF_temp_lv9(6)<='0';
        end if;
        if(DF_temp_lv8( 14)='1' OR DF_temp_lv8( 15)='1') then
        DF_temp_lv9(7)<='1';
        else
        DF_temp_lv9(7)<='0';
        end if;
end if;
end process;
END rtl;
