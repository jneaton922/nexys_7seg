library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seg7_controller is
    Port(
        -- inputs
        clk : in STD_LOGIC; -- system master clock (100MHz)
        rst : in STD_LOGIC; -- active high reset

        -- 4-bit digit for hex value on 7-segment
        c1 : in STD_LOGIC_VECTOR(3 downto 0);
        c2 : in STD_LOGIC_VECTOR(3 downto 0);
        c3 : in STD_LOGIC_VECTOR(3 downto 0);
        c4 : in STD_LOGIC_VECTOR(3 downto 0);
        c5 : in STD_LOGIC_VECTOR(3 downto 0);
        c6 : in STD_LOGIC_VECTOR(3 downto 0);
        c7 : in STD_LOGIC_VECTOR(3 downto 0);
        c8 : in STD_LOGIC_VECTOR(3 downto 0);

        -- outputs
        anode : out STD_LOGIC_VECTOR(7 downto 0);
        cathodes: out STD_LOGIC_VECTOR(7 downto 0)
    );
end seg7_controller;

architecture arch of seg7_controller is

    signal 

begin

end arch ; -- arch