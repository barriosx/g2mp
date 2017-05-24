----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:18:03 05/11/2017 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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

entity RAM is
		Port (
		I_RAM_EN : in std_logic;
		I_RAM_RE : in std_logic;
		I_RAM_WE : in std_logic;
		I_RAM_ADDR : in std_logic_vector (31 downto 0);
		I_RAM_DATA : in std_logic_vector (31 downto 0);
		O_RAM_DATA : out std_logic_vector (31 downto 0)
		);
end RAM;

architecture Behavioral of RAM is

		type ram_type is array (natural range <>) of std_logic_vector(31 downto 0);
	   signal ram:     ram_type(0 to 255) := (others=> (others => '0'));
		signal Address: integer := 0;
begin
		
		process(I_RAM_EN,I_RAM_RE,I_RAM_WE,I_RAM_ADDR,I_RAM_DATA) begin
			Address <= to_integer (unsigned(I_RAM_ADDR(7 downto 0))); -- offset for RAM address 
			if(I_RAM_EN = '1') then 
				if(I_RAM_WE = '1') then
					ram(Address) <= I_RAM_DATA;
				elsif(I_RAM_RE = '1') then 
					O_RAM_DATA <= ram(Address);
				end if;
			end if;
		end process;
end Behavioral;

