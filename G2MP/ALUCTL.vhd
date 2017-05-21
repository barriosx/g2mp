----------------------------------------------------------------------------------
-- When enabled, the alu control feeds the ALU op code 
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

entity ALUCTL is
	port (
			 I_ALU_OP      : in STD_LOGIC_VECTOR (1 downto 0);	  
			 I_ALU_FUNCT   : in STD_LOGIC_VECTOR (5 downto 0);  -- For addu instruction
			 O_ALU_CTR     : out STD_LOGIC_VECTOR (3 downto 0)  -- ALU op code 
		  );
end ALUCTL;

architecture Behavioral of ALUCTL is
begin
process(I_ALU_OP)
begin

	if(I_ALU_OP = "10") AND (I_ALU_FUNCT = "100001") then -- addu
		O_ALU_CTR <= "0010";	
	elsif(I_ALU_OP = "00") then -- addiu, addi, sw
		O_ALU_CTR <= "0010";	
    elsif(I_ALU_OP = "01") then -- bne
		O_ALU_CTR <= "0110";	
	end if;	 
end process;
end Behavioral;

