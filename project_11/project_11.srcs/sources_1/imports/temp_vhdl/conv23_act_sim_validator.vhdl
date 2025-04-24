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

entity conv23_act_sim_validator is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
        layer_xi_1 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_2 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_3 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_4 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_5 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_6 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_7 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_8 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_9 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_10 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_11 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_12 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_13 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_14 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_15 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_16 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_17 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_18 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_19 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_20 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_21 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_22 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_23 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_24 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_25 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_26 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_27 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_28 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_29 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_30 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_31 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_32 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_33 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_34 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_35 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_36 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_37 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_38 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_39 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_40 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_41 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_42 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_43 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_44 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_45 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_46 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_47 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_48 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_49 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_50 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_51 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_52 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_53 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_54 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_55 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_56 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_57 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_58 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_59 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_60 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_61 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_62 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_63 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_64 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_65 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_66 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_67 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_68 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_69 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_70 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_71 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_72 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_73 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_74 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_75 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_76 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_77 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_78 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_79 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_80 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_81 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_82 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_83 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_84 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_85 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_86 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_87 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_88 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_89 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_90 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_91 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_92 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_93 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_94 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_95 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_96 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_97 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_98 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_99 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_100 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_101 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_102 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_103 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_104 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_105 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_106 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_107 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_108 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_109 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_110 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_111 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_112 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_113 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_114 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_115 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_116 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_117 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_118 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_119 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_120 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_121 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_122 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_123 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_124 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_125 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_126 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_127 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_128 : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        x_is_valid    : in std_logic;
        layer_yo_1 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_2 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_3 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_4 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_5 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_6 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_7 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_8 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_9 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_10 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_11 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_12 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_13 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_14 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_15 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_16 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_17 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_18 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_19 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_20 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_21 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_22 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_23 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_24 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_25 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_26 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_27 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_28 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_29 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_30 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_31 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_32 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_33 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_34 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_35 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_36 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_37 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_38 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_39 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_40 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_41 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_42 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_43 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_44 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_45 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_46 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_47 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_48 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_49 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_50 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_51 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_52 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_53 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_54 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_55 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_56 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_57 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_58 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_59 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_60 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_61 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_62 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_63 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_64 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_65 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_66 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_67 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_68 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_69 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_70 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_71 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_72 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_73 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_74 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_75 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_76 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_77 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_78 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_79 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_80 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_81 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_82 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_83 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_84 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_85 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_86 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_87 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_88 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_89 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_90 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_91 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_92 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_93 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_94 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_95 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_96 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_97 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_98 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_99 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_100 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_101 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_102 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_103 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_104 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_105 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_106 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_107 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_108 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_109 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_110 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_111 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_112 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_113 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_114 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_115 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_116 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_117 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_118 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_119 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_120 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_121 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_122 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_123 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_124 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_125 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_126 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_127 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        layer_yo_128 : in std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        y_valid    : in std_logic

    ) ;
end conv23_act_sim_validator;

architecture Behavioral of conv23_act_sim_validator is



begin

