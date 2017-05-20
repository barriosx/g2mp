----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:04:26 05/09/2017 
-- Design Name: 
-- Module Name:    REG - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity REG is
    Port ( I_REG_EN : in  STD_LOGIC;
           I_REG_WE : in  STD_LOGIC;
           I_REG_SEL_RS : in  STD_LOGIC_VECTOR (4 downto 0);
           I_REG_SEL_RT : in  STD_LOGIC_VECTOR (4 downto 0);
           I_REG_SEL_RD : in  STD_LOGIC_VECTOR (4 downto 0);
           I_REG_DATA_RD : in  STD_LOGIC_VECTOR (31 downto 0);
           O_REG_DATA_A : out  STD_LOGIC_VECTOR (31 downto 0);
           O_REG_DATA_B : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
    -- declare array type of size 32 containing registers of 32 bit long
    type reg32 is array (31 downto 0) of STD_LOGIC_VECTOR (31 downto 0);

end REG;

architecture Behavioral of REG is
    signal registr : reg32 := (others => "00000000000000000000000000000000") ; 
begin
	process(I_REG_EN,I_REG_WE,I_REG_SEL_RS,I_REG_SEL_RT)
    begin
      if I_REG_EN = '1' AND I_REG_WE = '1' then
            registr(to_integer(unsigned(I_REG_SEL_RD)))<= I_REG_DATA_RD;        
      else
            O_REG_DATA_A <= registr(to_integer(unsigned(I_REG_SEL_RS)))(31 downto 0);
            O_REG_DATA_B <= registr(to_integer(unsigned(I_REG_SEL_RT)))(31 downto 0);
      end if;
    end process;
end Behavioral;

