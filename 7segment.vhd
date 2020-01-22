library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity sonar is
Port ( CLK : in STD_LOGIC;
TRIGGER : out STD_LOGIC;
ECHO : in STD_LOGIC;
SEG_SEC : out STD_LOGIC_VECTOR (3 downto 0);
SEGMENTS : out STD_LOGIC_VECTOR (6 downto 0));
end sonar;
architecture Behavioral of sonar is
signal count : unsigned(16 downto 0) := (others => '0');
signal santimetre : unsigned(15 downto 0) := (others => '0');
signal santimetre_birler : unsigned(3 downto 0) := (others => '0');
signal santimetre_onlar : unsigned(3 downto 0) := (others => '0');
signal out_birler : unsigned(3 downto 0) := (others => '0');
signal out_onlar : unsigned(3 downto 0) := (others => '0');
signal digit : unsigned(3 downto 0) := (others => '0');
signal echo_son_deger : std_logic := '0';
signal echo_senkron : std_logic := '0';
signal echo_not_senkron : std_logic := '0';
signal bekleme : std_logic := '0';
signal segment_sayac : unsigned(15 downto 0) := (others => '0');
begin
decode: process(digit)
begin
case digit is
when "0001" => SEGMENTS <= "1111001";
when "0010" => SEGMENTS <= "0100100";
when "0011" => SEGMENTS <= "0110000";
when "0100" => SEGMENTS <= "0011001";
when "0101" => SEGMENTS <= "0010010";
when "0110" => SEGMENTS <= "0000010";
when "0111" => SEGMENTS <= "1111000";
when "1000" => SEGMENTS <= "0000000";
when "1001" => SEGMENTS <= "0010000";
when "1010" => SEGMENTS <= "0001000";
when "1011" => SEGMENTS <= "0000011";
when "1100" => SEGMENTS <= "1000110";
when "1101" => SEGMENTS <= "0100001";
when "1110" => SEGMENTS <= "0000110";
when "1111" => SEGMENTS <= "0001110";
when others => SEGMENTS <= "1000000";
end case;
end process;
seven_seg: process(CLK)
begin
if rising_edge(CLK) then
if segment_sayac(segment_sayac'high) = '1' then
digit <= out_birler;
SEG_SEC <= "1110";
else
digit <= out_onlar;
SEG_SEC <= "1101";
end if;
segment_sayac <= segment_sayac +1;
end if;
end process;
process(CLK)
begin
if rising_edge(CLK) then
if bekleme = '0' then
if count = 1000 then -- 10us tetikleme
TRIGGER <= '0';
bekleme <= '1';
count <= (others => '0');
else
TRIGGER <= '1';
count <= count+1;
end if;
elsif echo_son_deger = '0' and echo_senkron = '1' then
count <= (others => '0');
santimetre <= (others => '0');
santimetre_birler <= (others => '0');
santimetre_onlar <= (others => '0');
elsif echo_son_deger = '1' and echo_senkron = '0' then
out_birler <= santimetre_birler;
out_onlar <= santimetre_onlar;
elsif count = 5799 then --5800-1
if santimetre_birler = 9 then
santimetre_birler <= (others => '0');
santimetre_onlar <= santimetre_onlar + 1;
else
santimetre_birler <= santimetre_birler + 1;
end if;
santimetre <= santimetre + 1;
count <= (others => '0');
if santimetre = 3448 then
bekleme <= '0';
end if;
else
count <= count + 1;
end if;
echo_son_deger <= echo_senkron;
echo_senkron <= echo_not_senkron;
echo_not_senkron <= ECHO;
end if;
end process;
end Behavioral;