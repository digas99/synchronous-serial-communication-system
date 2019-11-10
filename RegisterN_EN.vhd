library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RegisterN_EN is
	generic(N : positive := 4);
	port (clk		:	in std_logic;
			enable	:	in std_logic;
			sin		:	in std_logic_vector(N-1 downto 0);
			dataOut	:	out std_logic_vector(N-1 downto 0));
end RegisterN_EN;

architecture Behavioral of RegisterN_EN is

begin
	process (clk, enable)
	begin
		if (rising_edge(clk)) then
			if(enable = '1') then
				dataOut <= sin;
			end if;
		end if;
	end process;
	
end Behavioral;