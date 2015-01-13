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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_chenillard is
	port(
		clk : in std_logic;
		w1a : inout std_logic_vector(15 downto 0);
		w1b : inout std_logic_vector(15 downto 0);
		w2c : inout std_logic_vector(15 downto 0);
		rx : in std_logic;
		tx : inout std_logic
	);
end top_chenillard;

architecture Behavioral of top_chenillard is
	component chenillard
		port(
			clk : in std_logic;
			reset : in std_logic;
			button : in std_logic;
			led1 : out std_logic;
			led2 : out std_logic;
			led3 : out std_logic;
			led4 : out std_logic
			);
	end component;
	signal reset : std_logic;
	signal pre_Q : std_logic_vector(23 downto 0);
	signal clock_slow : std_logic;
begin
	process(clk,reset)
	begin
		if reset = '1' then
			pre_Q <= (others => '0');
		elsif rising_edge(clk) then
			pre_Q <= pre_Q + 1;
		end if;
	end process;
	clock_slow <= pre_q(23);
	
	chenillard_inst : chenillard
	port map(
			clk => clock_slow,
			reset =>reset,
			button => w1a(7),
			led1 => w1a(6),
			led2 => w1a(4),
			led3 => w1a(2),
			led4 => w1a(0)
	);
	
	reset <= '0';
end Behavioral;

