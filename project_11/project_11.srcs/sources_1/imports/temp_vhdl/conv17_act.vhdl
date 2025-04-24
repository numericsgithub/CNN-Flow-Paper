LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
use work.ActivationFunctions.all;
use work.conv17_act_settings.all;

entity conv17_act is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_2    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_3    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_4    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_5    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_6    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_7    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_8    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_9    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_10    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_11    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_12    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_13    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_14    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_15    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_16    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_17    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_18    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_19    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_20    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_21    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_22    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_23    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_24    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_25    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_26    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_27    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_28    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_29    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_30    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_31    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_32    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_33    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_34    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_35    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_36    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_37    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_38    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_39    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_40    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_41    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_42    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_43    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_44    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_45    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_46    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_47    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_48    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_49    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_50    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_51    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_52    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_53    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_54    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_55    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_56    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_57    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_58    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_59    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_60    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_61    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_62    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_63    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_64    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_65    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_66    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_67    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_68    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_69    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_70    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_71    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_72    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_73    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_74    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_75    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_76    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_77    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_78    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_79    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_80    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_81    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_82    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_83    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_84    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_85    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_86    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_87    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_88    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_89    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_90    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_91    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_92    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_93    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_94    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_95    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_96    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_97    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_98    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_99    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_100    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_101    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_102    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_103    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_104    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_105    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_106    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_107    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_108    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_109    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_110    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_111    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_112    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_113    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_114    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_115    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_116    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_117    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_118    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_119    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_120    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_121    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_122    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_123    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_124    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_125    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_126    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_127    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        layer_xi_128    : in std_logic_vector(8-1 downto 0); --	sfix(3, -5)
        x_is_valid    : in std_logic;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_2 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_3 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_4 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_5 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_6 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_7 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_8 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_9 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_10 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_11 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_12 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_13 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_14 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_15 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_16 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_17 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_18 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_19 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_20 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_21 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_22 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_23 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_24 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_25 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_26 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_27 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_28 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_29 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_30 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_31 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_32 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_33 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_34 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_35 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_36 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_37 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_38 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_39 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_40 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_41 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_42 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_43 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_44 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_45 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_46 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_47 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_48 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_49 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_50 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_51 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_52 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_53 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_54 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_55 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_56 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_57 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_58 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_59 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_60 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_61 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_62 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_63 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_64 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_65 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_66 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_67 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_68 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_69 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_70 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_71 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_72 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_73 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_74 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_75 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_76 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_77 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_78 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_79 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_80 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_81 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_82 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_83 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_84 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_85 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_86 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_87 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_88 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_89 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_90 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_91 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_92 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_93 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_94 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_95 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_96 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_97 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_98 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_99 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_100 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_101 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_102 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_103 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_104 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_105 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_106 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_107 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_108 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_109 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_110 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_111 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_112 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_113 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_114 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_115 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_116 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_117 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_118 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_119 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_120 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_121 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_122 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_123 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_124 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_125 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_126 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_127 : out std_logic_vector(7-1 downto 0);  --	ufix(2, -5)
        layer_yo_128 : out std_logic_vector(7-1 downto 0) --	ufix(2, -5)
    ) ;
end conv17_act;

