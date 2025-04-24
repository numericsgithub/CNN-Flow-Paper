LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv2_settings.all;

entity conv2_core4 is
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




    
        kpu_1_input_1 : out std_logic_vector(12-1 downto 0) ;  --	sfix(8, -4)
        kpu_1_input_2 : out std_logic_vector(12-1 downto 0) ;  --	sfix(8, -4)
        kpu_1_input_3 : out std_logic_vector(13-1 downto 0) ;  --	sfix(9, -4)
        kpu_1_input_4 : out std_logic_vector(13-1 downto 0) ;  --	sfix(9, -4)
        kpu_1_input_5 : out std_logic_vector(13-1 downto 0) ;  --	sfix(9, -4)
        kpu_1_input_6 : out std_logic_vector(14-1 downto 0) ;  --	sfix(10, -4)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(9, -4)
        kpu_1_input_8 : out std_logic_vector(14-1 downto 0) ;  --	sfix(10, -4)
        kpu_1_input_9 : out std_logic_vector(11-1 downto 0)  --	sfix(7, -4)
    );
end conv2_core4;

architecture structural of conv2_core4 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm13c0c1c7_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm13c0c7c1_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm15c0c0cm25_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm6c1cm1cm17_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm11cm2cm6cm22_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm9c0c0cm37_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm8c0c0cm21_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm11c0c0cm38_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm7c0c0cm5_signal : std_logic_vector(11-1 downto 0);
    signal  x_c0c0c0c0_signal : std_logic_vector(5-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm13c0c1c7 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r1_c2_cm13c0c7c1 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r1_c3_cm15c0c0cm25 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm6c1cm1cm17 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_cm11cm2cm6cm22 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c3_cm9c0c0cm37 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c1_cm8c0c0cm21 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm11c0c0cm38 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_cm7c0c0cm5 : std_logic_vector(11-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm13c0c1c7_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r1_c2_cm13c0c7c1_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r1_c3_cm15c0c0cm25_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm6c1cm1cm17_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_cm11cm2cm6cm22_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c3_cm9c0c0cm37_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c1_cm8c0c0cm21_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm11c0c0cm38_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_cm7c0c0cm5_mux_out : std_logic_vector(11-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv2_core4_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm13c0c1c7 => x_cm13c0c1c7_signal, 
                R_cm13c0c7c1 => x_cm13c0c7c1_signal, 
                R_cm15c0c0cm25 => x_cm15c0c0cm25_signal, 
                R_cm6c1cm1cm17 => x_cm6c1cm1cm17_signal, 
                R_cm11cm2cm6cm22 => x_cm11cm2cm6cm22_signal, 
                R_cm9c0c0cm37 => x_cm9c0c0cm37_signal, 
                R_cm8c0c0cm21 => x_cm8c0c0cm21_signal, 
                R_cm11c0c0cm38 => x_cm11c0c0cm38_signal, 
                R_cm7c0c0cm5 => x_cm7c0c0cm5_signal, 
                R_c0c0c0c0 => x_c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm13c0c1c7 <= x_cm13c0c1c7_signal;
    x_f_f1_r1_c2_cm13c0c7c1 <= x_cm13c0c7c1_signal;
    x_f_f1_r1_c3_cm15c0c0cm25 <= x_cm15c0c0cm25_signal;
    x_f_f1_r2_c1_cm6c1cm1cm17 <= x_cm6c1cm1cm17_signal;
    x_f_f1_r2_c2_cm11cm2cm6cm22 <= x_cm11cm2cm6cm22_signal;
    x_f_f1_r2_c3_cm9c0c0cm37 <= x_cm9c0c0cm37_signal;
    x_f_f1_r3_c1_cm8c0c0cm21 <= x_cm8c0c0cm21_signal;
    x_f_f1_r3_c2_cm11c0c0cm38 <= x_cm11c0c0cm38_signal;
    x_f_f1_r3_c3_cm7c0c0cm5 <= x_cm7c0c0cm5_signal;

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
    PADMUX_f_f1_r1_c1_cm13c0c1c7: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm13c0c1c7'length)
       port map(x_f_f1_r1_c1_cm13c0c1c7,(others => '0'),sel_1,x_f_f1_r1_c1_cm13c0c1c7_mux_out);
    PADMUX_f_f1_r1_c2_cm13c0c7c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm13c0c7c1'length)
       port map(x_f_f1_r1_c2_cm13c0c7c1,(others => '0'),sel_2,x_f_f1_r1_c2_cm13c0c7c1_mux_out);
    PADMUX_f_f1_r1_c3_cm15c0c0cm25: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm15c0c0cm25'length)
       port map(x_f_f1_r1_c3_cm15c0c0cm25,(others => '0'),sel_3,x_f_f1_r1_c3_cm15c0c0cm25_mux_out);
    PADMUX_f_f1_r2_c1_cm6c1cm1cm17: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm6c1cm1cm17'length)
       port map(x_f_f1_r2_c1_cm6c1cm1cm17,(others => '0'),sel_1,x_f_f1_r2_c1_cm6c1cm1cm17_mux_out);
    PADMUX_f_f1_r2_c2_cm11cm2cm6cm22: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_cm11cm2cm6cm22'length)
       port map(x_f_f1_r2_c2_cm11cm2cm6cm22,(others => '0'),sel_2,x_f_f1_r2_c2_cm11cm2cm6cm22_mux_out);
    PADMUX_f_f1_r2_c3_cm9c0c0cm37: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm9c0c0cm37'length)
       port map(x_f_f1_r2_c3_cm9c0c0cm37,(others => '0'),sel_3,x_f_f1_r2_c3_cm9c0c0cm37_mux_out);
    PADMUX_f_f1_r3_c1_cm8c0c0cm21: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm8c0c0cm21'length)
       port map(x_f_f1_r3_c1_cm8c0c0cm21,(others => '0'),sel_1,x_f_f1_r3_c1_cm8c0c0cm21_mux_out);
    PADMUX_f_f1_r3_c2_cm11c0c0cm38: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm11c0c0cm38'length)
       port map(x_f_f1_r3_c2_cm11c0c0cm38,(others => '0'),sel_2,x_f_f1_r3_c2_cm11c0c0cm38_mux_out);
    PADMUX_f_f1_r3_c3_cm7c0c0cm5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_cm7c0c0cm5'length)
       port map(x_f_f1_r3_c3_cm7c0c0cm5,(others => '0'),sel_3,x_f_f1_r3_c3_cm7c0c0cm5_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm13c0c1c7_mux_out; -- sfix(8, -4)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm13c0c7c1_mux_out; -- sfix(8, -4)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm15c0c0cm25_mux_out; -- sfix(9, -4)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm6c1cm1cm17_mux_out; -- sfix(9, -4)
    kpu_1_input_5 <= x_f_f1_r2_c2_cm11cm2cm6cm22_mux_out; -- sfix(9, -4)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm9c0c0cm37_mux_out; -- sfix(10, -4)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm8c0c0cm21_mux_out; -- sfix(9, -4)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm11c0c0cm38_mux_out; -- sfix(10, -4)
    kpu_1_input_9 <= x_f_f1_r3_c3_cm7c0c0cm5_mux_out; -- sfix(7, -4)

























end structural;