----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2022 07:49:32 PM
-- Design Name: 
-- Module Name: lab2_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab2_top is
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
    end lab2_top;

architecture Behavioral of lab2_top is


    signal display_digit : STD_LOGIC_VECTOR(3 downto 0);

begin
    process (BTNC, BTND, BTNU, SW)
    begin

        -- display digit is bottom 4 switches, unless BTNC pressed
        if (BTNC = '0') then
            display_digit <= SW(3 downto 0);
        else
            display_digit <= "0000";
        end if;

        -- BTNU forces upper 4 digits, 
        -- BTND lower 4 digits,
        -- BTNC all digits
        -- Anodes 'active low' for digits on
        if (BTNU = '1') then
            AN <= "00001111";
        elsif (BTND = '1') then
            AN <= "11110000";
        elsif (BTNC = '1') then
            AN <= "00000000";
        else
            AN <= not SW(11 downto 4);
        end if;          
    end process;

    -- All 16 LEDS always match SW states
    LED <= SW;

    -- instantiate decoder component, map to display digit and cathode output
    seven_seg : entity work.seg7_hex port map ( digit => display_digit, seg7 => SEG7_CATH);

end Behavioral;
