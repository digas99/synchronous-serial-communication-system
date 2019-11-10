library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SCSS_FSM_Master is
	port (toggle		:	in std_logic;
			reset			:	in std_logic;
			clkFSM		:	in std_logic;
			stateNmr		: 	out std_logic_vector(3 downto 0);
			payloadOut	:	out std_logic;
			sizeOut		:	out std_logic;
			checksumOut	:	out std_logic);
end SCSS_FSM_Master;

architecture Behavioral of SCSS_FSM_Master is

	type t_state is (idle, sof, size, payload, checksum);
	signal s_currentState, s_nextState : T_state;


begin
	sync_proc : process(clkFSM)
	begin
		if (rising_edge(clkFSM)) then
			if (reset = '1') then
				s_currentState <= idle;
			else
				s_currentState <= s_nextState;
			end if;
		end if;
	end process;
	
	comb_proc : process(s_currentState, toggle)
	begin
		sizeOut <= '0';
		payloadOut <= '0';
		checksumOut <= '0';
		case(s_currentState) is
			when idle =>
				stateNmr <= "0000"; 
				if (toggle = '1') then
					s_nextState <= sof;
				else
					s_nextState <= idle;
				end if;
			when sof =>
				stateNmr <= "0001";
				if (toggle = '1') then
					s_nextState <= size;
				else 
					s_nextState <= sof;
				end if;	
			when size =>
				sizeOut <= '1';
				stateNmr <= "0010";
				if (toggle = '1') then
					s_nextState <= payload;
				else 
					s_nextState <= size;
				end if;	
			when payload =>
				payloadOut <= '1';
				stateNmr <= "0011";
				if (toggle = '1') then
					s_nextState <= checksum;
				else 
					s_nextState <= payload;
				end if;
			when checksum =>
				checksumOut <= '1';
				stateNmr <= "0100";
				if (toggle = '1') then
					s_nextState <= idle;
				else
					s_nextState <= checksum;
				end if;
		end case;
	end process;
end Behavioral;