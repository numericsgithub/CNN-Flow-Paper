LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core27 is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk   : in std_logic;
        rst   : in std_logic;

        xi    : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        sel_config: in    std_logic_vector(bits(4-1)-1 downto 0);
    
        yo_1  : out std_logic_vector(11-1 downto 0);  --	sfix(4, -7)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_5  : out std_logic_vector(11-1 downto 0);  --	sfix(4, -7)
        yo_6  : out std_logic_vector(15-1 downto 0);  --	sfix(8, -7)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(7, -7)
        yo_8  : out std_logic_vector(9-1 downto 0);  --	sfix(2, -7)
        yo_9  : out std_logic_vector(12-1 downto 0);  --	sfix(5, -7)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_12  : out std_logic_vector(11-1 downto 0);  --	sfix(4, -7)
        yo_13  : out std_logic_vector(10-1 downto 0);  --	sfix(3, -7)
        yo_14  : out std_logic_vector(14-1 downto 0);  --	sfix(7, -7)
        yo_15  : out std_logic_vector(11-1 downto 0);  --	sfix(4, -7)
        yo_16  : out std_logic_vector(12-1 downto 0) --	sfix(5, -7)
    );
end conv3_core27;

architecture structural of conv3_core27 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm1cm6cm1cm4_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_cm3c6c11c27_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c0cm17c0c1_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c6cm14c9c16_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c2c5cm3c4_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_c70c0c0c0_signal : std_logic_vector(15-1 downto 0); --	sfix(8, -7)
    signal  x_c2c33c1c0_signal : std_logic_vector(14-1 downto 0); --	sfix(7, -7)
    signal  x_c0c1c0c1_signal : std_logic_vector(9-1 downto 0); --	sfix(2, -7)
    signal  x_c1c13cm2cm7_signal : std_logic_vector(12-1 downto 0); --	sfix(5, -7)
    signal  x_c11cm19c0cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c4cm25c30c2_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c6cm5c0c6_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_c2cm2c0c0_signal : std_logic_vector(10-1 downto 0); --	sfix(3, -7)
    signal  x_c2cm33cm3cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(7, -7)
    signal  x_c1c2c7c2_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_cm1cm11c0c1_signal : std_logic_vector(12-1 downto 0); --	sfix(5, -7)
    signal  x_c0c0c0c0_signal : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(4-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv3_core27_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm1cm6cm1cm4 => x_cm1cm6cm1cm4_signal, 
                R_cm3c6c11c27 => x_cm3c6c11c27_signal, 
                R_c0cm17c0c1 => x_c0cm17c0c1_signal, 
                R_c6cm14c9c16 => x_c6cm14c9c16_signal, 
                R_c2c5cm3c4 => x_c2c5cm3c4_signal, 
                R_c70c0c0c0 => x_c70c0c0c0_signal, 
                R_c2c33c1c0 => x_c2c33c1c0_signal, 
                R_c0c1c0c1 => x_c0c1c0c1_signal, 
                R_c1c13cm2cm7 => x_c1c13cm2cm7_signal, 
                R_c11cm19c0cm1 => x_c11cm19c0cm1_signal, 
                R_c4cm25c30c2 => x_c4cm25c30c2_signal, 
                R_c6cm5c0c6 => x_c6cm5c0c6_signal, 
                R_c2cm2c0c0 => x_c2cm2c0c0_signal, 
                R_c2cm33cm3cm8 => x_c2cm33cm3cm8_signal, 
                R_c1c2c7c2 => x_c1c2c7c2_signal, 
                R_cm1cm11c0c1 => x_cm1cm11c0c1_signal, 
                R_c0c0c0c0 => x_c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm1cm6cm1cm4_signal;
    yo_2 <= x_cm3c6c11c27_signal;
    yo_3 <= x_c0cm17c0c1_signal;
    yo_4 <= x_c6cm14c9c16_signal;
    yo_5 <= x_c2c5cm3c4_signal;
    yo_6 <= x_c70c0c0c0_signal;
    yo_7 <= x_c2c33c1c0_signal;
    yo_8 <= x_c0c1c0c1_signal;
    yo_9 <= x_c1c13cm2cm7_signal;
    yo_10 <= x_c11cm19c0cm1_signal;
    yo_11 <= x_c4cm25c30c2_signal;
    yo_12 <= x_c6cm5c0c6_signal;
    yo_13 <= x_c2cm2c0c0_signal;
    yo_14 <= x_c2cm33cm3cm8_signal;
    yo_15 <= x_c1c2c7c2_signal;
    yo_16 <= x_cm1cm11c0c1_signal;



end structural;