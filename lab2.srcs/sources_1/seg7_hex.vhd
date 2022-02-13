
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2022 09:04:12 PM
-- Design Name: 
-- Module Name: seg7_hex - Behavioral
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


entity seg7_hex is
    Port ( digit : in STD_LOGIC_VECTOR (3 downto 0);
           seg7 : out STD_LOGIC_VECTOR (7 downto 0));
end seg7_hex;

architecture Behavioral of seg7_hex is
    begin
        process ( digit )
        begin 
            -- use 'case' for process equivalent
            -- of csa from tutorial/lab1
            case digit is
                when "0000" =>
                    seg7 <= "11000000";
                when "0001" =>
                    seg7 <= "11111001";
                when "0010" =>
                    seg7 <= "10100100";
                when "0011" =>
                    seg7 <= "10110000";
                when "0100" =>
                    seg7 <= "10011001";
                when "0101" =>
                    seg7 <= "10010010";
                when "0110" =>
                    seg7 <= "10000010";
                when "0111" =>
                    seg7 <= "11111000";
                when "1000" =>
                    seg7 <= "10000000";
                when "1001" =>
                    seg7 <= "10010000";
                when "1010" =>
                    seg7 <= "10001000";
                when "1011" =>
                    seg7 <= "10000011";
                when "1100" =>
                    seg7 <= "11000110";
                when "1101" =>
                    seg7 <= "10100001";
                when "1110" =>
                    seg7 <= "10000110";
                when others =>
                    seg7 <= "10001110";
            end case;
        end process;
    end Behavioral;