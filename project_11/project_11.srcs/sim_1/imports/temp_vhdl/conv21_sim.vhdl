library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_arith.CONV_STD_LOGIC_VECTOR;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use std.env.finish;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

library work;
use work.simulation_settings.all;

entity conv21_sim is
    GENERIC
    (
        XI_WIDTH        	          : natural := 7
    );
end conv21_sim;

architecture Behavioral of conv21_sim is
    -- Constants declaration
    constant CLK_PERIOD : time := 10 ns;

    -- Clock and reset signal
    signal clk_tb : std_logic := '0';
    signal reset_tb : std_logic := '0';

    -- layer input data signals

    signal layer_xi_1_tb : std_logic_vector((7-1) downto 0);
    signal layer_xi_1_tb_sync : std_logic_vector((7-1) downto 0);
    signal layer_xi_2_tb : std_logic_vector((7-1) downto 0);
    signal layer_xi_2_tb_sync : std_logic_vector((7-1) downto 0);
    signal layer_xi_3_tb : std_logic_vector((7-1) downto 0);
    signal layer_xi_3_tb_sync : std_logic_vector((7-1) downto 0);
    signal layer_xi_4_tb : std_logic_vector((7-1) downto 0);
    signal layer_xi_4_tb_sync : std_logic_vector((7-1) downto 0);
    signal layer_xi_5_tb : std_logic_vector((7-1) downto 0);
    signal layer_xi_5_tb_sync : std_logic_vector((7-1) downto 0);
    signal layer_xi_6_tb : std_logic_vector((7-1) downto 0);
    signal layer_xi_6_tb_sync : std_logic_vector((7-1) downto 0);
    signal layer_xi_7_tb : std_logic_vector((7-1) downto 0);
    signal layer_xi_7_tb_sync : std_logic_vector((7-1) downto 0);
    signal layer_xi_8_tb : std_logic_vector((7-1) downto 0);
    signal layer_xi_8_tb_sync : std_logic_vector((7-1) downto 0);

    -- Control signals
    signal layer_y_valid_tb : std_logic;
    signal layer_x_is_valid_tb : std_logic;
    signal layer_x_is_valid_tb_sync : std_logic;
    --signal input_hold_counter_tb    : std_logic_vector(bits(CLOCK_CYCLES_PER_STEP-1)-1 downto 0);

    -- layer input data signals

    signal layer_input_sel_or_hold_tb      : std_logic_vector((2-1) downto 0);
    signal layer_input_sel_or_hold_tb_sync : std_logic_vector((2-1) downto 0);


    -- layer output data signals

    signal layer_yo_1_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_2_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_3_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_4_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_5_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_6_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_7_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_8_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_9_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_10_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_11_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_12_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_13_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_14_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_15_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_16_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_17_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_18_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_19_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_20_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_21_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_22_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_23_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_24_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_25_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_26_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_27_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_28_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_29_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_30_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_31_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_32_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_33_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_34_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_35_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_36_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_37_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_38_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_39_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_40_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_41_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_42_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_43_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_44_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_45_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_46_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_47_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_48_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_49_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_50_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_51_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_52_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_53_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_54_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_55_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_56_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_57_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_58_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_59_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_60_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_61_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_62_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_63_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_64_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_65_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_66_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_67_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_68_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_69_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_70_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_71_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_72_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_73_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_74_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_75_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_76_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_77_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_78_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_79_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_80_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_81_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_82_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_83_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_84_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_85_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_86_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_87_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_88_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_89_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_90_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_91_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_92_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_93_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_94_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_95_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_96_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_97_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_98_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_99_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_100_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_101_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_102_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_103_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_104_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_105_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_106_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_107_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_108_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_109_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_110_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_111_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_112_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_113_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_114_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_115_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_116_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_117_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_118_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_119_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_120_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_121_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_122_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_123_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_124_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_125_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_126_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_127_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_128_tb : std_logic_vector((8-1) downto 0);

