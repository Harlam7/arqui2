
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;



entity InstructionMemory is
	Port ( 
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is

type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
	signal instructions : rom_type := (X"01000000",
	--instrucciones
												  "10000010000100000010000000000101",-- mov 5, %g1
												  "10100000000100000011111111111000",-- mov -8, %l0
												  "10100010000100000010000000000100",-- mov 4, %l1
												  "10110001001010000110000000000010",-- sll %g1,2,%i0
												  "10110011001101000110000000000001",-- srl %l1,1,%i1
												  "10000001111010000010000000000000",-- restore %g0, 0, %g0 ->cambio de ventana a la 1
												  "10100000000000000110000000000011",-- add %g1,3,%l0
												  "10000001111000000010000000000000",-- save %g0,0,%g0 ->retorno a la ventana 0
												  "10000000101000000010000000000100",-- subcc %g0,4,%g0
												  "10000110010000000000000000000001",-- addx %g0,%g1,%g2
												  "10010000000100000000000000010000",-- mov %l0, %o0
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000");
	
	begin
		process (reset, address)
			begin
				if (reset = '1') then
					outInstruction <= (others => '0');
				else
					outInstruction <= instructions(conv_integer(address(5 downto 0)));--retorna en entero la posicion de la matriz
				end if;
		end process;

end Behavioral;

