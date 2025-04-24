LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core29 is
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
    
        yo_1  : out std_logic_vector(14-1 downto 0);  --	sfix(7, -7)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_4  : out std_logic_vector(9-1 downto 0);  --	sfix(2, -7)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(7, -7)
        yo_6  : out std_logic_vector(12-1 downto 0);  --	sfix(5, -7)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(7, -7)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_10  : out std_logic_vector(10-1 downto 0);  --	sfix(3, -7)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(5, -7)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(7, -7)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(6, -7)
        yo_16  : out std_logic_vector(11-1 downto 0) --	sfix(4, -7)
    );
end conv3_core29;

architecture structural of conv3_core29 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c5cm3c12c34_signal : std_logic_vector(14-1 downto 0); --	sfix(7, -7)
    signal  x_c5c1c16c3_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_cm19cm3c0cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c1c0c1c1_signal : std_logic_vector(9-1 downto 0); --	sfix(2, -7)
    signal  x_c5cm9c25cm37_signal : std_logic_vector(14-1 downto 0); --	sfix(7, -7)
    signal  x_cm10c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(5, -7)
    signal  x_c4c2c1cm25_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c8cm39cm3c5_signal : std_logic_vector(14-1 downto 0); --	sfix(7, -7)
    signal  x_cm17c0c12c5_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c2c1c0cm1_signal : std_logic_vector(10-1 downto 0); --	sfix(3, -7)
    signal  x_cm18cm13c0cm22_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c0c0c1cm16_signal : std_logic_vector(12-1 downto 0); --	sfix(5, -7)
    signal  x_c14cm47c0c0_signal : std_logic_vector(14-1 downto 0); --	sfix(7, -7)
    signal  x_c8cm14cm1c27_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c21cm8c3c2_signal : std_logic_vector(13-1 downto 0); --	sfix(6, -7)
    signal  x_c0c0c0cm8_signal : std_logic_vector(11-1 downto 0); --	sfix(4, -7)
    signal  x_c0c0c0c0_signal : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(4-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv3_core29_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c5cm3c12c34 => x_c5cm3c12c34_signal, 
                R_c5c1c16c3 => x_c5c1c16c3_signal, 
                R_cm19cm3c0cm6 => x_cm19cm3c0cm6_signal, 
                R_c1c0c1c1 => x_c1c0c1c1_signal, 
                R_c5cm9c25cm37 => x_c5cm9c25cm37_signal, 
                R_cm10c0c0c0 => x_cm10c0c0c0_signal, 
                R_c4c2c1cm25 => x_c4c2c1cm25_signal, 
                R_c8cm39cm3c5 => x_c8cm39cm3c5_signal, 
                R_cm17c0c12c5 => x_cm17c0c12c5_signal, 
                R_c2c1c0cm1 => x_c2c1c0cm1_signal, 
                R_cm18cm13c0cm22 => x_cm18cm13c0cm22_signal, 
                R_c0c0c1cm16 => x_c0c0c1cm16_signal, 
                R_c14cm47c0c0 => x_c14cm47c0c0_signal, 
                R_c8cm14cm1c27 => x_c8cm14cm1c27_signal, 
                R_c21cm8c3c2 => x_c21cm8c3c2_signal, 
                R_c0c0c0cm8 => x_c0c0c0cm8_signal, 
                R_c0c0c0c0 => x_c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c5cm3c12c34_signal;
    yo_2 <= x_c5c1c16c3_signal;
    yo_3 <= x_cm19cm3c0cm6_signal;
    yo_4 <= x_c1c0c1c1_signal;
    yo_5 <= x_c5cm9c25cm37_signal;
    yo_6 <= x_cm10c0c0c0_signal;
    yo_7 <= x_c4c2c1cm25_signal;
    yo_8 <= x_c8cm39cm3c5_signal;
    yo_9 <= x_cm17c0c12c5_signal;
    yo_10 <= x_c2c1c0cm1_signal;
    yo_11 <= x_cm18cm13c0cm22_signal;
    yo_12 <= x_c0c0c1cm16_signal;
    yo_13 <= x_c14cm47c0c0_signal;
    yo_14 <= x_c8cm14cm1c27_signal;
    yo_15 <= x_c21cm8c3c2_signal;
    yo_16 <= x_c0c0c0cm8_signal;



end structural;