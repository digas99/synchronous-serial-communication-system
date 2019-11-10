library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Bin2BCD is
	port( a									 : in std_logic_vector(7 downto 0);
			unidades, dezenas, centenas : out std_logic_vector(3 downto 0));
end Bin2BCD;

architecture Behavioral of Bin2BCD is

	signal s_unidades, s_dezenas, s_centenas : unsigned(7 downto 0);

begin	
	
	s_unidades <= unsigned(a) rem 10;
	s_dezenas  <= (unsigned(a) / 10) rem 10;
	s_centenas <= unsigned(a) / 100;
	
	unidades <= std_logic_vector(s_unidades(3 downto 0));
	dezenas  <= std_logic_vector(s_dezenas(3 downto 0));
	centenas <= std_logic_vector(s_centenas(3 downto 0));

end Behavioral;