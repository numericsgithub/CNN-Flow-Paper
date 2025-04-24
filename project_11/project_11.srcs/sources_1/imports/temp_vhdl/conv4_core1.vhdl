LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv4_settings.all;

entity conv4_core1 is
    generic
    (
        PIPELINE_STEPS             : natural := 0
    );
    port
    (
        clk   : in std_logic;
        reset : in std_logic;

        xi    : in XI_TYPE;









    
        sel_config: in SEL_CONFIGURATIONS_TYPE;
        sel_1, sel_2, sel_3 : in std_logic;




    
        kpu_1_input_1 : out std_logic_vector(9-1 downto 0) ;  --	sfix(5, -4)
        kpu_1_input_2 : out std_logic_vector(9-1 downto 0) ;  --	sfix(5, -4)
        kpu_1_input_3 : out std_logic_vector(5-1 downto 0) ;  --	sfix(1, -4)
        kpu_1_input_4 : out std_logic_vector(9-1 downto 0) ;  --	sfix(5, -4)
        kpu_1_input_5 : out std_logic_vector(10-1 downto 0) ;  --	sfix(6, -4)
        kpu_1_input_6 : out std_logic_vector(10-1 downto 0) ;  --	sfix(6, -4)
        kpu_1_input_7 : out std_logic_vector(9-1 downto 0) ;  --	sfix(5, -4)
        kpu_1_input_8 : out std_logic_vector(9-1 downto 0) ;  --	sfix(5, -4)
        kpu_1_input_9 : out std_logic_vector(9-1 downto 0)  --	sfix(5, -4)
    );
end conv4_core1;