validation_process: if IS_IN_SIMULATION generate

    validate_outputs: process(clk, reset)

        file tf_outputs_file : text open read_mode is PROJ_SIMULATION_ROOT_PATH &  "conv23_act_tf_outputs.csv";
        
        file valid_only_output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv23_act_sim_only_valid_outputs.csv";
        file since_first_valid_input_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv23_act_sim_inputs_since_first_valid_input.csv";
        file error_only_output_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv23_act_sim_only_valid_outputs.csv.error";
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
        variable tf_layer_yo_1 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_2 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_3 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_4 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_5 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_6 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_7 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_8 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_9 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_10 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_11 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_12 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_13 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_14 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_15 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_16 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_17 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_18 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_19 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_20 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_21 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_22 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_23 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_24 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_25 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_26 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_27 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_28 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_29 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_30 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_31 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_32 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_33 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_34 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_35 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_36 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_37 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_38 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_39 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_40 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_41 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_42 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_43 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_44 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_45 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_46 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_47 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_48 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_49 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_50 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_51 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_52 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_53 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_54 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_55 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_56 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_57 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_58 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_59 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_60 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_61 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_62 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_63 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_64 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_65 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_66 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_67 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_68 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_69 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_70 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_71 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_72 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_73 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_74 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_75 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_76 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_77 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_78 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_79 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_80 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_81 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_82 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_83 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_84 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_85 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_86 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_87 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_88 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_89 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_90 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_91 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_92 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_93 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_94 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_95 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_96 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_97 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_98 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_99 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_100 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_101 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_102 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_103 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_104 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_105 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_106 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_107 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_108 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_109 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_110 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_111 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_112 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_113 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_114 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_115 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_116 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_117 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_118 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_119 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_120 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_121 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_122 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_123 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_124 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_125 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_126 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_127 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
        variable tf_layer_yo_128 : std_logic_vector(7-1 downto 0); --	ufix(2, -5)
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
                file_open(tf_outputs_file, PROJ_SIMULATION_ROOT_PATH &  "conv23_act_tf_outputs.csv", read_mode);
                just_once := 1;
                report "OUTPUT VALIDATION IS ACTIVE FOR conv23_act." severity note;
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
                write(line_out, integer'image(to_integer(signed(layer_xi_4))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_5))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_6))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_7))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_8))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_9))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_10))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_11))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_12))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_13))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_14))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_15))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_16))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_17))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_18))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_19))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_20))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_21))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_22))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_23))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_24))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_25))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_26))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_27))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_28))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_29))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_30))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_31))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_32))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_33))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_34))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_35))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_36))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_37))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_38))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_39))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_40))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_41))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_42))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_43))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_44))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_45))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_46))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_47))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_48))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_49))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_50))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_51))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_52))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_53))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_54))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_55))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_56))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_57))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_58))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_59))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_60))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_61))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_62))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_63))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_64))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_65))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_66))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_67))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_68))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_69))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_70))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_71))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_72))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_73))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_74))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_75))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_76))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_77))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_78))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_79))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_80))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_81))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_82))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_83))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_84))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_85))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_86))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_87))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_88))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_89))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_90))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_91))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_92))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_93))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_94))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_95))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_96))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_97))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_98))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_99))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_100))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_101))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_102))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_103))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_104))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_105))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_106))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_107))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_108))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_109))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_110))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_111))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_112))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_113))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_114))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_115))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_116))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_117))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_118))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_119))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_120))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_121))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_122))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_123))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_124))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_125))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_126))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_127))));
                write(line_out, string'(" "));
                write(line_out, integer'image(to_integer(signed(layer_xi_128))));
                write(line_out, string'(" "));
                writeline(since_first_valid_input_file, line_out);
            end if;

            if y_valid = '1' then
                valid_output_counter := valid_output_counter + 1;
                if valid_output_counter = total_lines and got_last_valid_output = 0 then
                    report "GOT LAST VALID OUTPUT FOR conv23_act." severity note;
                    got_last_valid_output := 1;
                end if;
                if just_once_first_rep = 0 then
                    report "GOT FIRST VALID OUTPUT FOR conv23_act." severity note;
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
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_65 := conv_std_logic_vector(tf_output, tf_layer_yo_65'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_66 := conv_std_logic_vector(tf_output, tf_layer_yo_66'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_67 := conv_std_logic_vector(tf_output, tf_layer_yo_67'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_68 := conv_std_logic_vector(tf_output, tf_layer_yo_68'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_69 := conv_std_logic_vector(tf_output, tf_layer_yo_69'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_70 := conv_std_logic_vector(tf_output, tf_layer_yo_70'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_71 := conv_std_logic_vector(tf_output, tf_layer_yo_71'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_72 := conv_std_logic_vector(tf_output, tf_layer_yo_72'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_73 := conv_std_logic_vector(tf_output, tf_layer_yo_73'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_74 := conv_std_logic_vector(tf_output, tf_layer_yo_74'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_75 := conv_std_logic_vector(tf_output, tf_layer_yo_75'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_76 := conv_std_logic_vector(tf_output, tf_layer_yo_76'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_77 := conv_std_logic_vector(tf_output, tf_layer_yo_77'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_78 := conv_std_logic_vector(tf_output, tf_layer_yo_78'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_79 := conv_std_logic_vector(tf_output, tf_layer_yo_79'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_80 := conv_std_logic_vector(tf_output, tf_layer_yo_80'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_81 := conv_std_logic_vector(tf_output, tf_layer_yo_81'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_82 := conv_std_logic_vector(tf_output, tf_layer_yo_82'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_83 := conv_std_logic_vector(tf_output, tf_layer_yo_83'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_84 := conv_std_logic_vector(tf_output, tf_layer_yo_84'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_85 := conv_std_logic_vector(tf_output, tf_layer_yo_85'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_86 := conv_std_logic_vector(tf_output, tf_layer_yo_86'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_87 := conv_std_logic_vector(tf_output, tf_layer_yo_87'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_88 := conv_std_logic_vector(tf_output, tf_layer_yo_88'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_89 := conv_std_logic_vector(tf_output, tf_layer_yo_89'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_90 := conv_std_logic_vector(tf_output, tf_layer_yo_90'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_91 := conv_std_logic_vector(tf_output, tf_layer_yo_91'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_92 := conv_std_logic_vector(tf_output, tf_layer_yo_92'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_93 := conv_std_logic_vector(tf_output, tf_layer_yo_93'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_94 := conv_std_logic_vector(tf_output, tf_layer_yo_94'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_95 := conv_std_logic_vector(tf_output, tf_layer_yo_95'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_96 := conv_std_logic_vector(tf_output, tf_layer_yo_96'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_97 := conv_std_logic_vector(tf_output, tf_layer_yo_97'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_98 := conv_std_logic_vector(tf_output, tf_layer_yo_98'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_99 := conv_std_logic_vector(tf_output, tf_layer_yo_99'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_100 := conv_std_logic_vector(tf_output, tf_layer_yo_100'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_101 := conv_std_logic_vector(tf_output, tf_layer_yo_101'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_102 := conv_std_logic_vector(tf_output, tf_layer_yo_102'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_103 := conv_std_logic_vector(tf_output, tf_layer_yo_103'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_104 := conv_std_logic_vector(tf_output, tf_layer_yo_104'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_105 := conv_std_logic_vector(tf_output, tf_layer_yo_105'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_106 := conv_std_logic_vector(tf_output, tf_layer_yo_106'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_107 := conv_std_logic_vector(tf_output, tf_layer_yo_107'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_108 := conv_std_logic_vector(tf_output, tf_layer_yo_108'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_109 := conv_std_logic_vector(tf_output, tf_layer_yo_109'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_110 := conv_std_logic_vector(tf_output, tf_layer_yo_110'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_111 := conv_std_logic_vector(tf_output, tf_layer_yo_111'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_112 := conv_std_logic_vector(tf_output, tf_layer_yo_112'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_113 := conv_std_logic_vector(tf_output, tf_layer_yo_113'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_114 := conv_std_logic_vector(tf_output, tf_layer_yo_114'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_115 := conv_std_logic_vector(tf_output, tf_layer_yo_115'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_116 := conv_std_logic_vector(tf_output, tf_layer_yo_116'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_117 := conv_std_logic_vector(tf_output, tf_layer_yo_117'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_118 := conv_std_logic_vector(tf_output, tf_layer_yo_118'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_119 := conv_std_logic_vector(tf_output, tf_layer_yo_119'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_120 := conv_std_logic_vector(tf_output, tf_layer_yo_120'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_121 := conv_std_logic_vector(tf_output, tf_layer_yo_121'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_122 := conv_std_logic_vector(tf_output, tf_layer_yo_122'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_123 := conv_std_logic_vector(tf_output, tf_layer_yo_123'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_124 := conv_std_logic_vector(tf_output, tf_layer_yo_124'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_125 := conv_std_logic_vector(tf_output, tf_layer_yo_125'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_126 := conv_std_logic_vector(tf_output, tf_layer_yo_126'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_127 := conv_std_logic_vector(tf_output, tf_layer_yo_127'length);
                    read(tf_line_buf, tf_output);
                    tf_layer_yo_128 := conv_std_logic_vector(tf_output, tf_layer_yo_128'length);write(line_out, integer'image(to_integer(unsigned(layer_yo_1))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_2))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_3))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_4))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_5))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_6))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_7))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_8))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_9))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_10))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_11))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_12))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_13))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_14))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_15))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_16))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_17))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_18))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_19))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_20))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_21))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_22))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_23))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_24))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_25))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_26))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_27))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_28))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_29))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_30))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_31))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_32))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_33))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_34))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_35))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_36))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_37))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_38))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_39))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_40))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_41))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_42))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_43))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_44))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_45))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_46))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_47))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_48))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_49))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_50))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_51))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_52))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_53))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_54))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_55))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_56))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_57))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_58))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_59))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_60))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_61))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_62))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_63))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_64))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_65))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_66))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_67))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_68))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_69))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_70))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_71))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_72))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_73))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_74))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_75))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_76))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_77))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_78))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_79))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_80))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_81))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_82))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_83))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_84))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_85))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_86))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_87))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_88))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_89))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_90))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_91))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_92))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_93))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_94))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_95))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_96))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_97))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_98))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_99))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_100))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_101))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_102))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_103))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_104))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_105))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_106))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_107))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_108))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_109))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_110))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_111))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_112))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_113))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_114))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_115))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_116))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_117))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_118))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_119))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_120))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_121))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_122))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_123))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_124))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_125))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_126))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_127))));
                    write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_128))));
                    write(line_out, string'(" "));
                    writeline(valid_only_output_num_file, line_out);

                    if layer_yo_1 /=  tf_layer_yo_1 or  layer_yo_2 /=  tf_layer_yo_2 or  layer_yo_3 /=  tf_layer_yo_3 or  layer_yo_4 /=  tf_layer_yo_4 or  layer_yo_5 /=  tf_layer_yo_5 or  layer_yo_6 /=  tf_layer_yo_6 or  layer_yo_7 /=  tf_layer_yo_7 or  layer_yo_8 /=  tf_layer_yo_8 or  layer_yo_9 /=  tf_layer_yo_9 or  layer_yo_10 /=  tf_layer_yo_10 or  layer_yo_11 /=  tf_layer_yo_11 or  layer_yo_12 /=  tf_layer_yo_12 or  layer_yo_13 /=  tf_layer_yo_13 or  layer_yo_14 /=  tf_layer_yo_14 or  layer_yo_15 /=  tf_layer_yo_15 or  layer_yo_16 /=  tf_layer_yo_16 or  layer_yo_17 /=  tf_layer_yo_17 or  layer_yo_18 /=  tf_layer_yo_18 or  layer_yo_19 /=  tf_layer_yo_19 or  layer_yo_20 /=  tf_layer_yo_20 or  layer_yo_21 /=  tf_layer_yo_21 or  layer_yo_22 /=  tf_layer_yo_22 or  layer_yo_23 /=  tf_layer_yo_23 or  layer_yo_24 /=  tf_layer_yo_24 or  layer_yo_25 /=  tf_layer_yo_25 or  layer_yo_26 /=  tf_layer_yo_26 or  layer_yo_27 /=  tf_layer_yo_27 or  layer_yo_28 /=  tf_layer_yo_28 or  layer_yo_29 /=  tf_layer_yo_29 or  layer_yo_30 /=  tf_layer_yo_30 or  layer_yo_31 /=  tf_layer_yo_31 or  layer_yo_32 /=  tf_layer_yo_32 or  layer_yo_33 /=  tf_layer_yo_33 or  layer_yo_34 /=  tf_layer_yo_34 or  layer_yo_35 /=  tf_layer_yo_35 or  layer_yo_36 /=  tf_layer_yo_36 or  layer_yo_37 /=  tf_layer_yo_37 or  layer_yo_38 /=  tf_layer_yo_38 or  layer_yo_39 /=  tf_layer_yo_39 or  layer_yo_40 /=  tf_layer_yo_40 or  layer_yo_41 /=  tf_layer_yo_41 or  layer_yo_42 /=  tf_layer_yo_42 or  layer_yo_43 /=  tf_layer_yo_43 or  layer_yo_44 /=  tf_layer_yo_44 or  layer_yo_45 /=  tf_layer_yo_45 or  layer_yo_46 /=  tf_layer_yo_46 or  layer_yo_47 /=  tf_layer_yo_47 or  layer_yo_48 /=  tf_layer_yo_48 or  layer_yo_49 /=  tf_layer_yo_49 or  layer_yo_50 /=  tf_layer_yo_50 or  layer_yo_51 /=  tf_layer_yo_51 or  layer_yo_52 /=  tf_layer_yo_52 or  layer_yo_53 /=  tf_layer_yo_53 or  layer_yo_54 /=  tf_layer_yo_54 or  layer_yo_55 /=  tf_layer_yo_55 or  layer_yo_56 /=  tf_layer_yo_56 or  layer_yo_57 /=  tf_layer_yo_57 or  layer_yo_58 /=  tf_layer_yo_58 or  layer_yo_59 /=  tf_layer_yo_59 or  layer_yo_60 /=  tf_layer_yo_60 or  layer_yo_61 /=  tf_layer_yo_61 or  layer_yo_62 /=  tf_layer_yo_62 or  layer_yo_63 /=  tf_layer_yo_63 or  layer_yo_64 /=  tf_layer_yo_64 or  layer_yo_65 /=  tf_layer_yo_65 or  layer_yo_66 /=  tf_layer_yo_66 or  layer_yo_67 /=  tf_layer_yo_67 or  layer_yo_68 /=  tf_layer_yo_68 or  layer_yo_69 /=  tf_layer_yo_69 or  layer_yo_70 /=  tf_layer_yo_70 or  layer_yo_71 /=  tf_layer_yo_71 or  layer_yo_72 /=  tf_layer_yo_72 or  layer_yo_73 /=  tf_layer_yo_73 or  layer_yo_74 /=  tf_layer_yo_74 or  layer_yo_75 /=  tf_layer_yo_75 or  layer_yo_76 /=  tf_layer_yo_76 or  layer_yo_77 /=  tf_layer_yo_77 or  layer_yo_78 /=  tf_layer_yo_78 or  layer_yo_79 /=  tf_layer_yo_79 or  layer_yo_80 /=  tf_layer_yo_80 or  layer_yo_81 /=  tf_layer_yo_81 or  layer_yo_82 /=  tf_layer_yo_82 or  layer_yo_83 /=  tf_layer_yo_83 or  layer_yo_84 /=  tf_layer_yo_84 or  layer_yo_85 /=  tf_layer_yo_85 or  layer_yo_86 /=  tf_layer_yo_86 or  layer_yo_87 /=  tf_layer_yo_87 or  layer_yo_88 /=  tf_layer_yo_88 or  layer_yo_89 /=  tf_layer_yo_89 or  layer_yo_90 /=  tf_layer_yo_90 or  layer_yo_91 /=  tf_layer_yo_91 or  layer_yo_92 /=  tf_layer_yo_92 or  layer_yo_93 /=  tf_layer_yo_93 or  layer_yo_94 /=  tf_layer_yo_94 or  layer_yo_95 /=  tf_layer_yo_95 or  layer_yo_96 /=  tf_layer_yo_96 or  layer_yo_97 /=  tf_layer_yo_97 or  layer_yo_98 /=  tf_layer_yo_98 or  layer_yo_99 /=  tf_layer_yo_99 or  layer_yo_100 /=  tf_layer_yo_100 or  layer_yo_101 /=  tf_layer_yo_101 or  layer_yo_102 /=  tf_layer_yo_102 or  layer_yo_103 /=  tf_layer_yo_103 or  layer_yo_104 /=  tf_layer_yo_104 or  layer_yo_105 /=  tf_layer_yo_105 or  layer_yo_106 /=  tf_layer_yo_106 or  layer_yo_107 /=  tf_layer_yo_107 or  layer_yo_108 /=  tf_layer_yo_108 or  layer_yo_109 /=  tf_layer_yo_109 or  layer_yo_110 /=  tf_layer_yo_110 or  layer_yo_111 /=  tf_layer_yo_111 or  layer_yo_112 /=  tf_layer_yo_112 or  layer_yo_113 /=  tf_layer_yo_113 or  layer_yo_114 /=  tf_layer_yo_114 or  layer_yo_115 /=  tf_layer_yo_115 or  layer_yo_116 /=  tf_layer_yo_116 or  layer_yo_117 /=  tf_layer_yo_117 or  layer_yo_118 /=  tf_layer_yo_118 or  layer_yo_119 /=  tf_layer_yo_119 or  layer_yo_120 /=  tf_layer_yo_120 or  layer_yo_121 /=  tf_layer_yo_121 or  layer_yo_122 /=  tf_layer_yo_122 or  layer_yo_123 /=  tf_layer_yo_123 or  layer_yo_124 /=  tf_layer_yo_124 or  layer_yo_125 /=  tf_layer_yo_125 or  layer_yo_126 /=  tf_layer_yo_126 or  layer_yo_127 /=  tf_layer_yo_127 or  layer_yo_128 /=  tf_layer_yo_128  then
                      write(line_out, integer'image(to_integer(unsigned(layer_yo_1))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_2))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_3))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_4))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_5))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_6))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_7))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_8))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_9))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_10))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_11))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_12))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_13))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_14))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_15))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_16))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_17))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_18))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_19))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_20))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_21))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_22))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_23))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_24))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_25))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_26))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_27))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_28))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_29))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_30))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_31))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_32))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_33))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_34))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_35))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_36))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_37))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_38))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_39))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_40))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_41))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_42))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_43))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_44))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_45))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_46))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_47))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_48))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_49))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_50))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_51))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_52))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_53))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_54))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_55))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_56))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_57))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_58))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_59))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_60))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_61))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_62))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_63))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_64))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_65))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_66))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_67))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_68))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_69))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_70))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_71))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_72))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_73))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_74))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_75))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_76))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_77))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_78))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_79))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_80))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_81))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_82))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_83))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_84))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_85))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_86))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_87))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_88))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_89))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_90))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_91))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_92))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_93))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_94))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_95))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_96))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_97))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_98))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_99))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_100))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_101))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_102))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_103))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_104))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_105))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_106))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_107))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_108))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_109))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_110))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_111))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_112))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_113))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_114))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_115))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_116))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_117))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_118))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_119))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_120))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_121))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_122))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_123))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_124))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_125))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_126))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_127))));
                        write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_128))));
                        write(line_out, string'(" "));
                        writeline(error_only_output_file, line_out);

                        if error_write_out_count < 10 then
                            error_write_out_count := error_write_out_count + 1;
                            report "VALID OUTPUT MISMATCH (" & integer'image(valid_output_counter) & "/" & integer'image(total_lines) & ") roughly when reading the " & integer'image(valid_input_counter) & " input and at " & integer'image(input_counter) & " cycles since the first valid input FOR LAYER conv23_act " &integer'image(to_integer(unsigned(layer_yo_1))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_1))) & " " & integer'image(to_integer(unsigned(layer_yo_2))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_2))) & " " & integer'image(to_integer(unsigned(layer_yo_3))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_3))) & " " & integer'image(to_integer(unsigned(layer_yo_4))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_4))) & " " & integer'image(to_integer(unsigned(layer_yo_5))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_5))) & " " & integer'image(to_integer(unsigned(layer_yo_6))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_6))) & " " & integer'image(to_integer(unsigned(layer_yo_7))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_7))) & " " & integer'image(to_integer(unsigned(layer_yo_8))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_8))) & " " & integer'image(to_integer(unsigned(layer_yo_9))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_9))) & " " & integer'image(to_integer(unsigned(layer_yo_10))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_10))) & " " & integer'image(to_integer(unsigned(layer_yo_11))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_11))) & " " & integer'image(to_integer(unsigned(layer_yo_12))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_12))) & " " & integer'image(to_integer(unsigned(layer_yo_13))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_13))) & " " & integer'image(to_integer(unsigned(layer_yo_14))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_14))) & " " & integer'image(to_integer(unsigned(layer_yo_15))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_15))) & " " & integer'image(to_integer(unsigned(layer_yo_16))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_16))) & " " & integer'image(to_integer(unsigned(layer_yo_17))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_17))) & " " & integer'image(to_integer(unsigned(layer_yo_18))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_18))) & " " & integer'image(to_integer(unsigned(layer_yo_19))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_19))) & " " & integer'image(to_integer(unsigned(layer_yo_20))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_20))) & " " & integer'image(to_integer(unsigned(layer_yo_21))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_21))) & " " & integer'image(to_integer(unsigned(layer_yo_22))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_22))) & " " & integer'image(to_integer(unsigned(layer_yo_23))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_23))) & " " & integer'image(to_integer(unsigned(layer_yo_24))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_24))) & " " & integer'image(to_integer(unsigned(layer_yo_25))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_25))) & " " & integer'image(to_integer(unsigned(layer_yo_26))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_26))) & " " & integer'image(to_integer(unsigned(layer_yo_27))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_27))) & " " & integer'image(to_integer(unsigned(layer_yo_28))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_28))) & " " & integer'image(to_integer(unsigned(layer_yo_29))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_29))) & " " & integer'image(to_integer(unsigned(layer_yo_30))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_30))) & " " & integer'image(to_integer(unsigned(layer_yo_31))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_31))) & " " & integer'image(to_integer(unsigned(layer_yo_32))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_32))) & " " & integer'image(to_integer(unsigned(layer_yo_33))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_33))) & " " & integer'image(to_integer(unsigned(layer_yo_34))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_34))) & " " & integer'image(to_integer(unsigned(layer_yo_35))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_35))) & " " & integer'image(to_integer(unsigned(layer_yo_36))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_36))) & " " & integer'image(to_integer(unsigned(layer_yo_37))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_37))) & " " & integer'image(to_integer(unsigned(layer_yo_38))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_38))) & " " & integer'image(to_integer(unsigned(layer_yo_39))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_39))) & " " & integer'image(to_integer(unsigned(layer_yo_40))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_40))) & " " & integer'image(to_integer(unsigned(layer_yo_41))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_41))) & " " & integer'image(to_integer(unsigned(layer_yo_42))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_42))) & " " & integer'image(to_integer(unsigned(layer_yo_43))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_43))) & " " & integer'image(to_integer(unsigned(layer_yo_44))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_44))) & " " & integer'image(to_integer(unsigned(layer_yo_45))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_45))) & " " & integer'image(to_integer(unsigned(layer_yo_46))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_46))) & " " & integer'image(to_integer(unsigned(layer_yo_47))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_47))) & " " & integer'image(to_integer(unsigned(layer_yo_48))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_48))) & " " & integer'image(to_integer(unsigned(layer_yo_49))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_49))) & " " & integer'image(to_integer(unsigned(layer_yo_50))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_50))) & " " & integer'image(to_integer(unsigned(layer_yo_51))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_51))) & " " & integer'image(to_integer(unsigned(layer_yo_52))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_52))) & " " & integer'image(to_integer(unsigned(layer_yo_53))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_53))) & " " & integer'image(to_integer(unsigned(layer_yo_54))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_54))) & " " & integer'image(to_integer(unsigned(layer_yo_55))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_55))) & " " & integer'image(to_integer(unsigned(layer_yo_56))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_56))) & " " & integer'image(to_integer(unsigned(layer_yo_57))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_57))) & " " & integer'image(to_integer(unsigned(layer_yo_58))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_58))) & " " & integer'image(to_integer(unsigned(layer_yo_59))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_59))) & " " & integer'image(to_integer(unsigned(layer_yo_60))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_60))) & " " & integer'image(to_integer(unsigned(layer_yo_61))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_61))) & " " & integer'image(to_integer(unsigned(layer_yo_62))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_62))) & " " & integer'image(to_integer(unsigned(layer_yo_63))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_63))) & " " & integer'image(to_integer(unsigned(layer_yo_64))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_64))) & " " & integer'image(to_integer(unsigned(layer_yo_65))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_65))) & " " & integer'image(to_integer(unsigned(layer_yo_66))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_66))) & " " & integer'image(to_integer(unsigned(layer_yo_67))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_67))) & " " & integer'image(to_integer(unsigned(layer_yo_68))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_68))) & " " & integer'image(to_integer(unsigned(layer_yo_69))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_69))) & " " & integer'image(to_integer(unsigned(layer_yo_70))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_70))) & " " & integer'image(to_integer(unsigned(layer_yo_71))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_71))) & " " & integer'image(to_integer(unsigned(layer_yo_72))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_72))) & " " & integer'image(to_integer(unsigned(layer_yo_73))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_73))) & " " & integer'image(to_integer(unsigned(layer_yo_74))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_74))) & " " & integer'image(to_integer(unsigned(layer_yo_75))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_75))) & " " & integer'image(to_integer(unsigned(layer_yo_76))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_76))) & " " & integer'image(to_integer(unsigned(layer_yo_77))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_77))) & " " & integer'image(to_integer(unsigned(layer_yo_78))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_78))) & " " & integer'image(to_integer(unsigned(layer_yo_79))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_79))) & " " & integer'image(to_integer(unsigned(layer_yo_80))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_80))) & " " & integer'image(to_integer(unsigned(layer_yo_81))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_81))) & " " & integer'image(to_integer(unsigned(layer_yo_82))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_82))) & " " & integer'image(to_integer(unsigned(layer_yo_83))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_83))) & " " & integer'image(to_integer(unsigned(layer_yo_84))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_84))) & " " & integer'image(to_integer(unsigned(layer_yo_85))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_85))) & " " & integer'image(to_integer(unsigned(layer_yo_86))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_86))) & " " & integer'image(to_integer(unsigned(layer_yo_87))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_87))) & " " & integer'image(to_integer(unsigned(layer_yo_88))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_88))) & " " & integer'image(to_integer(unsigned(layer_yo_89))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_89))) & " " & integer'image(to_integer(unsigned(layer_yo_90))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_90))) & " " & integer'image(to_integer(unsigned(layer_yo_91))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_91))) & " " & integer'image(to_integer(unsigned(layer_yo_92))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_92))) & " " & integer'image(to_integer(unsigned(layer_yo_93))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_93))) & " " & integer'image(to_integer(unsigned(layer_yo_94))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_94))) & " " & integer'image(to_integer(unsigned(layer_yo_95))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_95))) & " " & integer'image(to_integer(unsigned(layer_yo_96))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_96))) & " " & integer'image(to_integer(unsigned(layer_yo_97))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_97))) & " " & integer'image(to_integer(unsigned(layer_yo_98))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_98))) & " " & integer'image(to_integer(unsigned(layer_yo_99))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_99))) & " " & integer'image(to_integer(unsigned(layer_yo_100))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_100))) & " " & integer'image(to_integer(unsigned(layer_yo_101))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_101))) & " " & integer'image(to_integer(unsigned(layer_yo_102))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_102))) & " " & integer'image(to_integer(unsigned(layer_yo_103))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_103))) & " " & integer'image(to_integer(unsigned(layer_yo_104))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_104))) & " " & integer'image(to_integer(unsigned(layer_yo_105))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_105))) & " " & integer'image(to_integer(unsigned(layer_yo_106))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_106))) & " " & integer'image(to_integer(unsigned(layer_yo_107))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_107))) & " " & integer'image(to_integer(unsigned(layer_yo_108))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_108))) & " " & integer'image(to_integer(unsigned(layer_yo_109))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_109))) & " " & integer'image(to_integer(unsigned(layer_yo_110))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_110))) & " " & integer'image(to_integer(unsigned(layer_yo_111))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_111))) & " " & integer'image(to_integer(unsigned(layer_yo_112))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_112))) & " " & integer'image(to_integer(unsigned(layer_yo_113))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_113))) & " " & integer'image(to_integer(unsigned(layer_yo_114))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_114))) & " " & integer'image(to_integer(unsigned(layer_yo_115))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_115))) & " " & integer'image(to_integer(unsigned(layer_yo_116))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_116))) & " " & integer'image(to_integer(unsigned(layer_yo_117))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_117))) & " " & integer'image(to_integer(unsigned(layer_yo_118))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_118))) & " " & integer'image(to_integer(unsigned(layer_yo_119))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_119))) & " " & integer'image(to_integer(unsigned(layer_yo_120))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_120))) & " " & integer'image(to_integer(unsigned(layer_yo_121))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_121))) & " " & integer'image(to_integer(unsigned(layer_yo_122))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_122))) & " " & integer'image(to_integer(unsigned(layer_yo_123))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_123))) & " " & integer'image(to_integer(unsigned(layer_yo_124))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_124))) & " " & integer'image(to_integer(unsigned(layer_yo_125))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_125))) & " " & integer'image(to_integer(unsigned(layer_yo_126))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_126))) & " " & integer'image(to_integer(unsigned(layer_yo_127))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_127))) & " " & integer'image(to_integer(unsigned(layer_yo_128))) & "!=" & integer'image(to_integer(unsigned(tf_layer_yo_128))) & " "
                                severity ERROR;
                        elsif error_write_out_count = 10 then
                            error_write_out_count := error_write_out_count + 1;
                            report "VALID OUTPUT MISMATCH FOR LAYER conv23_act too many. Stopping to report further errors!" severity ERROR;
                        end if;
                    end if;
                else
                    if just_once_over_rep = 0 then
                        report "GOT MORE VALID OUTPUTS THAN EXPECTED! conv23_act!!" severity ERROR;
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