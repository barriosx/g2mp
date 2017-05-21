----------------------------------------------------------------------------------
-- 32BIT EXTENDER
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

entity EXT32 is
	port (
		I_EXT_16 : in std_logic_vector (15 downto 0);
		O_EXT_32 : out std_logic_vector (31 downto 0)
		);
end EXT32;

architecture Behavioral of EXT32 is

begin
	
	process (I_EXT_16)
	variable temp : std_logic_vector (31 downto 0);
	begin
		if I_EXT_16(15) = '0' then
			temp := (others => '0');
			temp (15 downto 0) := I_EXT_16;
			O_EXT_32 <= temp (31 downto 0);
		end if;
		if I_EXT_16(15) = '1' then
			temp := (others => '1');
			temp (15 downto 0) := I_EXT_16;
			O_EXT_32 <= temp (31 downto 0);
		end if;
	end process;
end Behavioral;

