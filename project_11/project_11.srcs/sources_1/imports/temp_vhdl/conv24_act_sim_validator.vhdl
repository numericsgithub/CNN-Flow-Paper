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

entity conv24_act_sim_validator is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
        layer_xi_1 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_2 : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        x_is_valid    : in std_logic;
        layer_yo_1 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_yo_2 : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        y_valid    : in std_logic

    ) ;
end conv24_act_sim_validator;

architecture Behavioral of conv24_act_sim_validator is



begin

validation_process: if IS_IN_SIMULATION generate

    validate_outputs: process(clk, reset)

        file tf_outputs_file : text open read_mode is PROJ_SIMULATION_ROOT_PATH &  "conv24_act_tf_outputs.csv";
        
        file valid_only_output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv24_act_sim_only_valid_outputs.csv";
        file since_first_valid_input_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv24_act_sim_inputs_since_first_valid_input.csv";
        file error_only_output_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv24_act_sim_only_valid_outputs.csv.error";
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
        variable tf_layer_yo_1 : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        variable tf_layer_yo_2 : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
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
                file_open(tf_outputs_file, PROJ_SIMULATION_ROOT_PATH &  "conv24_act_tf_outputs.csv", read_mode);
                just_once := 1;
                report "OUTPUT VALIDATION IS ACTIVE FOR conv24_act." severity note;
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
                writeline(since_first_valid_input_file, line_out);
            end if;

            if y_valid = '1' then
                valid_output_counter := valid_output_counter + 1;
                if valid_output_counter = total_lines and got_last_valid_output = 0 then
                    report "GOT LAST VALID OUTPUT FOR conv24_act." severity note;
                    got_last_valid_output := 1;
                end if;
                if just_once_first_rep = 0 then
                    report "GOT FIRST VALID OUTPUT FOR conv24_act." severity note;
                    just_once_first_rep := 1;
                end if;

                -- Write ONLY valid layer output features into csv
                if not endfile(tf_outputs_file) then
                    readline(tf_outputs_file, tf_line_buf);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_1 := conv_std_logic_vector(tf_output, tf_layer_yo_1'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_2 := conv_std_logic_vector(tf_output, tf_layer_yo_2'length);write(line_out, integer'image(to_integer(unsigned(layer_yo_1))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_2))));
                    write(line_out, string'(" "));
                    writeline(valid_only_output_num_file, line_out);

                    if layer_yo_1 /=  tf_layer_yo_1 or  layer_yo_2 /=  tf_layer_yo_2  then
                      write(line_out, integer'image(to_integer(unsigned(layer_yo_1))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_2))));
                        write(line_out, string'(" "));
                        writeline(error_only_output_file, line_out);

                        if error_write_out_count < 10 then
                            error_write_out_count := error_write_out_count + 1;
                            report "VALID OUTPUT MISMATCH (" & integer'image(valid_output_counter) & "/" & integer'image(total_lines) & ") roughly when reading the " & integer'image(valid_input_counter) & " input and at " & integer'image(input_counter) & " cycles since the first valid input FOR LAYER conv24_act " &integer'image(to_integer(unsigned(layer_yo_1))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_1))) & " " & integer'image(to_integer(unsigned(layer_yo_2))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_2))) & " "
                                severity ERROR;
                        elsif error_write_out_count = 10 then
                            error_write_out_count := error_write_out_count + 1;
                            report "VALID OUTPUT MISMATCH FOR LAYER conv24_act too many. Stopping to report further errors!" severity ERROR;
                        end if;
                    end if;
                else
                    if just_once_over_rep = 0 then
                        report "GOT MORE VALID OUTPUTS THAN EXPECTED! conv24_act!!" severity ERROR;
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