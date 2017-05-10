-- ALU component
--
-- This component takes in 2 inputs, performs one of 2 
-- operations between them (add , ubtract) and returns the result.
--
-- Also returns a zero flag that is true if the 2 inputs
-- are equal and false otherwise.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity EMP_ALU is
	port (
			 I_ALU_EN   : in 		STD_LOGIC;
			 I_ALU_CTL  : in		STD_LOGIC_VECTOR (3 downto 0);
			 I_ALU_A		: in 		STD_LOGIC_VECTOR (31 downto 0);
			 I_ALU_B		: in 		STD_LOGIC_VECTOR (31 downto 0);
			 O_ALU_Out	: out 	STD_LOGIC_VECTOR (31 downto 0);
			 O_ALU_Zero : out		STD_LOGIC
			);
			 
end EMP_ALU;

architecture Behavioral of EMP_ALU is
		signal add								 : std_logic_vector(3 downto 0):= "0010";
		signal subtract_not_equal			 : std_logic_vector(3 downto 0):= "0110";
	
begin

process (I_ALU_A, I_ALU_B, I_ALU_CTL, I_ALU_EN)
begin 	
	
	 if(I_ALU_CTL = add) then
		O_ALU_Out <=	I_ALU_A + I_ALU_B;
		
	 elsif(I_ALU_CTL = subtract_not_equal) then
		O_ALU_Out <=	I_ALU_A - I_ALU_B;
		
	 end if;
	 
	 
	
	 if(I_ALU_A /= I_ALU_B and I_ALU_CTL = subtract_not_equal) then
		O_ALU_Zero <=	'0';
		
	 elsif (I_ALU_A  = I_ALU_B and I_ALU_CTL = subtract_not_equal) then
		O_ALU_Zero <=	'1';
		
	 elsif (I_ALU_A  = I_ALU_B and I_ALU_CTL = add) then		
		O_ALU_Zero <=	'1';
	
	 elsif (I_ALU_A  /= I_ALU_B and I_ALU_CTL = add) then		
		O_ALU_Zero <=	'1';

		
	 end if;

END PROCESS;
END Behavioral;


