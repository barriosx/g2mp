-- Vhdl test bench created from schematic C:\Users\C.k Obieyisi\Documents\Fax\VHDL Projects\Mips_processor\control_schem.sch - Fri May 12 01:39:06 2017
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY control_schem_control_schem_sch_tb IS
END control_schem_control_schem_sch_tb;
ARCHITECTURE behavioral OF control_schem_control_schem_sch_tb IS 

   COMPONENT control_schem
   PORT( CTL_EN	:	IN	STD_LOGIC; 
          CTL_INST	:	IN	STD_LOGIC_VECTOR (5 DOWNTO 0); 
          RegDst	:	OUT	STD_LOGIC; 
          Branch	:	OUT	STD_LOGIC; 
          MemRead	:	OUT	STD_LOGIC; 
          MemtoReg	:	OUT	STD_LOGIC; 
          MemWrite	:	OUT	STD_LOGIC; 
          ALUSrc	:	OUT	STD_LOGIC; 
          RegWrite	:	OUT	STD_LOGIC; 
          ALUOp	:	OUT	STD_LOGIC_VECTOR (1 DOWNTO 0));
   END COMPONENT;

   SIGNAL CTL_EN	:	STD_LOGIC;
   SIGNAL CTL_INST	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
   SIGNAL RegDst	:	STD_LOGIC;
   SIGNAL Branch	:	STD_LOGIC;
   SIGNAL MemRead	:	STD_LOGIC;
   SIGNAL MemtoReg	:	STD_LOGIC;
   SIGNAL MemWrite	:	STD_LOGIC;
   SIGNAL ALUSrc	:	STD_LOGIC;
   SIGNAL RegWrite	:	STD_LOGIC;
   SIGNAL ALUOp	:	STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN

   UUT: control_schem PORT MAP(
		CTL_EN => CTL_EN, 
		CTL_INST => CTL_INST, 
		RegDst => RegDst, 
		Branch => Branch, 
		MemRead => MemRead, 
		MemtoReg => MemtoReg, 
		MemWrite => MemWrite, 
		ALUSrc => ALUSrc, 
		RegWrite => RegWrite, 
		ALUOp => ALUOp
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	
		CTL_EN <= '1';
		
		CTL_INST <= "101011";
      WAIT for 10 ns;
		
		CTL_INST <= "001000";
      WAIT for 10 ns;
		
		CTL_INST <= "001001";
      WAIT for 10 ns;
		
		CTL_INST <= "000101";
      WAIT for 10 ns;
		
		CTL_INST <= "000000";
      WAIT for 10 ns;
		
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
