library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pulse_gen is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        trig : in std_logic_vector(27 downto 0);

        pulse : out std_logic;
    );
end pulse_gen;

architecture arch of pulse_gen is

    signal sig : unsigned(7 downto 0);

begin
    process (clk, rst)
    begin
        if (rst = '1') then
            sig <= (others=> '0');
        elsif (rising_edge(clk)) then
            sig <= sig + 1;
        end if;
    end process;
    counter <= sig;

end arch ; -- arch