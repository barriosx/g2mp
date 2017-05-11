----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:10:49 05/09/2017 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM is
    Port ( I_FSM_CLK : in  STD_LOGIC;
           I_FSM_EN : in  STD_LOGIC;
           I_FSM_INST : in  STD_LOGIC_VECTOR (31 downto 0);
           O_FSM_IF : out  STD_LOGIC;
           O_FSM_ID : out  STD_LOGIC;
           O_FSM_EX : out  STD_LOGIC;
           O_FSM_ME : out  STD_LOGIC;
           O_FSM_WB : out  STD_LOGIC);
end FSM;

architecture Behavioral of FSM is
-- We have to represent 5 states (at least 3 bits) 
signal state : STD_LOGIC_VECTOR (4 downto 0) :=(others=>'0');
begin 
	process(I_FSM_CLK,I_FSM_EN,I_FSM_INST)
	
	begin
	if (rising_edge(I_FSM_CLK) and I_FSM_EN='1') then 
		if(state ="00000") then
			O_FSM_IF <= '1'; -- Fetch 
			O_FSM_ID <= '0'; 
			O_FSM_EX <= '0';
			O_FSM_ME <= '0';
			O_FSM_WB <= '0';
			state <= "00001";
		elsif(state ="00001") then
			O_FSM_IF <= '0'; 
			O_FSM_ID <= '1'; -- Read register rd or rs
			O_FSM_EX <= '0';
			O_FSM_ME <= '0';
			O_FSM_WB <= '0';
			state <= "00010";
		elsif(state ="00010") then
			O_FSM_IF <= '0'; 
			O_FSM_ID <= '0'; 
			O_FSM_EX <= '1';-- Instruction is known, so function is executed
			O_FSM_ME <= '0';
			O_FSM_WB <= '0';
			state <= "00100";
		elsif(state ="00100") then
			O_FSM_IF <= '0'; 
			O_FSM_ID <= '0'; 
			O_FSM_EX <= '0';
			O_FSM_ME <= '1'; -- Memory is accessed based on address computed before
			O_FSM_WB <= '0';
			state <= "01000";
		elsif(state ="01000") then
			O_FSM_IF <= '0'; 
			O_FSM_ID <= '0'; 
			O_FSM_EX <= '0';
			O_FSM_ME <= '0'; 
			O_FSM_WB <= '1'; -- Write value from memory in the register
			state <= "00000";		
		end if; 
	end if;	
	end process;
end Behavioral;

