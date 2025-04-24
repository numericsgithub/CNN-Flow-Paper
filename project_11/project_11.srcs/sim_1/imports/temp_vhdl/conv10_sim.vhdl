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

entity conv10_sim is
    GENERIC
    (
        XI_WIDTH        	          : natural := 7
    );
end conv10_sim;

architecture Behavioral of conv10_sim is
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

    -- Control signals
    signal layer_y_valid_tb : std_logic;
    signal layer_x_is_valid_tb : std_logic;
    signal layer_x_is_valid_tb_sync : std_logic;
    --signal input_hold_counter_tb    : std_logic_vector(bits(CLOCK_CYCLES_PER_STEP-1)-1 downto 0);

    -- layer input data signals

    signal layer_input_sel_or_hold_tb      : std_logic_vector((6-1) downto 0);
    signal layer_input_sel_or_hold_tb_sync : std_logic_vector((6-1) downto 0);


    -- layer output data signals

    signal layer_yo_1_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_2_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_3_tb : std_logic_vector((8-1) downto 0);
    signal layer_yo_4_tb : std_logic_vector((8-1) downto 0);

begin
    -- Component instantiation
    dut : entity work.conv10
        port map (
            clk_tb,
            reset_tb,
        
            layer_xi_1_tb_sync,
            layer_xi_2_tb_sync,
            layer_xi_3_tb_sync,
            layer_xi_4_tb_sync,
            layer_x_is_valid_tb_sync,
        
            layer_input_sel_or_hold_tb_sync,
        

            layer_y_valid_tb,
            layer_yo_1_tb , 
            layer_yo_2_tb , 
            layer_yo_3_tb , 
            layer_yo_4_tb 
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
            layer_x_is_valid_tb_sync <= layer_x_is_valid_tb;
            layer_input_sel_or_hold_tb_sync <= layer_input_sel_or_hold_tb;
        end if;
    end process;

    -- Stimulus process
    stimulus_process: process
        file input_file      : text open read_mode is PROJ_SIMULATION_ROOT_PATH &  "conv10_sim_inputs.csv";
        
        file output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv10_sim_outputs.csv";
        file valid_only_output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv10_sim_only_valid_outputs.csv";
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
        file_open(input_file, PROJ_SIMULATION_ROOT_PATH &  "conv10_sim_inputs.csv", read_mode);

        wait for CLK_PERIOD / 2;

        -- Reset everything and set an initial input for a proper reset
    
        layer_xi_1_tb <= (others => '0');
        layer_xi_2_tb <= (others => '0');
        layer_xi_3_tb <= (others => '0');
        layer_xi_4_tb <= (others => '0');

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
            writeline(output_num_file, line_out);














        end loop;

        finish;
    end process;

end Behavioral;