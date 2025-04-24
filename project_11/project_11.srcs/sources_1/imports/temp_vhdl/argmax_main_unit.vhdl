library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.std_logic_signed.ALL;

entity Argmax is
    generic (
        VALUE_WIDTH : natural := 8;
        INDEX_WIDTH: natural := 6
    );
    Port (
        clk   : in std_logic;

    
        xi_1    : in std_logic_vector(VALUE_WIDTH-1 downto 0);
        xi_2    : in std_logic_vector(VALUE_WIDTH-1 downto 0);
        xi_3    : in std_logic_vector(VALUE_WIDTH-1 downto 0);
        xi_4    : in std_logic_vector(VALUE_WIDTH-1 downto 0);
        xi_5    : in std_logic_vector(VALUE_WIDTH-1 downto 0);
        xi_6    : in std_logic_vector(VALUE_WIDTH-1 downto 0);
        xi_7    : in std_logic_vector(VALUE_WIDTH-1 downto 0);
        xi_8    : in std_logic_vector(VALUE_WIDTH-1 downto 0);

        max_index : out unsigned(INDEX_WIDTH-1 downto 0);
        max_value : out std_logic_vector(VALUE_WIDTH-1 downto 0)
    );
end Argmax;

architecture Behavioral of Argmax is


    -- Stage 0
    signal stage_0_1_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_0_1_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_0_2_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_0_2_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_0_3_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_0_3_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_0_4_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_0_4_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_0_5_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_0_5_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_0_6_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_0_6_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_0_7_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_0_7_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_0_8_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_0_8_index : unsigned(INDEX_WIDTH-1 downto 0);

    -- Stage 1
    signal stage_1_1_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_1_1_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_1_2_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_1_2_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_1_3_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_1_3_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_1_4_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_1_4_index : unsigned(INDEX_WIDTH-1 downto 0);

    -- Stage 2
    signal stage_2_1_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_2_1_index : unsigned(INDEX_WIDTH-1 downto 0);
    signal stage_2_2_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_2_2_index : unsigned(INDEX_WIDTH-1 downto 0);

    -- Stage 3
    signal stage_3_1_value : std_logic_vector(VALUE_WIDTH-1 downto 0);
    signal stage_3_1_index : unsigned(INDEX_WIDTH-1 downto 0);

begin


    -- Stage 0
    stage_0_1_index <= to_unsigned(1, INDEX_WIDTH);
    stage_0_2_index <= to_unsigned(2, INDEX_WIDTH);
    stage_0_3_index <= to_unsigned(3, INDEX_WIDTH);
    stage_0_4_index <= to_unsigned(4, INDEX_WIDTH);
    stage_0_5_index <= to_unsigned(5, INDEX_WIDTH);
    stage_0_6_index <= to_unsigned(6, INDEX_WIDTH);
    stage_0_7_index <= to_unsigned(7, INDEX_WIDTH);
    stage_0_8_index <= to_unsigned(8, INDEX_WIDTH);

    -- Stage 1
    STAGE_1_MAX_1: entity work.Argmax2to1
        generic map(VALUE_WIDTH => VALUE_WIDTH, INDEX_WIDTH => INDEX_WIDTH)
        port map(
            clk,
            stage_0_1_value,
            stage_0_2_value,
            stage_0_1_index,
            stage_0_2_index,
            stage_1_1_value,
            stage_1_1_index
        );
    STAGE_1_MAX_2: entity work.Argmax2to1
        generic map(VALUE_WIDTH => VALUE_WIDTH, INDEX_WIDTH => INDEX_WIDTH)
        port map(
            clk,
            stage_0_3_value,
            stage_0_4_value,
            stage_0_3_index,
            stage_0_4_index,
            stage_1_2_value,
            stage_1_2_index
        );
    STAGE_1_MAX_3: entity work.Argmax2to1
        generic map(VALUE_WIDTH => VALUE_WIDTH, INDEX_WIDTH => INDEX_WIDTH)
        port map(
            clk,
            stage_0_5_value,
            stage_0_6_value,
            stage_0_5_index,
            stage_0_6_index,
            stage_1_3_value,
            stage_1_3_index
        );
    STAGE_1_MAX_4: entity work.Argmax2to1
        generic map(VALUE_WIDTH => VALUE_WIDTH, INDEX_WIDTH => INDEX_WIDTH)
        port map(
            clk,
            stage_0_7_value,
            stage_0_8_value,
            stage_0_7_index,
            stage_0_8_index,
            stage_1_4_value,
            stage_1_4_index
        );

    -- Stage 2
    STAGE_2_MAX_1: entity work.Argmax2to1
        generic map(VALUE_WIDTH => VALUE_WIDTH, INDEX_WIDTH => INDEX_WIDTH)
        port map(
            clk,
            stage_1_1_value,
            stage_1_2_value,
            stage_1_1_index,
            stage_1_2_index,
            stage_2_1_value,
            stage_2_1_index
        );
    STAGE_2_MAX_2: entity work.Argmax2to1
        generic map(VALUE_WIDTH => VALUE_WIDTH, INDEX_WIDTH => INDEX_WIDTH)
        port map(
            clk,
            stage_1_3_value,
            stage_1_4_value,
            stage_1_3_index,
            stage_1_4_index,
            stage_2_2_value,
            stage_2_2_index
        );

    -- Stage 3
    STAGE_3_MAX_1: entity work.Argmax2to1
        generic map(VALUE_WIDTH => VALUE_WIDTH, INDEX_WIDTH => INDEX_WIDTH)
        port map(
            clk,
            stage_2_1_value,
            stage_2_2_value,
            stage_2_1_index,
            stage_2_2_index,
            stage_3_1_value,
            stage_3_1_index
        );


    process(clk)
    begin
        if rising_edge(clk) then
        end if;
    end process;
    stage_0_1_value <=  xi_1;
    stage_0_2_value <=  xi_2;
    stage_0_3_value <=  xi_3;
    stage_0_4_value <=  xi_4;
    stage_0_5_value <=  xi_5;
    stage_0_6_value <=  xi_6;
    stage_0_7_value <=  xi_7;
    stage_0_8_value <=  xi_8;
    max_index <= stage_3_1_index;
    max_value <= stage_3_1_value;
end Behavioral;