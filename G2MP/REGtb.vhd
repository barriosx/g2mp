--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:40:55 05/10/2017
-- Design Name:   
-- Module Name:   C:/Lab5/G2MP/REGtb.vhd
-- Project Name:  G2MP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REG
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
USE ieee.numeric_std.ALL;
 
ENTITY REGtb IS
END REGtb;
 
ARCHITECTURE behavior OF REGtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT REG
    PORT(
         I_REG_EN : IN  std_logic;
         I_REG_WE : IN  std_logic;
         I_REG_SEL_RS : IN  std_logic_vector(4 downto 0);
         I_REG_SEL_RT : IN  std_logic_vector(4 downto 0);
         I_REG_SEL_RD : IN  std_logic_vector(4 downto 0);
         I_REG_DATA_RD : IN  std_logic_vector(31 downto 0);
         O_REG_DATA_A : OUT  std_logic_vector(31 downto 0);
         O_REG_DATA_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_REG_EN : std_logic := '0';
   signal I_REG_WE : std_logic := '0';
   signal I_REG_SEL_RS : std_logic_vector(4 downto 0) := (others => '0');
   signal I_REG_SEL_RT : std_logic_vector(4 downto 0) := (others => '0');
   signal I_REG_SEL_RD : std_logic_vector(4 downto 0) := (others => '0');
   signal I_REG_DATA_RD : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal O_REG_DATA_A : std_logic_vector(31 downto 0);
   signal O_REG_DATA_B : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: REG PORT MAP (
          I_REG_EN => I_REG_EN,
          I_REG_WE => I_REG_WE,
          I_REG_SEL_RS => I_REG_SEL_RS,
          I_REG_SEL_RT => I_REG_SEL_RT,
          I_REG_SEL_RD => I_REG_SEL_RD,
          I_REG_DATA_RD => I_REG_DATA_RD,
          O_REG_DATA_A => O_REG_DATA_A,
          O_REG_DATA_B => O_REG_DATA_B
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		I_REG_EN <= '0';
		wait for 20 ns;
		-- enable
		I_REG_EN <= '1';
		-- write to reg 1
		I_REG_WE <= '1';
		I_REG_SEL_RD <= "01001";
		I_REG_DATA_RD <= std_logic_vector(to_unsigned(490,32));
		wait for 20 ns;
		I_REG_EN <= '0';
		I_REG_WE <= '0';
		wait for 20 ns;
		
		-- write to reg 2
		I_REG_EN <= '1';
		I_REG_WE <= '1';
		I_REG_SEL_RD <= "00110";
		I_REG_DATA_RD <= std_logic_vector(to_unsigned(578,32));
		wait for 20 ns;
		I_REG_EN <= '0';
		I_REG_WE <= '0';
		wait for 20 ns;
		-- read from register 1 and 2
		I_REG_EN <= '1';
		I_REG_WE <= '0';
		I_REG_SEL_RS <= "01001";
		I_REG_SEL_RT <= "00110";
		wait for 20 ns;

      wait;
   end process;

END;
