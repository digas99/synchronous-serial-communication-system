library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RegisterN_NoEN is
	generic (N : positive := 4);
	port (clk		:	in std_logic;
			sin		:	in std_logic_vector(N-1 downto 0);
			dataOut	:	out std_logic_vector(N-1 downto 0));
end RegisterN_NoEN;

architecture Behavioral of RegisterN_NoEN is

begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			dataOut <= sin;
		end if;
	end process;
	
end Behavioral;