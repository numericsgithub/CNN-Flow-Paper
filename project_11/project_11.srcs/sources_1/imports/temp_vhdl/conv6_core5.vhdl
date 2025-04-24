LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv6_settings.all;

entity conv6_core5 is
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
        kpu_1_input_2 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_3 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_4 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_5 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_6 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_7 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(14-1 downto 0)  --	sfix(6, -8)
    );
end conv6_core5;

architecture structural of conv6_core5 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_signal : std_logic_vector(14-1 downto 0);
    signal  x_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_signal : std_logic_vector(14-1 downto 0);
    signal  x_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_signal : std_logic_vector(14-1 downto 0);
    signal  x_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_signal : std_logic_vector(14-1 downto 0);
    signal  x_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_signal : std_logic_vector(14-1 downto 0);
    signal  x_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_signal : std_logic_vector(13-1 downto 0);
    signal  x_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_signal : std_logic_vector(14-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c1_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r3_c1_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c2_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1 : std_logic_vector(14-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c1_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r3_c1_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c2_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_mux_out : std_logic_vector(14-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv6_core5_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1 => x_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_signal, 
                R_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12 => x_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_signal, 
                R_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2 => x_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_signal, 
                R_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2 => x_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_signal, 
                R_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29 => x_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_signal, 
                R_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5 => x_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_signal, 
                R_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1 => x_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_signal, 
                R_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2 => x_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_signal, 
                R_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1 => x_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1 <= x_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_signal;
    x_f_f1_r1_c2_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12 <= x_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_signal;
    x_f_f1_r1_c3_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2 <= x_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_signal;
    x_f_f1_r2_c1_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2 <= x_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_signal;
    x_f_f1_r2_c2_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29 <= x_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_signal;
    x_f_f1_r2_c3_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5 <= x_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_signal;
    x_f_f1_r3_c1_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1 <= x_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_signal;
    x_f_f1_r3_c2_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2 <= x_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_signal;
    x_f_f1_r3_c3_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1 <= x_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_signal;

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
    PADMUX_f_f1_r1_c1_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1'length)
       port map(x_f_f1_r1_c1_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1,(others => '0'),sel_1,x_f_f1_r1_c1_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_mux_out);
    PADMUX_f_f1_r1_c2_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12'length)
       port map(x_f_f1_r1_c2_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12,(others => '0'),sel_2,x_f_f1_r1_c2_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_mux_out);
    PADMUX_f_f1_r1_c3_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2'length)
       port map(x_f_f1_r1_c3_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2,(others => '0'),sel_3,x_f_f1_r1_c3_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_mux_out);
    PADMUX_f_f1_r2_c1_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2'length)
       port map(x_f_f1_r2_c1_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2,(others => '0'),sel_1,x_f_f1_r2_c1_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_mux_out);
    PADMUX_f_f1_r2_c2_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29'length)
       port map(x_f_f1_r2_c2_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29,(others => '0'),sel_2,x_f_f1_r2_c2_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_mux_out);
    PADMUX_f_f1_r2_c3_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5'length)
       port map(x_f_f1_r2_c3_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5,(others => '0'),sel_3,x_f_f1_r2_c3_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_mux_out);
    PADMUX_f_f1_r3_c1_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1'length)
       port map(x_f_f1_r3_c1_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1,(others => '0'),sel_1,x_f_f1_r3_c1_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_mux_out);
    PADMUX_f_f1_r3_c2_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2'length)
       port map(x_f_f1_r3_c2_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2,(others => '0'),sel_2,x_f_f1_r3_c2_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_mux_out);
    PADMUX_f_f1_r3_c3_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1'length)
       port map(x_f_f1_r3_c3_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1,(others => '0'),sel_3,x_f_f1_r3_c3_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_mux_out; -- sfix(6, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_mux_out; -- sfix(6, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_mux_out; -- sfix(6, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_mux_out; -- sfix(6, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_mux_out; -- sfix(7, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_mux_out; -- sfix(6, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_mux_out; -- sfix(6, -8)

























end structural;