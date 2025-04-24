LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core5 is
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
    
        yo_1  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_2  : out std_logic_vector(11-1 downto 0);  --	sfix(4, -7)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_4  : out std_logic_vector(10-1 downto 0);  --	sfix(3, -7)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_6  : out std_logic_vector(11-1 downto 0);  --	sfix(4, -7)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_8  : out std_logic_vector(12-1 downto 0);  --	sfix(5, -7)
        yo_9  : out std_logic_vector(12-1 downto 0);  --	sfix(5, -7)
        yo_10  : out std_logic_vector(11-1 downto 0);  --	sfix(4, -7)
        yo_11  : out std_logic_vector(10-1 downto 0);  --	sfix(3, -7)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(5, -7)
        yo_13  : out std_logic_vector(11-1 downto 0);  --	sfix(4, -7)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_15  : out std_logic_vector(15-1 downto 0);  --	sfix(8, -7)
        yo_16  : out std_logic_vector(11-1 downto 0) --	sfix(4, -7)
    );
end conv3_core5;

architecture structural of conv3_core5 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm3c6cm8c16_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_cm1c6c0c6_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_cm18cm7c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c1cm3c1c0_signal : std_logic_vector(10-1 downto 0); --	sfix(3, -7)
    signal  x_cm3c15cm2cm21_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c4c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_cm4c1c1c23_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c5cm12cm16c3_signal : std_logic_vector(12-1 downto 0); --	sfix(5, -7)
    signal  x_c2c0c14c1_signal : std_logic_vector(12-1 downto 0); --	sfix(5, -7)
    signal  x_cm6c1c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_c2c0c0c2_signal : std_logic_vector(10-1 downto 0); --	sfix(3, -7)
    signal  x_c2c0c0cm14_signal : std_logic_vector(12-1 downto 0); --	sfix(5, -7)
    signal  x_cm6cm5c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_c5c20cm3cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_cm4c1c2c97_signal : std_logic_vector(15-1 downto 0); --	sfix(8, -7)
    signal  x_c4c0c0cm4_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_c0c0c0c0_signal : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(4-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv3_core5_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm3c6cm8c16 => x_cm3c6cm8c16_signal, 
                R_cm1c6c0c6 => x_cm1c6c0c6_signal, 
                R_cm18cm7c0c0 => x_cm18cm7c0c0_signal, 
                R_c1cm3c1c0 => x_c1cm3c1c0_signal, 
                R_cm3c15cm2cm21 => x_cm3c15cm2cm21_signal, 
                R_c4c0c0c0 => x_c4c0c0c0_signal, 
                R_cm4c1c1c23 => x_cm4c1c1c23_signal, 
                R_c5cm12cm16c3 => x_c5cm12cm16c3_signal, 
                R_c2c0c14c1 => x_c2c0c14c1_signal, 
                R_cm6c1c0c0 => x_cm6c1c0c0_signal, 
                R_c2c0c0c2 => x_c2c0c0c2_signal, 
                R_c2c0c0cm14 => x_c2c0c0cm14_signal, 
                R_cm6cm5c0c0 => x_cm6cm5c0c0_signal, 
                R_c5c20cm3cm8 => x_c5c20cm3cm8_signal, 
                R_cm4c1c2c97 => x_cm4c1c2c97_signal, 
                R_c4c0c0cm4 => x_c4c0c0cm4_signal, 
                R_c0c0c0c0 => x_c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm3c6cm8c16_signal;
    yo_2 <= x_cm1c6c0c6_signal;
    yo_3 <= x_cm18cm7c0c0_signal;
    yo_4 <= x_c1cm3c1c0_signal;
    yo_5 <= x_cm3c15cm2cm21_signal;
    yo_6 <= x_c4c0c0c0_signal;
    yo_7 <= x_cm4c1c1c23_signal;
    yo_8 <= x_c5cm12cm16c3_signal;
    yo_9 <= x_c2c0c14c1_signal;
    yo_10 <= x_cm6c1c0c0_signal;
    yo_11 <= x_c2c0c0c2_signal;
    yo_12 <= x_c2c0c0cm14_signal;
    yo_13 <= x_cm6cm5c0c0_signal;
    yo_14 <= x_c5c20cm3cm8_signal;
    yo_15 <= x_cm4c1c2c97_signal;
    yo_16 <= x_c4c0c0cm4_signal;



end structural;