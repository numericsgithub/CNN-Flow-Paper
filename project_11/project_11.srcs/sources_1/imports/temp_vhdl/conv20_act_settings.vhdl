library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

USE work.Components.ALL;

package conv20_act_settings is
    constant AMOUNT_OF_LAYER_INPUTS   : NATURAL := 2; -- Amount of input signals
    constant AMOUNT_OF_LAYER_OUTPUTS  : NATURAL := 2; -- Amount of output signals
    constant XI_WIDTH : NATURAL := 8;
    subtype XI_TYPE is std_logic_vector((XI_WIDTH-1) downto 0);

    constant WI_WIDTH : NATURAL := 0;
    subtype WI_TYPE is std_logic_vector((WI_WIDTH-1) downto 0);

    -- Accumulation settings
    constant ACCU_WIDTH : NATURAL := XI_WIDTH + WI_WIDTH;
    subtype ACCU_TYPE is std_logic_vector((ACCU_WIDTH-1) downto 0);
    type BASE_ACCU_ARRAY_TYPE is array(natural range <>) of ACCU_TYPE;

    constant CONFIGURATIONS : NATURAL := 256;
    subtype SEL_CONFIGURATIONS_TYPE is std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);

    constant INTERLEAVINGS : NATURAL := 1;
    subtype SEL_INTERLEAVINGS_TYPE is std_logic_vector(bits(INTERLEAVINGS-1)-1 downto 0);

    -- Sliding window base settings
    constant KERNEL_SIZE : NATURAL := 1;
    constant FEATURE_MAP_SIZE : NATURAL := 14;
    constant STRIDE : NATURAL := 1;
    constant USE_SAME_PADDING : boolean := False;

    -- Sliding window delay settings
    -- The delay settings for the buffers in the KPU. We have a small buffer in between the pixels in the KPU and
    -- and big line buffers at the end of each row (except the last row) of each KPU.




    -- KPU settings
    subtype XI_ARRAY_TYPE is BASE_ACCU_ARRAY_TYPE(0 TO (KERNEL_SIZE*KERNEL_SIZE-1));
    subtype YI_ARRAY_TYPE is BASE_ACCU_ARRAY_TYPE(0 TO (KERNEL_SIZE*KERNEL_SIZE));
    --TYPE XI_ARRAY_TYPE IS ARRAY (0 TO (KERNEL_SIZE*KERNEL_SIZE-1)) OF ACCU_TYPE;
    --TYPE YI_ARRAY_TYPE IS ARRAY (0 TO (KERNEL_SIZE*KERNEL_SIZE)) OF ACCU_TYPE;

    -- Delay buffer settings
    constant KPU_BIG_DELAY_ARRAY_SIZE : NATURAL := KERNEL_SIZE-1;
    constant KPU_SMALL_DELAY_ARRAY_SIZE : NATURAL := (KERNEL_SIZE-1)*KERNEL_SIZE;

    -- Special settings

    --function sel(n : natural) return natural;
    --constant clock_period : time := 1 sec / 32000000;
    --constant num_regs : natural := 16;
    --subtype sel_word is std_logic_vector(sel(num_regs) downto 0);
end conv20_act_settings;