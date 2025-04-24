LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv2_settings.all;

entity conv2_core1 is
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




    
        kpu_1_input_1 : out std_logic_vector(14-1 downto 0) ;  --	sfix(10, -4)
        kpu_1_input_2 : out std_logic_vector(14-1 downto 0) ;  --	sfix(10, -4)
        kpu_1_input_3 : out std_logic_vector(13-1 downto 0) ;  --	sfix(9, -4)
        kpu_1_input_4 : out std_logic_vector(13-1 downto 0) ;  --	sfix(9, -4)
        kpu_1_input_5 : out std_logic_vector(14-1 downto 0) ;  --	sfix(10, -4)
        kpu_1_input_6 : out std_logic_vector(11-1 downto 0) ;  --	sfix(7, -4)
        kpu_1_input_7 : out std_logic_vector(14-1 downto 0) ;  --	sfix(10, -4)
        kpu_1_input_8 : out std_logic_vector(14-1 downto 0) ;  --	sfix(10, -4)
        kpu_1_input_9 : out std_logic_vector(12-1 downto 0)  --	sfix(8, -4)
    );
end conv2_core1;

architecture structural of conv2_core1 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm2c4c0cm36_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm2c5c0cm35_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm3c5c0cm28_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm1c6c0c18_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm1c4c1c37_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm2c6c0cm2_signal : std_logic_vector(11-1 downto 0);
    signal  x_cm2c1c0c45_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm1c3c1c39_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm2c4c0cm15_signal : std_logic_vector(12-1 downto 0);
    signal  x_c0c0c0c0_signal : std_logic_vector(5-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm2c4c0cm36 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm2c5c0cm35 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm3c5c0cm28 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm1c6c0c18 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_cm1c4c1c37 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_cm2c6c0cm2 : std_logic_vector(11-1 downto 0);
    signal x_f_f1_r3_c1_cm2c1c0c45 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c2_cm1c3c1c39 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_cm2c4c0cm15 : std_logic_vector(12-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm2c4c0cm36_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm2c5c0cm35_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm3c5c0cm28_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm1c6c0c18_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_cm1c4c1c37_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_cm2c6c0cm2_mux_out : std_logic_vector(11-1 downto 0);
    signal x_f_f1_r3_c1_cm2c1c0c45_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c2_cm1c3c1c39_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_cm2c4c0cm15_mux_out : std_logic_vector(12-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv2_core1_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm2c4c0cm36 => x_cm2c4c0cm36_signal, 
                R_cm2c5c0cm35 => x_cm2c5c0cm35_signal, 
                R_cm3c5c0cm28 => x_cm3c5c0cm28_signal, 
                R_cm1c6c0c18 => x_cm1c6c0c18_signal, 
                R_cm1c4c1c37 => x_cm1c4c1c37_signal, 
                R_cm2c6c0cm2 => x_cm2c6c0cm2_signal, 
                R_cm2c1c0c45 => x_cm2c1c0c45_signal, 
                R_cm1c3c1c39 => x_cm1c3c1c39_signal, 
                R_cm2c4c0cm15 => x_cm2c4c0cm15_signal, 
                R_c0c0c0c0 => x_c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm2c4c0cm36 <= x_cm2c4c0cm36_signal;
    x_f_f1_r1_c2_cm2c5c0cm35 <= x_cm2c5c0cm35_signal;
    x_f_f1_r1_c3_cm3c5c0cm28 <= x_cm3c5c0cm28_signal;
    x_f_f1_r2_c1_cm1c6c0c18 <= x_cm1c6c0c18_signal;
    x_f_f1_r2_c2_cm1c4c1c37 <= x_cm1c4c1c37_signal;
    x_f_f1_r2_c3_cm2c6c0cm2 <= x_cm2c6c0cm2_signal;
    x_f_f1_r3_c1_cm2c1c0c45 <= x_cm2c1c0c45_signal;
    x_f_f1_r3_c2_cm1c3c1c39 <= x_cm1c3c1c39_signal;
    x_f_f1_r3_c3_cm2c4c0cm15 <= x_cm2c4c0cm15_signal;

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
    PADMUX_f_f1_r1_c1_cm2c4c0cm36: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm2c4c0cm36'length)
       port map(x_f_f1_r1_c1_cm2c4c0cm36,(others => '0'),sel_1,x_f_f1_r1_c1_cm2c4c0cm36_mux_out);
    PADMUX_f_f1_r1_c2_cm2c5c0cm35: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm2c5c0cm35'length)
       port map(x_f_f1_r1_c2_cm2c5c0cm35,(others => '0'),sel_2,x_f_f1_r1_c2_cm2c5c0cm35_mux_out);
    PADMUX_f_f1_r1_c3_cm3c5c0cm28: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm3c5c0cm28'length)
       port map(x_f_f1_r1_c3_cm3c5c0cm28,(others => '0'),sel_3,x_f_f1_r1_c3_cm3c5c0cm28_mux_out);
    PADMUX_f_f1_r2_c1_cm1c6c0c18: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm1c6c0c18'length)
       port map(x_f_f1_r2_c1_cm1c6c0c18,(others => '0'),sel_1,x_f_f1_r2_c1_cm1c6c0c18_mux_out);
    PADMUX_f_f1_r2_c2_cm1c4c1c37: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_cm1c4c1c37'length)
       port map(x_f_f1_r2_c2_cm1c4c1c37,(others => '0'),sel_2,x_f_f1_r2_c2_cm1c4c1c37_mux_out);
    PADMUX_f_f1_r2_c3_cm2c6c0cm2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm2c6c0cm2'length)
       port map(x_f_f1_r2_c3_cm2c6c0cm2,(others => '0'),sel_3,x_f_f1_r2_c3_cm2c6c0cm2_mux_out);
    PADMUX_f_f1_r3_c1_cm2c1c0c45: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm2c1c0c45'length)
       port map(x_f_f1_r3_c1_cm2c1c0c45,(others => '0'),sel_1,x_f_f1_r3_c1_cm2c1c0c45_mux_out);
    PADMUX_f_f1_r3_c2_cm1c3c1c39: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm1c3c1c39'length)
       port map(x_f_f1_r3_c2_cm1c3c1c39,(others => '0'),sel_2,x_f_f1_r3_c2_cm1c3c1c39_mux_out);
    PADMUX_f_f1_r3_c3_cm2c4c0cm15: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_cm2c4c0cm15'length)
       port map(x_f_f1_r3_c3_cm2c4c0cm15,(others => '0'),sel_3,x_f_f1_r3_c3_cm2c4c0cm15_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm2c4c0cm36_mux_out; -- sfix(10, -4)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm2c5c0cm35_mux_out; -- sfix(10, -4)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm3c5c0cm28_mux_out; -- sfix(9, -4)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm1c6c0c18_mux_out; -- sfix(9, -4)
    kpu_1_input_5 <= x_f_f1_r2_c2_cm1c4c1c37_mux_out; -- sfix(10, -4)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm2c6c0cm2_mux_out; -- sfix(7, -4)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm2c1c0c45_mux_out; -- sfix(10, -4)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm1c3c1c39_mux_out; -- sfix(10, -4)
    kpu_1_input_9 <= x_f_f1_r3_c3_cm2c4c0cm15_mux_out; -- sfix(8, -4)

























end structural;