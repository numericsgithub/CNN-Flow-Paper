library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv22_bias_add_constant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 256;
        WORDS_PER_ADDR                : natural := 2
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv22_bias_add_constant_memoryROM;

architecture Behavioral of conv22_bias_add_constant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,30),
	    1 => w(-8,-8),
	    2 => w(-8,0),
	    3 => w(37,-15),
	    4 => w(24,25),
	    5 => w(19,-6),
	    6 => w(23,-12),
	    7 => w(9,19),
	    8 => w(-3,24),
	    9 => w(0,19),
	    10 => w(29,-8),
	    11 => w(27,49),
	    12 => w(25,44),
	    13 => w(-2,0),
	    14 => w(-4,-21),
	    15 => w(28,-1),
	    16 => w(-4,-22),
	    17 => w(7,-10),
	    18 => w(24,-5),
	    19 => w(20,-6),
	    20 => w(25,29),
	    21 => w(-6,13),
	    22 => w(-5,20),
	    23 => w(19,-5),
	    24 => w(-1,21),
	    25 => w(20,19),
	    26 => w(26,18),
	    27 => w(-20,-19),
	    28 => w(-2,-9),
	    29 => w(0,-10),
	    30 => w(-11,32),
	    31 => w(-11,-4),
	    32 => w(19,0),
	    33 => w(-32,21),
	    34 => w(24,-34),
	    35 => w(-11,-2),
	    36 => w(30,21),
	    37 => w(19,20),
	    38 => w(21,-4),
	    39 => w(18,-3),
	    40 => w(-8,22),
	    41 => w(0,-14),
	    42 => w(37,23),
	    43 => w(-6,-10),
	    44 => w(38,-16),
	    45 => w(-14,-7),
	    46 => w(-26,-2),
	    47 => w(23,-9),
	    48 => w(28,-1),
	    49 => w(37,0),
	    50 => w(36,-5),
	    51 => w(39,23),
	    52 => w(-10,22),
	    53 => w(0,-25),
	    54 => w(-23,7),
	    55 => w(-6,-2),
	    56 => w(19,25),
	    57 => w(7,-4),
	    58 => w(20,33),
	    59 => w(-2,29),
	    60 => w(-2,-4),
	    61 => w(26,-6),
	    62 => w(-14,26),
	    63 => w(-2,-5),
	    64 => w(24,23),
	    65 => w(-19,0),
	    66 => w(0,30),
	    67 => w(27,25),
	    68 => w(75,39),
	    69 => w(-5,-19),
	    70 => w(-6,33),
	    71 => w(-1,-5),
	    72 => w(-3,-12),
	    73 => w(-9,-6),
	    74 => w(23,-13),
	    75 => w(-3,26),
	    76 => w(-3,24),
	    77 => w(20,25),
	    78 => w(31,13),
	    79 => w(26,-11),
	    80 => w(-11,5),
	    81 => w(-40,27),
	    82 => w(-9,-8),
	    83 => w(21,21),
	    84 => w(32,40),
	    85 => w(19,44),
	    86 => w(6,21),
	    87 => w(-11,-3),
	    88 => w(24,23),
	    89 => w(-10,21),
	    90 => w(0,20),
	    91 => w(34,0),
	    92 => w(42,19),
	    93 => w(43,-5),
	    94 => w(34,18),
	    95 => w(22,31),
	    96 => w(-3,20),
	    97 => w(31,33),
	    98 => w(20,-16),
	    99 => w(0,20),
	    100 => w(-3,24),
	    101 => w(21,19),
	    102 => w(35,0),
	    103 => w(-14,31),
	    104 => w(-27,23),
	    105 => w(25,-2),
	    106 => w(-12,-19),
	    107 => w(21,11),
	    108 => w(32,-12),
	    109 => w(29,17),
	    110 => w(-2,-22),
	    111 => w(10,0),
	    112 => w(-5,34),
	    113 => w(-5,19),
	    114 => w(-6,0),
	    115 => w(29,12),
	    116 => w(18,-8),
	    117 => w(-9,-33),
	    118 => w(0,19),
	    119 => w(-27,33),
	    120 => w(40,31),
	    121 => w(-9,36),
	    122 => w(20,21),
	    123 => w(21,-3),
	    124 => w(38,22),
	    125 => w(-2,23),
	    126 => w(-29,32),
	    127 => w(27,-3),
	    128 => w(-1,-6),
	    129 => w(36,-25),
	    130 => w(20,39),
	    131 => w(-3,14),
	    132 => w(-8,-4),
	    133 => w(27,-11),
	    134 => w(18,26),
	    135 => w(20,21),
	    136 => w(35,21),
	    137 => w(1,29),
	    138 => w(26,21),
	    139 => w(47,-7),
	    140 => w(22,-21),
	    141 => w(-2,20),
	    142 => w(29,-27),
	    143 => w(22,11),
	    144 => w(21,-17),
	    145 => w(-8,28),
	    146 => w(-22,21),
	    147 => w(-8,13),
	    148 => w(-1,24),
	    149 => w(21,-1),
	    150 => w(41,40),
	    151 => w(-3,33),
	    152 => w(35,-11),
	    153 => w(21,-17),
	    154 => w(0,-12),
	    155 => w(-8,20),
	    156 => w(18,20),
	    157 => w(19,19),
	    158 => w(-14,0),
	    159 => w(-11,13),
	    160 => w(22,20),
	    161 => w(-3,40),
	    162 => w(0,28),
	    163 => w(-8,20),
	    164 => w(-8,-7),
	    165 => w(-26,-13),
	    166 => w(44,39),
	    167 => w(-4,30),
	    168 => w(22,29),
	    169 => w(-22,36),
	    170 => w(31,0),
	    171 => w(21,35),
	    172 => w(0,22),
	    173 => w(23,19),
	    174 => w(20,-11),
	    175 => w(15,-16),
	    176 => w(4,-7),
	    177 => w(20,36),
	    178 => w(29,-6),
	    179 => w(32,-3),
	    180 => w(0,20),
	    181 => w(28,19),
	    182 => w(24,27),
	    183 => w(-2,-7),
	    184 => w(-25,-1),
	    185 => w(-4,25),
	    186 => w(-6,-1),
	    187 => w(20,6),
	    188 => w(-9,-3),
	    189 => w(-1,-12),
	    190 => w(4,-32),
	    191 => w(20,-8),
	    192 => w(-1,23),
	    193 => w(-33,-2),
	    194 => w(20,33),
	    195 => w(22,-7),
	    196 => w(-5,-7),
	    197 => w(-24,33),
	    198 => w(3,19),
	    199 => w(21,-15),
	    200 => w(-10,-1),
	    201 => w(84,-2),
	    202 => w(-16,25),
	    203 => w(-7,-6),
	    204 => w(23,-13),
	    205 => w(22,25),
	    206 => w(-14,28),
	    207 => w(19,-13),
	    208 => w(-2,-21),
	    209 => w(-28,9),
	    210 => w(22,-8),
	    211 => w(-21,2),
	    212 => w(21,36),
	    213 => w(24,-7),
	    214 => w(20,-21),
	    215 => w(34,31),
	    216 => w(-38,-7),
	    217 => w(-17,20),
	    218 => w(20,-18),
	    219 => w(-18,0),
	    220 => w(-7,25),
	    221 => w(25,-7),
	    222 => w(24,-3),
	    223 => w(-5,-17),
	    224 => w(17,-4),
	    225 => w(25,-3),
	    226 => w(-1,19),
	    227 => w(26,57),
	    228 => w(26,-18),
	    229 => w(22,22),
	    230 => w(27,-13),
	    231 => w(-4,0),
	    232 => w(32,26),
	    233 => w(27,-15),
	    234 => w(-4,-6),
	    235 => w(-12,34),
	    236 => w(-3,-25),
	    237 => w(-4,-21),
	    238 => w(-15,19),
	    239 => w(21,23),
	    240 => w(-35,-2),
	    241 => w(28,-5),
	    242 => w(-21,34),
	    243 => w(30,-9),
	    244 => w(-11,-27),
	    245 => w(-4,21),
	    246 => w(30,-5),
	    247 => w(-6,0),
	    248 => w(-3,32),
	    249 => w(-10,-4),
	    250 => w(30,23),
	    251 => w(-1,33),
	    252 => w(-19,-7),
	    253 => w(12,-5),
	    254 => w(22,27),
	    255 => w(-1,-3)
        );
    
begin

dout <= data_ROM(to_integer(data_index));


end Behavioral;