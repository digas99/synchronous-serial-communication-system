library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Checksum_Slave is
	port (sizeValue	:	in	std_logic_vector(3 downto 0);
			dataValue	:	in	std_logic_vector(7 downto 0);
			result		:	out std_logic_vector(3 downto 0));
	
end Checksum_Slave;

architecture Behavioral of Checksum_Slave is

	signal s_sizeV	:	unsigned (3 downto 0);
	signal s_dataV	:	unsigned (7 downto 0);
	signal s_resu	:	unsigned (3 downto 0);
	
begin
	s_sizeV <= unsigned(sizeValue);
	s_dataV <= unsigned(dataValue);
	
	s_resu <= s_sizeV + s_dataV(3 downto 0) + s_dataV(7 downto 4);
	
	result <= std_logic_vector(s_resu);
end Behavioral;