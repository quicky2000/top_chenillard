--
--    This file is part of top_chenillard
--    Copyright (C) 2011  Julien Thevenon ( julien_thevenon at yahoo.fr )
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>
--
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity chenillard is
		port(
			clk : in std_logic;
			reset : in std_logic;
			button : in std_logic;
			led1 : out std_logic;
			led2 : out std_logic;
			led3 : out std_logic;
			led4 : out std_logic
			);
end chenillard;

architecture Behavioral of chenillard is
	type state_type is (e1,e2,e3,e4,e5,e6);
	signal state,next_state : state_type;
begin
	--state register
	process(clk,reset)
	begin
		if reset = '1' then
			state <= e1;
		elsif rising_edge(clk) then
			state <= next_state;
		end if;
	end process;
	
	--state transition
	process(state)
	begin
		case state is
			when e1 => next_state <= e2;
			when e2 => next_state <= e3;
			when e3 => next_state <= e4;
			when e4 => next_state <= e5;
			when e5 => next_state <= e6;
			when e6 => next_state <= e1;
		end case;
	end process;
	
	--output function
	led1 <= '1' when state = e1 else '0';
	led2 <= '1' when state = e2 or state = e6 else '0';
	led3 <= '1' when state = e3 or state = e5 else '0';
	led4 <= '1' when state = e4 else '0';
end Behavioral;

