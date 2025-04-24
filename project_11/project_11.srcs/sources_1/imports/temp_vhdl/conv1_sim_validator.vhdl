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

entity conv1_sim_validator is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
        layer_xi_1 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        layer_xi_2 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        layer_xi_3 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        x_is_valid    : in std_logic;
        layer_yo_1 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_2 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_3 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_4 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_5 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_6 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_7 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_8 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_9 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_10 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_11 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_12 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_13 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_14 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_15 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_16 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_17 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_18 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_19 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_20 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_21 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_22 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_23 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_24 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_25 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_26 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_27 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_28 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_29 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_30 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_31 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_yo_32 : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        y_valid    : in std_logic

    ) ;
end conv1_sim_validator;

architecture Behavioral of conv1_sim_validator is



begin

validation_process: if IS_IN_SIMULATION generate

    validate_outputs: process(clk, reset)

        file tf_outputs_file : text open read_mode is PROJ_SIMULATION_ROOT_PATH &  "conv1_tf_outputs.csv";
        
        file valid_only_output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv1_sim_only_valid_outputs.csv";
        file since_first_valid_input_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv1_sim_inputs_since_first_valid_input.csv";
        file error_only_output_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv1_sim_only_valid_outputs.csv.error";
        variable tf_line_buf    : line;
        variable input_x     : integer;
        variable tf_output     : integer;
        variable line_out    : line;
        variable line_count : integer := 0;
        variable error_write_out_count : integer := 0;
        variable total_lines : integer := 0;
        variable just_once : integer := 0;
        variable just_once_over_rep : integer := 0;
        variable just_once_first_rep : integer := 0;
        variable valid_output_counter : integer := 0;
        variable valid_input_counter : integer := 0;
        variable input_counter : integer := 0;
        variable cycle_counter : integer := 0;
        variable got_first_valid_input : integer := 0;
        variable got_last_valid_output : integer := 0;
        variable tf_layer_yo_1 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_2 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_3 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_4 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_5 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_6 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_7 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_8 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_9 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_10 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_11 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_12 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_13 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_14 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_15 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_16 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_17 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_18 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_19 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_20 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_21 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_22 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_23 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_24 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_25 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_26 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_27 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_28 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_29 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_30 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_31 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        variable tf_layer_yo_32 : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
    begin
        if reset = '1' then
            valid_output_counter := 0;
            cycle_counter := 0;
        elsif rising_edge(clk) then
            cycle_counter := cycle_counter + 1;

            -- Count total lines in file
            if just_once = 0 then
                while not endfile(tf_outputs_file) loop
                    readline(tf_outputs_file, tf_line_buf);
                    total_lines := total_lines + 1;
                end loop;
                file_close(tf_outputs_file);
                file_open(tf_outputs_file, PROJ_SIMULATION_ROOT_PATH &  "conv1_tf_outputs.csv", read_mode);
                just_once := 1;
                report "OUTPUT VALIDATION IS ACTIVE FOR conv1." severity note;
            end if;

            if x_is_valid = '1' then
                valid_input_counter := valid_input_counter + 1;
                if got_first_valid_input = 0 then
                    got_first_valid_input := 1;
                end if;
            end if;

            if got_first_valid_input = 1 and got_last_valid_output = 0 then
                input_counter := input_counter + 1;
                write(line_out, x_is_valid);
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_1))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_2))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_3))));
                write(line_out, string'(" "));
                writeline(since_first_valid_input_file, line_out);
            end if;

            if y_valid = '1' then
                valid_output_counter := valid_output_counter + 1;
                if valid_output_counter = total_lines and got_last_valid_output = 0 then
                    report "GOT LAST VALID OUTPUT FOR conv1." severity note;
                    got_last_valid_output := 1;
                end if;
                if just_once_first_rep = 0 then
                    report "GOT FIRST VALID OUTPUT FOR conv1." severity note;
                    just_once_first_rep := 1;
                end if;

                -- Write ONLY valid layer output features into csv
                if not endfile(tf_outputs_file) then
                    readline(tf_outputs_file, tf_line_buf);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_1 := conv_std_logic_vector(tf_output, tf_layer_yo_1'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_2 := conv_std_logic_vector(tf_output, tf_layer_yo_2'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_3 := conv_std_logic_vector(tf_output, tf_layer_yo_3'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_4 := conv_std_logic_vector(tf_output, tf_layer_yo_4'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_5 := conv_std_logic_vector(tf_output, tf_layer_yo_5'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_6 := conv_std_logic_vector(tf_output, tf_layer_yo_6'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_7 := conv_std_logic_vector(tf_output, tf_layer_yo_7'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_8 := conv_std_logic_vector(tf_output, tf_layer_yo_8'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_9 := conv_std_logic_vector(tf_output, tf_layer_yo_9'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_10 := conv_std_logic_vector(tf_output, tf_layer_yo_10'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_11 := conv_std_logic_vector(tf_output, tf_layer_yo_11'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_12 := conv_std_logic_vector(tf_output, tf_layer_yo_12'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_13 := conv_std_logic_vector(tf_output, tf_layer_yo_13'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_14 := conv_std_logic_vector(tf_output, tf_layer_yo_14'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_15 := conv_std_logic_vector(tf_output, tf_layer_yo_15'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_16 := conv_std_logic_vector(tf_output, tf_layer_yo_16'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_17 := conv_std_logic_vector(tf_output, tf_layer_yo_17'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_18 := conv_std_logic_vector(tf_output, tf_layer_yo_18'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_19 := conv_std_logic_vector(tf_output, tf_layer_yo_19'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_20 := conv_std_logic_vector(tf_output, tf_layer_yo_20'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_21 := conv_std_logic_vector(tf_output, tf_layer_yo_21'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_22 := conv_std_logic_vector(tf_output, tf_layer_yo_22'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_23 := conv_std_logic_vector(tf_output, tf_layer_yo_23'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_24 := conv_std_logic_vector(tf_output, tf_layer_yo_24'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_25 := conv_std_logic_vector(tf_output, tf_layer_yo_25'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_26 := conv_std_logic_vector(tf_output, tf_layer_yo_26'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_27 := conv_std_logic_vector(tf_output, tf_layer_yo_27'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_28 := conv_std_logic_vector(tf_output, tf_layer_yo_28'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_29 := conv_std_logic_vector(tf_output, tf_layer_yo_29'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_30 := conv_std_logic_vector(tf_output, tf_layer_yo_30'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_31 := conv_std_logic_vector(tf_output, tf_layer_yo_31'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_32 := conv_std_logic_vector(tf_output, tf_layer_yo_32'length);
                    write(line_out, integer'image(to_integer(signed(layer_yo_1))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_2))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_3))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_4))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_5))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_6))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_7))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_8))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_9))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_10))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_11))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_12))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_13))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_14))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_15))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_16))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_17))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_18))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_19))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_20))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_21))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_22))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_23))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_24))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_25))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_26))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_27))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_28))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_29))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_30))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_31))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_32))));
                    write(line_out, string'(" "));
                    writeline(valid_only_output_num_file, line_out);

                    if layer_yo_1 /=  tf_layer_yo_1 or  layer_yo_2 /=  tf_layer_yo_2 or  layer_yo_3 /=  tf_layer_yo_3 or  layer_yo_4 /=  tf_layer_yo_4 or  layer_yo_5 /=  tf_layer_yo_5 or  layer_yo_6 /=  tf_layer_yo_6 or  layer_yo_7 /=  tf_layer_yo_7 or  layer_yo_8 /=  tf_layer_yo_8 or  layer_yo_9 /=  tf_layer_yo_9 or  layer_yo_10 /=  tf_layer_yo_10 or  layer_yo_11 /=  tf_layer_yo_11 or  layer_yo_12 /=  tf_layer_yo_12 or  layer_yo_13 /=  tf_layer_yo_13 or  layer_yo_14 /=  tf_layer_yo_14 or  layer_yo_15 /=  tf_layer_yo_15 or  layer_yo_16 /=  tf_layer_yo_16 or  layer_yo_17 /=  tf_layer_yo_17 or  layer_yo_18 /=  tf_layer_yo_18 or  layer_yo_19 /=  tf_layer_yo_19 or  layer_yo_20 /=  tf_layer_yo_20 or  layer_yo_21 /=  tf_layer_yo_21 or  layer_yo_22 /=  tf_layer_yo_22 or  layer_yo_23 /=  tf_layer_yo_23 or  layer_yo_24 /=  tf_layer_yo_24 or  layer_yo_25 /=  tf_layer_yo_25 or  layer_yo_26 /=  tf_layer_yo_26 or  layer_yo_27 /=  tf_layer_yo_27 or  layer_yo_28 /=  tf_layer_yo_28 or  layer_yo_29 /=  tf_layer_yo_29 or  layer_yo_30 /=  tf_layer_yo_30 or  layer_yo_31 /=  tf_layer_yo_31 or  layer_yo_32 /=  tf_layer_yo_32  then
                      
                        write(line_out, integer'image(to_integer(signed(layer_yo_1))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_2))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_3))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_4))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_5))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_6))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_7))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_8))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_9))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_10))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_11))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_12))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_13))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_14))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_15))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_16))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_17))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_18))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_19))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_20))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_21))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_22))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_23))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_24))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_25))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_26))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_27))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_28))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_29))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_30))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_31))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_32))));
                        write(line_out, string'(" "));
                        writeline(error_only_output_file, line_out);

                        if error_write_out_count < 10 then
                            error_write_out_count := error_write_out_count + 1;
                            report "VALID OUTPUT MISMATCH (" & integer'image(valid_output_counter) & "/" & integer'image(total_lines) & ") roughly when reading the " & integer'image(valid_input_counter) & " input and at " & integer'image(input_counter) & " cycles since the first valid input FOR LAYER conv1 " &integer'image(to_integer(signed(layer_yo_1))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_1))) & " " & integer'image(to_integer(signed(layer_yo_2))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_2))) & " " & integer'image(to_integer(signed(layer_yo_3))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_3))) & " " & integer'image(to_integer(signed(layer_yo_4))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_4))) & " " & integer'image(to_integer(signed(layer_yo_5))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_5))) & " " & integer'image(to_integer(signed(layer_yo_6))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_6))) & " " & integer'image(to_integer(signed(layer_yo_7))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_7))) & " " & integer'image(to_integer(signed(layer_yo_8))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_8))) & " " & integer'image(to_integer(signed(layer_yo_9))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_9))) & " " & integer'image(to_integer(signed(layer_yo_10))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_10))) & " " & integer'image(to_integer(signed(layer_yo_11))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_11))) & " " & integer'image(to_integer(signed(layer_yo_12))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_12))) & " " & integer'image(to_integer(signed(layer_yo_13))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_13))) & " " & integer'image(to_integer(signed(layer_yo_14))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_14))) & " " & integer'image(to_integer(signed(layer_yo_15))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_15))) & " " & integer'image(to_integer(signed(layer_yo_16))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_16))) & " " & integer'image(to_integer(signed(layer_yo_17))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_17))) & " " & integer'image(to_integer(signed(layer_yo_18))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_18))) & " " & integer'image(to_integer(signed(layer_yo_19))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_19))) & " " & integer'image(to_integer(signed(layer_yo_20))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_20))) & " " & integer'image(to_integer(signed(layer_yo_21))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_21))) & " " & integer'image(to_integer(signed(layer_yo_22))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_22))) & " " & integer'image(to_integer(signed(layer_yo_23))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_23))) & " " & integer'image(to_integer(signed(layer_yo_24))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_24))) & " " & integer'image(to_integer(signed(layer_yo_25))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_25))) & " " & integer'image(to_integer(signed(layer_yo_26))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_26))) & " " & integer'image(to_integer(signed(layer_yo_27))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_27))) & " " & integer'image(to_integer(signed(layer_yo_28))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_28))) & " " & integer'image(to_integer(signed(layer_yo_29))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_29))) & " " & integer'image(to_integer(signed(layer_yo_30))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_30))) & " " & integer'image(to_integer(signed(layer_yo_31))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_31))) & " " & integer'image(to_integer(signed(layer_yo_32))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_32))) & " "
                                severity ERROR;
                        elsif error_write_out_count = 10 then
                            error_write_out_count := error_write_out_count + 1;
                            report "VALID OUTPUT MISMATCH FOR LAYER conv1 too many. Stopping to report further errors!" severity ERROR;
                        end if;
                    end if;
                else
                    if just_once_over_rep = 0 then
                        report "GOT MORE VALID OUTPUTS THAN EXPECTED! conv1!!" severity ERROR;
                        just_once_over_rep := 1;
                    end if;
                end if;
            end if;
        end if;

    end process;
end generate validation_process;
NON_validation_process: if IS_IN_SIMULATION = false generate
    validate_outputs: process(clk, reset)

    begin
        if reset = '1' then
            report "OUTPUT VALIDATION WAS DEACTIVATED!!" severity WARNING;
        elsif rising_edge(clk) then
        end if;

    end process;
end generate NON_validation_process;
end Behavioral;