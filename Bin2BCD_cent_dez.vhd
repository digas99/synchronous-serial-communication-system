library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Bin2BCD_cent_dez is
	port( a						: in std_logic_vector(3 downto 0);
			unidades, dezenas : out std_logic_vector(3 downto 0));
end Bin2BCD_cent_dez;

architecture Behavioral of Bin2BCD_cent_dez is

begin	
	
	unidades <= std_logic_vector(unsigned(a) rem 10);
	dezenas 	<= std_logic_vector(unsigned(a) / 10);

end Behavioral;