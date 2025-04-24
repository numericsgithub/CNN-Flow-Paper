LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
use work.ActivationFunctions.all;
use work.conv4_act_settings.all;

entity conv4_act is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_2    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_3    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_4    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_5    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_6    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_7    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_8    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_9    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_10    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_11    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_12    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_13    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_14    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_15    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        layer_xi_16    : in std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        x_is_valid    : in std_logic;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_2 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_3 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_4 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_5 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_6 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_7 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_8 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_9 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_10 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_11 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_12 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_13 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_14 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_15 : out std_logic_vector(7-1 downto 0);  --	ufix(5, -2)
        layer_yo_16 : out std_logic_vector(7-1 downto 0) --	ufix(5, -2)
    ) ;
end conv4_act;

architecture Behavioral of conv4_act is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv4_act : entity is "yes";

    type PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_5_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_6_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_7_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_8_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_9_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_10_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_11_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_12_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_13_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_14_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_15_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_16_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_X_IS_VALID_SIGNAL    is array(0 to 1) of std_logic;


    -- sfix(6, -2)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_2_signal    : PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_3_signal    : PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_4_signal    : PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_5_signal    : PIPELINE_TYPE_FOR_LAYER_XI_5_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_6_signal    : PIPELINE_TYPE_FOR_LAYER_XI_6_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_7_signal    : PIPELINE_TYPE_FOR_LAYER_XI_7_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_8_signal    : PIPELINE_TYPE_FOR_LAYER_XI_8_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_9_signal    : PIPELINE_TYPE_FOR_LAYER_XI_9_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_10_signal   : PIPELINE_TYPE_FOR_LAYER_XI_10_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_11_signal   : PIPELINE_TYPE_FOR_LAYER_XI_11_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_12_signal   : PIPELINE_TYPE_FOR_LAYER_XI_12_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_13_signal   : PIPELINE_TYPE_FOR_LAYER_XI_13_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_14_signal   : PIPELINE_TYPE_FOR_LAYER_XI_14_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_15_signal   : PIPELINE_TYPE_FOR_LAYER_XI_15_SIGNAL;
    -- sfix(6, -2)
    signal layer_xi_16_signal   : PIPELINE_TYPE_FOR_LAYER_XI_16_SIGNAL;




    -- 
    signal x_is_valid_signal    : PIPELINE_TYPE_FOR_X_IS_VALID_SIGNAL;

begin

-- "Initialize" stuff
    x_is_valid_signal(0) <= x_is_valid;

    layer_xi_1_signal(0) <= layer_xi_1;
    layer_xi_2_signal(0) <= layer_xi_2;
    layer_xi_3_signal(0) <= layer_xi_3;
    layer_xi_4_signal(0) <= layer_xi_4;
    layer_xi_5_signal(0) <= layer_xi_5;
    layer_xi_6_signal(0) <= layer_xi_6;
    layer_xi_7_signal(0) <= layer_xi_7;
    layer_xi_8_signal(0) <= layer_xi_8;
    layer_xi_9_signal(0) <= layer_xi_9;
    layer_xi_10_signal(0) <= layer_xi_10;
    layer_xi_11_signal(0) <= layer_xi_11;
    layer_xi_12_signal(0) <= layer_xi_12;
    layer_xi_13_signal(0) <= layer_xi_13;
    layer_xi_14_signal(0) <= layer_xi_14;
    layer_xi_15_signal(0) <= layer_xi_15;
    layer_xi_16_signal(0) <= layer_xi_16;

