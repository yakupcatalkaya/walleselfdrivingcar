library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity topmodule is
    Port ( clk: in std_logic;
--        speed_control_in : in std_logic_vector(1 downto 0);
--        direction: in std_logic_vector(1 downto 0);
--        switch1 : in std_logic;
        motor_data_out : OUT STD_LOGIC;
        trigger : out std_logic;
        echo: in std_logic;
--        echo1: in std_logic;
        echo2: in std_logic; 
        echo3: in std_logic;  
--        SEG_SEC : out STD_LOGIC_VECTOR (3 downto 0);
--        SEGMENTS : out STD_LOGIC_VECTOR (6 downto 0);           
        trigger2 : out std_logic;
        trigger3 : out std_logic;
--        trigger1 : out std_logic;
        falling : out std_logic;
        forwardleft : out std_logic;
        forwardright : out std_logic;
        backwardleft : out std_logic;
        backwardright : out std_logic
        );
        
end topmodule;

architecture Behavioral of topmodule is

component servobehaviour is
  Port (clk: in std_logic;
        echo1: in std_logic;
        echo3: in std_logic; 
        echo2: in std_logic;
        trigger1 : out std_logic;
        trigger2 : out std_logic;
        trigger3 : out std_logic;
        falling : out std_logic;
        motor_data_out: out std_logic;
        forwardleft : out std_logic;
        forwardright : out std_logic;
        backwardleft : out std_logic;
        backwardright : out std_logic
         );
end component;
--      component sonarbelow is
--      Port ( CLK: in std_logic;
--              TRIGGER : out std_logic;
--              ECHO: in std_logic;
--              out_birlerr : out STD_LOGIC_VECTOR(3 downto 0);
--              out_onlarr : out STD_LOGIC_VECTOR(3 downto 0));
--      end component;
--    component checker is
--     Port (
--            CLK: in std_logic;
--            releases: in std_logic;
--            trigger1 : out std_logic;
--            trigger21 : out std_logic;
--            trigger31 : out std_logic;
--            echo1: in std_logic;
--            echo31: in std_logic; 
--            echo21: in std_logic; 
--            fallings : out std_logic;
--            forwardlefts : out std_logic;
--            forwardrights : out std_logic;
--            backwardlefts : out std_logic;
--            backwardrights : out std_logic
--            );
--      end component;

begin
--rotatingsonar: sonarbelow port map (CLK=>clk,TRIGGER=>trigger1,ECHO=>echo1,out_birlerr=>birlerr,out_onlarr=>onlarr);
--driver: MotorDriver port map(clockm => clk,directions=>direction,speed_control => speed_control_in,motor_out => motor_data_out, switch => switch1);  
--turning: checker port map (CLK =>clk,releases=>release,trigger1=>trigger,trigger21=>trigger2,trigger31=>trigger3,echo1=>echo,echo31=>echo3,echo21=>echo2,fallings=>falling,forwardlefts=>forwardleft,forwardrights=>forwardright,backwardlefts=>backwardleft,backwardrights=>backwardright);
--  checkpoint: sonar port map (CLK=>clk,TRIGGER=>trigger1,ECHO=>echo1,SEG_SEC=>SEG_SEC,SEGMENTS=>SEGMENTS);
behaviour: servobehaviour port map(clk=>clk,echo1=>echo,echo3=>echo3,echo2=>echo2,trigger1=>trigger,trigger3=>trigger3,trigger2=>trigger2,falling=>falling,motor_data_out=>motor_data_out,forwardleft=>forwardleft,forwardright=>forwardright,backwardleft=>backwardleft,backwardright=>backwardright);
--falling<=not isfalling;
end;