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

entity examplemodel_sim is
    GENERIC
    (
        XI_WIDTH        	          : natural := 8
    );
end examplemodel_sim;

architecture Behavioral of examplemodel_sim is
    -- Constants declaration
    constant CLK_PERIOD : time := 10 ns;

    -- Clock and reset signal
    signal clk_tb : std_logic := '0';
    signal reset_tb : std_logic := '0';

    -- model input data signals

    signal model_xi_1_tb : std_logic_vector((8-1) downto 0);
    signal model_xi_1_tb_sync : std_logic_vector((8-1) downto 0);
    signal model_xi_2_tb : std_logic_vector((8-1) downto 0);
    signal model_xi_2_tb_sync : std_logic_vector((8-1) downto 0);
    signal model_xi_3_tb : std_logic_vector((8-1) downto 0);
    signal model_xi_3_tb_sync : std_logic_vector((8-1) downto 0);

    -- Control signals
    signal model_y_valid_tb : std_logic;
    signal model_x_is_valid_tb : std_logic;
    signal model_x_is_valid_tb_sync : std_logic;
    --signal input_hold_counter_tb    : std_logic_vector(bits(CLOCK_CYCLES_PER_STEP-1)-1 downto 0);

    -- model output data signals


    signal model_yo_1_tb : std_logic_vector((30-1) downto 0);
    signal model_yo_2_tb : std_logic_vector((30-1) downto 0);
    signal model_yo_3_tb : std_logic_vector((30-1) downto 0);
    signal model_yo_4_tb : std_logic_vector((30-1) downto 0);
    signal model_yo_5_tb : std_logic_vector((30-1) downto 0);
    signal model_yo_6_tb : std_logic_vector((30-1) downto 0);
    signal model_yo_7_tb : std_logic_vector((30-1) downto 0);
    signal model_yo_8_tb : std_logic_vector((30-1) downto 0);

begin
    -- Component instantiation
    dut : entity work.examplemodel_for_simulation
        port map (
            clk =>   clk_tb,
            reset => reset_tb,
            --xi => xi_tb,
        
            model_xi_1 => model_xi_1_tb_sync,
            model_xi_2 => model_xi_2_tb_sync,
            model_xi_3 => model_xi_3_tb_sync,
            --input_hold_counter   => input_hold_counter_tb,
            model_x_is_valid   => model_x_is_valid_tb_sync,

            model_y_valid      => model_y_valid_tb,
        
            model_yo_1 => model_yo_1_tb , 
            model_yo_2 => model_yo_2_tb , 
            model_yo_3 => model_yo_3_tb , 
            model_yo_4 => model_yo_4_tb , 
            model_yo_5 => model_yo_5_tb , 
            model_yo_6 => model_yo_6_tb , 
            model_yo_7 => model_yo_7_tb , 
            model_yo_8 => model_yo_8_tb 
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
        
            model_xi_1_tb_sync <= model_xi_1_tb;
            model_xi_2_tb_sync <= model_xi_2_tb;
            model_xi_3_tb_sync <= model_xi_3_tb;
            model_x_is_valid_tb_sync <= model_x_is_valid_tb;
        
        end if;
    end process;

    -- Stimulus process
    stimulus_process: process
        file input_file      : text open read_mode is PROJ_SIMULATION_ROOT_PATH &  "examplemodel_sim_inputs.csv";
        
        file output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "examplemodel_sim_outputs.csv";
        file valid_only_output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "examplemodel_sim_only_valid_outputs.csv";
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
        file_open(input_file, PROJ_SIMULATION_ROOT_PATH &  "examplemodel_sim_inputs.csv", read_mode);

        wait for CLK_PERIOD / 2;

        -- Reset everything and set an initial input for a proper reset
    
        model_xi_1_tb <= (others => '0');
        model_xi_2_tb <= (others => '0');
        model_xi_3_tb <= (others => '0');

        -- Start the reset and let it run for a few clock cycles
        model_x_is_valid_tb <= '0';
        reset_tb <= '1';  -- Assert reset
        wait for 150 * CLK_PERIOD;
        reset_tb <= '0';  -- De-assert reset
        wait for CLK_PERIOD;

        -- Input one row after the other in the input_file. One row per clock cycle
        while not endfile(input_file) loop
            readline(input_file, line_buf);

            -- Read and set x_is_valid
            read(line_buf, input_valid);
            model_x_is_valid_tb <= input_valid;

            -- Read and set model input features
        
            read(line_buf, input_x);
            model_xi_1_tb <= conv_std_logic_vector(input_x, model_xi_1_tb'length);
            read(line_buf, input_x);
            model_xi_2_tb <= conv_std_logic_vector(input_x, model_xi_2_tb'length);
            read(line_buf, input_x);
            model_xi_3_tb <= conv_std_logic_vector(input_x, model_xi_3_tb'length);

            wait for clk_period;

            -- Write out progress into tcl console (stdout)
            line_count := line_count + 1;
            if (line_count mod 5000 = 0) then
                report "INFO: " & integer'image(line_count) & "/" & integer'image(total_lines) severity note;
            end if;

            -- Write y_valid into csv
            write(line_out, model_y_valid_tb);
            write(line_out, string'(" "));

            -- Write all model output features into csv
            write(line_out, integer'image(to_integer(signed(model_yo_1_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(model_yo_2_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(model_yo_3_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(model_yo_4_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(model_yo_5_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(model_yo_6_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(model_yo_7_tb))));
            write(line_out, string'(" "));
            write(line_out, integer'image(to_integer(signed(model_yo_8_tb))));
            write(line_out, string'(" "));
            writeline(output_num_file, line_out);

            -- Write ONLY valid model output features into csv
            if model_y_valid_tb = '1' then
            
                write(line_out, integer'image(to_integer(signed(model_yo_1_tb))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(model_yo_2_tb))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(model_yo_3_tb))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(model_yo_4_tb))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(model_yo_5_tb))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(model_yo_6_tb))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(model_yo_7_tb))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(model_yo_8_tb))));
                write(line_out, string'(" "));
                writeline(valid_only_output_num_file, line_out);
            end if;
        end loop;

        finish;
    end process;

end Behavioral;