--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:36:00 05/13/2017
-- Design Name:   
-- Module Name:   C:/Lab5/G2MP/MUX5_tb.vhd
-- Project Name:  G2MP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX5
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MUX5_tb IS
END MUX5_tb;
 
ARCHITECTURE behavior OF MUX5_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX5
    PORT(
         I_MUX_0 : IN  std_logic_vector(4 downto 0);
         I_MUX_1 : IN  std_logic_vector(4 downto 0);
         I_MUX_Sel : IN  std_logic;
         O_MUX_Out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_MUX_0 : std_logic_vector(4 downto 0) := (others => '0');
   signal I_MUX_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal I_MUX_Sel : std_logic := '0';

 	--Outputs
   signal O_MUX_Out : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX5 PORT MAP (
          I_MUX_0 => I_MUX_0,
          I_MUX_1 => I_MUX_1,
          I_MUX_Sel => I_MUX_Sel,
          O_MUX_Out => O_MUX_Out
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		I_MUX_0 <= "00000";
		I_MUX_1 <= "10000";
		I_MUX_Sel <= '1';
		wait for 100 ns;
		I_MUX_Sel <= '0';
		wait for 100 ns;
		I_MUX_0 <= "01000";
		I_MUX_1 <= "10100";
		I_MUX_Sel <= '1';
		wait for 100 ns;
		I_MUX_Sel <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
