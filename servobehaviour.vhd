library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity servobehaviour is
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
end servobehaviour;

architecture Behavioral of servobehaviour is
      component sonarbelow is
      Port ( CLK: in std_logic;
              TRIGGER : out std_logic;
              ECHO: in std_logic;
              out_birlerr : out STD_LOGIC_VECTOR(3 downto 0);
              out_onlarr : out STD_LOGIC_VECTOR(3 downto 0));
      end component;
      
        component MotorDriver is
            Port ( clockm: in std_logic;
                directions: in std_logic_vector(1 downto 0);
                switch : in std_logic;
                speed_control: in std_logic_vector(1 downto 0);
                motor_out: out std_logic );
        end component;
--     component servoclk is
--      Port ( clk : in std_logic;
--       Hz05: out std_logic
--      );
--      end component;

signal birlerr: STD_LOGIC_VECTOR(3 downto 0);
signal onlarr: STD_LOGIC_VECTOR(3 downto 0);
signal birlerr1: STD_LOGIC_VECTOR(3 downto 0);
signal onlarr1: STD_LOGIC_VECTOR(3 downto 0);
signal birlerr2: STD_LOGIC_VECTOR(3 downto 0);
signal onlarr2: STD_LOGIC_VECTOR(3 downto 0);
signal speed_control_in : std_logic_vector(1 downto 0):= "00";
signal direction: std_logic_vector(1 downto 0):="00";
signal switch1 : std_logic:='0';
signal counters: integer range 0 to 400000001:=0;
signal counterss: integer range 0 to 300000001:=0;
signal countersss: integer range 0 to 400000001:=0;
signal counterssss: integer range 0 to 300000001:=0;
signal countersssss: integer range 0 to 180000001:=0;
signal counterssssss: integer range 0 to 180000001:=0;
signal dontmeasure: std_logic;
signal sayi1: std_logic_vector(7 downto 0):="00000000";
signal sayi2: std_logic_vector(7 downto 0):="00000000";
signal sayi3: std_logic_vector(7 downto 0):="00000000";
signal psayi1: std_logic_vector(7 downto 0):="00000000";
signal psayi2: std_logic_vector(7 downto 0):="00000000";
signal psayi3: std_logic_vector(7 downto 0):="00000000";
signal sayii1: std_logic_vector(7 downto 0):="00000000";
signal sayii2: std_logic_vector(7 downto 0):="00000000";
signal isfalling: std_logic:='0';
signal turnright: std_logic:='0';
signal turnleft: std_logic:='0';
signal onlarrr: std_logic_vector(3 downto 0):="0000";
signal blindremember: std_logic:='0';
signal left: std_logic;


begin
leftsonar: sonarbelow port map (CLK=>clk,TRIGGER=>trigger2,ECHO=>echo2,out_birlerr=>birlerr1,out_onlarr=>onlarr1);
rightsonar: sonarbelow port map (CLK=>clk,TRIGGER=>trigger3,ECHO=>echo3,out_birlerr=>birlerr2,out_onlarr=>onlarr2);
rotatingsonar: sonarbelow port map (CLK=>clk,TRIGGER=>trigger1,ECHO=>echo1,out_birlerr=>birlerr,out_onlarr=>onlarr);
driver: MotorDriver port map(clockm => clk,directions=>direction,speed_control => speed_control_in,motor_out => motor_data_out, switch => switch1);  

--process(clk)
--begin
--if rising_edge(clk) then
--if mods='1' then
--switch1<='1';
--direction<="00";
--sayi1<=onlarr&birlerr;
--sayi2<=onlarr1&birlerr1;
--sayi3<=onlarr2&birlerr2;
--if sayi1<"0011" and sayi1>sayi2 and sayi1>sayi3 then
--              forwardleft<='1';  
--              forwardright<='1'; 
--              backwardleft<='0'; 
--              backwardright<='0';
--elsif sayi1<"0011" and  sayi2>sayi1 and sayi2>sayi3  then
--              forwardleft<='0';  
--              forwardright<='1'; 
--              backwardleft<='1'; 
--              backwardright<='0';
--elsif sayi1<"0011" and  sayi3>sayi1 and sayi3>sayi2  then
--              forwardleft<='1';  
--              forwardright<='0'; 
--              backwardleft<='0'; 
--              backwardright<='1';
--elsif sayi1<"0011" and  sayi2=sayi1 and (sayi2<sayi3 or sayi1<sayi3) then
--              forwardleft<='1';  
--              forwardright<='0'; 
--              backwardleft<='0'; 
--              backwardright<='1'; 
--elsif sayi1<"0011" and  sayi2=sayi3 and (sayi1>sayi3 or sayi1>sayi2) then
--              forwardleft<='1';  
--              forwardright<='1'; 
--              backwardleft<='0'; 
--              backwardright<='0';
--elsif sayi1<"0011" and  sayi3=sayi1 and (sayi2>sayi3 or sayi2>sayi1)  then
--              forwardleft<='0';  
--              forwardright<='1'; 
--              backwardleft<='1'; 
--              backwardright<='0';  
--else
--if sayi1>"0001" then
--              forwardleft<='1';  
--              forwardright<='1'; 
--              backwardleft<='0'; 
--              backwardright<='0';   
--elsif sayi1<"0010" then
--              forwardleft<='0';  
--              forwardright<='0'; 
--              backwardleft<='1'; 
--              backwardright<='1';    
--else
--              forwardleft<='1';  
--              forwardright<='1'; 
--              backwardleft<='1'; 
--              backwardright<='1';     
--end if;                          
--end if;

