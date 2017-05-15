----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:57:47 05/10/2017 
-- Design Name: 
-- Module Name:    sign_extention_module - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity sign_extention_module is
	port (
		I_EXT_16 : in std_logic_vector (15 downto 0);
		O_EXT_32 : out std_logic_vector (31 downto 0)
		);
end sign_extention_module;

architecture Behavioral of sign_extention_module is

begin
	
	process (I_EXT_16)
	variable dummy : std_logic_vector (31 downto 0);
	begin
		
		if I_EXT_16(15) = '0' then
			dummy := (others => '0');
			dummy (15 downto 0) := I_EXT_16;
			O_EXT_32 <= dummy (31 downto 0);
		end if;
		
		if I_EXT_16(15) = '1' then
			dummy := (others => '1');
			dummy (15 downto 0) := I_EXT_16;
			O_EXT_32 <= dummy (31 downto 0);
		end if;
		
	end process;

end Behavioral;