architecture Behavioral of conv17_act is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv17_act : entity is "yes";

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
    type PIPELINE_TYPE_FOR_LAYER_XI_17_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_18_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_19_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_20_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_21_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_22_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_23_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_24_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_25_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_26_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_27_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_28_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_29_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_30_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_31_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_32_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_33_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_34_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_35_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_36_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_37_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_38_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_39_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_40_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_41_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_42_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_43_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_44_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_45_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_46_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_47_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_48_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_49_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_50_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_51_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_52_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_53_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_54_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_55_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_56_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_57_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_58_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_59_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_60_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_61_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_62_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_63_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_64_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_65_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_66_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_67_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_68_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_69_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_70_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_71_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_72_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_73_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_74_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_75_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_76_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_77_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_78_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_79_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_80_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_81_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_82_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_83_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_84_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_85_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_86_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_87_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_88_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_89_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_90_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_91_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_92_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_93_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_94_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_95_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_96_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_97_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_98_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_99_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_100_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_101_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_102_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_103_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_104_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_105_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_106_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_107_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_108_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_109_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_110_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_111_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_112_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_113_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_114_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_115_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_116_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_117_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_118_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_119_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_120_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_121_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_122_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_123_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_124_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_125_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_126_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_127_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_128_SIGNAL  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_X_IS_VALID_SIGNAL    is array(0 to 1) of std_logic;


    -- sfix(3, -5)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_2_signal    : PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_3_signal    : PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_4_signal    : PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_5_signal    : PIPELINE_TYPE_FOR_LAYER_XI_5_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_6_signal    : PIPELINE_TYPE_FOR_LAYER_XI_6_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_7_signal    : PIPELINE_TYPE_FOR_LAYER_XI_7_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_8_signal    : PIPELINE_TYPE_FOR_LAYER_XI_8_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_9_signal    : PIPELINE_TYPE_FOR_LAYER_XI_9_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_10_signal   : PIPELINE_TYPE_FOR_LAYER_XI_10_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_11_signal   : PIPELINE_TYPE_FOR_LAYER_XI_11_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_12_signal   : PIPELINE_TYPE_FOR_LAYER_XI_12_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_13_signal   : PIPELINE_TYPE_FOR_LAYER_XI_13_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_14_signal   : PIPELINE_TYPE_FOR_LAYER_XI_14_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_15_signal   : PIPELINE_TYPE_FOR_LAYER_XI_15_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_16_signal   : PIPELINE_TYPE_FOR_LAYER_XI_16_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_17_signal   : PIPELINE_TYPE_FOR_LAYER_XI_17_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_18_signal   : PIPELINE_TYPE_FOR_LAYER_XI_18_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_19_signal   : PIPELINE_TYPE_FOR_LAYER_XI_19_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_20_signal   : PIPELINE_TYPE_FOR_LAYER_XI_20_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_21_signal   : PIPELINE_TYPE_FOR_LAYER_XI_21_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_22_signal   : PIPELINE_TYPE_FOR_LAYER_XI_22_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_23_signal   : PIPELINE_TYPE_FOR_LAYER_XI_23_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_24_signal   : PIPELINE_TYPE_FOR_LAYER_XI_24_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_25_signal   : PIPELINE_TYPE_FOR_LAYER_XI_25_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_26_signal   : PIPELINE_TYPE_FOR_LAYER_XI_26_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_27_signal   : PIPELINE_TYPE_FOR_LAYER_XI_27_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_28_signal   : PIPELINE_TYPE_FOR_LAYER_XI_28_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_29_signal   : PIPELINE_TYPE_FOR_LAYER_XI_29_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_30_signal   : PIPELINE_TYPE_FOR_LAYER_XI_30_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_31_signal   : PIPELINE_TYPE_FOR_LAYER_XI_31_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_32_signal   : PIPELINE_TYPE_FOR_LAYER_XI_32_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_33_signal   : PIPELINE_TYPE_FOR_LAYER_XI_33_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_34_signal   : PIPELINE_TYPE_FOR_LAYER_XI_34_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_35_signal   : PIPELINE_TYPE_FOR_LAYER_XI_35_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_36_signal   : PIPELINE_TYPE_FOR_LAYER_XI_36_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_37_signal   : PIPELINE_TYPE_FOR_LAYER_XI_37_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_38_signal   : PIPELINE_TYPE_FOR_LAYER_XI_38_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_39_signal   : PIPELINE_TYPE_FOR_LAYER_XI_39_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_40_signal   : PIPELINE_TYPE_FOR_LAYER_XI_40_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_41_signal   : PIPELINE_TYPE_FOR_LAYER_XI_41_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_42_signal   : PIPELINE_TYPE_FOR_LAYER_XI_42_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_43_signal   : PIPELINE_TYPE_FOR_LAYER_XI_43_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_44_signal   : PIPELINE_TYPE_FOR_LAYER_XI_44_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_45_signal   : PIPELINE_TYPE_FOR_LAYER_XI_45_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_46_signal   : PIPELINE_TYPE_FOR_LAYER_XI_46_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_47_signal   : PIPELINE_TYPE_FOR_LAYER_XI_47_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_48_signal   : PIPELINE_TYPE_FOR_LAYER_XI_48_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_49_signal   : PIPELINE_TYPE_FOR_LAYER_XI_49_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_50_signal   : PIPELINE_TYPE_FOR_LAYER_XI_50_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_51_signal   : PIPELINE_TYPE_FOR_LAYER_XI_51_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_52_signal   : PIPELINE_TYPE_FOR_LAYER_XI_52_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_53_signal   : PIPELINE_TYPE_FOR_LAYER_XI_53_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_54_signal   : PIPELINE_TYPE_FOR_LAYER_XI_54_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_55_signal   : PIPELINE_TYPE_FOR_LAYER_XI_55_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_56_signal   : PIPELINE_TYPE_FOR_LAYER_XI_56_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_57_signal   : PIPELINE_TYPE_FOR_LAYER_XI_57_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_58_signal   : PIPELINE_TYPE_FOR_LAYER_XI_58_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_59_signal   : PIPELINE_TYPE_FOR_LAYER_XI_59_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_60_signal   : PIPELINE_TYPE_FOR_LAYER_XI_60_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_61_signal   : PIPELINE_TYPE_FOR_LAYER_XI_61_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_62_signal   : PIPELINE_TYPE_FOR_LAYER_XI_62_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_63_signal   : PIPELINE_TYPE_FOR_LAYER_XI_63_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_64_signal   : PIPELINE_TYPE_FOR_LAYER_XI_64_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_65_signal   : PIPELINE_TYPE_FOR_LAYER_XI_65_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_66_signal   : PIPELINE_TYPE_FOR_LAYER_XI_66_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_67_signal   : PIPELINE_TYPE_FOR_LAYER_XI_67_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_68_signal   : PIPELINE_TYPE_FOR_LAYER_XI_68_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_69_signal   : PIPELINE_TYPE_FOR_LAYER_XI_69_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_70_signal   : PIPELINE_TYPE_FOR_LAYER_XI_70_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_71_signal   : PIPELINE_TYPE_FOR_LAYER_XI_71_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_72_signal   : PIPELINE_TYPE_FOR_LAYER_XI_72_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_73_signal   : PIPELINE_TYPE_FOR_LAYER_XI_73_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_74_signal   : PIPELINE_TYPE_FOR_LAYER_XI_74_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_75_signal   : PIPELINE_TYPE_FOR_LAYER_XI_75_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_76_signal   : PIPELINE_TYPE_FOR_LAYER_XI_76_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_77_signal   : PIPELINE_TYPE_FOR_LAYER_XI_77_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_78_signal   : PIPELINE_TYPE_FOR_LAYER_XI_78_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_79_signal   : PIPELINE_TYPE_FOR_LAYER_XI_79_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_80_signal   : PIPELINE_TYPE_FOR_LAYER_XI_80_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_81_signal   : PIPELINE_TYPE_FOR_LAYER_XI_81_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_82_signal   : PIPELINE_TYPE_FOR_LAYER_XI_82_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_83_signal   : PIPELINE_TYPE_FOR_LAYER_XI_83_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_84_signal   : PIPELINE_TYPE_FOR_LAYER_XI_84_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_85_signal   : PIPELINE_TYPE_FOR_LAYER_XI_85_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_86_signal   : PIPELINE_TYPE_FOR_LAYER_XI_86_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_87_signal   : PIPELINE_TYPE_FOR_LAYER_XI_87_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_88_signal   : PIPELINE_TYPE_FOR_LAYER_XI_88_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_89_signal   : PIPELINE_TYPE_FOR_LAYER_XI_89_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_90_signal   : PIPELINE_TYPE_FOR_LAYER_XI_90_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_91_signal   : PIPELINE_TYPE_FOR_LAYER_XI_91_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_92_signal   : PIPELINE_TYPE_FOR_LAYER_XI_92_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_93_signal   : PIPELINE_TYPE_FOR_LAYER_XI_93_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_94_signal   : PIPELINE_TYPE_FOR_LAYER_XI_94_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_95_signal   : PIPELINE_TYPE_FOR_LAYER_XI_95_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_96_signal   : PIPELINE_TYPE_FOR_LAYER_XI_96_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_97_signal   : PIPELINE_TYPE_FOR_LAYER_XI_97_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_98_signal   : PIPELINE_TYPE_FOR_LAYER_XI_98_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_99_signal   : PIPELINE_TYPE_FOR_LAYER_XI_99_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_100_signal  : PIPELINE_TYPE_FOR_LAYER_XI_100_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_101_signal  : PIPELINE_TYPE_FOR_LAYER_XI_101_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_102_signal  : PIPELINE_TYPE_FOR_LAYER_XI_102_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_103_signal  : PIPELINE_TYPE_FOR_LAYER_XI_103_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_104_signal  : PIPELINE_TYPE_FOR_LAYER_XI_104_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_105_signal  : PIPELINE_TYPE_FOR_LAYER_XI_105_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_106_signal  : PIPELINE_TYPE_FOR_LAYER_XI_106_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_107_signal  : PIPELINE_TYPE_FOR_LAYER_XI_107_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_108_signal  : PIPELINE_TYPE_FOR_LAYER_XI_108_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_109_signal  : PIPELINE_TYPE_FOR_LAYER_XI_109_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_110_signal  : PIPELINE_TYPE_FOR_LAYER_XI_110_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_111_signal  : PIPELINE_TYPE_FOR_LAYER_XI_111_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_112_signal  : PIPELINE_TYPE_FOR_LAYER_XI_112_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_113_signal  : PIPELINE_TYPE_FOR_LAYER_XI_113_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_114_signal  : PIPELINE_TYPE_FOR_LAYER_XI_114_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_115_signal  : PIPELINE_TYPE_FOR_LAYER_XI_115_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_116_signal  : PIPELINE_TYPE_FOR_LAYER_XI_116_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_117_signal  : PIPELINE_TYPE_FOR_LAYER_XI_117_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_118_signal  : PIPELINE_TYPE_FOR_LAYER_XI_118_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_119_signal  : PIPELINE_TYPE_FOR_LAYER_XI_119_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_120_signal  : PIPELINE_TYPE_FOR_LAYER_XI_120_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_121_signal  : PIPELINE_TYPE_FOR_LAYER_XI_121_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_122_signal  : PIPELINE_TYPE_FOR_LAYER_XI_122_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_123_signal  : PIPELINE_TYPE_FOR_LAYER_XI_123_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_124_signal  : PIPELINE_TYPE_FOR_LAYER_XI_124_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_125_signal  : PIPELINE_TYPE_FOR_LAYER_XI_125_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_126_signal  : PIPELINE_TYPE_FOR_LAYER_XI_126_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_127_signal  : PIPELINE_TYPE_FOR_LAYER_XI_127_SIGNAL;
    -- sfix(3, -5)
    signal layer_xi_128_signal  : PIPELINE_TYPE_FOR_LAYER_XI_128_SIGNAL;




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
    layer_xi_17_signal(0) <= layer_xi_17;
    layer_xi_18_signal(0) <= layer_xi_18;
    layer_xi_19_signal(0) <= layer_xi_19;
    layer_xi_20_signal(0) <= layer_xi_20;
    layer_xi_21_signal(0) <= layer_xi_21;
    layer_xi_22_signal(0) <= layer_xi_22;
    layer_xi_23_signal(0) <= layer_xi_23;
    layer_xi_24_signal(0) <= layer_xi_24;
    layer_xi_25_signal(0) <= layer_xi_25;
    layer_xi_26_signal(0) <= layer_xi_26;
    layer_xi_27_signal(0) <= layer_xi_27;
    layer_xi_28_signal(0) <= layer_xi_28;
    layer_xi_29_signal(0) <= layer_xi_29;
    layer_xi_30_signal(0) <= layer_xi_30;
    layer_xi_31_signal(0) <= layer_xi_31;
    layer_xi_32_signal(0) <= layer_xi_32;
    layer_xi_33_signal(0) <= layer_xi_33;
    layer_xi_34_signal(0) <= layer_xi_34;
    layer_xi_35_signal(0) <= layer_xi_35;
    layer_xi_36_signal(0) <= layer_xi_36;
    layer_xi_37_signal(0) <= layer_xi_37;
    layer_xi_38_signal(0) <= layer_xi_38;
    layer_xi_39_signal(0) <= layer_xi_39;
    layer_xi_40_signal(0) <= layer_xi_40;
    layer_xi_41_signal(0) <= layer_xi_41;
    layer_xi_42_signal(0) <= layer_xi_42;
    layer_xi_43_signal(0) <= layer_xi_43;
    layer_xi_44_signal(0) <= layer_xi_44;
    layer_xi_45_signal(0) <= layer_xi_45;
    layer_xi_46_signal(0) <= layer_xi_46;
    layer_xi_47_signal(0) <= layer_xi_47;
    layer_xi_48_signal(0) <= layer_xi_48;
    layer_xi_49_signal(0) <= layer_xi_49;
    layer_xi_50_signal(0) <= layer_xi_50;
    layer_xi_51_signal(0) <= layer_xi_51;
    layer_xi_52_signal(0) <= layer_xi_52;
    layer_xi_53_signal(0) <= layer_xi_53;
    layer_xi_54_signal(0) <= layer_xi_54;
    layer_xi_55_signal(0) <= layer_xi_55;
    layer_xi_56_signal(0) <= layer_xi_56;
    layer_xi_57_signal(0) <= layer_xi_57;
    layer_xi_58_signal(0) <= layer_xi_58;
    layer_xi_59_signal(0) <= layer_xi_59;
    layer_xi_60_signal(0) <= layer_xi_60;
    layer_xi_61_signal(0) <= layer_xi_61;
    layer_xi_62_signal(0) <= layer_xi_62;
    layer_xi_63_signal(0) <= layer_xi_63;
    layer_xi_64_signal(0) <= layer_xi_64;
    layer_xi_65_signal(0) <= layer_xi_65;
    layer_xi_66_signal(0) <= layer_xi_66;
    layer_xi_67_signal(0) <= layer_xi_67;
    layer_xi_68_signal(0) <= layer_xi_68;
    layer_xi_69_signal(0) <= layer_xi_69;
    layer_xi_70_signal(0) <= layer_xi_70;
    layer_xi_71_signal(0) <= layer_xi_71;
    layer_xi_72_signal(0) <= layer_xi_72;
    layer_xi_73_signal(0) <= layer_xi_73;
    layer_xi_74_signal(0) <= layer_xi_74;
    layer_xi_75_signal(0) <= layer_xi_75;
    layer_xi_76_signal(0) <= layer_xi_76;
    layer_xi_77_signal(0) <= layer_xi_77;
    layer_xi_78_signal(0) <= layer_xi_78;
    layer_xi_79_signal(0) <= layer_xi_79;
    layer_xi_80_signal(0) <= layer_xi_80;
    layer_xi_81_signal(0) <= layer_xi_81;
    layer_xi_82_signal(0) <= layer_xi_82;
    layer_xi_83_signal(0) <= layer_xi_83;
    layer_xi_84_signal(0) <= layer_xi_84;
    layer_xi_85_signal(0) <= layer_xi_85;
    layer_xi_86_signal(0) <= layer_xi_86;
    layer_xi_87_signal(0) <= layer_xi_87;
    layer_xi_88_signal(0) <= layer_xi_88;
    layer_xi_89_signal(0) <= layer_xi_89;
    layer_xi_90_signal(0) <= layer_xi_90;
    layer_xi_91_signal(0) <= layer_xi_91;
    layer_xi_92_signal(0) <= layer_xi_92;
    layer_xi_93_signal(0) <= layer_xi_93;
    layer_xi_94_signal(0) <= layer_xi_94;
    layer_xi_95_signal(0) <= layer_xi_95;
    layer_xi_96_signal(0) <= layer_xi_96;
    layer_xi_97_signal(0) <= layer_xi_97;
    layer_xi_98_signal(0) <= layer_xi_98;
    layer_xi_99_signal(0) <= layer_xi_99;
    layer_xi_100_signal(0) <= layer_xi_100;
    layer_xi_101_signal(0) <= layer_xi_101;
    layer_xi_102_signal(0) <= layer_xi_102;
    layer_xi_103_signal(0) <= layer_xi_103;
    layer_xi_104_signal(0) <= layer_xi_104;
    layer_xi_105_signal(0) <= layer_xi_105;
    layer_xi_106_signal(0) <= layer_xi_106;
    layer_xi_107_signal(0) <= layer_xi_107;
    layer_xi_108_signal(0) <= layer_xi_108;
    layer_xi_109_signal(0) <= layer_xi_109;
    layer_xi_110_signal(0) <= layer_xi_110;
    layer_xi_111_signal(0) <= layer_xi_111;
    layer_xi_112_signal(0) <= layer_xi_112;
    layer_xi_113_signal(0) <= layer_xi_113;
    layer_xi_114_signal(0) <= layer_xi_114;
    layer_xi_115_signal(0) <= layer_xi_115;
    layer_xi_116_signal(0) <= layer_xi_116;
    layer_xi_117_signal(0) <= layer_xi_117;
    layer_xi_118_signal(0) <= layer_xi_118;
    layer_xi_119_signal(0) <= layer_xi_119;
    layer_xi_120_signal(0) <= layer_xi_120;
    layer_xi_121_signal(0) <= layer_xi_121;
    layer_xi_122_signal(0) <= layer_xi_122;
    layer_xi_123_signal(0) <= layer_xi_123;
    layer_xi_124_signal(0) <= layer_xi_124;
    layer_xi_125_signal(0) <= layer_xi_125;
    layer_xi_126_signal(0) <= layer_xi_126;
    layer_xi_127_signal(0) <= layer_xi_127;
    layer_xi_128_signal(0) <= layer_xi_128;

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
    PL_STEP_0_for_layer_xi_17_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_17_signal(0), layer_xi_17_signal(1));
    PL_STEP_0_for_layer_xi_18_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_18_signal(0), layer_xi_18_signal(1));
    PL_STEP_0_for_layer_xi_19_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_19_signal(0), layer_xi_19_signal(1));
    PL_STEP_0_for_layer_xi_20_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_20_signal(0), layer_xi_20_signal(1));
    PL_STEP_0_for_layer_xi_21_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_21_signal(0), layer_xi_21_signal(1));
    PL_STEP_0_for_layer_xi_22_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_22_signal(0), layer_xi_22_signal(1));
    PL_STEP_0_for_layer_xi_23_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_23_signal(0), layer_xi_23_signal(1));
    PL_STEP_0_for_layer_xi_24_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_24_signal(0), layer_xi_24_signal(1));
    PL_STEP_0_for_layer_xi_25_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_25_signal(0), layer_xi_25_signal(1));
    PL_STEP_0_for_layer_xi_26_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_26_signal(0), layer_xi_26_signal(1));
    PL_STEP_0_for_layer_xi_27_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_27_signal(0), layer_xi_27_signal(1));
    PL_STEP_0_for_layer_xi_28_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_28_signal(0), layer_xi_28_signal(1));
    PL_STEP_0_for_layer_xi_29_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_29_signal(0), layer_xi_29_signal(1));
    PL_STEP_0_for_layer_xi_30_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_30_signal(0), layer_xi_30_signal(1));
    PL_STEP_0_for_layer_xi_31_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_31_signal(0), layer_xi_31_signal(1));
    PL_STEP_0_for_layer_xi_32_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_32_signal(0), layer_xi_32_signal(1));
    PL_STEP_0_for_layer_xi_33_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_33_signal(0), layer_xi_33_signal(1));
    PL_STEP_0_for_layer_xi_34_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_34_signal(0), layer_xi_34_signal(1));
    PL_STEP_0_for_layer_xi_35_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_35_signal(0), layer_xi_35_signal(1));
    PL_STEP_0_for_layer_xi_36_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_36_signal(0), layer_xi_36_signal(1));
    PL_STEP_0_for_layer_xi_37_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_37_signal(0), layer_xi_37_signal(1));
    PL_STEP_0_for_layer_xi_38_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_38_signal(0), layer_xi_38_signal(1));
    PL_STEP_0_for_layer_xi_39_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_39_signal(0), layer_xi_39_signal(1));
    PL_STEP_0_for_layer_xi_40_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_40_signal(0), layer_xi_40_signal(1));
    PL_STEP_0_for_layer_xi_41_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_41_signal(0), layer_xi_41_signal(1));
    PL_STEP_0_for_layer_xi_42_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_42_signal(0), layer_xi_42_signal(1));
    PL_STEP_0_for_layer_xi_43_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_43_signal(0), layer_xi_43_signal(1));
    PL_STEP_0_for_layer_xi_44_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_44_signal(0), layer_xi_44_signal(1));
    PL_STEP_0_for_layer_xi_45_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_45_signal(0), layer_xi_45_signal(1));
    PL_STEP_0_for_layer_xi_46_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_46_signal(0), layer_xi_46_signal(1));
    PL_STEP_0_for_layer_xi_47_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_47_signal(0), layer_xi_47_signal(1));
    PL_STEP_0_for_layer_xi_48_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_48_signal(0), layer_xi_48_signal(1));
    PL_STEP_0_for_layer_xi_49_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_49_signal(0), layer_xi_49_signal(1));
    PL_STEP_0_for_layer_xi_50_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_50_signal(0), layer_xi_50_signal(1));
    PL_STEP_0_for_layer_xi_51_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_51_signal(0), layer_xi_51_signal(1));
    PL_STEP_0_for_layer_xi_52_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_52_signal(0), layer_xi_52_signal(1));
    PL_STEP_0_for_layer_xi_53_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_53_signal(0), layer_xi_53_signal(1));
    PL_STEP_0_for_layer_xi_54_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_54_signal(0), layer_xi_54_signal(1));
    PL_STEP_0_for_layer_xi_55_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_55_signal(0), layer_xi_55_signal(1));
    PL_STEP_0_for_layer_xi_56_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_56_signal(0), layer_xi_56_signal(1));
    PL_STEP_0_for_layer_xi_57_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_57_signal(0), layer_xi_57_signal(1));
    PL_STEP_0_for_layer_xi_58_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_58_signal(0), layer_xi_58_signal(1));
    PL_STEP_0_for_layer_xi_59_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_59_signal(0), layer_xi_59_signal(1));
    PL_STEP_0_for_layer_xi_60_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_60_signal(0), layer_xi_60_signal(1));
    PL_STEP_0_for_layer_xi_61_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_61_signal(0), layer_xi_61_signal(1));
    PL_STEP_0_for_layer_xi_62_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_62_signal(0), layer_xi_62_signal(1));
    PL_STEP_0_for_layer_xi_63_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_63_signal(0), layer_xi_63_signal(1));
    PL_STEP_0_for_layer_xi_64_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_64_signal(0), layer_xi_64_signal(1));
    PL_STEP_0_for_layer_xi_65_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_65_signal(0), layer_xi_65_signal(1));
    PL_STEP_0_for_layer_xi_66_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_66_signal(0), layer_xi_66_signal(1));
    PL_STEP_0_for_layer_xi_67_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_67_signal(0), layer_xi_67_signal(1));
    PL_STEP_0_for_layer_xi_68_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_68_signal(0), layer_xi_68_signal(1));
    PL_STEP_0_for_layer_xi_69_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_69_signal(0), layer_xi_69_signal(1));
    PL_STEP_0_for_layer_xi_70_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_70_signal(0), layer_xi_70_signal(1));
    PL_STEP_0_for_layer_xi_71_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_71_signal(0), layer_xi_71_signal(1));
    PL_STEP_0_for_layer_xi_72_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_72_signal(0), layer_xi_72_signal(1));
    PL_STEP_0_for_layer_xi_73_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_73_signal(0), layer_xi_73_signal(1));
    PL_STEP_0_for_layer_xi_74_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_74_signal(0), layer_xi_74_signal(1));
    PL_STEP_0_for_layer_xi_75_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_75_signal(0), layer_xi_75_signal(1));
    PL_STEP_0_for_layer_xi_76_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_76_signal(0), layer_xi_76_signal(1));
    PL_STEP_0_for_layer_xi_77_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_77_signal(0), layer_xi_77_signal(1));
    PL_STEP_0_for_layer_xi_78_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_78_signal(0), layer_xi_78_signal(1));
    PL_STEP_0_for_layer_xi_79_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_79_signal(0), layer_xi_79_signal(1));
    PL_STEP_0_for_layer_xi_80_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_80_signal(0), layer_xi_80_signal(1));
    PL_STEP_0_for_layer_xi_81_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_81_signal(0), layer_xi_81_signal(1));
    PL_STEP_0_for_layer_xi_82_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_82_signal(0), layer_xi_82_signal(1));
    PL_STEP_0_for_layer_xi_83_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_83_signal(0), layer_xi_83_signal(1));
    PL_STEP_0_for_layer_xi_84_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_84_signal(0), layer_xi_84_signal(1));
    PL_STEP_0_for_layer_xi_85_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_85_signal(0), layer_xi_85_signal(1));
    PL_STEP_0_for_layer_xi_86_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_86_signal(0), layer_xi_86_signal(1));
    PL_STEP_0_for_layer_xi_87_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_87_signal(0), layer_xi_87_signal(1));
    PL_STEP_0_for_layer_xi_88_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_88_signal(0), layer_xi_88_signal(1));
    PL_STEP_0_for_layer_xi_89_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_89_signal(0), layer_xi_89_signal(1));
    PL_STEP_0_for_layer_xi_90_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_90_signal(0), layer_xi_90_signal(1));
    PL_STEP_0_for_layer_xi_91_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_91_signal(0), layer_xi_91_signal(1));
    PL_STEP_0_for_layer_xi_92_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_92_signal(0), layer_xi_92_signal(1));
    PL_STEP_0_for_layer_xi_93_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_93_signal(0), layer_xi_93_signal(1));
    PL_STEP_0_for_layer_xi_94_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_94_signal(0), layer_xi_94_signal(1));
    PL_STEP_0_for_layer_xi_95_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_95_signal(0), layer_xi_95_signal(1));
    PL_STEP_0_for_layer_xi_96_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_96_signal(0), layer_xi_96_signal(1));
    PL_STEP_0_for_layer_xi_97_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_97_signal(0), layer_xi_97_signal(1));
    PL_STEP_0_for_layer_xi_98_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_98_signal(0), layer_xi_98_signal(1));
    PL_STEP_0_for_layer_xi_99_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_99_signal(0), layer_xi_99_signal(1));
    PL_STEP_0_for_layer_xi_100_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_100_signal(0), layer_xi_100_signal(1));
    PL_STEP_0_for_layer_xi_101_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_101_signal(0), layer_xi_101_signal(1));
    PL_STEP_0_for_layer_xi_102_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_102_signal(0), layer_xi_102_signal(1));
    PL_STEP_0_for_layer_xi_103_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_103_signal(0), layer_xi_103_signal(1));
    PL_STEP_0_for_layer_xi_104_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_104_signal(0), layer_xi_104_signal(1));
    PL_STEP_0_for_layer_xi_105_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_105_signal(0), layer_xi_105_signal(1));
    PL_STEP_0_for_layer_xi_106_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_106_signal(0), layer_xi_106_signal(1));
    PL_STEP_0_for_layer_xi_107_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_107_signal(0), layer_xi_107_signal(1));
    PL_STEP_0_for_layer_xi_108_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_108_signal(0), layer_xi_108_signal(1));
    PL_STEP_0_for_layer_xi_109_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_109_signal(0), layer_xi_109_signal(1));
    PL_STEP_0_for_layer_xi_110_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_110_signal(0), layer_xi_110_signal(1));
    PL_STEP_0_for_layer_xi_111_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_111_signal(0), layer_xi_111_signal(1));
    PL_STEP_0_for_layer_xi_112_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_112_signal(0), layer_xi_112_signal(1));
    PL_STEP_0_for_layer_xi_113_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_113_signal(0), layer_xi_113_signal(1));
    PL_STEP_0_for_layer_xi_114_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_114_signal(0), layer_xi_114_signal(1));
    PL_STEP_0_for_layer_xi_115_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_115_signal(0), layer_xi_115_signal(1));
    PL_STEP_0_for_layer_xi_116_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_116_signal(0), layer_xi_116_signal(1));
    PL_STEP_0_for_layer_xi_117_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_117_signal(0), layer_xi_117_signal(1));
    PL_STEP_0_for_layer_xi_118_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_118_signal(0), layer_xi_118_signal(1));
    PL_STEP_0_for_layer_xi_119_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_119_signal(0), layer_xi_119_signal(1));
    PL_STEP_0_for_layer_xi_120_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_120_signal(0), layer_xi_120_signal(1));
    PL_STEP_0_for_layer_xi_121_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_121_signal(0), layer_xi_121_signal(1));
    PL_STEP_0_for_layer_xi_122_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_122_signal(0), layer_xi_122_signal(1));
    PL_STEP_0_for_layer_xi_123_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_123_signal(0), layer_xi_123_signal(1));
    PL_STEP_0_for_layer_xi_124_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_124_signal(0), layer_xi_124_signal(1));
    PL_STEP_0_for_layer_xi_125_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_125_signal(0), layer_xi_125_signal(1));
    PL_STEP_0_for_layer_xi_126_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_126_signal(0), layer_xi_126_signal(1));
    PL_STEP_0_for_layer_xi_127_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_127_signal(0), layer_xi_127_signal(1));
    PL_STEP_0_for_layer_xi_128_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_128_signal(0), layer_xi_128_signal(1));
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
            elsif signed(layer_xi_1_signal(1)) > to_signed(127, layer_xi_1_signal(1)'length) then
                layer_yo_1 <= std_logic_vector(to_unsigned(127, layer_yo_1'length));
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
            elsif signed(layer_xi_2_signal(1)) > to_signed(127, layer_xi_2_signal(1)'length) then
                layer_yo_2 <= std_logic_vector(to_unsigned(127, layer_yo_2'length));
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
            elsif signed(layer_xi_3_signal(1)) > to_signed(127, layer_xi_3_signal(1)'length) then
                layer_yo_3 <= std_logic_vector(to_unsigned(127, layer_yo_3'length));
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
            elsif signed(layer_xi_4_signal(1)) > to_signed(127, layer_xi_4_signal(1)'length) then
                layer_yo_4 <= std_logic_vector(to_unsigned(127, layer_yo_4'length));
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
            elsif signed(layer_xi_5_signal(1)) > to_signed(127, layer_xi_5_signal(1)'length) then
                layer_yo_5 <= std_logic_vector(to_unsigned(127, layer_yo_5'length));
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
            elsif signed(layer_xi_6_signal(1)) > to_signed(127, layer_xi_6_signal(1)'length) then
                layer_yo_6 <= std_logic_vector(to_unsigned(127, layer_yo_6'length));
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
            elsif signed(layer_xi_7_signal(1)) > to_signed(127, layer_xi_7_signal(1)'length) then
                layer_yo_7 <= std_logic_vector(to_unsigned(127, layer_yo_7'length));
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
            elsif signed(layer_xi_8_signal(1)) > to_signed(127, layer_xi_8_signal(1)'length) then
                layer_yo_8 <= std_logic_vector(to_unsigned(127, layer_yo_8'length));
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
            elsif signed(layer_xi_9_signal(1)) > to_signed(127, layer_xi_9_signal(1)'length) then
                layer_yo_9 <= std_logic_vector(to_unsigned(127, layer_yo_9'length));
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
            elsif signed(layer_xi_10_signal(1)) > to_signed(127, layer_xi_10_signal(1)'length) then
                layer_yo_10 <= std_logic_vector(to_unsigned(127, layer_yo_10'length));
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
            elsif signed(layer_xi_11_signal(1)) > to_signed(127, layer_xi_11_signal(1)'length) then
                layer_yo_11 <= std_logic_vector(to_unsigned(127, layer_yo_11'length));
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
            elsif signed(layer_xi_12_signal(1)) > to_signed(127, layer_xi_12_signal(1)'length) then
                layer_yo_12 <= std_logic_vector(to_unsigned(127, layer_yo_12'length));
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
            elsif signed(layer_xi_13_signal(1)) > to_signed(127, layer_xi_13_signal(1)'length) then
                layer_yo_13 <= std_logic_vector(to_unsigned(127, layer_yo_13'length));
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
            elsif signed(layer_xi_14_signal(1)) > to_signed(127, layer_xi_14_signal(1)'length) then
                layer_yo_14 <= std_logic_vector(to_unsigned(127, layer_yo_14'length));
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
            elsif signed(layer_xi_15_signal(1)) > to_signed(127, layer_xi_15_signal(1)'length) then
                layer_yo_15 <= std_logic_vector(to_unsigned(127, layer_yo_15'length));
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
            elsif signed(layer_xi_16_signal(1)) > to_signed(127, layer_xi_16_signal(1)'length) then
                layer_yo_16 <= std_logic_vector(to_unsigned(127, layer_yo_16'length));
            else
                layer_yo_16 <= std_logic_vector(layer_xi_16_signal(1)(layer_xi_16_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input17: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_17 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_17_signal(1)) < 0 then
                layer_yo_17 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_17_signal(1)) > to_signed(127, layer_xi_17_signal(1)'length) then
                layer_yo_17 <= std_logic_vector(to_unsigned(127, layer_yo_17'length));
            else
                layer_yo_17 <= std_logic_vector(layer_xi_17_signal(1)(layer_xi_17_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input18: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_18 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_18_signal(1)) < 0 then
                layer_yo_18 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_18_signal(1)) > to_signed(127, layer_xi_18_signal(1)'length) then
                layer_yo_18 <= std_logic_vector(to_unsigned(127, layer_yo_18'length));
            else
                layer_yo_18 <= std_logic_vector(layer_xi_18_signal(1)(layer_xi_18_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input19: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_19 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_19_signal(1)) < 0 then
                layer_yo_19 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_19_signal(1)) > to_signed(127, layer_xi_19_signal(1)'length) then
                layer_yo_19 <= std_logic_vector(to_unsigned(127, layer_yo_19'length));
            else
                layer_yo_19 <= std_logic_vector(layer_xi_19_signal(1)(layer_xi_19_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input20: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_20 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_20_signal(1)) < 0 then
                layer_yo_20 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_20_signal(1)) > to_signed(127, layer_xi_20_signal(1)'length) then
                layer_yo_20 <= std_logic_vector(to_unsigned(127, layer_yo_20'length));
            else
                layer_yo_20 <= std_logic_vector(layer_xi_20_signal(1)(layer_xi_20_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input21: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_21 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_21_signal(1)) < 0 then
                layer_yo_21 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_21_signal(1)) > to_signed(127, layer_xi_21_signal(1)'length) then
                layer_yo_21 <= std_logic_vector(to_unsigned(127, layer_yo_21'length));
            else
                layer_yo_21 <= std_logic_vector(layer_xi_21_signal(1)(layer_xi_21_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input22: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_22 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_22_signal(1)) < 0 then
                layer_yo_22 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_22_signal(1)) > to_signed(127, layer_xi_22_signal(1)'length) then
                layer_yo_22 <= std_logic_vector(to_unsigned(127, layer_yo_22'length));
            else
                layer_yo_22 <= std_logic_vector(layer_xi_22_signal(1)(layer_xi_22_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input23: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_23 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_23_signal(1)) < 0 then
                layer_yo_23 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_23_signal(1)) > to_signed(127, layer_xi_23_signal(1)'length) then
                layer_yo_23 <= std_logic_vector(to_unsigned(127, layer_yo_23'length));
            else
                layer_yo_23 <= std_logic_vector(layer_xi_23_signal(1)(layer_xi_23_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input24: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_24 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_24_signal(1)) < 0 then
                layer_yo_24 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_24_signal(1)) > to_signed(127, layer_xi_24_signal(1)'length) then
                layer_yo_24 <= std_logic_vector(to_unsigned(127, layer_yo_24'length));
            else
                layer_yo_24 <= std_logic_vector(layer_xi_24_signal(1)(layer_xi_24_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input25: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_25 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_25_signal(1)) < 0 then
                layer_yo_25 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_25_signal(1)) > to_signed(127, layer_xi_25_signal(1)'length) then
                layer_yo_25 <= std_logic_vector(to_unsigned(127, layer_yo_25'length));
            else
                layer_yo_25 <= std_logic_vector(layer_xi_25_signal(1)(layer_xi_25_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input26: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_26 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_26_signal(1)) < 0 then
                layer_yo_26 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_26_signal(1)) > to_signed(127, layer_xi_26_signal(1)'length) then
                layer_yo_26 <= std_logic_vector(to_unsigned(127, layer_yo_26'length));
            else
                layer_yo_26 <= std_logic_vector(layer_xi_26_signal(1)(layer_xi_26_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input27: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_27 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_27_signal(1)) < 0 then
                layer_yo_27 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_27_signal(1)) > to_signed(127, layer_xi_27_signal(1)'length) then
                layer_yo_27 <= std_logic_vector(to_unsigned(127, layer_yo_27'length));
            else
                layer_yo_27 <= std_logic_vector(layer_xi_27_signal(1)(layer_xi_27_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input28: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_28 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_28_signal(1)) < 0 then
                layer_yo_28 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_28_signal(1)) > to_signed(127, layer_xi_28_signal(1)'length) then
                layer_yo_28 <= std_logic_vector(to_unsigned(127, layer_yo_28'length));
            else
                layer_yo_28 <= std_logic_vector(layer_xi_28_signal(1)(layer_xi_28_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input29: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_29 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_29_signal(1)) < 0 then
                layer_yo_29 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_29_signal(1)) > to_signed(127, layer_xi_29_signal(1)'length) then
                layer_yo_29 <= std_logic_vector(to_unsigned(127, layer_yo_29'length));
            else
                layer_yo_29 <= std_logic_vector(layer_xi_29_signal(1)(layer_xi_29_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input30: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_30 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_30_signal(1)) < 0 then
                layer_yo_30 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_30_signal(1)) > to_signed(127, layer_xi_30_signal(1)'length) then
                layer_yo_30 <= std_logic_vector(to_unsigned(127, layer_yo_30'length));
            else
                layer_yo_30 <= std_logic_vector(layer_xi_30_signal(1)(layer_xi_30_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input31: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_31 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_31_signal(1)) < 0 then
                layer_yo_31 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_31_signal(1)) > to_signed(127, layer_xi_31_signal(1)'length) then
                layer_yo_31 <= std_logic_vector(to_unsigned(127, layer_yo_31'length));
            else
                layer_yo_31 <= std_logic_vector(layer_xi_31_signal(1)(layer_xi_31_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input32: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_32 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_32_signal(1)) < 0 then
                layer_yo_32 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_32_signal(1)) > to_signed(127, layer_xi_32_signal(1)'length) then
                layer_yo_32 <= std_logic_vector(to_unsigned(127, layer_yo_32'length));
            else
                layer_yo_32 <= std_logic_vector(layer_xi_32_signal(1)(layer_xi_32_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input33: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_33 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_33_signal(1)) < 0 then
                layer_yo_33 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_33_signal(1)) > to_signed(127, layer_xi_33_signal(1)'length) then
                layer_yo_33 <= std_logic_vector(to_unsigned(127, layer_yo_33'length));
            else
                layer_yo_33 <= std_logic_vector(layer_xi_33_signal(1)(layer_xi_33_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input34: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_34 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_34_signal(1)) < 0 then
                layer_yo_34 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_34_signal(1)) > to_signed(127, layer_xi_34_signal(1)'length) then
                layer_yo_34 <= std_logic_vector(to_unsigned(127, layer_yo_34'length));
            else
                layer_yo_34 <= std_logic_vector(layer_xi_34_signal(1)(layer_xi_34_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input35: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_35 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_35_signal(1)) < 0 then
                layer_yo_35 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_35_signal(1)) > to_signed(127, layer_xi_35_signal(1)'length) then
                layer_yo_35 <= std_logic_vector(to_unsigned(127, layer_yo_35'length));
            else
                layer_yo_35 <= std_logic_vector(layer_xi_35_signal(1)(layer_xi_35_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input36: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_36 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_36_signal(1)) < 0 then
                layer_yo_36 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_36_signal(1)) > to_signed(127, layer_xi_36_signal(1)'length) then
                layer_yo_36 <= std_logic_vector(to_unsigned(127, layer_yo_36'length));
            else
                layer_yo_36 <= std_logic_vector(layer_xi_36_signal(1)(layer_xi_36_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input37: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_37 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_37_signal(1)) < 0 then
                layer_yo_37 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_37_signal(1)) > to_signed(127, layer_xi_37_signal(1)'length) then
                layer_yo_37 <= std_logic_vector(to_unsigned(127, layer_yo_37'length));
            else
                layer_yo_37 <= std_logic_vector(layer_xi_37_signal(1)(layer_xi_37_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input38: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_38 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_38_signal(1)) < 0 then
                layer_yo_38 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_38_signal(1)) > to_signed(127, layer_xi_38_signal(1)'length) then
                layer_yo_38 <= std_logic_vector(to_unsigned(127, layer_yo_38'length));
            else
                layer_yo_38 <= std_logic_vector(layer_xi_38_signal(1)(layer_xi_38_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input39: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_39 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_39_signal(1)) < 0 then
                layer_yo_39 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_39_signal(1)) > to_signed(127, layer_xi_39_signal(1)'length) then
                layer_yo_39 <= std_logic_vector(to_unsigned(127, layer_yo_39'length));
            else
                layer_yo_39 <= std_logic_vector(layer_xi_39_signal(1)(layer_xi_39_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input40: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_40 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_40_signal(1)) < 0 then
                layer_yo_40 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_40_signal(1)) > to_signed(127, layer_xi_40_signal(1)'length) then
                layer_yo_40 <= std_logic_vector(to_unsigned(127, layer_yo_40'length));
            else
                layer_yo_40 <= std_logic_vector(layer_xi_40_signal(1)(layer_xi_40_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input41: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_41 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_41_signal(1)) < 0 then
                layer_yo_41 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_41_signal(1)) > to_signed(127, layer_xi_41_signal(1)'length) then
                layer_yo_41 <= std_logic_vector(to_unsigned(127, layer_yo_41'length));
            else
                layer_yo_41 <= std_logic_vector(layer_xi_41_signal(1)(layer_xi_41_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input42: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_42 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_42_signal(1)) < 0 then
                layer_yo_42 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_42_signal(1)) > to_signed(127, layer_xi_42_signal(1)'length) then
                layer_yo_42 <= std_logic_vector(to_unsigned(127, layer_yo_42'length));
            else
                layer_yo_42 <= std_logic_vector(layer_xi_42_signal(1)(layer_xi_42_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input43: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_43 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_43_signal(1)) < 0 then
                layer_yo_43 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_43_signal(1)) > to_signed(127, layer_xi_43_signal(1)'length) then
                layer_yo_43 <= std_logic_vector(to_unsigned(127, layer_yo_43'length));
            else
                layer_yo_43 <= std_logic_vector(layer_xi_43_signal(1)(layer_xi_43_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input44: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_44 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_44_signal(1)) < 0 then
                layer_yo_44 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_44_signal(1)) > to_signed(127, layer_xi_44_signal(1)'length) then
                layer_yo_44 <= std_logic_vector(to_unsigned(127, layer_yo_44'length));
            else
                layer_yo_44 <= std_logic_vector(layer_xi_44_signal(1)(layer_xi_44_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input45: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_45 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_45_signal(1)) < 0 then
                layer_yo_45 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_45_signal(1)) > to_signed(127, layer_xi_45_signal(1)'length) then
                layer_yo_45 <= std_logic_vector(to_unsigned(127, layer_yo_45'length));
            else
                layer_yo_45 <= std_logic_vector(layer_xi_45_signal(1)(layer_xi_45_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input46: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_46 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_46_signal(1)) < 0 then
                layer_yo_46 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_46_signal(1)) > to_signed(127, layer_xi_46_signal(1)'length) then
                layer_yo_46 <= std_logic_vector(to_unsigned(127, layer_yo_46'length));
            else
                layer_yo_46 <= std_logic_vector(layer_xi_46_signal(1)(layer_xi_46_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input47: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_47 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_47_signal(1)) < 0 then
                layer_yo_47 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_47_signal(1)) > to_signed(127, layer_xi_47_signal(1)'length) then
                layer_yo_47 <= std_logic_vector(to_unsigned(127, layer_yo_47'length));
            else
                layer_yo_47 <= std_logic_vector(layer_xi_47_signal(1)(layer_xi_47_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input48: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_48 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_48_signal(1)) < 0 then
                layer_yo_48 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_48_signal(1)) > to_signed(127, layer_xi_48_signal(1)'length) then
                layer_yo_48 <= std_logic_vector(to_unsigned(127, layer_yo_48'length));
            else
                layer_yo_48 <= std_logic_vector(layer_xi_48_signal(1)(layer_xi_48_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input49: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_49 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_49_signal(1)) < 0 then
                layer_yo_49 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_49_signal(1)) > to_signed(127, layer_xi_49_signal(1)'length) then
                layer_yo_49 <= std_logic_vector(to_unsigned(127, layer_yo_49'length));
            else
                layer_yo_49 <= std_logic_vector(layer_xi_49_signal(1)(layer_xi_49_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input50: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_50 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_50_signal(1)) < 0 then
                layer_yo_50 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_50_signal(1)) > to_signed(127, layer_xi_50_signal(1)'length) then
                layer_yo_50 <= std_logic_vector(to_unsigned(127, layer_yo_50'length));
            else
                layer_yo_50 <= std_logic_vector(layer_xi_50_signal(1)(layer_xi_50_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input51: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_51 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_51_signal(1)) < 0 then
                layer_yo_51 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_51_signal(1)) > to_signed(127, layer_xi_51_signal(1)'length) then
                layer_yo_51 <= std_logic_vector(to_unsigned(127, layer_yo_51'length));
            else
                layer_yo_51 <= std_logic_vector(layer_xi_51_signal(1)(layer_xi_51_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input52: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_52 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_52_signal(1)) < 0 then
                layer_yo_52 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_52_signal(1)) > to_signed(127, layer_xi_52_signal(1)'length) then
                layer_yo_52 <= std_logic_vector(to_unsigned(127, layer_yo_52'length));
            else
                layer_yo_52 <= std_logic_vector(layer_xi_52_signal(1)(layer_xi_52_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input53: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_53 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_53_signal(1)) < 0 then
                layer_yo_53 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_53_signal(1)) > to_signed(127, layer_xi_53_signal(1)'length) then
                layer_yo_53 <= std_logic_vector(to_unsigned(127, layer_yo_53'length));
            else
                layer_yo_53 <= std_logic_vector(layer_xi_53_signal(1)(layer_xi_53_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input54: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_54 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_54_signal(1)) < 0 then
                layer_yo_54 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_54_signal(1)) > to_signed(127, layer_xi_54_signal(1)'length) then
                layer_yo_54 <= std_logic_vector(to_unsigned(127, layer_yo_54'length));
            else
                layer_yo_54 <= std_logic_vector(layer_xi_54_signal(1)(layer_xi_54_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input55: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_55 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_55_signal(1)) < 0 then
                layer_yo_55 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_55_signal(1)) > to_signed(127, layer_xi_55_signal(1)'length) then
                layer_yo_55 <= std_logic_vector(to_unsigned(127, layer_yo_55'length));
            else
                layer_yo_55 <= std_logic_vector(layer_xi_55_signal(1)(layer_xi_55_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input56: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_56 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_56_signal(1)) < 0 then
                layer_yo_56 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_56_signal(1)) > to_signed(127, layer_xi_56_signal(1)'length) then
                layer_yo_56 <= std_logic_vector(to_unsigned(127, layer_yo_56'length));
            else
                layer_yo_56 <= std_logic_vector(layer_xi_56_signal(1)(layer_xi_56_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input57: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_57 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_57_signal(1)) < 0 then
                layer_yo_57 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_57_signal(1)) > to_signed(127, layer_xi_57_signal(1)'length) then
                layer_yo_57 <= std_logic_vector(to_unsigned(127, layer_yo_57'length));
            else
                layer_yo_57 <= std_logic_vector(layer_xi_57_signal(1)(layer_xi_57_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input58: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_58 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_58_signal(1)) < 0 then
                layer_yo_58 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_58_signal(1)) > to_signed(127, layer_xi_58_signal(1)'length) then
                layer_yo_58 <= std_logic_vector(to_unsigned(127, layer_yo_58'length));
            else
                layer_yo_58 <= std_logic_vector(layer_xi_58_signal(1)(layer_xi_58_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input59: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_59 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_59_signal(1)) < 0 then
                layer_yo_59 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_59_signal(1)) > to_signed(127, layer_xi_59_signal(1)'length) then
                layer_yo_59 <= std_logic_vector(to_unsigned(127, layer_yo_59'length));
            else
                layer_yo_59 <= std_logic_vector(layer_xi_59_signal(1)(layer_xi_59_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input60: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_60 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_60_signal(1)) < 0 then
                layer_yo_60 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_60_signal(1)) > to_signed(127, layer_xi_60_signal(1)'length) then
                layer_yo_60 <= std_logic_vector(to_unsigned(127, layer_yo_60'length));
            else
                layer_yo_60 <= std_logic_vector(layer_xi_60_signal(1)(layer_xi_60_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input61: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_61 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_61_signal(1)) < 0 then
                layer_yo_61 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_61_signal(1)) > to_signed(127, layer_xi_61_signal(1)'length) then
                layer_yo_61 <= std_logic_vector(to_unsigned(127, layer_yo_61'length));
            else
                layer_yo_61 <= std_logic_vector(layer_xi_61_signal(1)(layer_xi_61_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input62: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_62 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_62_signal(1)) < 0 then
                layer_yo_62 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_62_signal(1)) > to_signed(127, layer_xi_62_signal(1)'length) then
                layer_yo_62 <= std_logic_vector(to_unsigned(127, layer_yo_62'length));
            else
                layer_yo_62 <= std_logic_vector(layer_xi_62_signal(1)(layer_xi_62_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input63: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_63 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_63_signal(1)) < 0 then
                layer_yo_63 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_63_signal(1)) > to_signed(127, layer_xi_63_signal(1)'length) then
                layer_yo_63 <= std_logic_vector(to_unsigned(127, layer_yo_63'length));
            else
                layer_yo_63 <= std_logic_vector(layer_xi_63_signal(1)(layer_xi_63_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input64: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_64 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_64_signal(1)) < 0 then
                layer_yo_64 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_64_signal(1)) > to_signed(127, layer_xi_64_signal(1)'length) then
                layer_yo_64 <= std_logic_vector(to_unsigned(127, layer_yo_64'length));
            else
                layer_yo_64 <= std_logic_vector(layer_xi_64_signal(1)(layer_xi_64_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input65: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_65 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_65_signal(1)) < 0 then
                layer_yo_65 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_65_signal(1)) > to_signed(127, layer_xi_65_signal(1)'length) then
                layer_yo_65 <= std_logic_vector(to_unsigned(127, layer_yo_65'length));
            else
                layer_yo_65 <= std_logic_vector(layer_xi_65_signal(1)(layer_xi_65_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input66: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_66 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_66_signal(1)) < 0 then
                layer_yo_66 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_66_signal(1)) > to_signed(127, layer_xi_66_signal(1)'length) then
                layer_yo_66 <= std_logic_vector(to_unsigned(127, layer_yo_66'length));
            else
                layer_yo_66 <= std_logic_vector(layer_xi_66_signal(1)(layer_xi_66_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input67: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_67 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_67_signal(1)) < 0 then
                layer_yo_67 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_67_signal(1)) > to_signed(127, layer_xi_67_signal(1)'length) then
                layer_yo_67 <= std_logic_vector(to_unsigned(127, layer_yo_67'length));
            else
                layer_yo_67 <= std_logic_vector(layer_xi_67_signal(1)(layer_xi_67_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input68: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_68 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_68_signal(1)) < 0 then
                layer_yo_68 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_68_signal(1)) > to_signed(127, layer_xi_68_signal(1)'length) then
                layer_yo_68 <= std_logic_vector(to_unsigned(127, layer_yo_68'length));
            else
                layer_yo_68 <= std_logic_vector(layer_xi_68_signal(1)(layer_xi_68_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input69: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_69 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_69_signal(1)) < 0 then
                layer_yo_69 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_69_signal(1)) > to_signed(127, layer_xi_69_signal(1)'length) then
                layer_yo_69 <= std_logic_vector(to_unsigned(127, layer_yo_69'length));
            else
                layer_yo_69 <= std_logic_vector(layer_xi_69_signal(1)(layer_xi_69_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input70: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_70 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_70_signal(1)) < 0 then
                layer_yo_70 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_70_signal(1)) > to_signed(127, layer_xi_70_signal(1)'length) then
                layer_yo_70 <= std_logic_vector(to_unsigned(127, layer_yo_70'length));
            else
                layer_yo_70 <= std_logic_vector(layer_xi_70_signal(1)(layer_xi_70_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input71: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_71 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_71_signal(1)) < 0 then
                layer_yo_71 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_71_signal(1)) > to_signed(127, layer_xi_71_signal(1)'length) then
                layer_yo_71 <= std_logic_vector(to_unsigned(127, layer_yo_71'length));
            else
                layer_yo_71 <= std_logic_vector(layer_xi_71_signal(1)(layer_xi_71_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input72: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_72 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_72_signal(1)) < 0 then
                layer_yo_72 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_72_signal(1)) > to_signed(127, layer_xi_72_signal(1)'length) then
                layer_yo_72 <= std_logic_vector(to_unsigned(127, layer_yo_72'length));
            else
                layer_yo_72 <= std_logic_vector(layer_xi_72_signal(1)(layer_xi_72_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input73: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_73 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_73_signal(1)) < 0 then
                layer_yo_73 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_73_signal(1)) > to_signed(127, layer_xi_73_signal(1)'length) then
                layer_yo_73 <= std_logic_vector(to_unsigned(127, layer_yo_73'length));
            else
                layer_yo_73 <= std_logic_vector(layer_xi_73_signal(1)(layer_xi_73_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input74: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_74 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_74_signal(1)) < 0 then
                layer_yo_74 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_74_signal(1)) > to_signed(127, layer_xi_74_signal(1)'length) then
                layer_yo_74 <= std_logic_vector(to_unsigned(127, layer_yo_74'length));
            else
                layer_yo_74 <= std_logic_vector(layer_xi_74_signal(1)(layer_xi_74_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input75: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_75 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_75_signal(1)) < 0 then
                layer_yo_75 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_75_signal(1)) > to_signed(127, layer_xi_75_signal(1)'length) then
                layer_yo_75 <= std_logic_vector(to_unsigned(127, layer_yo_75'length));
            else
                layer_yo_75 <= std_logic_vector(layer_xi_75_signal(1)(layer_xi_75_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input76: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_76 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_76_signal(1)) < 0 then
                layer_yo_76 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_76_signal(1)) > to_signed(127, layer_xi_76_signal(1)'length) then
                layer_yo_76 <= std_logic_vector(to_unsigned(127, layer_yo_76'length));
            else
                layer_yo_76 <= std_logic_vector(layer_xi_76_signal(1)(layer_xi_76_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input77: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_77 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_77_signal(1)) < 0 then
                layer_yo_77 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_77_signal(1)) > to_signed(127, layer_xi_77_signal(1)'length) then
                layer_yo_77 <= std_logic_vector(to_unsigned(127, layer_yo_77'length));
            else
                layer_yo_77 <= std_logic_vector(layer_xi_77_signal(1)(layer_xi_77_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input78: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_78 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_78_signal(1)) < 0 then
                layer_yo_78 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_78_signal(1)) > to_signed(127, layer_xi_78_signal(1)'length) then
                layer_yo_78 <= std_logic_vector(to_unsigned(127, layer_yo_78'length));
            else
                layer_yo_78 <= std_logic_vector(layer_xi_78_signal(1)(layer_xi_78_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input79: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_79 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_79_signal(1)) < 0 then
                layer_yo_79 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_79_signal(1)) > to_signed(127, layer_xi_79_signal(1)'length) then
                layer_yo_79 <= std_logic_vector(to_unsigned(127, layer_yo_79'length));
            else
                layer_yo_79 <= std_logic_vector(layer_xi_79_signal(1)(layer_xi_79_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input80: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_80 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_80_signal(1)) < 0 then
                layer_yo_80 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_80_signal(1)) > to_signed(127, layer_xi_80_signal(1)'length) then
                layer_yo_80 <= std_logic_vector(to_unsigned(127, layer_yo_80'length));
            else
                layer_yo_80 <= std_logic_vector(layer_xi_80_signal(1)(layer_xi_80_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input81: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_81 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_81_signal(1)) < 0 then
                layer_yo_81 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_81_signal(1)) > to_signed(127, layer_xi_81_signal(1)'length) then
                layer_yo_81 <= std_logic_vector(to_unsigned(127, layer_yo_81'length));
            else
                layer_yo_81 <= std_logic_vector(layer_xi_81_signal(1)(layer_xi_81_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input82: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_82 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_82_signal(1)) < 0 then
                layer_yo_82 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_82_signal(1)) > to_signed(127, layer_xi_82_signal(1)'length) then
                layer_yo_82 <= std_logic_vector(to_unsigned(127, layer_yo_82'length));
            else
                layer_yo_82 <= std_logic_vector(layer_xi_82_signal(1)(layer_xi_82_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input83: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_83 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_83_signal(1)) < 0 then
                layer_yo_83 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_83_signal(1)) > to_signed(127, layer_xi_83_signal(1)'length) then
                layer_yo_83 <= std_logic_vector(to_unsigned(127, layer_yo_83'length));
            else
                layer_yo_83 <= std_logic_vector(layer_xi_83_signal(1)(layer_xi_83_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input84: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_84 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_84_signal(1)) < 0 then
                layer_yo_84 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_84_signal(1)) > to_signed(127, layer_xi_84_signal(1)'length) then
                layer_yo_84 <= std_logic_vector(to_unsigned(127, layer_yo_84'length));
            else
                layer_yo_84 <= std_logic_vector(layer_xi_84_signal(1)(layer_xi_84_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input85: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_85 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_85_signal(1)) < 0 then
                layer_yo_85 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_85_signal(1)) > to_signed(127, layer_xi_85_signal(1)'length) then
                layer_yo_85 <= std_logic_vector(to_unsigned(127, layer_yo_85'length));
            else
                layer_yo_85 <= std_logic_vector(layer_xi_85_signal(1)(layer_xi_85_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input86: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_86 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_86_signal(1)) < 0 then
                layer_yo_86 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_86_signal(1)) > to_signed(127, layer_xi_86_signal(1)'length) then
                layer_yo_86 <= std_logic_vector(to_unsigned(127, layer_yo_86'length));
            else
                layer_yo_86 <= std_logic_vector(layer_xi_86_signal(1)(layer_xi_86_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input87: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_87 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_87_signal(1)) < 0 then
                layer_yo_87 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_87_signal(1)) > to_signed(127, layer_xi_87_signal(1)'length) then
                layer_yo_87 <= std_logic_vector(to_unsigned(127, layer_yo_87'length));
            else
                layer_yo_87 <= std_logic_vector(layer_xi_87_signal(1)(layer_xi_87_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input88: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_88 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_88_signal(1)) < 0 then
                layer_yo_88 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_88_signal(1)) > to_signed(127, layer_xi_88_signal(1)'length) then
                layer_yo_88 <= std_logic_vector(to_unsigned(127, layer_yo_88'length));
            else
                layer_yo_88 <= std_logic_vector(layer_xi_88_signal(1)(layer_xi_88_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input89: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_89 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_89_signal(1)) < 0 then
                layer_yo_89 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_89_signal(1)) > to_signed(127, layer_xi_89_signal(1)'length) then
                layer_yo_89 <= std_logic_vector(to_unsigned(127, layer_yo_89'length));
            else
                layer_yo_89 <= std_logic_vector(layer_xi_89_signal(1)(layer_xi_89_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input90: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_90 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_90_signal(1)) < 0 then
                layer_yo_90 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_90_signal(1)) > to_signed(127, layer_xi_90_signal(1)'length) then
                layer_yo_90 <= std_logic_vector(to_unsigned(127, layer_yo_90'length));
            else
                layer_yo_90 <= std_logic_vector(layer_xi_90_signal(1)(layer_xi_90_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input91: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_91 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_91_signal(1)) < 0 then
                layer_yo_91 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_91_signal(1)) > to_signed(127, layer_xi_91_signal(1)'length) then
                layer_yo_91 <= std_logic_vector(to_unsigned(127, layer_yo_91'length));
            else
                layer_yo_91 <= std_logic_vector(layer_xi_91_signal(1)(layer_xi_91_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input92: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_92 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_92_signal(1)) < 0 then
                layer_yo_92 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_92_signal(1)) > to_signed(127, layer_xi_92_signal(1)'length) then
                layer_yo_92 <= std_logic_vector(to_unsigned(127, layer_yo_92'length));
            else
                layer_yo_92 <= std_logic_vector(layer_xi_92_signal(1)(layer_xi_92_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input93: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_93 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_93_signal(1)) < 0 then
                layer_yo_93 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_93_signal(1)) > to_signed(127, layer_xi_93_signal(1)'length) then
                layer_yo_93 <= std_logic_vector(to_unsigned(127, layer_yo_93'length));
            else
                layer_yo_93 <= std_logic_vector(layer_xi_93_signal(1)(layer_xi_93_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input94: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_94 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_94_signal(1)) < 0 then
                layer_yo_94 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_94_signal(1)) > to_signed(127, layer_xi_94_signal(1)'length) then
                layer_yo_94 <= std_logic_vector(to_unsigned(127, layer_yo_94'length));
            else
                layer_yo_94 <= std_logic_vector(layer_xi_94_signal(1)(layer_xi_94_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input95: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_95 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_95_signal(1)) < 0 then
                layer_yo_95 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_95_signal(1)) > to_signed(127, layer_xi_95_signal(1)'length) then
                layer_yo_95 <= std_logic_vector(to_unsigned(127, layer_yo_95'length));
            else
                layer_yo_95 <= std_logic_vector(layer_xi_95_signal(1)(layer_xi_95_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input96: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_96 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_96_signal(1)) < 0 then
                layer_yo_96 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_96_signal(1)) > to_signed(127, layer_xi_96_signal(1)'length) then
                layer_yo_96 <= std_logic_vector(to_unsigned(127, layer_yo_96'length));
            else
                layer_yo_96 <= std_logic_vector(layer_xi_96_signal(1)(layer_xi_96_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input97: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_97 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_97_signal(1)) < 0 then
                layer_yo_97 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_97_signal(1)) > to_signed(127, layer_xi_97_signal(1)'length) then
                layer_yo_97 <= std_logic_vector(to_unsigned(127, layer_yo_97'length));
            else
                layer_yo_97 <= std_logic_vector(layer_xi_97_signal(1)(layer_xi_97_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input98: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_98 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_98_signal(1)) < 0 then
                layer_yo_98 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_98_signal(1)) > to_signed(127, layer_xi_98_signal(1)'length) then
                layer_yo_98 <= std_logic_vector(to_unsigned(127, layer_yo_98'length));
            else
                layer_yo_98 <= std_logic_vector(layer_xi_98_signal(1)(layer_xi_98_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input99: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_99 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_99_signal(1)) < 0 then
                layer_yo_99 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_99_signal(1)) > to_signed(127, layer_xi_99_signal(1)'length) then
                layer_yo_99 <= std_logic_vector(to_unsigned(127, layer_yo_99'length));
            else
                layer_yo_99 <= std_logic_vector(layer_xi_99_signal(1)(layer_xi_99_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input100: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_100 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_100_signal(1)) < 0 then
                layer_yo_100 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_100_signal(1)) > to_signed(127, layer_xi_100_signal(1)'length) then
                layer_yo_100 <= std_logic_vector(to_unsigned(127, layer_yo_100'length));
            else
                layer_yo_100 <= std_logic_vector(layer_xi_100_signal(1)(layer_xi_100_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input101: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_101 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_101_signal(1)) < 0 then
                layer_yo_101 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_101_signal(1)) > to_signed(127, layer_xi_101_signal(1)'length) then
                layer_yo_101 <= std_logic_vector(to_unsigned(127, layer_yo_101'length));
            else
                layer_yo_101 <= std_logic_vector(layer_xi_101_signal(1)(layer_xi_101_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input102: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_102 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_102_signal(1)) < 0 then
                layer_yo_102 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_102_signal(1)) > to_signed(127, layer_xi_102_signal(1)'length) then
                layer_yo_102 <= std_logic_vector(to_unsigned(127, layer_yo_102'length));
            else
                layer_yo_102 <= std_logic_vector(layer_xi_102_signal(1)(layer_xi_102_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input103: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_103 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_103_signal(1)) < 0 then
                layer_yo_103 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_103_signal(1)) > to_signed(127, layer_xi_103_signal(1)'length) then
                layer_yo_103 <= std_logic_vector(to_unsigned(127, layer_yo_103'length));
            else
                layer_yo_103 <= std_logic_vector(layer_xi_103_signal(1)(layer_xi_103_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input104: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_104 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_104_signal(1)) < 0 then
                layer_yo_104 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_104_signal(1)) > to_signed(127, layer_xi_104_signal(1)'length) then
                layer_yo_104 <= std_logic_vector(to_unsigned(127, layer_yo_104'length));
            else
                layer_yo_104 <= std_logic_vector(layer_xi_104_signal(1)(layer_xi_104_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input105: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_105 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_105_signal(1)) < 0 then
                layer_yo_105 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_105_signal(1)) > to_signed(127, layer_xi_105_signal(1)'length) then
                layer_yo_105 <= std_logic_vector(to_unsigned(127, layer_yo_105'length));
            else
                layer_yo_105 <= std_logic_vector(layer_xi_105_signal(1)(layer_xi_105_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input106: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_106 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_106_signal(1)) < 0 then
                layer_yo_106 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_106_signal(1)) > to_signed(127, layer_xi_106_signal(1)'length) then
                layer_yo_106 <= std_logic_vector(to_unsigned(127, layer_yo_106'length));
            else
                layer_yo_106 <= std_logic_vector(layer_xi_106_signal(1)(layer_xi_106_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input107: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_107 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_107_signal(1)) < 0 then
                layer_yo_107 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_107_signal(1)) > to_signed(127, layer_xi_107_signal(1)'length) then
                layer_yo_107 <= std_logic_vector(to_unsigned(127, layer_yo_107'length));
            else
                layer_yo_107 <= std_logic_vector(layer_xi_107_signal(1)(layer_xi_107_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input108: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_108 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_108_signal(1)) < 0 then
                layer_yo_108 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_108_signal(1)) > to_signed(127, layer_xi_108_signal(1)'length) then
                layer_yo_108 <= std_logic_vector(to_unsigned(127, layer_yo_108'length));
            else
                layer_yo_108 <= std_logic_vector(layer_xi_108_signal(1)(layer_xi_108_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input109: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_109 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_109_signal(1)) < 0 then
                layer_yo_109 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_109_signal(1)) > to_signed(127, layer_xi_109_signal(1)'length) then
                layer_yo_109 <= std_logic_vector(to_unsigned(127, layer_yo_109'length));
            else
                layer_yo_109 <= std_logic_vector(layer_xi_109_signal(1)(layer_xi_109_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input110: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_110 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_110_signal(1)) < 0 then
                layer_yo_110 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_110_signal(1)) > to_signed(127, layer_xi_110_signal(1)'length) then
                layer_yo_110 <= std_logic_vector(to_unsigned(127, layer_yo_110'length));
            else
                layer_yo_110 <= std_logic_vector(layer_xi_110_signal(1)(layer_xi_110_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input111: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_111 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_111_signal(1)) < 0 then
                layer_yo_111 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_111_signal(1)) > to_signed(127, layer_xi_111_signal(1)'length) then
                layer_yo_111 <= std_logic_vector(to_unsigned(127, layer_yo_111'length));
            else
                layer_yo_111 <= std_logic_vector(layer_xi_111_signal(1)(layer_xi_111_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input112: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_112 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_112_signal(1)) < 0 then
                layer_yo_112 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_112_signal(1)) > to_signed(127, layer_xi_112_signal(1)'length) then
                layer_yo_112 <= std_logic_vector(to_unsigned(127, layer_yo_112'length));
            else
                layer_yo_112 <= std_logic_vector(layer_xi_112_signal(1)(layer_xi_112_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input113: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_113 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_113_signal(1)) < 0 then
                layer_yo_113 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_113_signal(1)) > to_signed(127, layer_xi_113_signal(1)'length) then
                layer_yo_113 <= std_logic_vector(to_unsigned(127, layer_yo_113'length));
            else
                layer_yo_113 <= std_logic_vector(layer_xi_113_signal(1)(layer_xi_113_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input114: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_114 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_114_signal(1)) < 0 then
                layer_yo_114 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_114_signal(1)) > to_signed(127, layer_xi_114_signal(1)'length) then
                layer_yo_114 <= std_logic_vector(to_unsigned(127, layer_yo_114'length));
            else
                layer_yo_114 <= std_logic_vector(layer_xi_114_signal(1)(layer_xi_114_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input115: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_115 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_115_signal(1)) < 0 then
                layer_yo_115 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_115_signal(1)) > to_signed(127, layer_xi_115_signal(1)'length) then
                layer_yo_115 <= std_logic_vector(to_unsigned(127, layer_yo_115'length));
            else
                layer_yo_115 <= std_logic_vector(layer_xi_115_signal(1)(layer_xi_115_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input116: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_116 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_116_signal(1)) < 0 then
                layer_yo_116 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_116_signal(1)) > to_signed(127, layer_xi_116_signal(1)'length) then
                layer_yo_116 <= std_logic_vector(to_unsigned(127, layer_yo_116'length));
            else
                layer_yo_116 <= std_logic_vector(layer_xi_116_signal(1)(layer_xi_116_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input117: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_117 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_117_signal(1)) < 0 then
                layer_yo_117 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_117_signal(1)) > to_signed(127, layer_xi_117_signal(1)'length) then
                layer_yo_117 <= std_logic_vector(to_unsigned(127, layer_yo_117'length));
            else
                layer_yo_117 <= std_logic_vector(layer_xi_117_signal(1)(layer_xi_117_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input118: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_118 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_118_signal(1)) < 0 then
                layer_yo_118 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_118_signal(1)) > to_signed(127, layer_xi_118_signal(1)'length) then
                layer_yo_118 <= std_logic_vector(to_unsigned(127, layer_yo_118'length));
            else
                layer_yo_118 <= std_logic_vector(layer_xi_118_signal(1)(layer_xi_118_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input119: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_119 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_119_signal(1)) < 0 then
                layer_yo_119 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_119_signal(1)) > to_signed(127, layer_xi_119_signal(1)'length) then
                layer_yo_119 <= std_logic_vector(to_unsigned(127, layer_yo_119'length));
            else
                layer_yo_119 <= std_logic_vector(layer_xi_119_signal(1)(layer_xi_119_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input120: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_120 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_120_signal(1)) < 0 then
                layer_yo_120 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_120_signal(1)) > to_signed(127, layer_xi_120_signal(1)'length) then
                layer_yo_120 <= std_logic_vector(to_unsigned(127, layer_yo_120'length));
            else
                layer_yo_120 <= std_logic_vector(layer_xi_120_signal(1)(layer_xi_120_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input121: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_121 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_121_signal(1)) < 0 then
                layer_yo_121 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_121_signal(1)) > to_signed(127, layer_xi_121_signal(1)'length) then
                layer_yo_121 <= std_logic_vector(to_unsigned(127, layer_yo_121'length));
            else
                layer_yo_121 <= std_logic_vector(layer_xi_121_signal(1)(layer_xi_121_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input122: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_122 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_122_signal(1)) < 0 then
                layer_yo_122 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_122_signal(1)) > to_signed(127, layer_xi_122_signal(1)'length) then
                layer_yo_122 <= std_logic_vector(to_unsigned(127, layer_yo_122'length));
            else
                layer_yo_122 <= std_logic_vector(layer_xi_122_signal(1)(layer_xi_122_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input123: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_123 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_123_signal(1)) < 0 then
                layer_yo_123 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_123_signal(1)) > to_signed(127, layer_xi_123_signal(1)'length) then
                layer_yo_123 <= std_logic_vector(to_unsigned(127, layer_yo_123'length));
            else
                layer_yo_123 <= std_logic_vector(layer_xi_123_signal(1)(layer_xi_123_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input124: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_124 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_124_signal(1)) < 0 then
                layer_yo_124 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_124_signal(1)) > to_signed(127, layer_xi_124_signal(1)'length) then
                layer_yo_124 <= std_logic_vector(to_unsigned(127, layer_yo_124'length));
            else
                layer_yo_124 <= std_logic_vector(layer_xi_124_signal(1)(layer_xi_124_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input125: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_125 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_125_signal(1)) < 0 then
                layer_yo_125 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_125_signal(1)) > to_signed(127, layer_xi_125_signal(1)'length) then
                layer_yo_125 <= std_logic_vector(to_unsigned(127, layer_yo_125'length));
            else
                layer_yo_125 <= std_logic_vector(layer_xi_125_signal(1)(layer_xi_125_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input126: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_126 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_126_signal(1)) < 0 then
                layer_yo_126 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_126_signal(1)) > to_signed(127, layer_xi_126_signal(1)'length) then
                layer_yo_126 <= std_logic_vector(to_unsigned(127, layer_yo_126'length));
            else
                layer_yo_126 <= std_logic_vector(layer_xi_126_signal(1)(layer_xi_126_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input127: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_127 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_127_signal(1)) < 0 then
                layer_yo_127 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_127_signal(1)) > to_signed(127, layer_xi_127_signal(1)'length) then
                layer_yo_127 <= std_logic_vector(to_unsigned(127, layer_yo_127'length));
            else
                layer_yo_127 <= std_logic_vector(layer_xi_127_signal(1)(layer_xi_127_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input128: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_128 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_128_signal(1)) < 0 then
                layer_yo_128 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_128_signal(1)) > to_signed(127, layer_xi_128_signal(1)'length) then
                layer_yo_128 <= std_logic_vector(to_unsigned(127, layer_yo_128'length));
            else
                layer_yo_128 <= std_logic_vector(layer_xi_128_signal(1)(layer_xi_128_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;



end Behavioral;