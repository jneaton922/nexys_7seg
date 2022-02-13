----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2022 10:01:26 PM
-- Design Name: 
-- Module Name: lab3_top - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab3_top is
    Port (       
        -- Clock 
        CLK100MHZ : in STD_LOGIC;

        -- push buttons
        BTNC : in STD_LOGIC;

        -- switches
        SW : in STD_LOGIC_VECTOR (15 downto 0);

        -- LEDs
        LED : out STD_LOGIC_VECTOR (15 downto 0);

        -- 7 segment signals
        SEG7_CATH : out STD_LOGIC_VECTOR (7 downto 0);
        AN : out STD_LOGIC_VECTOR (7 downto 0));
    end lab3_top;

architecture Behavioral of lab3_top is

    signal reset : std_logic;
    signal pulse : std_logic;

begin
    
    pps : entity work.pulse_gen port map ( 
        clk => CLK100MHZ, 
        rst => reset, 
        pulse => pulse,
        trig => x"5f5e100"  -- 100e6 hex
    );

    seg7 : entity work.seg7_controller port map (
        clk => CLK100MHZ,
        rst => reset,
        c1 => x"1",
        c2 => x"3",
        c3 => x"5",
        c4 => x"7",
        c5 => x"9",
        c6 => x"b",
        c7 => x"d",
        c8 => x"f",
        anodes => AN,
        cathodes => SEG7_CATH
    );
    
end Behavioral;