architecture structural of conv4_core1 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm1c1c0cm1_signal : std_logic_vector(9-1 downto 0);
    signal  x_cm1cm1c1cm1_signal : std_logic_vector(9-1 downto 0);
    signal  x_c3c0c1cm1_signal : std_logic_vector(10-1 downto 0);
    signal  x_c2c1c0cm1_signal : std_logic_vector(10-1 downto 0);
    signal  x_c0cm1c1cm1_signal : std_logic_vector(9-1 downto 0);
    signal  x_cm1c0c1c0_signal : std_logic_vector(9-1 downto 0);
    signal  x_c0c0c0c0_signal : std_logic_vector(5-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm1c1c0cm1 : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r1_c2_cm1c1c0cm1 : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r1_c3_c0c0c0c0 : std_logic_vector(5-1 downto 0);
    signal x_f_f1_r2_c1_cm1cm1c1cm1 : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r2_c2_c3c0c1cm1 : std_logic_vector(10-1 downto 0);
    signal x_f_f1_r2_c3_c2c1c0cm1 : std_logic_vector(10-1 downto 0);
    signal x_f_f1_r3_c1_c0cm1c1cm1 : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r3_c2_cm1cm1c1cm1 : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r3_c3_cm1c0c1c0 : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm1c1c0cm1_mux_out : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r1_c2_cm1c1c0cm1_mux_out : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r1_c3_c0c0c0c0_mux_out : std_logic_vector(5-1 downto 0);
    signal x_f_f1_r2_c1_cm1cm1c1cm1_mux_out : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r2_c2_c3c0c1cm1_mux_out : std_logic_vector(10-1 downto 0);
    signal x_f_f1_r2_c3_c2c1c0cm1_mux_out : std_logic_vector(10-1 downto 0);
    signal x_f_f1_r3_c1_c0cm1c1cm1_mux_out : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r3_c2_cm1cm1c1cm1_mux_out : std_logic_vector(9-1 downto 0);
    signal x_f_f1_r3_c3_cm1c0c1c0_mux_out : std_logic_vector(9-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv4_core1_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm1c1c0cm1 => x_cm1c1c0cm1_signal, 
                R_cm1cm1c1cm1 => x_cm1cm1c1cm1_signal, 
                R_c3c0c1cm1 => x_c3c0c1cm1_signal, 
                R_c2c1c0cm1 => x_c2c1c0cm1_signal, 
                R_c0cm1c1cm1 => x_c0cm1c1cm1_signal, 
                R_cm1c0c1c0 => x_cm1c0c1c0_signal, 
                R_c0c0c0c0 => x_c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm1c1c0cm1 <= x_cm1c1c0cm1_signal;
    x_f_f1_r1_c2_cm1c1c0cm1 <= x_cm1c1c0cm1_signal;
    x_f_f1_r1_c3_c0c0c0c0 <= x_c0c0c0c0_signal;
    x_f_f1_r2_c1_cm1cm1c1cm1 <= x_cm1cm1c1cm1_signal;
    x_f_f1_r2_c2_c3c0c1cm1 <= x_c3c0c1cm1_signal;
    x_f_f1_r2_c3_c2c1c0cm1 <= x_c2c1c0cm1_signal;
    x_f_f1_r3_c1_c0cm1c1cm1 <= x_c0cm1c1cm1_signal;
    x_f_f1_r3_c2_cm1cm1c1cm1 <= x_cm1cm1c1cm1_signal;
    x_f_f1_r3_c3_cm1c0c1c0 <= x_cm1c0c1c0_signal;

    -- like this:
    --MUX_K1_R1_C1_Wm69:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C1_Wm69,zeros,sel_1,x_C1_k1_r1_c1_mux_out);
    --MUX_K1_R1_C2_Wm6:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C2_Wm6,zeros,sel_2,x_C1_k1_r1_c2_mux_out);
    --MUX_K1_R1_C3_W42:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C3_W42,zeros,sel_3,x_C1_k1_r1_c3_mux_out);
    --MUX_K1_R1_C4_Wm10:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C4_Wm10,zeros,sel_4,x_C1_k1_r1_c4_mux_out);
    --MUX_K1_R1_C5_W164:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C5_W164,zeros,sel_5,x_C1_k1_r1_c5_mux_out);
    PADMUX_f_f1_r1_c1_cm1c1c0cm1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm1c1c0cm1'length)
       port map(x_f_f1_r1_c1_cm1c1c0cm1,(others => '0'),sel_1,x_f_f1_r1_c1_cm1c1c0cm1_mux_out);
    PADMUX_f_f1_r1_c2_cm1c1c0cm1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm1c1c0cm1'length)
       port map(x_f_f1_r1_c2_cm1c1c0cm1,(others => '0'),sel_2,x_f_f1_r1_c2_cm1c1c0cm1_mux_out);
    PADMUX_f_f1_r1_c3_c0c0c0c0: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_c0c0c0c0'length)
       port map(x_f_f1_r1_c3_c0c0c0c0,(others => '0'),sel_3,x_f_f1_r1_c3_c0c0c0c0_mux_out);
    PADMUX_f_f1_r2_c1_cm1cm1c1cm1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm1cm1c1cm1'length)
       port map(x_f_f1_r2_c1_cm1cm1c1cm1,(others => '0'),sel_1,x_f_f1_r2_c1_cm1cm1c1cm1_mux_out);
    PADMUX_f_f1_r2_c2_c3c0c1cm1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c3c0c1cm1'length)
       port map(x_f_f1_r2_c2_c3c0c1cm1,(others => '0'),sel_2,x_f_f1_r2_c2_c3c0c1cm1_mux_out);
    PADMUX_f_f1_r2_c3_c2c1c0cm1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_c2c1c0cm1'length)
       port map(x_f_f1_r2_c3_c2c1c0cm1,(others => '0'),sel_3,x_f_f1_r2_c3_c2c1c0cm1_mux_out);
    PADMUX_f_f1_r3_c1_c0cm1c1cm1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_c0cm1c1cm1'length)
       port map(x_f_f1_r3_c1_c0cm1c1cm1,(others => '0'),sel_1,x_f_f1_r3_c1_c0cm1c1cm1_mux_out);
    PADMUX_f_f1_r3_c2_cm1cm1c1cm1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm1cm1c1cm1'length)
       port map(x_f_f1_r3_c2_cm1cm1c1cm1,(others => '0'),sel_2,x_f_f1_r3_c2_cm1cm1c1cm1_mux_out);
    PADMUX_f_f1_r3_c3_cm1c0c1c0: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_cm1c0c1c0'length)
       port map(x_f_f1_r3_c3_cm1c0c1c0,(others => '0'),sel_3,x_f_f1_r3_c3_cm1c0c1c0_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm1c1c0cm1_mux_out; -- sfix(5, -4)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm1c1c0cm1_mux_out; -- sfix(5, -4)
    kpu_1_input_3 <= x_f_f1_r1_c3_c0c0c0c0_mux_out; -- sfix(1, -4)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm1cm1c1cm1_mux_out; -- sfix(5, -4)
    kpu_1_input_5 <= x_f_f1_r2_c2_c3c0c1cm1_mux_out; -- sfix(6, -4)
    kpu_1_input_6 <= x_f_f1_r2_c3_c2c1c0cm1_mux_out; -- sfix(6, -4)
    kpu_1_input_7 <= x_f_f1_r3_c1_c0cm1c1cm1_mux_out; -- sfix(5, -4)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm1cm1c1cm1_mux_out; -- sfix(5, -4)
    kpu_1_input_9 <= x_f_f1_r3_c3_cm1c0c1c0_mux_out; -- sfix(5, -4)

























end structural;