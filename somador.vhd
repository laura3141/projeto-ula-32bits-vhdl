library IEEE;
use IEEE.std_logic_1164.all;

--outra entidade distinta da anterior
entity somador_completo is
    port(
        a: in std_logic;
        b: in std_logic;
        carry_in: in std_logic;
        soma: out std_logic;
        carry_out: out std_logic;
        overflow: out std_logic
    );
end somador_completo;

architecture somador_completo_arch of somador_completo is
	--componente interno da arquitetura do somador completo
    component meio_somador is
        port(
            a: in std_logic;
            b: in std_logic;
            soma: out std_logic;
            carry: out std_logic
        );
    end component;

    -- sinais internos
    signal S_primeira_soma: std_logic;
    signal S_primeiro_carry: std_logic;
    signal S_segunda_soma: std_logic;
    signal S_segundo_carry: std_logic;
begin
    --somador 1 é uma instancia de meio somador
    somador1: meio_somador
        port map(
            a => a, --os termos a esquerda sao a mascara, os da direita a instancia
            b => b,
            soma => S_primeira_soma,
            carry => S_primeiro_carry
        );

    
    somador2: meio_somador
        port map(
            a => S_primeira_soma,
            b => carry_in,
            soma => soma,
            carry => S_segundo_carry
        );

    
    carry_out <= S_primeiro_carry or S_segundo_carry;
    overflow <= carry_in xor carry_out;
end somador_completo_arch;