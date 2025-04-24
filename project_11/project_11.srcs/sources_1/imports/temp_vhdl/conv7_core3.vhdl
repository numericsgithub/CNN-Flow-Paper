LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core3 is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk   : in std_logic;
        rst   : in std_logic;

        xi    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        sel_config: in    std_logic_vector(bits(16-1)-1 downto 0);
    
        yo_1  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_3  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_5  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_6  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_10  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core3;

architecture structural of conv7_core3 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core3_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2 => x_cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_signal, 
                R_c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0 => x_c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_signal, 
                R_cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18 => x_cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_signal, 
                R_c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1 => x_c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_signal, 
                R_cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1 => x_cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_signal, 
                R_cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1 => x_cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_signal, 
                R_c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1 => x_c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_signal, 
                R_cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2 => x_cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_signal, 
                R_cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5 => x_cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_signal, 
                R_c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1 => x_c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_signal, 
                R_c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1 => x_c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_signal, 
                R_c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2 => x_c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_signal, 
                R_c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0 => x_c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_signal, 
                R_cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2 => x_cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_signal, 
                R_c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1 => x_c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_signal, 
                R_c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5 => x_c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_signal, 
                R_cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3 => x_cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_signal, 
                R_cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4 => x_cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_signal, 
                R_c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18 => x_c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_signal, 
                R_cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6 => x_cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_signal, 
                R_cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2 => x_cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_signal, 
                R_cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0 => x_cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_signal, 
                R_cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5 => x_cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_signal, 
                R_cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3 => x_cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_signal, 
                R_cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3 => x_cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_signal, 
                R_c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3 => x_c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_signal, 
                R_cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10 => x_cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_signal, 
                R_cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1 => x_cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_signal, 
                R_cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1 => x_cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_signal, 
                R_c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2 => x_c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_signal, 
                R_cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9 => x_cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_signal, 
                R_c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1 => x_c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_signal;
    yo_2 <= x_c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_signal;
    yo_3 <= x_cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_signal;
    yo_4 <= x_c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_signal;
    yo_5 <= x_cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_signal;
    yo_6 <= x_cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_signal;
    yo_7 <= x_c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_signal;
    yo_8 <= x_cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_signal;
    yo_9 <= x_cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_signal;
    yo_10 <= x_c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_signal;
    yo_11 <= x_c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_signal;
    yo_12 <= x_c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_signal;
    yo_13 <= x_c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_signal;
    yo_14 <= x_cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_signal;
    yo_15 <= x_c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_signal;
    yo_16 <= x_c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_signal;
    yo_17 <= x_cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_signal;
    yo_18 <= x_cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_signal;
    yo_19 <= x_c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_signal;
    yo_20 <= x_cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_signal;
    yo_21 <= x_cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_signal;
    yo_22 <= x_cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_signal;
    yo_23 <= x_cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_signal;
    yo_24 <= x_cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_signal;
    yo_25 <= x_cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_signal;
    yo_26 <= x_c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_signal;
    yo_27 <= x_cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_signal;
    yo_28 <= x_cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_signal;
    yo_29 <= x_cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_signal;
    yo_30 <= x_c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_signal;
    yo_31 <= x_cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_signal;
    yo_32 <= x_c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_signal;



end structural;