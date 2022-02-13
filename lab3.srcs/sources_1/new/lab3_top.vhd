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
    signal c1 :  STD_LOGIC_VECTOR(3 downto 0);
    signal c2 :  STD_LOGIC_VECTOR(3 downto 0);
    signal c3 :  STD_LOGIC_VECTOR(3 downto 0);
    signal c4 :  STD_LOGIC_VECTOR(3 downto 0);
    signal c5 :  STD_LOGIC_VECTOR(3 downto 0);
    signal c6 :  STD_LOGIC_VECTOR(3 downto 0);
    signal c7 :  STD_LOGIC_VECTOR(3 downto 0);
    signal c8 :  STD_LOGIC_VECTOR(3 downto 0);

    signal counter : STD_LOGIC_VECTOR(15 downto 0);

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
        c1 => c1,
        c2 => c2,
        c3 => c3,
        c4 => c4,
        c5 => c5,
        c6 => c6,
        c7 => c7,
        c8 => c8,
        anodes => AN,
        cathodes => SEG7_CATH
    );

    process (CLK100MHZ, BTNC)
    begin
        if (BTNC = '1') then -- asynch reset
            reset <= '1';
            c1 <= x"0";
            c2 <= x"0";
            c3 <= x"0";
            c4 <= x"0";
            c5 <= x"0";
            c6 <= x"0";
            c7 <= x"0";
            c8 <= x"0";

            counter <= (others=> '0');

        elsif (rising_edge(CLK100MHZ)) then
            reset <= '0';
            if (pulse = '1') then
                -- left shift characters
                c8 <= c7;
                c7 <= c6;
                c6 <= c5;
                c5 <= c4;
                c4 <= c3;
                c3 <= c2;
                c2 <= c1;
                c1 <= SW(3 downto 0);

                counter <= std_logic_vector( unsigned(counter) + 1);
            end if;
        end if;

    end process;
    
    LED <= counter;

end Behavioral;