-- Add a pipeline step
    PL_STEP_0_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(0), layer_xi_1_signal(1));
    PL_STEP_0_for_layer_xi_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_2_signal(0), layer_xi_2_signal(1));
    PL_STEP_0_for_layer_xi_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_3_signal(0), layer_xi_3_signal(1));
    PL_STEP_0_for_layer_xi_4_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_4_signal(0), layer_xi_4_signal(1));
    PL_STEP_0_for_layer_xi_5_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_5_signal(0), layer_xi_5_signal(1));
    PL_STEP_0_for_layer_xi_6_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_6_signal(0), layer_xi_6_signal(1));
    PL_STEP_0_for_layer_xi_7_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_7_signal(0), layer_xi_7_signal(1));
    PL_STEP_0_for_layer_xi_8_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_8_signal(0), layer_xi_8_signal(1));
    PL_STEP_0_for_layer_xi_9_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_9_signal(0), layer_xi_9_signal(1));
    PL_STEP_0_for_layer_xi_10_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_10_signal(0), layer_xi_10_signal(1));
    PL_STEP_0_for_layer_xi_11_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_11_signal(0), layer_xi_11_signal(1));
    PL_STEP_0_for_layer_xi_12_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_12_signal(0), layer_xi_12_signal(1));
    PL_STEP_0_for_layer_xi_13_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_13_signal(0), layer_xi_13_signal(1));
    PL_STEP_0_for_layer_xi_14_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_14_signal(0), layer_xi_14_signal(1));
    PL_STEP_0_for_layer_xi_15_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_15_signal(0), layer_xi_15_signal(1));
    PL_STEP_0_for_layer_xi_16_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_16_signal(0), layer_xi_16_signal(1));
    PL_STEP_0_for_x_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', x_is_valid_signal(0), x_is_valid_signal(1));



    set_y_valid: process(reset, clk)
    begin
        if reset = '1' then
            y_valid <= '0';
        elsif rising_edge(clk) then
            y_valid <= x_is_valid_signal(1);
        end if;
    end process;


    relu6_input1: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_1 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_1_signal(1)) < 0 then
                layer_yo_1 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_1_signal(1)) > to_signed(24, layer_xi_1_signal(1)'length) then
                layer_yo_1 <= std_logic_vector(to_unsigned(24, layer_yo_1'length));
            else
                layer_yo_1 <= std_logic_vector(layer_xi_1_signal(1)(layer_xi_1_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input2: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_2 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_2_signal(1)) < 0 then
                layer_yo_2 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_2_signal(1)) > to_signed(24, layer_xi_2_signal(1)'length) then
                layer_yo_2 <= std_logic_vector(to_unsigned(24, layer_yo_2'length));
            else
                layer_yo_2 <= std_logic_vector(layer_xi_2_signal(1)(layer_xi_2_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input3: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_3 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_3_signal(1)) < 0 then
                layer_yo_3 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_3_signal(1)) > to_signed(24, layer_xi_3_signal(1)'length) then
                layer_yo_3 <= std_logic_vector(to_unsigned(24, layer_yo_3'length));
            else
                layer_yo_3 <= std_logic_vector(layer_xi_3_signal(1)(layer_xi_3_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input4: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_4 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_4_signal(1)) < 0 then
                layer_yo_4 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_4_signal(1)) > to_signed(24, layer_xi_4_signal(1)'length) then
                layer_yo_4 <= std_logic_vector(to_unsigned(24, layer_yo_4'length));
            else
                layer_yo_4 <= std_logic_vector(layer_xi_4_signal(1)(layer_xi_4_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input5: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_5 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_5_signal(1)) < 0 then
                layer_yo_5 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_5_signal(1)) > to_signed(24, layer_xi_5_signal(1)'length) then
                layer_yo_5 <= std_logic_vector(to_unsigned(24, layer_yo_5'length));
            else
                layer_yo_5 <= std_logic_vector(layer_xi_5_signal(1)(layer_xi_5_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input6: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_6 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_6_signal(1)) < 0 then
                layer_yo_6 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_6_signal(1)) > to_signed(24, layer_xi_6_signal(1)'length) then
                layer_yo_6 <= std_logic_vector(to_unsigned(24, layer_yo_6'length));
            else
                layer_yo_6 <= std_logic_vector(layer_xi_6_signal(1)(layer_xi_6_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input7: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_7 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_7_signal(1)) < 0 then
                layer_yo_7 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_7_signal(1)) > to_signed(24, layer_xi_7_signal(1)'length) then
                layer_yo_7 <= std_logic_vector(to_unsigned(24, layer_yo_7'length));
            else
                layer_yo_7 <= std_logic_vector(layer_xi_7_signal(1)(layer_xi_7_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input8: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_8 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_8_signal(1)) < 0 then
                layer_yo_8 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_8_signal(1)) > to_signed(24, layer_xi_8_signal(1)'length) then
                layer_yo_8 <= std_logic_vector(to_unsigned(24, layer_yo_8'length));
            else
                layer_yo_8 <= std_logic_vector(layer_xi_8_signal(1)(layer_xi_8_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input9: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_9 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_9_signal(1)) < 0 then
                layer_yo_9 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_9_signal(1)) > to_signed(24, layer_xi_9_signal(1)'length) then
                layer_yo_9 <= std_logic_vector(to_unsigned(24, layer_yo_9'length));
            else
                layer_yo_9 <= std_logic_vector(layer_xi_9_signal(1)(layer_xi_9_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input10: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_10 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_10_signal(1)) < 0 then
                layer_yo_10 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_10_signal(1)) > to_signed(24, layer_xi_10_signal(1)'length) then
                layer_yo_10 <= std_logic_vector(to_unsigned(24, layer_yo_10'length));
            else
                layer_yo_10 <= std_logic_vector(layer_xi_10_signal(1)(layer_xi_10_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input11: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_11 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_11_signal(1)) < 0 then
                layer_yo_11 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_11_signal(1)) > to_signed(24, layer_xi_11_signal(1)'length) then
                layer_yo_11 <= std_logic_vector(to_unsigned(24, layer_yo_11'length));
            else
                layer_yo_11 <= std_logic_vector(layer_xi_11_signal(1)(layer_xi_11_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input12: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_12 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_12_signal(1)) < 0 then
                layer_yo_12 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_12_signal(1)) > to_signed(24, layer_xi_12_signal(1)'length) then
                layer_yo_12 <= std_logic_vector(to_unsigned(24, layer_yo_12'length));
            else
                layer_yo_12 <= std_logic_vector(layer_xi_12_signal(1)(layer_xi_12_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input13: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_13 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_13_signal(1)) < 0 then
                layer_yo_13 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_13_signal(1)) > to_signed(24, layer_xi_13_signal(1)'length) then
                layer_yo_13 <= std_logic_vector(to_unsigned(24, layer_yo_13'length));
            else
                layer_yo_13 <= std_logic_vector(layer_xi_13_signal(1)(layer_xi_13_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input14: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_14 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_14_signal(1)) < 0 then
                layer_yo_14 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_14_signal(1)) > to_signed(24, layer_xi_14_signal(1)'length) then
                layer_yo_14 <= std_logic_vector(to_unsigned(24, layer_yo_14'length));
            else
                layer_yo_14 <= std_logic_vector(layer_xi_14_signal(1)(layer_xi_14_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input15: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_15 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_15_signal(1)) < 0 then
                layer_yo_15 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_15_signal(1)) > to_signed(24, layer_xi_15_signal(1)'length) then
                layer_yo_15 <= std_logic_vector(to_unsigned(24, layer_yo_15'length));
            else
                layer_yo_15 <= std_logic_vector(layer_xi_15_signal(1)(layer_xi_15_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input16: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_16 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_16_signal(1)) < 0 then
                layer_yo_16 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_16_signal(1)) > to_signed(24, layer_xi_16_signal(1)'length) then
                layer_yo_16 <= std_logic_vector(to_unsigned(24, layer_yo_16'length));
            else
                layer_yo_16 <= std_logic_vector(layer_xi_16_signal(1)(layer_xi_16_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;



end Behavioral;