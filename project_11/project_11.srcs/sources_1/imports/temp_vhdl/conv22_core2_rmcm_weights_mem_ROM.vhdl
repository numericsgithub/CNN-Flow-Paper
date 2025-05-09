library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv22_core2_rmcm_weightsconstant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 256;
        WORDS_PER_ADDR                : natural := 9
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv22_core2_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv22_core2_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(5,18,1,-2,7,-4,-18,-16,-10),
	    1 => w(7,10,5,11,27,3,3,6,1),
	    2 => w(2,12,0,12,24,4,3,5,4),
	    3 => w(-22,-21,35,-26,-2,44,-15,-18,29),
	    4 => w(-16,-7,-11,-12,1,-11,-13,-3,-9),
	    5 => w(6,-5,4,10,-3,11,13,15,8),
	    6 => w(14,10,3,6,3,-1,9,7,1),
	    7 => w(-9,-10,-5,-8,-6,-5,-11,-8,-9),
	    8 => w(-5,-11,-2,-10,-11,-6,-4,-5,-3),
	    9 => w(-7,-2,-7,-9,-1,-8,-9,-8,-7),
	    10 => w(4,12,2,19,14,13,-1,9,-2),
	    11 => w(-12,-8,-10,-5,45,-15,-11,-12,-5),
	    12 => w(-8,-13,-5,-17,-22,-9,-10,-12,-9),
	    13 => w(3,14,1,9,17,2,3,4,3),
	    14 => w(16,14,14,11,36,-2,13,4,14),
	    15 => w(12,9,8,11,14,6,8,7,6),
	    16 => w(18,-1,-5,29,3,-5,12,6,-3),
	    17 => w(3,18,1,22,29,12,-5,10,-2),
	    18 => w(4,8,2,12,24,5,3,1,3),
	    19 => w(-13,-6,-8,6,29,-4,-3,7,-3),
	    20 => w(-10,-20,-8,-3,11,-5,-5,3,-4),
	    21 => w(-15,-20,-7,3,38,-8,-2,17,-3),
	    22 => w(-7,-9,-5,-6,-5,-4,-7,-4,-5),
	    23 => w(-13,4,-10,3,94,-19,-22,-25,-13),
	    24 => w(-15,-10,-12,-10,-7,-8,-10,-10,-7),
	    25 => w(-12,-6,-9,-10,-4,-6,-5,-5,-3),
	    26 => w(-15,-7,-11,-9,-7,-6,-10,-6,-8),
	    27 => w(10,7,9,12,17,5,5,12,5),
	    28 => w(5,8,4,10,20,3,2,5,2),
	    29 => w(16,16,9,-1,6,2,11,16,4),
	    30 => w(-9,-10,-5,-10,-8,-7,-10,-9,-7),
	    31 => w(-1,-1,1,9,29,-2,3,5,3),
	    32 => w(5,5,5,9,24,-2,5,5,6),
	    33 => w(-7,-8,-3,-8,-6,-6,-7,-6,-5),
	    34 => w(19,22,12,1,-7,1,15,16,12),
	    35 => w(9,14,7,15,31,0,4,-12,11),
	    36 => w(-18,-8,-14,-15,-8,-11,-6,-10,-4),
	    37 => w(-10,-7,-7,-6,-4,-4,-10,-6,-8),
	    38 => w(5,16,3,17,26,8,8,7,8),
	    39 => w(13,38,-4,26,31,18,17,-1,18),
	    40 => w(-19,-10,-16,-10,6,-8,-17,-7,-14),
	    41 => w(15,28,6,17,17,11,-3,-13,2),
	    42 => w(-9,-6,-7,-6,-5,-5,-11,-9,-8),
	    43 => w(6,14,6,16,33,1,6,6,8),
	    44 => w(1,14,-1,13,32,0,0,1,3),
	    45 => w(2,6,2,9,28,-1,1,-1,3),
	    46 => w(9,16,6,10,26,2,3,5,2),
	    47 => w(3,13,1,14,18,8,0,11,-1),
	    48 => w(1,6,2,9,25,-1,2,2,4),
	    49 => w(10,13,8,13,18,6,7,5,6),
	    50 => w(6,8,3,7,12,2,8,5,8),
	    51 => w(-12,-6,-10,-9,-9,-4,-12,-7,-10),
	    52 => w(-2,6,-3,-9,-2,-7,-12,-12,-9),
	    53 => w(5,11,-1,9,62,-13,3,6,0),
	    54 => w(-1,-7,0,4,-17,10,21,20,13),
	    55 => w(8,8,6,15,19,6,4,4,4),
	    56 => w(-8,-4,-5,-11,-4,-9,-10,-8,-8),
	    57 => w(11,8,10,11,30,-1,-2,3,1),
	    58 => w(-10,-7,-7,-9,-13,-6,-8,-7,-7),
	    59 => w(-12,-10,-7,-13,-5,-10,-10,-11,-6),
	    60 => w(6,4,7,11,31,-1,5,5,5),
	    61 => w(-1,-5,3,15,29,4,8,18,5),
	    62 => w(-8,-7,-5,-9,-7,-7,-5,-4,-3),
	    63 => w(12,19,7,11,18,5,3,-4,7),
	    64 => w(9,2,-9,19,-13,-12,7,0,-5),
	    65 => w(8,9,7,10,33,-1,2,-3,4),
	    66 => w(-7,-9,-5,-8,-6,-5,-4,-6,-3),
	    67 => w(-12,-11,-6,2,31,-7,-1,9,-1),
	    68 => w(-4,-8,-1,-7,-9,-3,-6,1,-6),
	    69 => w(11,23,5,18,16,12,11,13,8),
	    70 => w(12,16,7,-1,-31,6,-7,-10,-3),
	    71 => w(4,8,4,11,32,-1,2,5,3),
	    72 => w(-19,-11,-15,-2,9,-1,14,23,6),
	    73 => w(8,17,5,10,18,2,-2,-3,0),
	    74 => w(11,18,9,14,15,5,8,4,9),
	    75 => w(-7,-7,-4,-7,-7,-4,-5,-3,-5),
	    76 => w(-1,-13,1,-7,-7,-3,-5,-3,-4),
	    77 => w(-6,-9,-5,-8,-5,-4,-4,-4,-4),
	    78 => w(-6,12,-6,4,44,-10,-13,-13,-6),
	    79 => w(25,-7,-12,32,-11,-5,16,-4,-14),
	    80 => w(18,26,11,3,-4,2,-11,-5,-6),
	    81 => w(-9,-6,-7,-7,-8,-5,-6,-7,-3),
	    82 => w(9,14,5,12,29,2,3,-4,4),
	    83 => w(-7,-21,-2,8,-50,18,32,49,18),
	    84 => w(-9,-13,-5,-11,-10,-7,-7,-7,-5),
	    85 => w(5,10,3,6,18,-1,2,-8,5),
	    86 => w(-7,-9,-4,-8,-7,-6,-6,-6,-5),
	    87 => w(22,12,14,7,-6,8,2,-9,3),
	    88 => w(-1,-22,3,4,-26,10,18,26,9),
	    89 => w(-9,-7,-6,-8,-8,-4,-6,-6,-5),
	    90 => w(-7,-8,-5,-7,-7,-5,-8,-6,-5),
	    91 => w(72,62,52,23,-12,25,-3,-54,1),
	    92 => w(-12,-2,18,-8,-5,11,-8,-3,14),
	    93 => w(13,19,9,8,20,-3,-1,-1,1),
	    94 => w(-9,-6,-6,-9,-6,-6,-8,-7,-5),
	    95 => w(-2,0,-3,-8,2,-7,-16,-11,-13),
	    96 => w(-7,-6,-6,-5,-6,-1,-6,-3,-6),
	    97 => w(-15,-11,-10,0,17,-2,-3,11,-3),
	    98 => w(1,18,-2,31,22,22,7,30,0),
	    99 => w(-5,-5,-4,-6,-5,-4,-9,-5,-6),
	    100 => w(-2,-20,1,-1,-31,9,24,19,16),
	    101 => w(-9,-5,-7,-7,-3,-5,-10,-5,-8),
	    102 => w(-13,-46,-1,-21,-4,-22,25,54,13),
	    103 => w(-2,-3,-2,-6,-7,-2,-5,-5,-4),
	    104 => w(-9,-9,-6,-9,-9,-5,-6,-8,-4),
	    105 => w(7,16,4,18,23,9,8,7,7),
	    106 => w(28,5,24,-8,16,-10,17,34,7),
	    107 => w(-17,-31,-10,0,-8,1,14,20,9),
	    108 => w(13,24,12,24,37,7,9,19,10),
	    109 => w(-4,-28,1,3,-25,10,13,25,4),
	    110 => w(6,5,5,7,15,3,5,6,3),
	    111 => w(5,16,1,19,22,10,-8,10,-8),
	    112 => w(16,2,10,-3,-66,14,17,5,11),
	    113 => w(-8,-6,-6,-6,-1,-5,-8,-5,-6),
	    114 => w(7,17,2,10,20,3,6,-1,6),
	    115 => w(-5,-10,-3,-3,-3,1,13,24,6),
	    116 => w(14,14,9,12,0,9,5,13,4),
	    117 => w(12,3,8,7,10,11,7,1,10),
	    118 => w(-10,-4,-9,-8,-3,-6,-12,-8,-8),
	    119 => w(-5,3,-5,-6,-10,-3,-14,-4,-13),
	    120 => w(-8,-8,-6,-8,-9,-5,-7,-6,-5),
	    121 => w(-21,5,-5,-11,13,4,-10,3,1),
	    122 => w(-8,-11,-5,-14,-10,-10,-9,-9,-6),
	    123 => w(-9,4,-5,20,28,8,10,19,8),
	    124 => w(-17,-9,-13,-6,-3,-7,-18,-8,-13),
	    125 => w(-3,-12,1,-9,-2,-8,-7,-6,-4),
	    126 => w(-11,-5,-8,-7,10,-8,-4,-4,-3),
	    127 => w(11,14,9,15,33,0,4,3,7),
	    128 => w(-1,-1,1,9,38,-7,0,4,1),
	    129 => w(-19,2,-6,5,70,2,-17,-4,-2),
	    130 => w(3,-7,-22,5,10,2,6,-7,-35),
	    131 => w(23,7,19,-4,-24,0,-2,-11,0),
	    132 => w(4,11,3,11,29,1,-1,4,0),
	    133 => w(-1,-4,1,10,30,1,5,9,3),
	    134 => w(-5,-8,-3,-8,-10,-3,-3,-3,-3),
	    135 => w(-11,-4,-9,-5,-5,-3,-9,-7,-7),
	    136 => w(-6,-6,-4,-9,-7,-7,-6,-4,-3),
	    137 => w(-10,-9,-7,-7,-6,-5,-8,-6,-6),
	    138 => w(-7,-2,-5,-9,-4,-7,-14,-12,-10),
	    139 => w(5,11,4,11,30,0,1,5,2),
	    140 => w(-13,-5,-6,7,59,-9,1,7,1),
	    141 => w(-9,-6,-7,-6,-4,-3,-6,-2,-6),
	    142 => w(-1,-2,-5,16,38,-5,16,21,1),
	    143 => w(20,14,13,5,-10,7,-6,-19,-2),
	    144 => w(8,11,5,10,29,1,7,1,8),
	    145 => w(-4,-1,-4,-8,-2,-6,-5,-12,-2),
	    146 => w(-9,-4,-7,-6,2,-5,-7,-6,-6),
	    147 => w(10,24,4,0,7,-2,-6,-12,-3),
	    148 => w(-7,-14,-3,1,-23,7,15,11,10),
	    149 => w(0,11,1,15,25,5,-1,7,0),
	    150 => w(-22,-16,-15,0,23,-4,-1,16,-3),
	    151 => w(8,3,5,-7,-18,0,-5,-7,-4),
	    152 => w(-1,5,0,13,23,4,1,8,1),
	    153 => w(4,-9,13,1,1,35,-5,-6,16),
	    154 => w(6,13,3,14,33,2,3,3,3),
	    155 => w(-5,-6,-4,-8,-5,-5,-8,-8,-6),
	    156 => w(-13,-8,-8,-6,-6,-5,-7,-3,-7),
	    157 => w(-17,-8,-12,-11,2,-9,-14,-8,-11),
	    158 => w(40,43,31,40,-62,30,-9,-20,26),
	    159 => w(3,1,-22,4,18,-14,7,-1,-19),
	    160 => w(-9,-7,-6,-8,-7,-6,-6,-4,-5),
	    161 => w(-4,-5,-3,-7,-15,-2,-2,-5,-1),
	    162 => w(-7,-7,-5,-5,-4,-3,-7,-4,-5),
	    163 => w(-7,-8,-5,-10,-9,-7,-6,-7,-4),
	    164 => w(2,16,2,14,36,-2,2,0,7),
	    165 => w(16,19,9,8,6,6,0,-4,0),
	    166 => w(-21,-18,-16,-13,-8,-11,-7,-3,-6),
	    167 => w(-9,-9,-7,-10,-13,-5,-1,0,-2),
	    168 => w(-5,-7,-4,-10,-9,-5,-7,-6,-5),
	    169 => w(3,11,1,4,9,2,-14,-23,-8),
	    170 => w(16,22,10,14,21,7,7,-14,9),
	    171 => w(-8,-7,-5,-7,-4,-5,-6,-3,-4),
	    172 => w(-10,-9,-7,-9,-6,-7,-6,-5,-4),
	    173 => w(-12,-2,-9,-6,-3,-4,-11,-3,-10),
	    174 => w(12,19,10,21,41,0,7,12,11),
	    175 => w(5,2,5,8,4,6,14,12,10),
	    176 => w(14,19,7,11,26,5,3,-21,8),
	    177 => w(-9,-13,-6,0,-20,6,5,11,0),
	    178 => w(11,21,8,15,-3,10,17,-2,22),
	    179 => w(8,12,6,14,18,7,10,14,6),
	    180 => w(-7,-7,-4,-8,-3,-7,-5,-7,-3),
	    181 => w(-14,-10,-10,-13,-7,-8,-10,-7,-7),
	    182 => w(-5,-5,-3,-6,-6,-3,-4,-6,-3),
	    183 => w(-1,15,2,16,38,-4,-2,3,7),
	    184 => w(6,14,3,16,31,5,3,7,4),
	    185 => w(-9,-9,-5,-7,-3,-6,-3,-5,-2),
	    186 => w(-24,6,11,-30,21,13,-32,10,10),
	    187 => w(-2,-1,0,4,40,-8,-2,-3,1),
	    188 => w(9,8,8,10,23,0,5,6,6),
	    189 => w(-17,-15,-10,-4,10,-5,21,39,10),
	    190 => w(-22,16,-19,15,37,7,-10,11,-10),
	    191 => w(-9,6,-9,14,31,2,13,18,10),
	    192 => w(-7,-9,-5,-9,-7,-6,-6,-5,-4),
	    193 => w(-6,7,-4,9,53,-6,-9,-7,-3),
	    194 => w(-10,-19,-6,-11,-9,-8,-9,-1,-8),
	    195 => w(-1,4,1,11,33,1,4,7,3),
	    196 => w(1,6,2,9,30,-3,1,0,4),
	    197 => w(-11,-8,-9,-11,-11,-7,-5,-5,-5),
	    198 => w(-7,-7,-4,-8,-5,-7,-13,-4,-10),
	    199 => w(8,15,4,17,24,9,6,10,3),
	    200 => w(17,15,11,8,-4,7,-5,-5,-3),
	    201 => w(8,14,6,11,26,-2,7,5,8),
	    202 => w(2,3,1,-10,-4,-8,-12,-11,-9),
	    203 => w(4,-8,5,16,3,13,11,19,6),
	    204 => w(11,20,6,2,27,8,6,5,3),
	    205 => w(-10,-14,-6,-16,-2,-14,-10,-13,-7),
	    206 => w(-1,-9,0,-9,-18,-2,2,-5,2),
	    207 => w(-13,1,27,-9,-2,27,-13,1,19),
	    208 => w(-17,-9,-10,5,85,-15,-8,17,-8),
	    209 => w(-4,-7,3,1,-5,0,12,5,28),
	    210 => w(-4,-17,1,-5,-6,-3,15,44,4),
	    211 => w(6,10,4,9,29,-1,1,-2,2),
	    212 => w(-8,-9,-5,-8,-5,-5,-4,-6,-2),
	    213 => w(8,-7,11,9,21,2,12,14,8),
	    214 => w(-5,-2,-4,4,5,4,14,27,7),
	    215 => w(-14,-6,-12,-9,-5,-7,-12,-6,-10),
	    216 => w(-38,-1,23,-33,4,35,-22,-4,18),
	    217 => w(-19,-12,-12,-11,-2,-9,-14,-6,-10),
	    218 => w(12,4,11,3,6,1,7,8,6),
	    219 => w(16,26,9,-4,3,-4,-9,-8,-6),
	    220 => w(-6,-5,-5,-6,-5,-5,-5,-4,-4),
	    221 => w(-7,-12,-2,10,13,4,6,18,3),
	    222 => w(8,13,6,16,20,8,4,6,4),
	    223 => w(5,7,5,10,25,1,5,7,4),
	    224 => w(9,19,2,16,16,10,-1,-1,1),
	    225 => w(8,12,4,14,17,7,2,9,0),
	    226 => w(-8,-4,-7,-5,-6,-2,-7,-3,-6),
	    227 => w(7,-23,8,-25,-55,-9,1,-7,-2),
	    228 => w(-3,19,16,4,16,2,-2,18,11),
	    229 => w(-15,-13,-10,-7,-2,-6,-10,-3,-8),
	    230 => w(1,10,0,15,27,4,0,8,0),
	    231 => w(17,16,11,16,19,9,4,10,3),
	    232 => w(-12,-11,-9,-10,-4,-7,-11,-8,-8),
	    233 => w(6,19,4,25,35,11,7,11,9),
	    234 => w(0,-1,2,12,25,7,9,16,4),
	    235 => w(-18,-15,-12,-9,-6,-10,-12,-6,-6),
	    236 => w(4,20,0,14,11,9,11,-3,11),
	    237 => w(4,11,2,13,22,3,3,4,3),
	    238 => w(-10,-9,-5,-7,-5,-5,-8,-5,-6),
	    239 => w(-15,-16,-9,-14,-10,-10,-11,-7,-9),
	    240 => w(13,21,8,15,25,4,0,-20,8),
	    241 => w(9,7,7,7,8,1,7,2,8),
	    242 => w(-6,-13,-3,-7,-8,-3,1,4,-1),
	    243 => w(10,-1,12,8,24,-3,0,4,4),
	    244 => w(14,11,11,13,47,-4,0,9,4),
	    245 => w(-10,-6,-7,-9,-6,-6,-9,-7,-6),
	    246 => w(5,15,3,13,31,2,2,2,4),
	    247 => w(23,36,14,20,6,18,-8,-8,-6),
	    248 => w(11,1,-16,9,3,-7,7,1,-15),
	    249 => w(12,24,7,7,15,5,-6,-12,-2),
	    250 => w(-19,-8,-16,-9,-3,-6,-19,-10,-17),
	    251 => w(0,-1,-1,-5,-7,-3,-8,-9,-5),
	    252 => w(1,4,0,9,31,-1,1,3,0),
	    253 => w(6,12,3,8,16,3,0,0,1),
	    254 => w(-3,-7,-2,-7,-12,-3,-2,-3,-1),
	    255 => w(0,12,-1,13,31,4,-2,4,-1)
        );
    attribute ram_style : string;
        attribute ram_style of data_ROM : constant is "block";
begin

Read_rom_process: process(clk)
    begin
        if rising_edge(clk) then
            dout <= data_ROM(to_integer(data_index));
        end if;
    end process;


end Behavioral;