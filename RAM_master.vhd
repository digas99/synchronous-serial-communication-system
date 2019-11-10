library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RAM_master is
	port (clk			:	in std_logic;
			writeEnable	:	in std_logic;
			writeData	:	in std_logic_vector(7 downto 0);
			address		:	in std_logic_vector(3 downto 0);
			readData		:	out std_logic_vector(7 downto 0));
end RAM_master;

architecture Behavioral of RAM_master is

	subtype data_word is std_logic_vector(7 downto 0);
	type	t_RAM is array(0 to 15) of data_word;
	
	signal RAMData	: t_RAM;
	
begin

sync:		process(clk)
			begin
				if (rising_edge(clk) and writeEnable = '1') then
					RAMData(to_integer(unsigned(address))) <= writeData;
				end if;
			end process;
			
			readData <= RAMData(to_integer(unsigned(address)));
		
end Behavioral;