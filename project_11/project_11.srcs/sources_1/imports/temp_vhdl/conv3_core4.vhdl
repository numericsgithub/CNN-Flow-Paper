LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core4 is
    generic
    (
        PIPELINE_STEPS             : natural := 0
    );
    port
    (
        clk   : in std_logic;
        rst   : in std_logic;

        xi    : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        sel_config: in    std_logic_vector(bits(4-1)-1 downto 0);
    
        yo_1  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_2  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_3  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_4  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_5  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_6  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_7  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_8  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_9  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_10  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_11  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_12  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_13  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_14  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_15  : out std_logic_vector(8-1 downto 0);  --	sfix(1, -7)
        yo_16  : out std_logic_vector(8-1 downto 0) --	sfix(1, -7)
    );
end conv3_core4;

architecture structural of conv3_core4 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c0c0c0c0_signal : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(4-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv3_core4_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c0c0c0c0 => x_c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c0c0c0c0_signal;
    yo_2 <= x_c0c0c0c0_signal;
    yo_3 <= x_c0c0c0c0_signal;
    yo_4 <= x_c0c0c0c0_signal;
    yo_5 <= x_c0c0c0c0_signal;
    yo_6 <= x_c0c0c0c0_signal;
    yo_7 <= x_c0c0c0c0_signal;
    yo_8 <= x_c0c0c0c0_signal;
    yo_9 <= x_c0c0c0c0_signal;
    yo_10 <= x_c0c0c0c0_signal;
    yo_11 <= x_c0c0c0c0_signal;
    yo_12 <= x_c0c0c0c0_signal;
    yo_13 <= x_c0c0c0c0_signal;
    yo_14 <= x_c0c0c0c0_signal;
    yo_15 <= x_c0c0c0c0_signal;
    yo_16 <= x_c0c0c0c0_signal;



end structural;