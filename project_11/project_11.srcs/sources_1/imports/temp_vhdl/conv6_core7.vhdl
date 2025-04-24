LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv6_settings.all;

entity conv6_core7 is
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




    
        kpu_1_input_1 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_2 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_3 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_4 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_5 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_6 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_7 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_8 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_9 : out std_logic_vector(13-1 downto 0)  --	sfix(5, -8)
    );
end conv6_core7;

architecture structural of conv6_core7 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_signal : std_logic_vector(13-1 downto 0);
    signal  x_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_signal : std_logic_vector(13-1 downto 0);
    signal  x_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_signal : std_logic_vector(14-1 downto 0);
    signal  x_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_signal : std_logic_vector(13-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r1_c3_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c2_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c2_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21 : std_logic_vector(13-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r1_c3_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c2_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c2_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_mux_out : std_logic_vector(13-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv6_core7_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32 => x_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_signal, 
                R_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83 => x_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_signal, 
                R_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24 => x_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_signal, 
                R_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30 => x_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_signal, 
                R_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42 => x_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_signal, 
                R_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5 => x_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_signal, 
                R_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9 => x_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_signal, 
                R_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35 => x_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_signal, 
                R_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21 => x_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32 <= x_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_signal;
    x_f_f1_r1_c2_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83 <= x_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_signal;
    x_f_f1_r1_c3_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24 <= x_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_signal;
    x_f_f1_r2_c1_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30 <= x_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_signal;
    x_f_f1_r2_c2_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42 <= x_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_signal;
    x_f_f1_r2_c3_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5 <= x_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_signal;
    x_f_f1_r3_c1_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9 <= x_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_signal;
    x_f_f1_r3_c2_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35 <= x_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_signal;
    x_f_f1_r3_c3_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21 <= x_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_signal;

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
    PADMUX_f_f1_r1_c1_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32'length)
       port map(x_f_f1_r1_c1_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32,(others => '0'),sel_1,x_f_f1_r1_c1_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_mux_out);
    PADMUX_f_f1_r1_c2_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83'length)
       port map(x_f_f1_r1_c2_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83,(others => '0'),sel_2,x_f_f1_r1_c2_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_mux_out);
    PADMUX_f_f1_r1_c3_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24'length)
       port map(x_f_f1_r1_c3_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24,(others => '0'),sel_3,x_f_f1_r1_c3_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_mux_out);
    PADMUX_f_f1_r2_c1_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30'length)
       port map(x_f_f1_r2_c1_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30,(others => '0'),sel_1,x_f_f1_r2_c1_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_mux_out);
    PADMUX_f_f1_r2_c2_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42'length)
       port map(x_f_f1_r2_c2_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42,(others => '0'),sel_2,x_f_f1_r2_c2_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_mux_out);
    PADMUX_f_f1_r2_c3_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5'length)
       port map(x_f_f1_r2_c3_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5,(others => '0'),sel_3,x_f_f1_r2_c3_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_mux_out);
    PADMUX_f_f1_r3_c1_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9'length)
       port map(x_f_f1_r3_c1_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9,(others => '0'),sel_1,x_f_f1_r3_c1_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_mux_out);
    PADMUX_f_f1_r3_c2_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35'length)
       port map(x_f_f1_r3_c2_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35,(others => '0'),sel_2,x_f_f1_r3_c2_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_mux_out);
    PADMUX_f_f1_r3_c3_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21'length)
       port map(x_f_f1_r3_c3_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21,(others => '0'),sel_3,x_f_f1_r3_c3_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_mux_out; -- sfix(6, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_mux_out; -- sfix(7, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_mux_out; -- sfix(7, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_mux_out; -- sfix(5, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_mux_out; -- sfix(6, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_mux_out; -- sfix(6, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_mux_out; -- sfix(5, -8)

























end structural;