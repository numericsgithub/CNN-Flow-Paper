library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv16_bias_add_constant_memoryROM is
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
end conv16_bias_add_constant_memoryROM;

architecture Behavioral of conv16_bias_add_constant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(8,-8),
	    1 => w(6,-29),
	    2 => w(28,24),
	    3 => w(-23,-20),
	    4 => w(19,-8),
	    5 => w(-4,30),
	    6 => w(25,28),
	    7 => w(0,-12),
	    8 => w(0,3),
	    9 => w(18,40),
	    10 => w(-52,-26),
	    11 => w(-16,-15),
	    12 => w(47,20),
	    13 => w(67,35),
	    14 => w(-1,-9),
	    15 => w(7,-17),
	    16 => w(-15,2),
	    17 => w(-10,-20),
	    18 => w(-14,35),
	    19 => w(4,-10),
	    20 => w(-7,-12),
	    21 => w(-4,26),
	    22 => w(-1,9),
	    23 => w(-22,7),
	    24 => w(24,-7),
	    25 => w(-1,36),
	    26 => w(-19,3),
	    27 => w(-10,18),
	    28 => w(0,28),
	    29 => w(45,13),
	    30 => w(26,-9),
	    31 => w(48,-2),
	    32 => w(44,26),
	    33 => w(-20,29),
	    34 => w(-24,-20),
	    35 => w(0,-18),
	    36 => w(32,20),
	    37 => w(-17,21),
	    38 => w(22,10),
	    39 => w(1,37),
	    40 => w(11,-17),
	    41 => w(18,30),
	    42 => w(17,-4),
	    43 => w(-22,-6),
	    44 => w(-16,-5),
	    45 => w(-2,-21),
	    46 => w(21,-11),
	    47 => w(-8,-23),
	    48 => w(43,-21),
	    49 => w(-19,-16),
	    50 => w(19,-3),
	    51 => w(25,27),
	    52 => w(62,32),
	    53 => w(7,25),
	    54 => w(-23,-33),
	    55 => w(29,-5),
	    56 => w(-8,-9),
	    57 => w(-23,-9),
	    58 => w(19,15),
	    59 => w(22,22),
	    60 => w(28,-17),
	    61 => w(-8,15),
	    62 => w(-7,-8),
	    63 => w(-10,23),
	    64 => w(45,-9),
	    65 => w(15,25),
	    66 => w(27,-34),
	    67 => w(0,27),
	    68 => w(26,-54),
	    69 => w(-7,6),
	    70 => w(27,24),
	    71 => w(21,-24),
	    72 => w(-13,11),
	    73 => w(13,19),
	    74 => w(50,-8),
	    75 => w(-20,4),
	    76 => w(-8,-2),
	    77 => w(-8,-16),
	    78 => w(-15,-10),
	    79 => w(-8,3),
	    80 => w(-3,45),
	    81 => w(10,-4),
	    82 => w(-21,43),
	    83 => w(23,-23),
	    84 => w(-10,8),
	    85 => w(-6,-1),
	    86 => w(-10,8),
	    87 => w(-2,13),
	    88 => w(12,-21),
	    89 => w(43,-7),
	    90 => w(27,-2),
	    91 => w(4,-10),
	    92 => w(23,-5),
	    93 => w(-4,-13),
	    94 => w(-1,15),
	    95 => w(22,14),
	    96 => w(-7,25),
	    97 => w(-6,10),
	    98 => w(20,42),
	    99 => w(-17,37),
	    100 => w(-28,-18),
	    101 => w(-12,33),
	    102 => w(-22,-4),
	    103 => w(-9,-13),
	    104 => w(-20,-25),
	    105 => w(20,47),
	    106 => w(33,22),
	    107 => w(6,-24),
	    108 => w(-28,0),
	    109 => w(-7,-17),
	    110 => w(-15,19),
	    111 => w(-56,28),
	    112 => w(74,23),
	    113 => w(30,11),
	    114 => w(41,10),
	    115 => w(-9,-11),
	    116 => w(-7,-5),
	    117 => w(-39,-18),
	    118 => w(-1,-12),
	    119 => w(0,-15),
	    120 => w(-10,4),
	    121 => w(-22,-51),
	    122 => w(-26,11),
	    123 => w(-11,59),
	    124 => w(1,37),
	    125 => w(-3,18),
	    126 => w(44,-4),
	    127 => w(24,27),
	    128 => w(13,4),
	    129 => w(-7,32),
	    130 => w(-15,10),
	    131 => w(0,-3),
	    132 => w(-26,-10),
	    133 => w(-21,-7),
	    134 => w(-2,-59),
	    135 => w(22,22),
	    136 => w(26,36),
	    137 => w(-16,-112),
	    138 => w(-97,-11),
	    139 => w(-16,35),
	    140 => w(-6,21),
	    141 => w(-3,28),
	    142 => w(-17,15),
	    143 => w(25,25),
	    144 => w(32,37),
	    145 => w(1,20),
	    146 => w(21,-25),
	    147 => w(13,1),
	    148 => w(20,0),
	    149 => w(9,18),
	    150 => w(11,9),
	    151 => w(34,-15),
	    152 => w(19,-1),
	    153 => w(24,28),
	    154 => w(-6,35),
	    155 => w(22,22),
	    156 => w(19,12),
	    157 => w(28,3),
	    158 => w(2,-20),
	    159 => w(-28,53),
	    160 => w(-7,-10),
	    161 => w(-11,0),
	    162 => w(31,-14),
	    163 => w(-17,-14),
	    164 => w(1,-13),
	    165 => w(-13,-16),
	    166 => w(33,12),
	    167 => w(-26,-1),
	    168 => w(23,-3),
	    169 => w(13,-3),
	    170 => w(27,-117),
	    171 => w(-14,4),
	    172 => w(29,0),
	    173 => w(-20,-20),
	    174 => w(16,-18),
	    175 => w(25,-3),
	    176 => w(-12,38),
	    177 => w(21,19),
	    178 => w(1,26),
	    179 => w(-55,-17),
	    180 => w(41,49),
	    181 => w(-5,21),
	    182 => w(17,21),
	    183 => w(11,19),
	    184 => w(-15,35),
	    185 => w(-16,22),
	    186 => w(-12,2),
	    187 => w(-41,-5),
	    188 => w(-11,0),
	    189 => w(46,34),
	    190 => w(-22,16),
	    191 => w(-14,15),
	    192 => w(-6,1),
	    193 => w(-4,18),
	    194 => w(22,15),
	    195 => w(-11,-11),
	    196 => w(-16,-2),
	    197 => w(39,-18),
	    198 => w(-4,-19),
	    199 => w(33,-12),
	    200 => w(31,25),
	    201 => w(13,45),
	    202 => w(-3,-19),
	    203 => w(2,21),
	    204 => w(-12,27),
	    205 => w(-8,22),
	    206 => w(25,-2),
	    207 => w(-21,0),
	    208 => w(-8,29),
	    209 => w(30,-22),
	    210 => w(1,21),
	    211 => w(-23,15),
	    212 => w(38,25),
	    213 => w(17,47),
	    214 => w(-4,-6),
	    215 => w(-33,-16),
	    216 => w(-4,-14),
	    217 => w(-20,-17),
	    218 => w(-13,55),
	    219 => w(28,45),
	    220 => w(-16,11),
	    221 => w(-23,-31),
	    222 => w(6,-10),
	    223 => w(0,-5),
	    224 => w(22,3),
	    225 => w(-2,22),
	    226 => w(-5,35),
	    227 => w(-37,-2),
	    228 => w(-42,-13),
	    229 => w(60,-8),
	    230 => w(10,-11),
	    231 => w(1,-15),
	    232 => w(19,-9),
	    233 => w(20,47),
	    234 => w(-7,4),
	    235 => w(4,-2),
	    236 => w(-31,34),
	    237 => w(-52,0),
	    238 => w(-8,2),
	    239 => w(33,-18),
	    240 => w(3,24),
	    241 => w(6,10),
	    242 => w(-6,42),
	    243 => w(-24,-2),
	    244 => w(18,23),
	    245 => w(-10,25),
	    246 => w(-14,20),
	    247 => w(-22,19),
	    248 => w(-7,34),
	    249 => w(-20,-16),
	    250 => w(22,15),
	    251 => w(-23,16),
	    252 => w(15,27),
	    253 => w(10,36),
	    254 => w(-13,-3),
	    255 => w(29,-18)
        );
    
begin

dout <= data_ROM(to_integer(data_index));


end Behavioral;