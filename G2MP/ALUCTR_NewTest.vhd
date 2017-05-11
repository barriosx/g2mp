-- Vhdl test bench created from schematic C:\Users\moehi\EMP\ALUCTR_Schem.sch - Wed May 10 16:36:27 2017
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
ENTITY ALUCTR_Schem_ALUCTR_Schem_sch_tb IS
END ALUCTR_Schem_ALUCTR_Schem_sch_tb;
ARCHITECTURE behavioral OF ALUCTR_Schem_ALUCTR_Schem_sch_tb IS 

   COMPONENT ALUCTR_Schem
   PORT( ALUOp	:	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
          ALUFunct	:	IN	STD_LOGIC_VECTOR (5 DOWNTO 0); 
          ALUControl	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;

   SIGNAL ALUOp	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
   SIGNAL ALUFunct	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
   SIGNAL ALUControl	:	STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

   UUT: ALUCTR_Schem PORT MAP(
		ALUOp => ALUOp, 
		ALUFunct => ALUFunct, 
		ALUControl => ALUControl
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
--Testing addu
	ALUOp <= "10";
	ALUFunct <= "100001";
	wait for 50 ns;
--Testing addiu, addi, sw
	ALUOp <= "00";
	wait for 50 ns;
--Testing bne
	ALUOp <= "01";
	wait for 50 ns;
	
	
	
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
