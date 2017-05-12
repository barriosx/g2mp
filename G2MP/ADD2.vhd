----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:56:14 05/11/2017 
-- Design Name: 
-- Module Name:    ADD2 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ADD2 is
		port (
		I_ADD2_A : in std_logic_vector (31 downto 0);
		I_ADD2_B : in std_logic_vector(31 downto 0);
		O_ADD2_Out : out std_logic_vector(31 downto 0)
	);
end ADD2;

architecture Behavioral of ADD2 is
 signal temp : std_logic_vector (32 downto 0); 
 
begin
		temp <= std_logic_vector(unsigned(I_ADD2_A ) + unsigned (I_ADD2_B));
		
		O_ADD2_Out <= temp (31 downto 0);
		
end Behavioral;

