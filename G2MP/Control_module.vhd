----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:40:02 05/11/2017 
-- Design Name: 
-- Module Name:    Control_module - Behavioral 
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

entity Control_module is
	port (
		I_CTL_EN : in std_logic;
		I_CTL_INST : in std_logic_vector (5 downto 0);
		O_CTL_RegDst : out std_logic;
		O_CTL_Branch : out std_logic;
		O_CTL_MemRead : out std_logic;
		O_CTL_MemtoReg : out std_logic;
		O_CTL_ALUOp : out std_logic_vector (1 downto 0);
		O_CTL_MemWrite : out std_logic;
		O_CTL_ALUSrc : out std_logic;
		O_CTL_RegWrite : out std_logic
		);
		
end Control_module;

architecture Behavioral of Control_module is

begin
	process (I_CTL_INST, I_CTL_EN)
	begin 
		
		if I_CTL_EN = '1' then 
			
			if (I_CTL_INST = "101011") then --sw
				O_CTL_RegDst <= '0';
				O_CTL_Branch <= '0';
				O_CTL_MemRead <= '0';
				O_CTL_MemtoReg <= '0';
				O_CTL_ALUOp <= "00";
				O_CTL_MemWrite <= '1';
				O_CTL_ALUSrc <= '1';
				O_CTL_RegWrite	<=	'0';
			end if;
			
			if (I_CTL_INST = "001000") then -- addi
				O_CTL_RegDst <= '0';
				O_CTL_Branch <= '0';
				O_CTL_MemRead <= '0';
				O_CTL_MemtoReg <= '0';
				O_CTL_ALUOp <= "00";
				O_CTL_MemWrite <= '0';
				O_CTL_ALUSrc <= '1';
				O_CTL_RegWrite	<=	'1';
			end if;
			
			if (I_CTL_INST = "001001") then --addiu
				O_CTL_RegDst <= '0';
				O_CTL_Branch <= '0';
				O_CTL_MemRead <= '0';
				O_CTL_MemtoReg <= '0';
				O_CTL_ALUOp <= "00";
				O_CTL_MemWrite <= '0';
				O_CTL_ALUSrc <= '1';
				O_CTL_RegWrite	<=	'1';
			end if;
			
			if (I_CTL_INST = "000101") then --bne
				O_CTL_RegDst <= '0';
				O_CTL_Branch <= '1';
				O_CTL_MemRead <= '0';
				O_CTL_MemtoReg <= '0';
				O_CTL_ALUOp <= "01";
				O_CTL_MemWrite <= '0';
				O_CTL_ALUSrc <= '0';
				O_CTL_RegWrite	<=	'0';
			end if;
			
			if (I_CTL_INST = "000000") then --add
				O_CTL_RegDst <= '1';
				O_CTL_Branch <= '0';
				O_CTL_MemRead <= '0';
				O_CTL_MemtoReg <= '0';
				O_CTL_ALUOp <= "10";
				O_CTL_MemWrite <= '0';
				O_CTL_ALUSrc <= '0';
				O_CTL_RegWrite	<=	'1';
			end if;
	
		end if;
	
	end process;		

end Behavioral;

