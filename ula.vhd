library ieee;
use ieee.std_logic_1164.all;

entity ula is

  port(a,b,carry_in,selB: in std_logic;
  		sel: in std_logic_vector (1 downto 0);
       s,carry_out,overflow: out std_logic);
       
end ula;

architecture ula_arch of ula isAC

	component mux_invert is 
    	  port (b,nB : in std_logic;
  			sel: in std_logic;
  			s: out std_logic);
    end component;
    
	component mux is 
    	port (e1, e2,e3,e4: in std_logic;
  		    sel: in std_logic_vector (1 downto 0);
  			s: out std_logic);
    end component;
    
    component somador_completo is 
    	port(
          a: in std_logic;
          b: in std_logic;
          carry_in: in std_logic;
          soma: out std_logic;
          carry_out: out std_logic;
          overflow: out std_logic
    	);
    end component;
    
	component porta_and is 
    	port (a, b: in std_logic;
  				s: out std_logic);
    end component;
    
    component porta_or is 
    	 port (a, b: in std_logic;
  			s: out std_logic);
    end component;
    
    component porta_not is 
        port (a: in std_logic;
        s: out std_logic);
    end component;
    
	signal sinal_1: std_logic;-- soma
    signal sinal_2: std_logic;--and
    signal sinal_3: std_logic;--or
    signal sinal_4: std_logic;--not a
    signal sinal_5: std_logic;--not b
    signal sinal_6: std_logic;--saida do mux 2
    
	begin
    
    p_not1: porta_not
    	port map (
        		a=>b,
                s=>sinal_5);
                
     mux2: mux_invert
        port map(
                b => b,
                nB =>sinal_5,
                sel => selB,
                s => sinal_6);
    
    somador: somador_completo
        port map(
                a => a,
                b => sinal_6,
                carry_in => selB,
                soma=>sinal_1,
                carry_out=>carry_out,
                overflow=>overflow);
    
    p_and: porta_and
        port map(
                a => a,
                b => b,
                s=>sinal_2);
                
	p_or: porta_or
    	port map (
        		a=>a,
                b=>b,
                s=>sinal_3);
                
	p_not: porta_not
    	port map (
        		a=>a,
                s=>sinal_4);
                
                
    mux1: mux
        port map(
                e1 => sinal_1,
                e2 =>sinal_2,
                e3 =>sinal_3,
                e4 =>sinal_4,
                sel => sel,
                s => s);
	
end ula_arch;