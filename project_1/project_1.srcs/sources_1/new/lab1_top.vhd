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

    signal display_digit : STD_LOGIC_VECTOR(3 downto 0);

begin
    
    -- LED displays directly indicated by switch states
    LED <= SW;

    -- assign  seg7 input to first 4 switches
    display_digit <= 
        SW(3 downto 0) when BTNC = '0' else
        "0000";

    -- instantiate decoder, map display digit as input, SEG7_CATH as output vector
    seven_seg_decode : entity work.seg7_hex port map ( digit => display_digit, seg7 => SEG7_CATH);

    -- enable display digits based on SW11 through SW4 by default, otherwise depend on pushbutton states
    -- as defined in the lab assignment
    AN <= 
        "00001111" when BTNU = '1' else
        "11110000" when BTND = '1' else
        "00000000" when BTNC = '1' else
        not SW(11 downto 4);

        
    
end Behavioral;
