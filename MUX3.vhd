----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:55 05/11/2017 
-- Design Name: 
-- Module Name:    MUX3 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity MUX3 is
		port (
		Read_Data_2: in std_logic_vector(15 downto 0);
		Sign_Extend: in std_logic_vector (31 downto 0);
		s: in std_logic;
		Mux_out: out std_logic_vector(31 downto 0)
	);
end MUX3;

architecture Behavioral of MUX3 is

begin
   Mux_out <= Read_Data_2 when (s='0') else Sign_Extend;


end Behavioral;

