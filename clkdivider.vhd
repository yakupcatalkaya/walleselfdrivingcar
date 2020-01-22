library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clkdivider is
  Port ( clk : in std_logic;
         Hz5000: out std_logic
        );
end clkdivider;

architecture Behavioral of clkdivider is

    signal freq: std_logic:= '0';
    signal count: integer range 0 to 10000:= 0;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if count = 9999 then
                count <= 0;
                freq <= not freq;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
 
 Hz5000 <= freq;

end Behavioral;