----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:06:13 05/11/2017 
-- Design Name: 
-- Module Name:    MUX32 - Behavioral 
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

entity MUX32 IS
	port (
		I_MUX_0  :  in  std_logic_vector(31 downto 0);
		I_MUX_1  :  in  std_logic_vector(31 downto 0);
		O_MUX_Out  :  out std_logic_vector(31 downto 0);
		I_MUX_Sel     :  in  std_logic);
end MUX32;

architecture Behavioral of MUX32 is

begin
		O_MUX_Out <= I_MUX_0 when I_MUX_Sel='0' 
		else  I_MUX_1 when I_MUX_Sel='1';
		

end Behavioral;


