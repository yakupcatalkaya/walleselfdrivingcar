library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity checker is
 Port (
CLK: in std_logic;
releases: in std_logic;
trigger1 : out std_logic;
trigger21 : out std_logic;
trigger31 : out std_logic;
echo1: in std_logic;
echo31: in std_logic; 
echo21: in std_logic;      
--out_birl: in STD_LOGIC_VECTOR(3 downto 0);
--out_birl2: in STD_LOGIC_VECTOR(3 downto 0);
--out_onl2: in STD_LOGIC_VECTOR(3 downto 0);
--out_birl1: in STD_LOGIC_VECTOR(3 downto 0);
--out_onl: in STD_LOGIC_VECTOR(3 downto 0);
--out_onl1: in STD_LOGIC_VECTOR(3 downto 0);
fallings : out std_logic;
forwardlefts : out std_logic;
forwardrights : out std_logic;
backwardlefts : out std_logic;
backwardrights : out std_logic
);
end checker;

architecture Behavioral of checker is
      component sonarbelow is
      Port ( CLK: in std_logic;
              TRIGGER : out std_logic;
              ECHO: in std_logic;
              out_birlerr : out STD_LOGIC_VECTOR(3 downto 0);
              out_onlarr : out STD_LOGIC_VECTOR(3 downto 0));
      end component;
signal out_birle: STD_LOGIC_VECTOR(3 downto 0);
signal out_birle2: STD_LOGIC_VECTOR(3 downto 0);
signal out_birle1: STD_LOGIC_VECTOR(3 downto 0);
signal out_onla: STD_LOGIC_VECTOR(3 downto 0);
signal out_onla2: STD_LOGIC_VECTOR(3 downto 0);
signal out_onla1: STD_LOGIC_VECTOR(3 downto 0);
signal leftforward: STD_LOGIC :='0';
signal leftbackward: STD_LOGIC:='0' ;
signal rightforward: STD_LOGIC:='0';
signal rightbackward: STD_LOGIC:='0';
signal isfalling: STD_LOGIC;
begin

  rightsonar: sonarbelow port map (CLK =>clk,TRIGGER=>trigger31,ECHO=>echo31,out_birlerr=>out_birle,out_onlarr=>out_onla);
  leftsonra: sonarbelow port map (CLK =>clk,TRIGGER=>trigger21,ECHO=>echo21,out_birlerr=>out_birle1,out_onlarr=>out_onla1);
  belowsonar: sonarbelow port map (CLK =>clk,TRIGGER=>trigger1,ECHO=>echo1,out_birlerr=>out_birle2,out_onlarr=>out_onla2);
  
process (CLK,out_onla,out_onla1,out_birle,out_birle1,releases)
    begin
    if rising_edge(CLK) then
    if releases='0' then
            leftforward <='1';
            rightforward <='1';    
            rightbackward <='1';
            leftbackward <='1';
    else    
        if (out_birle="0000" and out_onla="0000") or (out_birle1<"1000" and out_onla1="0000")  then
            leftforward <='0';
            rightforward <='0';    
            rightbackward <='0';
            leftbackward <='0';                         
        elsif out_onla<"1010" or out_onla1<"1010" then
            if out_onla>out_onla1 then
                leftforward <='1';
                rightforward <='0';    
                rightbackward <='1';
                leftbackward <='0';     
            elsif out_onla< out_onla1 then
                leftforward <='0';
                rightforward <='1';    
                rightbackward <='0';
                leftbackward <='1';                   
            elsif out_onla = out_onla1 then
                if out_birle>out_birle1 then
                    leftforward <='1';
                    rightforward <='0';    
                    rightbackward <='1';
                    leftbackward <='0'; 
                elsif out_birle<out_birle1 then
                    leftforward <='0';
                    rightforward <='1';    
                    rightbackward <='0';
                    leftbackward <='1';
                else
                    leftforward <='1';
                    rightforward <='1';    
                    rightbackward <='0';
                    leftbackward <='0';
                end if;                          
       else
            leftforward <='1';
            rightforward <='1';    
            rightbackward <='0';
            leftbackward <='0';  
        end if;              
     end if;
     end if;

forwardlefts <=leftforward;
forwardrights <=rightforward;
backwardlefts <=leftbackward;
backwardrights<=rightbackward;

    end if;
    end process;

process(CLK,out_birle2,out_onla2)
    begin
    if rising_edge(CLK) then
        if out_birle2< "0100" and out_onla2="0000" then
            isfalling <='0';
        else
            isfalling<='1';
        end if;
    end if;
    fallings <= not isfalling;
    end process;

end Behavioral;
