library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

ENTITY InstructionMemory IS
	port (
        I_ROM_EN : in STD_LOGIC;
		I_ROM_ADDR : in  std_logic_vector(31 downto 0);
		O_ROM_DATA : out std_logic_vector(31 downto 0));
END InstructionMemory;

ARCHITECTURE Behavioral of InstructionMemory is

--Define the type of ROM. It is an array of size 256.
--Each element of the array is a one byte STD_LOGIC_VECTOR
type rom_type is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
--Create a function to initialize the ROM from a file
impure function init_rom(RomFileName : in string) return rom_type is
	file fp : text;
	variable file_line : line;
	variable temp_bv : bit_vector(31 downto 0);
	variable temp_mem : rom_type;
	variable rom_count : integer := 0;
begin
	temp_mem := (others => x"00");
	file_open(fp,  RomFileName,  read_mode);
	while not endfile(fp) loop
		--read a line from a file and stores it in a line type variable
		readline(fp, file_line);
		--read a string from the line
		read(file_line, temp_bv);
		temp_mem(rom_count)   := to_stdlogicvector(temp_bv(7 downto 0));
		temp_mem(rom_count+1)   := to_stdlogicvector(temp_bv(15 downto 8));
		temp_mem(rom_count+2)   := to_stdlogicvector(temp_bv(23 downto 16));
		temp_mem(rom_count+3)   := to_stdlogicvector(temp_bv(31 downto 24));
		rom_count := rom_count + 4;
		if rom_count  >= 255 then
			exit;
		end if;
	 end loop;
	       file_close(fp);
	       return temp_mem;
    end function;
-- call the function to initialize the ROM
signal rom: rom_type := init_rom("Fibonacci.bin");


	signal IM_address	: integer := 0 ;

BEGIN
	process(I_ROM_EN) begin
		if I_ROM_EN = '1' then 
			IM_address <= to_integer(unsigned(I_ROM_ADDR));-- when (to_integer(unsigned(I_ROM_ADDR)) <= 1023) else 0;
			O_ROM_DATA <= rom(IM_address+3) & rom(IM_address+2) & rom(IM_address+1) & rom(IM_address);-- when (IM_address >= 0) else std_logic_vector(to_signed(-1,32));
		end if;
	end process;
END Behavioral;
