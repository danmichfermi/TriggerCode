-- ****************************************************************************
-- Company:         CAEN SpA - Viareggio - Italy
-- Model:           V1495 -  Multipurpose Programmable Trigger Unit
-- FPGA Proj. Name: V1495USR_DEMO
-- Device:          ALTERA EP1C4F400C6
-- Author:          Luca Colombini
-- Date:            02-03-2006
-- ----------------------------------------------------------------------------
-- Module:          V1495USR_PKG
-- Description:     Package that implements global constants (ID Codes, 
--                  Register Addresses).
-- ****************************************************************************

-- ############################################################################
-- Revision History:
-- ############################################################################
LIBRARY ieee;
USE ieee.std_logic_1164.all;
PACKAGE v1495pkg IS
   
-- Constants
-- Expansion Mezzanine Type ID-Codes
constant A395A : std_logic_vector(2 downto 0) := "000"; -- 32CH IN LVDS/ECL INTERFACE
constant A395B : std_logic_vector(2 downto 0) := "001"; -- 32CH OUT LVDS INTERFACE
constant A395C : std_logic_vector(2 downto 0) := "010"; -- 32CH OUT ECL INTERFACE
constant A395D : std_logic_vector(2 downto 0) := "011"; -- 8CH I/O SELECT NIM/TTL INTER

-- Register Address Map
constant A_ASTATUS_L  : std_logic_vector(15 downto 0) := X"0000";
constant A_ASTATUS_H  : std_logic_vector(15 downto 0) := X"0002";
constant A_BSTATUS_L  : std_logic_vector(15 downto 0) := X"0004";
constant A_BSTATUS_H  : std_logic_vector(15 downto 0) := X"0006";
constant A_CSTATUS_L  : std_logic_vector(15 downto 0) := X"0008";
constant A_CSTATUS_H  : std_logic_vector(15 downto 0) := X"000A";
constant A_AMASK_L    : std_logic_vector(15 downto 0) := X"000C";
constant A_AMASK_H    : std_logic_vector(15 downto 0) := X"000E";
constant A_BMASK_L    : std_logic_vector(15 downto 0) := X"0010";
constant A_BMASK_H    : std_logic_vector(15 downto 0) := X"0012";
constant A_CMASK_L    : std_logic_vector(15 downto 0) := X"0014";
constant A_CMASK_H    : std_logic_vector(15 downto 0) := X"0016";
constant A_GATEWIDTH  : std_logic_vector(15 downto 0) := X"0018";
constant A_CCTRL_L    : std_logic_vector(15 downto 0) := X"001A";
constant A_CCTRL_H    : std_logic_vector(15 downto 0) := X"001C";
constant A_MODE       : std_logic_vector(15 downto 0) := X"001E";
constant A_SCRATCH    : std_logic_vector(15 downto 0) := X"0020";
constant A_GCTRL      : std_logic_vector(15 downto 0) := X"0022";
constant A_DCTRL_L    : std_logic_vector(15 downto 0) := X"0024";
constant A_DCTRL_H    : std_logic_vector(15 downto 0) := X"0026";
constant A_DDATA_L    : std_logic_vector(15 downto 0) := X"0028";
constant A_DDATA_H    : std_logic_vector(15 downto 0) := X"002A";
constant A_ECTRL_L    : std_logic_vector(15 downto 0) := X"002C";
constant A_ECTRL_H    : std_logic_vector(15 downto 0) := X"002E";
constant A_EDATA_L    : std_logic_vector(15 downto 0) := X"0030";
constant A_EDATA_H    : std_logic_vector(15 downto 0) := X"0032";
constant A_FCTRL_L    : std_logic_vector(15 downto 0) := X"0034";
constant A_FCTRL_H    : std_logic_vector(15 downto 0) := X"0036";
constant A_FDATA_L    : std_logic_vector(15 downto 0) := X"0038";
constant A_FDATA_H    : std_logic_vector(15 downto 0) := X"003A";
constant A_REVISION   : std_logic_vector(15 downto 0) := X"003C";
constant A_PDL_CTRL   : std_logic_vector(15 downto 0) := X"003E";
constant A_PDL_DATA   : std_logic_vector(15 downto 0) := X"0040";
constant A_DIDCODE    : std_logic_vector(15 downto 0) := X"0042";
constant A_EIDCODE    : std_logic_vector(15 downto 0) := X"0044";
constant A_FIDCODE    : std_logic_vector(15 downto 0) := X"0046";
         
END v1495pkg;
