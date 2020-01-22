library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sonarbelow is
Port ( CLK : in STD_LOGIC;
TRIGGER : out STD_LOGIC;
ECHO : in STD_LOGIC;
out_birlerr : out STD_LOGIC_VECTOR(3 downto 0);
out_onlarr : out STD_LOGIC_VECTOR(3 downto 0));
--OUTS: out STD_LOGIC_VECTOR(3 downto 0)


end sonarbelow;
architecture Behavioral of sonarbelow is
signal count : unsigned(16 downto 0) := (others => '0');
signal santimetre : unsigned(15 downto 0) := (others => '0');
signal santimetre_birler : unsigned(3 downto 0) := (others => '0');
signal santimetre_onlar : unsigned(3 downto 0) := (others => '0');
signal out_birler : unsigned(3 downto 0) := (others => '0');
signal out_onlar : unsigned(3 downto 0) := (others => '0');
--signal digit : unsigned(3 downto 0) := (others => '0');
signal echo_son_deger : std_logic := '0';
signal echo_senkron : std_logic := '0';
signal echo_not_senkron : std_logic := '0';
signal bekleme : std_logic := '0';



begin
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
out_birlerr<=std_logic_vector(out_birler);
out_onlarr<=std_logic_vector(out_onlar);
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