library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Comparator is
	port (checksum1			:	in	std_logic_vector(3 downto 0);
			checksum2			:	in	std_logic_vector(3 downto 0);
			result				:	out std_logic_vector(3 downto 0));
	
end Comparator;

architecture Behavioral of Comparator is

	signal s_check1	:	std_logic_vector(3 downto 0);
	signal s_check2	:	std_logic_vector(3 downto 0);
	
begin

	s_check1 <= checksum1;
	s_check2 <= checksum2;
	process(s_check1, s_check2)
	begin
		if (s_check1 = s_check2) then
			result <= "1100";
		else
			result <= "1111";
		end if;
	end process;
	
end Behavioral;