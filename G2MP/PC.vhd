library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( I_PC_UPDATE : in  STD_LOGIC;
           I_PC : in  STD_LOGIC_VECTOR (31 downto 0);
           O_PC : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end PC;

architecture Behavioral of PC is

signal pc_prev : std_logic_vector (31 downto 0) := (others => '0') ;

begin

process(I_PC_UPDATE,I_PC)
begin
	if I_PC_UPDATE = '1' then
		pc_prev<=I_PC;
	end if;
	O_PC <= pc_prev;

end process;


end Behavioral;