begin
    -- Component instantiation
    dut : entity work.conv21
        port map (
            clk_tb,
            reset_tb,
        
            layer_xi_1_tb_sync,
            layer_xi_2_tb_sync,
            layer_xi_3_tb_sync,
            layer_xi_4_tb_sync,
            layer_xi_5_tb_sync,
            layer_xi_6_tb_sync,
            layer_xi_7_tb_sync,
            layer_xi_8_tb_sync,
            layer_x_is_valid_tb_sync,
        
            layer_input_sel_or_hold_tb_sync,
        

            layer_y_valid_tb,
            layer_yo_1_tb , 
            layer_yo_2_tb , 
            layer_yo_3_tb , 
            layer_yo_4_tb , 
            layer_yo_5_tb , 
            layer_yo_6_tb , 
            layer_yo_7_tb , 
            layer_yo_8_tb , 
            layer_yo_9_tb , 
            layer_yo_10_tb , 
            layer_yo_11_tb , 
            layer_yo_12_tb , 
            layer_yo_13_tb , 
            layer_yo_14_tb , 
            layer_yo_15_tb , 
            layer_yo_16_tb , 
            layer_yo_17_tb , 
            layer_yo_18_tb , 
            layer_yo_19_tb , 
            layer_yo_20_tb , 
            layer_yo_21_tb , 
            layer_yo_22_tb , 
            layer_yo_23_tb , 
            layer_yo_24_tb , 
            layer_yo_25_tb , 
            layer_yo_26_tb , 
            layer_yo_27_tb , 
            layer_yo_28_tb , 
            layer_yo_29_tb , 
            layer_yo_30_tb , 
            layer_yo_31_tb , 
            layer_yo_32_tb , 
            layer_yo_33_tb , 
            layer_yo_34_tb , 
            layer_yo_35_tb , 
            layer_yo_36_tb , 
            layer_yo_37_tb , 
            layer_yo_38_tb , 
            layer_yo_39_tb , 
            layer_yo_40_tb , 
            layer_yo_41_tb , 
            layer_yo_42_tb , 
            layer_yo_43_tb , 
            layer_yo_44_tb , 
            layer_yo_45_tb , 
            layer_yo_46_tb , 
            layer_yo_47_tb , 
            layer_yo_48_tb , 
            layer_yo_49_tb , 
            layer_yo_50_tb , 
            layer_yo_51_tb , 
            layer_yo_52_tb , 
            layer_yo_53_tb , 
            layer_yo_54_tb , 
            layer_yo_55_tb , 
            layer_yo_56_tb , 
            layer_yo_57_tb , 
            layer_yo_58_tb , 
            layer_yo_59_tb , 
            layer_yo_60_tb , 
            layer_yo_61_tb , 
            layer_yo_62_tb , 
            layer_yo_63_tb , 
            layer_yo_64_tb , 
            layer_yo_65_tb , 
            layer_yo_66_tb , 
            layer_yo_67_tb , 
            layer_yo_68_tb , 
            layer_yo_69_tb , 
            layer_yo_70_tb , 
            layer_yo_71_tb , 
            layer_yo_72_tb , 
            layer_yo_73_tb , 
            layer_yo_74_tb , 
            layer_yo_75_tb , 
            layer_yo_76_tb , 
            layer_yo_77_tb , 
            layer_yo_78_tb , 
            layer_yo_79_tb , 
            layer_yo_80_tb , 
            layer_yo_81_tb , 
            layer_yo_82_tb , 
            layer_yo_83_tb , 
            layer_yo_84_tb , 
            layer_yo_85_tb , 
            layer_yo_86_tb , 
            layer_yo_87_tb , 
            layer_yo_88_tb , 
            layer_yo_89_tb , 
            layer_yo_90_tb , 
            layer_yo_91_tb , 
            layer_yo_92_tb , 
            layer_yo_93_tb , 
            layer_yo_94_tb , 
            layer_yo_95_tb , 
            layer_yo_96_tb , 
            layer_yo_97_tb , 
            layer_yo_98_tb , 
            layer_yo_99_tb , 
            layer_yo_100_tb , 
            layer_yo_101_tb , 
            layer_yo_102_tb , 
            layer_yo_103_tb , 
            layer_yo_104_tb , 
            layer_yo_105_tb , 
            layer_yo_106_tb , 
            layer_yo_107_tb , 
            layer_yo_108_tb , 
            layer_yo_109_tb , 
            layer_yo_110_tb , 
            layer_yo_111_tb , 
            layer_yo_112_tb , 
            layer_yo_113_tb , 
            layer_yo_114_tb , 
            layer_yo_115_tb , 
            layer_yo_116_tb , 
            layer_yo_117_tb , 
            layer_yo_118_tb , 
            layer_yo_119_tb , 
            layer_yo_120_tb , 
            layer_yo_121_tb , 
            layer_yo_122_tb , 
            layer_yo_123_tb , 
            layer_yo_124_tb , 
            layer_yo_125_tb , 
            layer_yo_126_tb , 
            layer_yo_127_tb , 
            layer_yo_128_tb 
        );

    -- Clock process
    clk_process: process
    begin
        clk_tb <= '0';
        wait for CLK_PERIOD / 2;
        clk_tb <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- sync input data
    sync_inputs: process(clk_tb)
    begin
        if rising_edge(clk_tb) then
        
            layer_xi_1_tb_sync <= layer_xi_1_tb;
            layer_xi_2_tb_sync <= layer_xi_2_tb;
            layer_xi_3_tb_sync <= layer_xi_3_tb;
            layer_xi_4_tb_sync <= layer_xi_4_tb;
            layer_xi_5_tb_sync <= layer_xi_5_tb;
            layer_xi_6_tb_sync <= layer_xi_6_tb;
            layer_xi_7_tb_sync <= layer_xi_7_tb;
            layer_xi_8_tb_sync <= layer_xi_8_tb;
            layer_x_is_valid_tb_sync <= layer_x_is_valid_tb;
            layer_input_sel_or_hold_tb_sync <= layer_input_sel_or_hold_tb;
        end if;
    end process;

    -- Stimulus process
    stimulus_process: process
        file input_file      : text open read_mode is PROJ_SIMULATION_ROOT_PATH &  "conv21_sim_inputs.csv";
        
        file output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv21_sim_outputs.csv";
        file valid_only_output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv21_sim_only_valid_outputs.csv";
        variable line_buf    : line;
        variable input_x     : integer;
        variable input_valid : std_logic;
        variable line_out    : line;
        variable line_count : integer := 0;
        variable total_lines : integer := 0;
    begin
        -- Count total lines in file
        while not endfile(input_file) loop
            readline(input_file, line_buf);
            total_lines := total_lines + 1;
        end loop;
        file_close(input_file);
        file_open(input_file, PROJ_SIMULATION_ROOT_PATH &  "conv21_sim_inputs.csv", read_mode);

        wait for CLK_PERIOD / 2;

        -- Reset everything and set an initial input for a proper reset
    
        layer_xi_1_tb <= (others => '0');
        layer_xi_2_tb <= (others => '0');
        layer_xi_3_tb <= (others => '0');
        layer_xi_4_tb <= (others => '0');
        layer_xi_5_tb <= (others => '0');
        layer_xi_6_tb <= (others => '0');
        layer_xi_7_tb <= (others => '0');
        layer_xi_8_tb <= (others => '0');

        -- Start the reset and let it run for a few clock cycles
        layer_x_is_valid_tb <= '0';
        reset_tb <= '1';  -- Assert reset
        wait for 15 * CLK_PERIOD;
        reset_tb <= '0';  -- De-assert reset
        wait for CLK_PERIOD;

        -- Input one row after the other in the input_file. One row per clock cycle
        while not endfile(input_file) loop
            readline(input_file, line_buf);

            -- Read and set x_is_valid
            read(line_buf, input_valid);
            layer_x_is_valid_tb <= input_valid;


            -- Read the layer input hold/config select. If not used it will be ignored after reading it.
            read(line_buf, input_x);
            layer_input_sel_or_hold_tb <= conv_std_logic_vector(input_x, layer_input_sel_or_hold_tb'length);

            -- Read and set layer input features
        
            read(line_buf, input_x);
            layer_xi_1_tb <= conv_std_logic_vector(input_x, layer_xi_1_tb'length);
            read(line_buf, input_x);
            layer_xi_2_tb <= conv_std_logic_vector(input_x, layer_xi_2_tb'length);
            read(line_buf, input_x);
            layer_xi_3_tb <= conv_std_logic_vector(input_x, layer_xi_3_tb'length);
            read(line_buf, input_x);
            layer_xi_4_tb <= conv_std_logic_vector(input_x, layer_xi_4_tb'length);
            read(line_buf, input_x);
            layer_xi_5_tb <= conv_std_logic_vector(input_x, layer_xi_5_tb'length);
            read(line_buf, input_x);
            layer_xi_6_tb <= conv_std_logic_vector(input_x, layer_xi_6_tb'length);
            read(line_buf, input_x);
            layer_xi_7_tb <= conv_std_logic_vector(input_x, layer_xi_7_tb'length);
            read(line_buf, input_x);
            layer_xi_8_tb <= conv_std_logic_vector(input_x, layer_xi_8_tb'length);


            wait for clk_period;







            -- Write y_valid into csv
            write(line_out, layer_y_valid_tb);
            write(line_out, string'(" "));


            -- Write all layer output features into csv
            write(line_out, integer'image(to_integer(signed(layer_yo_1_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_2_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_3_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_4_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_5_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_6_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_7_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_8_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_9_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_10_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_11_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_12_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_13_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_14_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_15_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_16_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_17_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_18_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_19_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_20_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_21_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_22_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_23_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_24_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_25_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_26_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_27_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_28_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_29_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_30_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_31_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_32_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_33_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_34_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_35_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_36_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_37_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_38_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_39_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_40_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_41_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_42_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_43_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_44_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_45_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_46_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_47_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_48_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_49_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_50_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_51_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_52_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_53_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_54_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_55_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_56_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_57_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_58_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_59_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_60_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_61_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_62_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_63_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_64_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_65_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_66_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_67_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_68_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_69_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_70_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_71_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_72_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_73_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_74_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_75_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_76_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_77_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_78_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_79_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_80_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_81_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_82_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_83_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_84_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_85_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_86_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_87_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_88_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_89_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_90_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_91_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_92_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_93_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_94_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_95_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_96_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_97_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_98_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_99_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_100_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_101_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_102_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_103_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_104_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_105_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_106_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_107_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_108_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_109_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_110_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_111_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_112_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_113_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_114_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_115_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_116_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_117_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_118_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_119_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_120_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_121_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_122_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_123_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_124_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_125_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_126_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_127_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(layer_yo_128_tb))));
            write(line_out, string'(" "));
            writeline(output_num_file, line_out);














        end loop;

        finish;
    end process;

end Behavioral;