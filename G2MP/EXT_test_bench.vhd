-- Vhdl test bench created from schematic C:\Users\C.k Obieyisi\Documents\Fax\VHDL Projects\Mips_processor\EXT_schem.sch - Wed May 10 23:09:36 2017
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
ENTITY EXT_schem_EXT_schem_sch_tb IS
END EXT_schem_EXT_schem_sch_tb;
ARCHITECTURE behavioral OF EXT_schem_EXT_schem_sch_tb IS 

   COMPONENT EXT_schem
   PORT( input_16bits	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          output_32bits	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0));
   END COMPONENT;

   SIGNAL input_16bits	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL output_32bits	:	STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN

   UUT: EXT_schem PORT MAP(
		input_16bits => input_16bits, 
		output_32bits => output_32bits
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		
		input_16bits <= "0000000000000010";
		
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
