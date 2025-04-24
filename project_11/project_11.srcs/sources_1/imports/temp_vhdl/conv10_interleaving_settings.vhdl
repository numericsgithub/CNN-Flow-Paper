library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

USE work.Components.ALL;

package conv10_interleaving_settings is
    constant AMOUNT_OF_LAYER_INPUTS   : NATURAL := 64; -- Amount of input signals
    constant AMOUNT_OF_LAYER_OUTPUTS  : NATURAL := 4; -- Amount of output signals
    constant XI_WIDTH : NATURAL := 7;
    subtype XI_TYPE is std_logic_vector((XI_WIDTH-1) downto 0);

    -- Accumulation settings
    constant ACCU_WIDTH : NATURAL := XI_WIDTH;
    subtype ACCU_TYPE is std_logic_vector((ACCU_WIDTH-1) downto 0);
    type BASE_ACCU_ARRAY_TYPE is array(natural range <>) of ACCU_TYPE;

    constant CONFIGURATIONS : NATURAL := 64;
    subtype SEL_CONFIGURATIONS_TYPE is std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);

    constant INTERLEAVINGS : NATURAL := 1;
    subtype SEL_INTERLEAVINGS_TYPE is std_logic_vector(bits(INTERLEAVINGS-1)-1 downto 0);

    -- Special settings

    --function sel(n : natural) return natural;
    --constant clock_period : time := 1 sec / 32000000;
    --constant num_regs : natural := 16;
    --subtype sel_word is std_logic_vector(sel(num_regs) downto 0);
end conv10_interleaving_settings;