--else
--              forwardleft<='1';  
--              forwardright<='1'; 
--              backwardleft<='1'; 
--              backwardright<='1';               
--end if;
--end if;
--end process;

selecter:process(clk,dontmeasure)
begin
if rising_edge(clk) then
if dontmeasure='1' then
onlarrr<="0000";
if left='1' then
sayi1<=onlarr&birlerr;
sayi2<="11111111";
sayi3<="11111101";
else
sayi1<=onlarr&birlerr;
sayi2<="11111101";
sayi3<="11111111";
end if;
else
onlarrr<=onlarr;
sayi1<=onlarr&birlerr;
sayi2<=onlarr1&birlerr1;
sayi3<=onlarr2&birlerr2;
end if;
end if;
end process;

--process(clk,onlarrr,onlarr,counters)
--begin
--if rising_edge(clk) then
--if onlarrr<"0010"  then
--                      forwardleft<='1';  
--                      forwardright<='1'; 
--                      backwardleft<='1'; 
--                      backwardright<='1';
--    dontmeasure<='1'; 
--elsif onlarrr="1111"  then
--    if counters=100000000 then   
--                      forwardleft<='1';  
--                      forwardright<='1'; 
--                      backwardleft<='1'; 
--                      backwardright<='1';             
--        direction<="01";
--        counters<=counters+1;
--    elsif counters=300000000 then  
--                      forwardleft<='1';  
--                      forwardright<='1'; 
--                      backwardleft<='1'; 
--                      backwardright<='1';
--        sayi1<=onlarr&birlerr;
--        counters<=counters+1;        
--    elsif counters=400000000 then
--                      forwardleft<='1';  
--                      forwardright<='1'; 
--                      backwardleft<='1'; 
--                      backwardright<='1'; 
--        direction<="10";
--        counters<=counters+1;
--    elsif counters=600000000 then
--                      forwardleft<='1';  
--                      forwardright<='1'; 
--                      backwardleft<='1'; 
--                      backwardright<='1';
--        sayi2<=onlarr&birlerr;
--        counters<=counters+1;        
--    elsif counters=700000000 then
--                      forwardleft<='1';  
--                      forwardright<='1'; 
--                      backwardleft<='1'; 
--                      backwardright<='1';
--        direction<="00";
--        if (sayi1>sayi2 or sayi1=sayi2) and sayi1>"00010001" then
--                if counterss/=1800000000 then 
--                  forwardleft<='1';  
--                  forwardright<='0'; 
--                  backwardleft<='0'; 
--                  backwardright<='1';
--                  counterss<=counterss+1;
--              else
--                   counterss<=0;
--                end if;
--        elsif sayi1<sayi2 and sayi2>"00010001" then
--                 if counterss/=1800000000 then            
--                      forwardleft<='0';  
--                      forwardright<='1'; 
--                      backwardleft<='1'; 
--                      backwardright<='0';
--                      counterss<=counterss+1;
--                 else
--                      counterss<=0;
--                   end if;
--        else
--                         if counterss/=100000000 then            
--                      forwardleft<='0';  
--                      forwardright<='0'; 
--                      backwardleft<='1'; 
--                      backwardright<='1';  
--                       counterss<=counterss+1;
--                 else
--                      counterss<=0;
--                   end if;
--            end if;
--            counters<=0;
--        dontmeasure<='0';
--    else
--        counters<=counters+1;
--    end if;
--elsif onlarrr>"0010" and onlarrr/="1111" then
--              forwardleft<='1';  
--              forwardright<='1'; 
--              backwardleft<='0'; 
--              backwardright<='0';       
--end if;
--end if;
--end process;


