LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
use work.ActivationFunctions.all;
use work.conv16_act_settings.all;

entity conv16_act is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_2    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        x_is_valid    : in std_logic;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_2 : out std_logic_vector(7-1 downto 0) --	ufix(3, -4)
    ) ;
end conv16_act;

architecture Behavioral of conv16_act is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv16_act : entity is "yes";

    type PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_X_IS_VALID_SIGNAL    is array(0 to 1) of std_logic;


    -- sfix(4, -4)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_2_signal    : PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL;




    -- 
    signal x_is_valid_signal    : PIPELINE_TYPE_FOR_X_IS_VALID_SIGNAL;

begin

-- "Initialize" stuff
    x_is_valid_signal(0) <= x_is_valid;

    layer_xi_1_signal(0) <= layer_xi_1;
    layer_xi_2_signal(0) <= layer_xi_2;

-- Add a pipeline step
    PL_STEP_0_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(0), layer_xi_1_signal(1));
    PL_STEP_0_for_layer_xi_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_2_signal(0), layer_xi_2_signal(1));
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
            elsif signed(layer_xi_1_signal(1)) > to_signed(96, layer_xi_1_signal(1)'length) then
                layer_yo_1 <= std_logic_vector(to_unsigned(96, layer_yo_1'length));
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
            elsif signed(layer_xi_2_signal(1)) > to_signed(96, layer_xi_2_signal(1)'length) then
                layer_yo_2 <= std_logic_vector(to_unsigned(96, layer_yo_2'length));
            else
                layer_yo_2 <= std_logic_vector(layer_xi_2_signal(1)(layer_xi_2_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;



end Behavioral;