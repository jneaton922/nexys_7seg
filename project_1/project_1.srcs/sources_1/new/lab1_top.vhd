----------------------------------------------------------------------------------
--
-- Author: K. Newlander
--
-- Description:
--
-- Tutorial Top Level which displays the SW(3:0) input as a hexidecimal digit
--
-- on one of the 7-SEGMENT displays
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab1_top is
    Port ( 
        -- push buttons
        BTNC : in STD_LOGIC;
        BTND : in STD_LOGIC;
        BTNU : in STD_LOGIC;

        -- switches
        SW : in STD_LOGIC_VECTOR (15 downto 0);

        -- LEDs
        LED : out STD_LOGIC_VECTOR (15 downto 0);

        -- 7 segment signals
        SEG7_CATH : out STD_LOGIC_VECTOR (7 downto 0);
        AN : out STD_LOGIC_VECTOR (7 downto 0));

end lab1_top;

architecture Behavioral of lab1_top is

    signal display_digit : std_logic_vector(3 downto 0);

begin
    
    -- LED displays directly indicated by switch states
    LED <= SW;

    -- assign  seg7 input to first 4 switches
    display_digit <= SW(3 downto 0)

    -- instantiate decoder, map display digit as input, SEG7_CATH as output vector
    seven_seg_decode : entity seg7_hex port map ( digit => display_digit, seg7 => SEG7_CATH);
    
end Behavioral;