process(clk,onlarrr)
begin
if rising_edge(clk) then   
    if onlarrr="0000" then
                 forwardleft<='1';  
                 forwardright<='1'; 
                 backwardleft<='1'; 
                 backwardright<='1';
        if sayi2>sayi3 or sayi2=sayi3 then
              if counters= 100000000 then 
                    direction<="01";
                          counters<=counters+1;
              elsif counters=300000000 then
                    sayii1<=onlarr&birlerr;
                    counters<=counters+1;
              elsif counters= 350000000 then 
                    direction<="00";      
              elsif counters=400000000 then
                    if sayii1>"00010001" then
                            if counterssssss/=180000000 then
                              left<='0';
                              forwardleft<='0';  
                              forwardright<='1'; 
                              backwardleft<='1'; 
                              backwardright<='0';
                              counterssssss<=counterssssss+1;
                            else
                               counterssssss<=0;
                               dontmeasure<='0';
                               counters<=0;                  
                            end if;       
                    else   
                        if counterss/=300000000 then
                            forwardleft<='0';  
                            forwardright<='0'; 
                            backwardleft<='1'; 
                            backwardright<='1';
                        else 
                            counterss<=0;
                            counters<=0;
                            dontmeasure<='0';
                        end if;
                    end if;
               else
                     counters<=counters+1;             
               end if;   
        elsif sayi3>sayi2 then
              if countersss= 100000000 then 
                    direction<="10";
                    countersss<=countersss+1;
              elsif countersss=300000000 then
                    sayii2<=onlarr&birlerr;
                    countersss<=countersss+1;
              elsif counters= 350000000 then 
                    direction<="00";
              elsif countersss=400000000 then
                    if sayii2>"00010001" then
                        if countersssss/=180000000 then 
                          left<='0';
                          forwardleft<='0';  
                          forwardright<='1'; 
                          backwardleft<='1'; 
                          backwardright<='0';
                          countersssss<=countersssss+1;
                        else
                           countersssss<=0;
                           dontmeasure<='0';
                           countersss<=0;
                        end if;
                    else   
                        if counterssss/=300000000 then
                            forwardleft<='0';  
                            forwardright<='0'; 
                            backwardleft<='1'; 
                            backwardright<='1';
                        else 
                            counterssss<=0;
                            dontmeasure<='0';
                            countersss<=0;
                        end if; ---counterssss end
                    end if; ---sayii2 end
               else        
                    countersss<=countersss+1;
               end if; ---countersss end
         end if; ---sayi3 sayi2 end
    elsif onlarrr="0001" and birlerr<"0101" then
        direction<="00";
        dontmeasure<='1';        
    elsif onlarrr>"0010" or onlarrr="0010" then
         direction<="00";
                    if sayi1>sayi2 and sayi1>sayi3 then
                                  forwardleft<='1';  
                                  forwardright<='1'; 
                                  backwardleft<='0'; 
                                  backwardright<='0';
                    elsif sayi2>sayi1 and sayi2>sayi3  then
                                  forwardleft<='0';  
                                  forwardright<='1'; 
                                  backwardleft<='1'; 
                                  backwardright<='0';
                    elsif sayi3>sayi1 and sayi3>sayi2  then
                                  forwardleft<='1';  
                                  forwardright<='0'; 
                                  backwardleft<='0'; 
                                  backwardright<='1';
                    elsif sayi2=sayi1 and (sayi2<sayi3 or sayi1<sayi3) then
                                  forwardleft<='1';  
                                  forwardright<='0'; 
                                  backwardleft<='0'; 
                                  backwardright<='1'; 
                    elsif sayi2=sayi3 and (sayi1>sayi3 or sayi1>sayi2) then
                                  forwardleft<='1';  
                                  forwardright<='1'; 
                                  backwardleft<='0'; 
                                  backwardright<='0';
                    elsif sayi3=sayi1 and (sayi2>sayi3 or sayi2>sayi1)  then
                                  forwardleft<='0';  
                                  forwardright<='1'; 
                                  backwardleft<='1'; 
                                  backwardright<='0'; 
--                    else
                                  forwardleft<='1';  
                                  forwardright<='1'; 
                                  backwardleft<='0'; 
                                  backwardright<='0';                    
                    end if; ----sayi1 sayi2 sayi3 end
        end if; ---onlarr end
        end if; ---rising edge end
end process;

--process(clk,turnleft,turnright)
--begin
--if rising_edge(clk) then
--if turnleft='1' and turnright='0'then
--                if countersssss/=1800000000 then 
--                  forwardleft<='1';  
--                  forwardright<='0'; 
--                  backwardleft<='0'; 
--                  backwardright<='1';
--                  countersssss<=countersssss+1;
--              else
--                   countersssss<=0;
--                   dontmeasure<='0';
--                end if;
--elsif turnleft='0' and turnright='1' then
--                if counterssssss/=1800000000 then 
--                  forwardleft<='1';  
--                  forwardright<='0'; 
--                  backwardleft<='0'; 
--                  backwardright<='1';
--                  counterssssss<=counterssssss+1;
--              else
--                   counterssssss<=0;
--                   dontmeasure<='0';                  
--                end if;
--end if;
--end if;
--end process;

switch1<='1';
falling<=not isfalling;
end;