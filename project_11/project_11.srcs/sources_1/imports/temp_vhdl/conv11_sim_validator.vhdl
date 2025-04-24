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

entity conv11_sim_validator is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
        layer_xi_1 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_2 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_3 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_4 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_5 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_6 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_7 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_8 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_9 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_10 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_11 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_12 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_13 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_14 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_15 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_16 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        x_is_valid    : in std_logic;
        layer_yo_1 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_2 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_3 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_4 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_5 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_6 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_7 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_8 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_9 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_10 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_11 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_12 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_13 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_14 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_15 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_16 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_17 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_18 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_19 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_20 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_21 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_22 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_23 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_24 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_25 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_26 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_27 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_28 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_29 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_30 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_31 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_32 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_33 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_34 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_35 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_36 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_37 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_38 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_39 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_40 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_41 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_42 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_43 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_44 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_45 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_46 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_47 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_48 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_49 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_50 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_51 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_52 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_53 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_54 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_55 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_56 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_57 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_58 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_59 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_60 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_61 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_62 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_63 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_yo_64 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        y_valid    : in std_logic

    ) ;
end conv11_sim_validator;

architecture Behavioral of conv11_sim_validator is



begin

validation_process: if IS_IN_SIMULATION generate

    validate_outputs: process(clk, reset)

        file tf_outputs_file : text open read_mode is PROJ_SIMULATION_ROOT_PATH &  "conv11_tf_outputs.csv";
        
        file valid_only_output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv11_sim_only_valid_outputs.csv";
        file since_first_valid_input_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv11_sim_inputs_since_first_valid_input.csv";
        file error_only_output_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv11_sim_only_valid_outputs.csv.error";
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
        variable tf_layer_yo_1 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_2 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_3 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_4 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_5 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_6 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_7 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_8 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_9 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_10 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_11 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_12 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_13 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_14 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_15 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_16 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_17 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_18 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_19 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_20 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_21 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_22 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_23 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_24 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_25 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_26 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_27 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_28 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_29 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_30 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_31 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_32 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_33 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_34 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_35 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_36 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_37 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_38 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_39 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_40 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_41 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_42 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_43 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_44 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_45 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_46 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_47 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_48 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_49 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_50 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_51 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_52 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_53 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_54 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_55 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_56 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_57 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_58 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_59 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_60 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_61 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_62 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_63 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        variable tf_layer_yo_64 : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
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
                file_open(tf_outputs_file, PROJ_SIMULATION_ROOT_PATH &  "conv11_tf_outputs.csv", read_mode);
                just_once := 1;
                report "OUTPUT VALIDATION IS ACTIVE FOR conv11." severity note;
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
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_1))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_2))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_3))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_4))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_5))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_6))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_7))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_8))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_9))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_10))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_11))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_12))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_13))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_14))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_15))));
                write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_xi_16))));
                write(line_out, string'(" "));
                writeline(since_first_valid_input_file, line_out);
            end if;

            if y_valid = '1' then
                valid_output_counter := valid_output_counter + 1;
                if valid_output_counter = total_lines and got_last_valid_output = 0 then
                    report "GOT LAST VALID OUTPUT FOR conv11." severity note;
                    got_last_valid_output := 1;
                end if;
                if just_once_first_rep = 0 then
                    report "GOT FIRST VALID OUTPUT FOR conv11." severity note;
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
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_33 := conv_std_logic_vector(tf_output, tf_layer_yo_33'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_34 := conv_std_logic_vector(tf_output, tf_layer_yo_34'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_35 := conv_std_logic_vector(tf_output, tf_layer_yo_35'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_36 := conv_std_logic_vector(tf_output, tf_layer_yo_36'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_37 := conv_std_logic_vector(tf_output, tf_layer_yo_37'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_38 := conv_std_logic_vector(tf_output, tf_layer_yo_38'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_39 := conv_std_logic_vector(tf_output, tf_layer_yo_39'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_40 := conv_std_logic_vector(tf_output, tf_layer_yo_40'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_41 := conv_std_logic_vector(tf_output, tf_layer_yo_41'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_42 := conv_std_logic_vector(tf_output, tf_layer_yo_42'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_43 := conv_std_logic_vector(tf_output, tf_layer_yo_43'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_44 := conv_std_logic_vector(tf_output, tf_layer_yo_44'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_45 := conv_std_logic_vector(tf_output, tf_layer_yo_45'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_46 := conv_std_logic_vector(tf_output, tf_layer_yo_46'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_47 := conv_std_logic_vector(tf_output, tf_layer_yo_47'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_48 := conv_std_logic_vector(tf_output, tf_layer_yo_48'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_49 := conv_std_logic_vector(tf_output, tf_layer_yo_49'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_50 := conv_std_logic_vector(tf_output, tf_layer_yo_50'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_51 := conv_std_logic_vector(tf_output, tf_layer_yo_51'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_52 := conv_std_logic_vector(tf_output, tf_layer_yo_52'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_53 := conv_std_logic_vector(tf_output, tf_layer_yo_53'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_54 := conv_std_logic_vector(tf_output, tf_layer_yo_54'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_55 := conv_std_logic_vector(tf_output, tf_layer_yo_55'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_56 := conv_std_logic_vector(tf_output, tf_layer_yo_56'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_57 := conv_std_logic_vector(tf_output, tf_layer_yo_57'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_58 := conv_std_logic_vector(tf_output, tf_layer_yo_58'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_59 := conv_std_logic_vector(tf_output, tf_layer_yo_59'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_60 := conv_std_logic_vector(tf_output, tf_layer_yo_60'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_61 := conv_std_logic_vector(tf_output, tf_layer_yo_61'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_62 := conv_std_logic_vector(tf_output, tf_layer_yo_62'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_63 := conv_std_logic_vector(tf_output, tf_layer_yo_63'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_64 := conv_std_logic_vector(tf_output, tf_layer_yo_64'length);
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
                    write(line_out, integer'image(to_integer(signed(layer_yo_33))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_34))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_35))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_36))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_37))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_38))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_39))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_40))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_41))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_42))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_43))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_44))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_45))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_46))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_47))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_48))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_49))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_50))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_51))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_52))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_53))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_54))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_55))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_56))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_57))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_58))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_59))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_60))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_61))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_62))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_63))));
                    write(line_out, string'(" "));
                    write(line_out, integer'image(to_integer(signed(layer_yo_64))));
                    write(line_out, string'(" "));
                    writeline(valid_only_output_num_file, line_out);

                    if layer_yo_1 /=  tf_layer_yo_1 or  layer_yo_2 /=  tf_layer_yo_2 or  layer_yo_3 /=  tf_layer_yo_3 or  layer_yo_4 /=  tf_layer_yo_4 or  layer_yo_5 /=  tf_layer_yo_5 or  layer_yo_6 /=  tf_layer_yo_6 or  layer_yo_7 /=  tf_layer_yo_7 or  layer_yo_8 /=  tf_layer_yo_8 or  layer_yo_9 /=  tf_layer_yo_9 or  layer_yo_10 /=  tf_layer_yo_10 or  layer_yo_11 /=  tf_layer_yo_11 or  layer_yo_12 /=  tf_layer_yo_12 or  layer_yo_13 /=  tf_layer_yo_13 or  layer_yo_14 /=  tf_layer_yo_14 or  layer_yo_15 /=  tf_layer_yo_15 or  layer_yo_16 /=  tf_layer_yo_16 or  layer_yo_17 /=  tf_layer_yo_17 or  layer_yo_18 /=  tf_layer_yo_18 or  layer_yo_19 /=  tf_layer_yo_19 or  layer_yo_20 /=  tf_layer_yo_20 or  layer_yo_21 /=  tf_layer_yo_21 or  layer_yo_22 /=  tf_layer_yo_22 or  layer_yo_23 /=  tf_layer_yo_23 or  layer_yo_24 /=  tf_layer_yo_24 or  layer_yo_25 /=  tf_layer_yo_25 or  layer_yo_26 /=  tf_layer_yo_26 or  layer_yo_27 /=  tf_layer_yo_27 or  layer_yo_28 /=  tf_layer_yo_28 or  layer_yo_29 /=  tf_layer_yo_29 or  layer_yo_30 /=  tf_layer_yo_30 or  layer_yo_31 /=  tf_layer_yo_31 or  layer_yo_32 /=  tf_layer_yo_32 or  layer_yo_33 /=  tf_layer_yo_33 or  layer_yo_34 /=  tf_layer_yo_34 or  layer_yo_35 /=  tf_layer_yo_35 or  layer_yo_36 /=  tf_layer_yo_36 or  layer_yo_37 /=  tf_layer_yo_37 or  layer_yo_38 /=  tf_layer_yo_38 or  layer_yo_39 /=  tf_layer_yo_39 or  layer_yo_40 /=  tf_layer_yo_40 or  layer_yo_41 /=  tf_layer_yo_41 or  layer_yo_42 /=  tf_layer_yo_42 or  layer_yo_43 /=  tf_layer_yo_43 or  layer_yo_44 /=  tf_layer_yo_44 or  layer_yo_45 /=  tf_layer_yo_45 or  layer_yo_46 /=  tf_layer_yo_46 or  layer_yo_47 /=  tf_layer_yo_47 or  layer_yo_48 /=  tf_layer_yo_48 or  layer_yo_49 /=  tf_layer_yo_49 or  layer_yo_50 /=  tf_layer_yo_50 or  layer_yo_51 /=  tf_layer_yo_51 or  layer_yo_52 /=  tf_layer_yo_52 or  layer_yo_53 /=  tf_layer_yo_53 or  layer_yo_54 /=  tf_layer_yo_54 or  layer_yo_55 /=  tf_layer_yo_55 or  layer_yo_56 /=  tf_layer_yo_56 or  layer_yo_57 /=  tf_layer_yo_57 or  layer_yo_58 /=  tf_layer_yo_58 or  layer_yo_59 /=  tf_layer_yo_59 or  layer_yo_60 /=  tf_layer_yo_60 or  layer_yo_61 /=  tf_layer_yo_61 or  layer_yo_62 /=  tf_layer_yo_62 or  layer_yo_63 /=  tf_layer_yo_63 or  layer_yo_64 /=  tf_layer_yo_64  then
                      
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
                        write(line_out, integer'image(to_integer(signed(layer_yo_33))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_34))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_35))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_36))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_37))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_38))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_39))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_40))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_41))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_42))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_43))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_44))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_45))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_46))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_47))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_48))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_49))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_50))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_51))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_52))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_53))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_54))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_55))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_56))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_57))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_58))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_59))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_60))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_61))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_62))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_63))));
                        write(line_out, string'(" "));
                        write(line_out, integer'image(to_integer(signed(layer_yo_64))));
                        write(line_out, string'(" "));
                        writeline(error_only_output_file, line_out);

                        if error_write_out_count < 10 then
                            error_write_out_count := error_write_out_count + 1;
                            report "VALID OUTPUT MISMATCH (" & integer'image(valid_output_counter) & "/" & integer'image(total_lines) & ") roughly when reading the " & integer'image(valid_input_counter) & " input and at " & integer'image(input_counter) & " cycles since the first valid input FOR LAYER conv11 " &integer'image(to_integer(signed(layer_yo_1))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_1))) & " " & integer'image(to_integer(signed(layer_yo_2))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_2))) & " " & integer'image(to_integer(signed(layer_yo_3))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_3))) & " " & integer'image(to_integer(signed(layer_yo_4))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_4))) & " " & integer'image(to_integer(signed(layer_yo_5))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_5))) & " " & integer'image(to_integer(signed(layer_yo_6))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_6))) & " " & integer'image(to_integer(signed(layer_yo_7))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_7))) & " " & integer'image(to_integer(signed(layer_yo_8))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_8))) & " " & integer'image(to_integer(signed(layer_yo_9))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_9))) & " " & integer'image(to_integer(signed(layer_yo_10))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_10))) & " " & integer'image(to_integer(signed(layer_yo_11))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_11))) & " " & integer'image(to_integer(signed(layer_yo_12))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_12))) & " " & integer'image(to_integer(signed(layer_yo_13))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_13))) & " " & integer'image(to_integer(signed(layer_yo_14))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_14))) & " " & integer'image(to_integer(signed(layer_yo_15))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_15))) & " " & integer'image(to_integer(signed(layer_yo_16))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_16))) & " " & integer'image(to_integer(signed(layer_yo_17))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_17))) & " " & integer'image(to_integer(signed(layer_yo_18))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_18))) & " " & integer'image(to_integer(signed(layer_yo_19))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_19))) & " " & integer'image(to_integer(signed(layer_yo_20))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_20))) & " " & integer'image(to_integer(signed(layer_yo_21))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_21))) & " " & integer'image(to_integer(signed(layer_yo_22))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_22))) & " " & integer'image(to_integer(signed(layer_yo_23))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_23))) & " " & integer'image(to_integer(signed(layer_yo_24))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_24))) & " " & integer'image(to_integer(signed(layer_yo_25))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_25))) & " " & integer'image(to_integer(signed(layer_yo_26))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_26))) & " " & integer'image(to_integer(signed(layer_yo_27))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_27))) & " " & integer'image(to_integer(signed(layer_yo_28))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_28))) & " " & integer'image(to_integer(signed(layer_yo_29))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_29))) & " " & integer'image(to_integer(signed(layer_yo_30))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_30))) & " " & integer'image(to_integer(signed(layer_yo_31))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_31))) & " " & integer'image(to_integer(signed(layer_yo_32))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_32))) & " " & integer'image(to_integer(signed(layer_yo_33))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_33))) & " " & integer'image(to_integer(signed(layer_yo_34))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_34))) & " " & integer'image(to_integer(signed(layer_yo_35))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_35))) & " " & integer'image(to_integer(signed(layer_yo_36))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_36))) & " " & integer'image(to_integer(signed(layer_yo_37))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_37))) & " " & integer'image(to_integer(signed(layer_yo_38))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_38))) & " " & integer'image(to_integer(signed(layer_yo_39))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_39))) & " " & integer'image(to_integer(signed(layer_yo_40))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_40))) & " " & integer'image(to_integer(signed(layer_yo_41))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_41))) & " " & integer'image(to_integer(signed(layer_yo_42))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_42))) & " " & integer'image(to_integer(signed(layer_yo_43))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_43))) & " " & integer'image(to_integer(signed(layer_yo_44))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_44))) & " " & integer'image(to_integer(signed(layer_yo_45))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_45))) & " " & integer'image(to_integer(signed(layer_yo_46))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_46))) & " " & integer'image(to_integer(signed(layer_yo_47))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_47))) & " " & integer'image(to_integer(signed(layer_yo_48))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_48))) & " " & integer'image(to_integer(signed(layer_yo_49))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_49))) & " " & integer'image(to_integer(signed(layer_yo_50))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_50))) & " " & integer'image(to_integer(signed(layer_yo_51))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_51))) & " " & integer'image(to_integer(signed(layer_yo_52))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_52))) & " " & integer'image(to_integer(signed(layer_yo_53))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_53))) & " " & integer'image(to_integer(signed(layer_yo_54))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_54))) & " " & integer'image(to_integer(signed(layer_yo_55))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_55))) & " " & integer'image(to_integer(signed(layer_yo_56))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_56))) & " " & integer'image(to_integer(signed(layer_yo_57))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_57))) & " " & integer'image(to_integer(signed(layer_yo_58))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_58))) & " " & integer'image(to_integer(signed(layer_yo_59))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_59))) & " " & integer'image(to_integer(signed(layer_yo_60))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_60))) & " " & integer'image(to_integer(signed(layer_yo_61))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_61))) & " " & integer'image(to_integer(signed(layer_yo_62))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_62))) & " " & integer'image(to_integer(signed(layer_yo_63))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_63))) & " " & integer'image(to_integer(signed(layer_yo_64))) & "!=" & integer'image(to_integer(signed(tf_layer_yo_64))) & " "
                                severity ERROR;
                        elsif error_write_out_count = 10 then
                            error_write_out_count := error_write_out_count + 1;
                            report "VALID OUTPUT MISMATCH FOR LAYER conv11 too many. Stopping to report further errors!" severity ERROR;
                        end if;
                    end if;
                else
                    if just_once_over_rep = 0 then
                        report "GOT MORE VALID OUTPUTS THAN EXPECTED! conv11!!" severity ERROR;
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