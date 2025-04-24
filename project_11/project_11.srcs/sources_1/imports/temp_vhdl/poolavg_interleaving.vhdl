LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity poolavg_interleaving is
    generic
    (
        XI_WIDTH        	: natural := 7;
		CONFIGURATIONS      : natural := 1024;
		INTERLEAVINGS       : natural := 1;
		INPUTS_PER_MUX      : natural := 256
    );
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_2    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_3    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_4    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_5    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_6    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_7    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_8    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_9    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_10    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_11    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_12    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_13    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_14    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_15    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_16    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_17    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_18    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_19    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_20    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_21    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_22    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_23    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_24    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_25    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_26    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_27    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_28    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_29    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_30    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_31    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_32    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_33    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_34    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_35    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_36    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_37    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_38    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_39    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_40    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_41    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_42    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_43    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_44    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_45    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_46    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_47    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_48    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_49    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_50    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_51    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_52    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_53    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_54    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_55    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_56    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_57    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_58    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_59    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_60    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_61    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_62    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_63    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_64    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_65    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_66    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_67    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_68    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_69    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_70    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_71    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_72    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_73    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_74    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_75    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_76    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_77    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_78    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_79    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_80    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_81    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_82    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_83    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_84    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_85    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_86    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_87    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_88    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_89    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_90    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_91    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_92    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_93    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_94    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_95    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_96    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_97    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_98    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_99    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_100    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_101    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_102    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_103    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_104    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_105    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_106    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_107    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_108    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_109    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_110    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_111    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_112    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_113    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_114    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_115    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_116    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_117    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_118    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_119    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_120    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_121    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_122    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_123    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_124    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_125    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_126    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_127    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_128    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_129    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_130    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_131    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_132    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_133    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_134    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_135    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_136    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_137    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_138    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_139    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_140    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_141    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_142    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_143    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_144    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_145    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_146    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_147    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_148    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_149    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_150    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_151    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_152    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_153    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_154    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_155    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_156    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_157    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_158    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_159    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_160    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_161    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_162    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_163    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_164    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_165    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_166    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_167    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_168    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_169    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_170    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_171    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_172    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_173    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_174    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_175    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_176    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_177    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_178    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_179    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_180    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_181    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_182    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_183    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_184    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_185    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_186    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_187    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_188    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_189    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_190    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_191    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_192    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_193    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_194    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_195    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_196    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_197    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_198    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_199    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_200    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_201    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_202    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_203    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_204    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_205    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_206    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_207    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_208    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_209    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_210    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_211    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_212    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_213    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_214    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_215    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_216    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_217    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_218    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_219    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_220    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_221    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_222    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_223    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_224    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_225    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_226    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_227    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_228    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_229    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_230    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_231    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_232    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_233    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_234    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_235    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_236    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_237    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_238    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_239    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_240    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_241    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_242    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_243    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_244    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_245    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_246    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_247    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_248    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_249    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_250    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_251    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_252    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_253    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_254    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_255    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_256    : in std_logic_vector((XI_WIDTH-1) downto 0);
        x_is_valid    : in std_logic;

        y_valid       : out std_logic;
        sel_config    : out std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
        layer_yo_1 : out std_logic_vector((XI_WIDTH-1) downto 0)
    ) ;
end poolavg_interleaving;

architecture Behavioral of poolavg_interleaving is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of poolavg_interleaving : entity is "yes";


	constant FIFO_START_THR     : natural := 2;
    constant FIFO_LAST_READ_MAX : natural := INPUTS_PER_MUX - 1;
    constant FIFO_SIZE          : natural := 5;
    constant FIFO_HOLD_CYCLES   : natural := INTERLEAVINGS * INPUTS_PER_MUX;
    constant AMOUNT_OF_LAYER_OUTPUTS          : natural := 1;

    type state_type is (FLUSH_DATA, LOAD_FIRST, AWAIT_THRESHOLD);
    signal state : state_type;
    signal debug_state_signal : unsigned(2 downto 0);

    type PIPELINE_TYPE_FOR_Y_VALID_PL           is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_SEL_CONFIG_PL        is array(0 to 2) of std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL is array(0 to 1) of std_logic_vector((bits(INPUTS_PER_MUX - 1) - 1) downto 0);
    type PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL is array(0 to 1) of std_logic_vector((XI_WIDTH*256-1) downto 0);

    -- 
    signal y_valid_pl           : PIPELINE_TYPE_FOR_Y_VALID_PL;
    -- 
    signal sel_config_pl        : PIPELINE_TYPE_FOR_SEL_CONFIG_PL;
    -- 
    signal layer_yo_1_pl        : PIPELINE_TYPE_FOR_LAYER_YO_1_PL;
    -- 
    signal mux_select_signal_pl : PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL;
    signal mux_select_signal        : unsigned((bits(INPUTS_PER_MUX - 1) - 1) downto 0);
    signal config_out_select_signal : unsigned((bits(CONFIGURATIONS - 1) - 1) downto 0);
    signal fifo_hold_counter        : unsigned((bits(FIFO_HOLD_CYCLES - 1) - 1) downto 0);
    signal data_next                : std_logic;
    signal fifo_data_counter        : unsigned(bits(FIFO_SIZE) downto 0);
    signal y_valid_signal           : std_logic;

    -- All fifo flags
    signal full_flag_MAIN_signal          : std_logic;
    signal empty_flag_MAIN_signal         : std_logic;

    -- All fifo outputs
    signal fifo_MAIN_input_signal         : std_logic_vector((XI_WIDTH*256-1) downto 0);
    -- 
    signal fifo_MAIN_output_signal_pl : PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL;
    --signal fifo_MAIN_output_signal        : std_logic_vector((XI_WIDTH*256-1) downto 0);
    signal fifo_1_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_2_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_3_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_4_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_5_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_6_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_7_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_8_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_9_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_10_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_11_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_12_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_13_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_14_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_15_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_16_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_17_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_18_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_19_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_20_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_21_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_22_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_23_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_24_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_25_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_26_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_27_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_28_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_29_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_30_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_31_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_32_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_33_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_34_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_35_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_36_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_37_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_38_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_39_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_40_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_41_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_42_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_43_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_44_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_45_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_46_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_47_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_48_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_49_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_50_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_51_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_52_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_53_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_54_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_55_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_56_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_57_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_58_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_59_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_60_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_61_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_62_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_63_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_64_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_65_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_66_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_67_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_68_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_69_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_70_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_71_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_72_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_73_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_74_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_75_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_76_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_77_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_78_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_79_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_80_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_81_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_82_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_83_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_84_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_85_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_86_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_87_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_88_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_89_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_90_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_91_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_92_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_93_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_94_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_95_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_96_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_97_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_98_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_99_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_100_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_101_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_102_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_103_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_104_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_105_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_106_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_107_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_108_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_109_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_110_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_111_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_112_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_113_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_114_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_115_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_116_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_117_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_118_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_119_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_120_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_121_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_122_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_123_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_124_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_125_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_126_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_127_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_128_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_129_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_130_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_131_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_132_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_133_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_134_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_135_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_136_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_137_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_138_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_139_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_140_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_141_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_142_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_143_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_144_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_145_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_146_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_147_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_148_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_149_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_150_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_151_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_152_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_153_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_154_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_155_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_156_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_157_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_158_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_159_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_160_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_161_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_162_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_163_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_164_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_165_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_166_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_167_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_168_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_169_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_170_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_171_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_172_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_173_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_174_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_175_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_176_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_177_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_178_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_179_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_180_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_181_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_182_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_183_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_184_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_185_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_186_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_187_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_188_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_189_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_190_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_191_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_192_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_193_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_194_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_195_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_196_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_197_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_198_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_199_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_200_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_201_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_202_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_203_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_204_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_205_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_206_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_207_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_208_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_209_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_210_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_211_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_212_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_213_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_214_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_215_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_216_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_217_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_218_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_219_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_220_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_221_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_222_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_223_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_224_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_225_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_226_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_227_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_228_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_229_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_230_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_231_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_232_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_233_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_234_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_235_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_236_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_237_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_238_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_239_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_240_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_241_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_242_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_243_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_244_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_245_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_246_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_247_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_248_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_249_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_250_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_251_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_252_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_253_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_254_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_255_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_256_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);

begin

    fifo_MAIN_input_signal <= layer_xi_1  & layer_xi_2  & layer_xi_3  & layer_xi_4  & layer_xi_5  & layer_xi_6  & layer_xi_7  & layer_xi_8  & layer_xi_9  & layer_xi_10  & layer_xi_11  & layer_xi_12  & layer_xi_13  & layer_xi_14  & layer_xi_15  & layer_xi_16  & layer_xi_17  & layer_xi_18  & layer_xi_19  & layer_xi_20  & layer_xi_21  & layer_xi_22  & layer_xi_23  & layer_xi_24  & layer_xi_25  & layer_xi_26  & layer_xi_27  & layer_xi_28  & layer_xi_29  & layer_xi_30  & layer_xi_31  & layer_xi_32  & layer_xi_33  & layer_xi_34  & layer_xi_35  & layer_xi_36  & layer_xi_37  & layer_xi_38  & layer_xi_39  & layer_xi_40  & layer_xi_41  & layer_xi_42  & layer_xi_43  & layer_xi_44  & layer_xi_45  & layer_xi_46  & layer_xi_47  & layer_xi_48  & layer_xi_49  & layer_xi_50  & layer_xi_51  & layer_xi_52  & layer_xi_53  & layer_xi_54  & layer_xi_55  & layer_xi_56  & layer_xi_57  & layer_xi_58  & layer_xi_59  & layer_xi_60  & layer_xi_61  & layer_xi_62  & layer_xi_63  & layer_xi_64  & layer_xi_65  & layer_xi_66  & layer_xi_67  & layer_xi_68  & layer_xi_69  & layer_xi_70  & layer_xi_71  & layer_xi_72  & layer_xi_73  & layer_xi_74  & layer_xi_75  & layer_xi_76  & layer_xi_77  & layer_xi_78  & layer_xi_79  & layer_xi_80  & layer_xi_81  & layer_xi_82  & layer_xi_83  & layer_xi_84  & layer_xi_85  & layer_xi_86  & layer_xi_87  & layer_xi_88  & layer_xi_89  & layer_xi_90  & layer_xi_91  & layer_xi_92  & layer_xi_93  & layer_xi_94  & layer_xi_95  & layer_xi_96  & layer_xi_97  & layer_xi_98  & layer_xi_99  & layer_xi_100  & layer_xi_101  & layer_xi_102  & layer_xi_103  & layer_xi_104  & layer_xi_105  & layer_xi_106  & layer_xi_107  & layer_xi_108  & layer_xi_109  & layer_xi_110  & layer_xi_111  & layer_xi_112  & layer_xi_113  & layer_xi_114  & layer_xi_115  & layer_xi_116  & layer_xi_117  & layer_xi_118  & layer_xi_119  & layer_xi_120  & layer_xi_121  & layer_xi_122  & layer_xi_123  & layer_xi_124  & layer_xi_125  & layer_xi_126  & layer_xi_127  & layer_xi_128  & layer_xi_129  & layer_xi_130  & layer_xi_131  & layer_xi_132  & layer_xi_133  & layer_xi_134  & layer_xi_135  & layer_xi_136  & layer_xi_137  & layer_xi_138  & layer_xi_139  & layer_xi_140  & layer_xi_141  & layer_xi_142  & layer_xi_143  & layer_xi_144  & layer_xi_145  & layer_xi_146  & layer_xi_147  & layer_xi_148  & layer_xi_149  & layer_xi_150  & layer_xi_151  & layer_xi_152  & layer_xi_153  & layer_xi_154  & layer_xi_155  & layer_xi_156  & layer_xi_157  & layer_xi_158  & layer_xi_159  & layer_xi_160  & layer_xi_161  & layer_xi_162  & layer_xi_163  & layer_xi_164  & layer_xi_165  & layer_xi_166  & layer_xi_167  & layer_xi_168  & layer_xi_169  & layer_xi_170  & layer_xi_171  & layer_xi_172  & layer_xi_173  & layer_xi_174  & layer_xi_175  & layer_xi_176  & layer_xi_177  & layer_xi_178  & layer_xi_179  & layer_xi_180  & layer_xi_181  & layer_xi_182  & layer_xi_183  & layer_xi_184  & layer_xi_185  & layer_xi_186  & layer_xi_187  & layer_xi_188  & layer_xi_189  & layer_xi_190  & layer_xi_191  & layer_xi_192  & layer_xi_193  & layer_xi_194  & layer_xi_195  & layer_xi_196  & layer_xi_197  & layer_xi_198  & layer_xi_199  & layer_xi_200  & layer_xi_201  & layer_xi_202  & layer_xi_203  & layer_xi_204  & layer_xi_205  & layer_xi_206  & layer_xi_207  & layer_xi_208  & layer_xi_209  & layer_xi_210  & layer_xi_211  & layer_xi_212  & layer_xi_213  & layer_xi_214  & layer_xi_215  & layer_xi_216  & layer_xi_217  & layer_xi_218  & layer_xi_219  & layer_xi_220  & layer_xi_221  & layer_xi_222  & layer_xi_223  & layer_xi_224  & layer_xi_225  & layer_xi_226  & layer_xi_227  & layer_xi_228  & layer_xi_229  & layer_xi_230  & layer_xi_231  & layer_xi_232  & layer_xi_233  & layer_xi_234  & layer_xi_235  & layer_xi_236  & layer_xi_237  & layer_xi_238  & layer_xi_239  & layer_xi_240  & layer_xi_241  & layer_xi_242  & layer_xi_243  & layer_xi_244  & layer_xi_245  & layer_xi_246  & layer_xi_247  & layer_xi_248  & layer_xi_249  & layer_xi_250  & layer_xi_251  & layer_xi_252  & layer_xi_253  & layer_xi_254  & layer_xi_255  & layer_xi_256 ;


    FIFO_1: entity work.fifo_master_generator generic map(XI_WIDTH => XI_WIDTH*256, XI_DEPTH => FIFO_SIZE)
        port map
        (
            reset => reset,
            clk   => clk,
            write_en   => x_is_valid,
            data_in    => fifo_MAIN_input_signal,
            full_flag  => full_flag_MAIN_signal,
            read_en    => data_next,
            data_out   => fifo_MAIN_output_signal_pl(0),
            empty_flag => empty_flag_MAIN_signal,
            data_available => open
        );
    mux_select_signal_pl(0) <= std_logic_vector(mux_select_signal);

    -- Add a pipeline step
    PL_STEP_0_for_mux_select_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', mux_select_signal_pl(0), mux_select_signal_pl(1));
    PL_STEP_0_for_fifo_MAIN_output_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', fifo_MAIN_output_signal_pl(0), fifo_MAIN_output_signal_pl(1));


    fifo_1_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*256)-1 downto (XI_WIDTH*255));
    fifo_2_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*255)-1 downto (XI_WIDTH*254));
    fifo_3_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*254)-1 downto (XI_WIDTH*253));
    fifo_4_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*253)-1 downto (XI_WIDTH*252));
    fifo_5_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*252)-1 downto (XI_WIDTH*251));
    fifo_6_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*251)-1 downto (XI_WIDTH*250));
    fifo_7_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*250)-1 downto (XI_WIDTH*249));
    fifo_8_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*249)-1 downto (XI_WIDTH*248));
    fifo_9_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*248)-1 downto (XI_WIDTH*247));
    fifo_10_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*247)-1 downto (XI_WIDTH*246));
    fifo_11_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*246)-1 downto (XI_WIDTH*245));
    fifo_12_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*245)-1 downto (XI_WIDTH*244));
    fifo_13_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*244)-1 downto (XI_WIDTH*243));
    fifo_14_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*243)-1 downto (XI_WIDTH*242));
    fifo_15_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*242)-1 downto (XI_WIDTH*241));
    fifo_16_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*241)-1 downto (XI_WIDTH*240));
    fifo_17_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*240)-1 downto (XI_WIDTH*239));
    fifo_18_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*239)-1 downto (XI_WIDTH*238));
    fifo_19_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*238)-1 downto (XI_WIDTH*237));
    fifo_20_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*237)-1 downto (XI_WIDTH*236));
    fifo_21_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*236)-1 downto (XI_WIDTH*235));
    fifo_22_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*235)-1 downto (XI_WIDTH*234));
    fifo_23_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*234)-1 downto (XI_WIDTH*233));
    fifo_24_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*233)-1 downto (XI_WIDTH*232));
    fifo_25_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*232)-1 downto (XI_WIDTH*231));
    fifo_26_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*231)-1 downto (XI_WIDTH*230));
    fifo_27_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*230)-1 downto (XI_WIDTH*229));
    fifo_28_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*229)-1 downto (XI_WIDTH*228));
    fifo_29_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*228)-1 downto (XI_WIDTH*227));
    fifo_30_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*227)-1 downto (XI_WIDTH*226));
    fifo_31_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*226)-1 downto (XI_WIDTH*225));
    fifo_32_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*225)-1 downto (XI_WIDTH*224));
    fifo_33_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*224)-1 downto (XI_WIDTH*223));
    fifo_34_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*223)-1 downto (XI_WIDTH*222));
    fifo_35_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*222)-1 downto (XI_WIDTH*221));
    fifo_36_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*221)-1 downto (XI_WIDTH*220));
    fifo_37_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*220)-1 downto (XI_WIDTH*219));
    fifo_38_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*219)-1 downto (XI_WIDTH*218));
    fifo_39_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*218)-1 downto (XI_WIDTH*217));
    fifo_40_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*217)-1 downto (XI_WIDTH*216));
    fifo_41_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*216)-1 downto (XI_WIDTH*215));
    fifo_42_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*215)-1 downto (XI_WIDTH*214));
    fifo_43_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*214)-1 downto (XI_WIDTH*213));
    fifo_44_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*213)-1 downto (XI_WIDTH*212));
    fifo_45_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*212)-1 downto (XI_WIDTH*211));
    fifo_46_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*211)-1 downto (XI_WIDTH*210));
    fifo_47_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*210)-1 downto (XI_WIDTH*209));
    fifo_48_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*209)-1 downto (XI_WIDTH*208));
    fifo_49_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*208)-1 downto (XI_WIDTH*207));
    fifo_50_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*207)-1 downto (XI_WIDTH*206));
    fifo_51_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*206)-1 downto (XI_WIDTH*205));
    fifo_52_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*205)-1 downto (XI_WIDTH*204));
    fifo_53_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*204)-1 downto (XI_WIDTH*203));
    fifo_54_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*203)-1 downto (XI_WIDTH*202));
    fifo_55_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*202)-1 downto (XI_WIDTH*201));
    fifo_56_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*201)-1 downto (XI_WIDTH*200));
    fifo_57_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*200)-1 downto (XI_WIDTH*199));
    fifo_58_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*199)-1 downto (XI_WIDTH*198));
    fifo_59_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*198)-1 downto (XI_WIDTH*197));
    fifo_60_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*197)-1 downto (XI_WIDTH*196));
    fifo_61_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*196)-1 downto (XI_WIDTH*195));
    fifo_62_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*195)-1 downto (XI_WIDTH*194));
    fifo_63_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*194)-1 downto (XI_WIDTH*193));
    fifo_64_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*193)-1 downto (XI_WIDTH*192));
    fifo_65_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*192)-1 downto (XI_WIDTH*191));
    fifo_66_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*191)-1 downto (XI_WIDTH*190));
    fifo_67_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*190)-1 downto (XI_WIDTH*189));
    fifo_68_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*189)-1 downto (XI_WIDTH*188));
    fifo_69_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*188)-1 downto (XI_WIDTH*187));
    fifo_70_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*187)-1 downto (XI_WIDTH*186));
    fifo_71_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*186)-1 downto (XI_WIDTH*185));
    fifo_72_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*185)-1 downto (XI_WIDTH*184));
    fifo_73_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*184)-1 downto (XI_WIDTH*183));
    fifo_74_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*183)-1 downto (XI_WIDTH*182));
    fifo_75_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*182)-1 downto (XI_WIDTH*181));
    fifo_76_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*181)-1 downto (XI_WIDTH*180));
    fifo_77_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*180)-1 downto (XI_WIDTH*179));
    fifo_78_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*179)-1 downto (XI_WIDTH*178));
    fifo_79_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*178)-1 downto (XI_WIDTH*177));
    fifo_80_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*177)-1 downto (XI_WIDTH*176));
    fifo_81_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*176)-1 downto (XI_WIDTH*175));
    fifo_82_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*175)-1 downto (XI_WIDTH*174));
    fifo_83_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*174)-1 downto (XI_WIDTH*173));
    fifo_84_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*173)-1 downto (XI_WIDTH*172));
    fifo_85_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*172)-1 downto (XI_WIDTH*171));
    fifo_86_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*171)-1 downto (XI_WIDTH*170));
    fifo_87_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*170)-1 downto (XI_WIDTH*169));
    fifo_88_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*169)-1 downto (XI_WIDTH*168));
    fifo_89_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*168)-1 downto (XI_WIDTH*167));
    fifo_90_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*167)-1 downto (XI_WIDTH*166));
    fifo_91_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*166)-1 downto (XI_WIDTH*165));
    fifo_92_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*165)-1 downto (XI_WIDTH*164));
    fifo_93_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*164)-1 downto (XI_WIDTH*163));
    fifo_94_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*163)-1 downto (XI_WIDTH*162));
    fifo_95_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*162)-1 downto (XI_WIDTH*161));
    fifo_96_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*161)-1 downto (XI_WIDTH*160));
    fifo_97_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*160)-1 downto (XI_WIDTH*159));
    fifo_98_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*159)-1 downto (XI_WIDTH*158));
    fifo_99_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*158)-1 downto (XI_WIDTH*157));
    fifo_100_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*157)-1 downto (XI_WIDTH*156));
    fifo_101_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*156)-1 downto (XI_WIDTH*155));
    fifo_102_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*155)-1 downto (XI_WIDTH*154));
    fifo_103_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*154)-1 downto (XI_WIDTH*153));
    fifo_104_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*153)-1 downto (XI_WIDTH*152));
    fifo_105_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*152)-1 downto (XI_WIDTH*151));
    fifo_106_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*151)-1 downto (XI_WIDTH*150));
    fifo_107_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*150)-1 downto (XI_WIDTH*149));
    fifo_108_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*149)-1 downto (XI_WIDTH*148));
    fifo_109_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*148)-1 downto (XI_WIDTH*147));
    fifo_110_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*147)-1 downto (XI_WIDTH*146));
    fifo_111_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*146)-1 downto (XI_WIDTH*145));
    fifo_112_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*145)-1 downto (XI_WIDTH*144));
    fifo_113_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*144)-1 downto (XI_WIDTH*143));
    fifo_114_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*143)-1 downto (XI_WIDTH*142));
    fifo_115_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*142)-1 downto (XI_WIDTH*141));
    fifo_116_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*141)-1 downto (XI_WIDTH*140));
    fifo_117_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*140)-1 downto (XI_WIDTH*139));
    fifo_118_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*139)-1 downto (XI_WIDTH*138));
    fifo_119_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*138)-1 downto (XI_WIDTH*137));
    fifo_120_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*137)-1 downto (XI_WIDTH*136));
    fifo_121_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*136)-1 downto (XI_WIDTH*135));
    fifo_122_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*135)-1 downto (XI_WIDTH*134));
    fifo_123_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*134)-1 downto (XI_WIDTH*133));
    fifo_124_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*133)-1 downto (XI_WIDTH*132));
    fifo_125_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*132)-1 downto (XI_WIDTH*131));
    fifo_126_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*131)-1 downto (XI_WIDTH*130));
    fifo_127_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*130)-1 downto (XI_WIDTH*129));
    fifo_128_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*129)-1 downto (XI_WIDTH*128));
    fifo_129_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*128)-1 downto (XI_WIDTH*127));
    fifo_130_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*127)-1 downto (XI_WIDTH*126));
    fifo_131_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*126)-1 downto (XI_WIDTH*125));
    fifo_132_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*125)-1 downto (XI_WIDTH*124));
    fifo_133_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*124)-1 downto (XI_WIDTH*123));
    fifo_134_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*123)-1 downto (XI_WIDTH*122));
    fifo_135_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*122)-1 downto (XI_WIDTH*121));
    fifo_136_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*121)-1 downto (XI_WIDTH*120));
    fifo_137_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*120)-1 downto (XI_WIDTH*119));
    fifo_138_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*119)-1 downto (XI_WIDTH*118));
    fifo_139_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*118)-1 downto (XI_WIDTH*117));
    fifo_140_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*117)-1 downto (XI_WIDTH*116));
    fifo_141_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*116)-1 downto (XI_WIDTH*115));
    fifo_142_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*115)-1 downto (XI_WIDTH*114));
    fifo_143_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*114)-1 downto (XI_WIDTH*113));
    fifo_144_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*113)-1 downto (XI_WIDTH*112));
    fifo_145_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*112)-1 downto (XI_WIDTH*111));
    fifo_146_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*111)-1 downto (XI_WIDTH*110));
    fifo_147_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*110)-1 downto (XI_WIDTH*109));
    fifo_148_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*109)-1 downto (XI_WIDTH*108));
    fifo_149_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*108)-1 downto (XI_WIDTH*107));
    fifo_150_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*107)-1 downto (XI_WIDTH*106));
    fifo_151_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*106)-1 downto (XI_WIDTH*105));
    fifo_152_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*105)-1 downto (XI_WIDTH*104));
    fifo_153_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*104)-1 downto (XI_WIDTH*103));
    fifo_154_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*103)-1 downto (XI_WIDTH*102));
    fifo_155_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*102)-1 downto (XI_WIDTH*101));
    fifo_156_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*101)-1 downto (XI_WIDTH*100));
    fifo_157_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*100)-1 downto (XI_WIDTH*99));
    fifo_158_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*99)-1 downto (XI_WIDTH*98));
    fifo_159_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*98)-1 downto (XI_WIDTH*97));
    fifo_160_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*97)-1 downto (XI_WIDTH*96));
    fifo_161_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*96)-1 downto (XI_WIDTH*95));
    fifo_162_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*95)-1 downto (XI_WIDTH*94));
    fifo_163_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*94)-1 downto (XI_WIDTH*93));
    fifo_164_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*93)-1 downto (XI_WIDTH*92));
    fifo_165_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*92)-1 downto (XI_WIDTH*91));
    fifo_166_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*91)-1 downto (XI_WIDTH*90));
    fifo_167_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*90)-1 downto (XI_WIDTH*89));
    fifo_168_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*89)-1 downto (XI_WIDTH*88));
    fifo_169_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*88)-1 downto (XI_WIDTH*87));
    fifo_170_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*87)-1 downto (XI_WIDTH*86));
    fifo_171_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*86)-1 downto (XI_WIDTH*85));
    fifo_172_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*85)-1 downto (XI_WIDTH*84));
    fifo_173_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*84)-1 downto (XI_WIDTH*83));
    fifo_174_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*83)-1 downto (XI_WIDTH*82));
    fifo_175_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*82)-1 downto (XI_WIDTH*81));
    fifo_176_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*81)-1 downto (XI_WIDTH*80));
    fifo_177_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*80)-1 downto (XI_WIDTH*79));
    fifo_178_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*79)-1 downto (XI_WIDTH*78));
    fifo_179_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*78)-1 downto (XI_WIDTH*77));
    fifo_180_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*77)-1 downto (XI_WIDTH*76));
    fifo_181_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*76)-1 downto (XI_WIDTH*75));
    fifo_182_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*75)-1 downto (XI_WIDTH*74));
    fifo_183_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*74)-1 downto (XI_WIDTH*73));
    fifo_184_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*73)-1 downto (XI_WIDTH*72));
    fifo_185_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*72)-1 downto (XI_WIDTH*71));
    fifo_186_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*71)-1 downto (XI_WIDTH*70));
    fifo_187_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*70)-1 downto (XI_WIDTH*69));
    fifo_188_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*69)-1 downto (XI_WIDTH*68));
    fifo_189_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*68)-1 downto (XI_WIDTH*67));
    fifo_190_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*67)-1 downto (XI_WIDTH*66));
    fifo_191_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*66)-1 downto (XI_WIDTH*65));
    fifo_192_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*65)-1 downto (XI_WIDTH*64));
    fifo_193_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*64)-1 downto (XI_WIDTH*63));
    fifo_194_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*63)-1 downto (XI_WIDTH*62));
    fifo_195_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*62)-1 downto (XI_WIDTH*61));
    fifo_196_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*61)-1 downto (XI_WIDTH*60));
    fifo_197_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*60)-1 downto (XI_WIDTH*59));
    fifo_198_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*59)-1 downto (XI_WIDTH*58));
    fifo_199_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*58)-1 downto (XI_WIDTH*57));
    fifo_200_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*57)-1 downto (XI_WIDTH*56));
    fifo_201_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*56)-1 downto (XI_WIDTH*55));
    fifo_202_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*55)-1 downto (XI_WIDTH*54));
    fifo_203_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*54)-1 downto (XI_WIDTH*53));
    fifo_204_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*53)-1 downto (XI_WIDTH*52));
    fifo_205_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*52)-1 downto (XI_WIDTH*51));
    fifo_206_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*51)-1 downto (XI_WIDTH*50));
    fifo_207_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*50)-1 downto (XI_WIDTH*49));
    fifo_208_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*49)-1 downto (XI_WIDTH*48));
    fifo_209_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*48)-1 downto (XI_WIDTH*47));
    fifo_210_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*47)-1 downto (XI_WIDTH*46));
    fifo_211_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*46)-1 downto (XI_WIDTH*45));
    fifo_212_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*45)-1 downto (XI_WIDTH*44));
    fifo_213_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*44)-1 downto (XI_WIDTH*43));
    fifo_214_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*43)-1 downto (XI_WIDTH*42));
    fifo_215_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*42)-1 downto (XI_WIDTH*41));
    fifo_216_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*41)-1 downto (XI_WIDTH*40));
    fifo_217_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*40)-1 downto (XI_WIDTH*39));
    fifo_218_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*39)-1 downto (XI_WIDTH*38));
    fifo_219_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*38)-1 downto (XI_WIDTH*37));
    fifo_220_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*37)-1 downto (XI_WIDTH*36));
    fifo_221_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*36)-1 downto (XI_WIDTH*35));
    fifo_222_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*35)-1 downto (XI_WIDTH*34));
    fifo_223_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*34)-1 downto (XI_WIDTH*33));
    fifo_224_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*33)-1 downto (XI_WIDTH*32));
    fifo_225_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*32)-1 downto (XI_WIDTH*31));
    fifo_226_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*31)-1 downto (XI_WIDTH*30));
    fifo_227_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*30)-1 downto (XI_WIDTH*29));
    fifo_228_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*29)-1 downto (XI_WIDTH*28));
    fifo_229_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*28)-1 downto (XI_WIDTH*27));
    fifo_230_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*27)-1 downto (XI_WIDTH*26));
    fifo_231_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*26)-1 downto (XI_WIDTH*25));
    fifo_232_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*25)-1 downto (XI_WIDTH*24));
    fifo_233_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*24)-1 downto (XI_WIDTH*23));
    fifo_234_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*23)-1 downto (XI_WIDTH*22));
    fifo_235_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*22)-1 downto (XI_WIDTH*21));
    fifo_236_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*21)-1 downto (XI_WIDTH*20));
    fifo_237_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*20)-1 downto (XI_WIDTH*19));
    fifo_238_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*19)-1 downto (XI_WIDTH*18));
    fifo_239_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*18)-1 downto (XI_WIDTH*17));
    fifo_240_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*17)-1 downto (XI_WIDTH*16));
    fifo_241_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*16)-1 downto (XI_WIDTH*15));
    fifo_242_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*15)-1 downto (XI_WIDTH*14));
    fifo_243_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*14)-1 downto (XI_WIDTH*13));
    fifo_244_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*13)-1 downto (XI_WIDTH*12));
    fifo_245_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*12)-1 downto (XI_WIDTH*11));
    fifo_246_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*11)-1 downto (XI_WIDTH*10));
    fifo_247_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*10)-1 downto (XI_WIDTH*9));
    fifo_248_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*9)-1 downto (XI_WIDTH*8));
    fifo_249_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*8)-1 downto (XI_WIDTH*7));
    fifo_250_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*7)-1 downto (XI_WIDTH*6));
    fifo_251_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*6)-1 downto (XI_WIDTH*5));
    fifo_252_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*5)-1 downto (XI_WIDTH*4));
    fifo_253_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*4)-1 downto (XI_WIDTH*3));
    fifo_254_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*3)-1 downto (XI_WIDTH*2));
    fifo_255_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*2)-1 downto (XI_WIDTH*1));
    fifo_256_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*1)-1 downto (XI_WIDTH*0));



    MUX_0: entity work.muxB_256to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_1_output_signal, fifo_2_output_signal, fifo_3_output_signal, fifo_4_output_signal, fifo_5_output_signal, fifo_6_output_signal, fifo_7_output_signal, fifo_8_output_signal, fifo_9_output_signal, fifo_10_output_signal, fifo_11_output_signal, fifo_12_output_signal, fifo_13_output_signal, fifo_14_output_signal, fifo_15_output_signal, fifo_16_output_signal, fifo_17_output_signal, fifo_18_output_signal, fifo_19_output_signal, fifo_20_output_signal, fifo_21_output_signal, fifo_22_output_signal, fifo_23_output_signal, fifo_24_output_signal, fifo_25_output_signal, fifo_26_output_signal, fifo_27_output_signal, fifo_28_output_signal, fifo_29_output_signal, fifo_30_output_signal, fifo_31_output_signal, fifo_32_output_signal, fifo_33_output_signal, fifo_34_output_signal, fifo_35_output_signal, fifo_36_output_signal, fifo_37_output_signal, fifo_38_output_signal, fifo_39_output_signal, fifo_40_output_signal, fifo_41_output_signal, fifo_42_output_signal, fifo_43_output_signal, fifo_44_output_signal, fifo_45_output_signal, fifo_46_output_signal, fifo_47_output_signal, fifo_48_output_signal, fifo_49_output_signal, fifo_50_output_signal, fifo_51_output_signal, fifo_52_output_signal, fifo_53_output_signal, fifo_54_output_signal, fifo_55_output_signal, fifo_56_output_signal, fifo_57_output_signal, fifo_58_output_signal, fifo_59_output_signal, fifo_60_output_signal, fifo_61_output_signal, fifo_62_output_signal, fifo_63_output_signal, fifo_64_output_signal, fifo_65_output_signal, fifo_66_output_signal, fifo_67_output_signal, fifo_68_output_signal, fifo_69_output_signal, fifo_70_output_signal, fifo_71_output_signal, fifo_72_output_signal, fifo_73_output_signal, fifo_74_output_signal, fifo_75_output_signal, fifo_76_output_signal, fifo_77_output_signal, fifo_78_output_signal, fifo_79_output_signal, fifo_80_output_signal, fifo_81_output_signal, fifo_82_output_signal, fifo_83_output_signal, fifo_84_output_signal, fifo_85_output_signal, fifo_86_output_signal, fifo_87_output_signal, fifo_88_output_signal, fifo_89_output_signal, fifo_90_output_signal, fifo_91_output_signal, fifo_92_output_signal, fifo_93_output_signal, fifo_94_output_signal, fifo_95_output_signal, fifo_96_output_signal, fifo_97_output_signal, fifo_98_output_signal, fifo_99_output_signal, fifo_100_output_signal, fifo_101_output_signal, fifo_102_output_signal, fifo_103_output_signal, fifo_104_output_signal, fifo_105_output_signal, fifo_106_output_signal, fifo_107_output_signal, fifo_108_output_signal, fifo_109_output_signal, fifo_110_output_signal, fifo_111_output_signal, fifo_112_output_signal, fifo_113_output_signal, fifo_114_output_signal, fifo_115_output_signal, fifo_116_output_signal, fifo_117_output_signal, fifo_118_output_signal, fifo_119_output_signal, fifo_120_output_signal, fifo_121_output_signal, fifo_122_output_signal, fifo_123_output_signal, fifo_124_output_signal, fifo_125_output_signal, fifo_126_output_signal, fifo_127_output_signal, fifo_128_output_signal, fifo_129_output_signal, fifo_130_output_signal, fifo_131_output_signal, fifo_132_output_signal, fifo_133_output_signal, fifo_134_output_signal, fifo_135_output_signal, fifo_136_output_signal, fifo_137_output_signal, fifo_138_output_signal, fifo_139_output_signal, fifo_140_output_signal, fifo_141_output_signal, fifo_142_output_signal, fifo_143_output_signal, fifo_144_output_signal, fifo_145_output_signal, fifo_146_output_signal, fifo_147_output_signal, fifo_148_output_signal, fifo_149_output_signal, fifo_150_output_signal, fifo_151_output_signal, fifo_152_output_signal, fifo_153_output_signal, fifo_154_output_signal, fifo_155_output_signal, fifo_156_output_signal, fifo_157_output_signal, fifo_158_output_signal, fifo_159_output_signal, fifo_160_output_signal, fifo_161_output_signal, fifo_162_output_signal, fifo_163_output_signal, fifo_164_output_signal, fifo_165_output_signal, fifo_166_output_signal, fifo_167_output_signal, fifo_168_output_signal, fifo_169_output_signal, fifo_170_output_signal, fifo_171_output_signal, fifo_172_output_signal, fifo_173_output_signal, fifo_174_output_signal, fifo_175_output_signal, fifo_176_output_signal, fifo_177_output_signal, fifo_178_output_signal, fifo_179_output_signal, fifo_180_output_signal, fifo_181_output_signal, fifo_182_output_signal, fifo_183_output_signal, fifo_184_output_signal, fifo_185_output_signal, fifo_186_output_signal, fifo_187_output_signal, fifo_188_output_signal, fifo_189_output_signal, fifo_190_output_signal, fifo_191_output_signal, fifo_192_output_signal, fifo_193_output_signal, fifo_194_output_signal, fifo_195_output_signal, fifo_196_output_signal, fifo_197_output_signal, fifo_198_output_signal, fifo_199_output_signal, fifo_200_output_signal, fifo_201_output_signal, fifo_202_output_signal, fifo_203_output_signal, fifo_204_output_signal, fifo_205_output_signal, fifo_206_output_signal, fifo_207_output_signal, fifo_208_output_signal, fifo_209_output_signal, fifo_210_output_signal, fifo_211_output_signal, fifo_212_output_signal, fifo_213_output_signal, fifo_214_output_signal, fifo_215_output_signal, fifo_216_output_signal, fifo_217_output_signal, fifo_218_output_signal, fifo_219_output_signal, fifo_220_output_signal, fifo_221_output_signal, fifo_222_output_signal, fifo_223_output_signal, fifo_224_output_signal, fifo_225_output_signal, fifo_226_output_signal, fifo_227_output_signal, fifo_228_output_signal, fifo_229_output_signal, fifo_230_output_signal, fifo_231_output_signal, fifo_232_output_signal, fifo_233_output_signal, fifo_234_output_signal, fifo_235_output_signal, fifo_236_output_signal, fifo_237_output_signal, fifo_238_output_signal, fifo_239_output_signal, fifo_240_output_signal, fifo_241_output_signal, fifo_242_output_signal, fifo_243_output_signal, fifo_244_output_signal, fifo_245_output_signal, fifo_246_output_signal, fifo_247_output_signal, fifo_248_output_signal, fifo_249_output_signal, fifo_250_output_signal, fifo_251_output_signal, fifo_252_output_signal, fifo_253_output_signal, fifo_254_output_signal, fifo_255_output_signal, fifo_256_output_signal, mux_select_signal_pl(1), layer_yo_1_pl(0));


    y_valid_pl(0) <= y_valid_signal;
    sel_config_pl(0) <= std_logic_vector(config_out_select_signal);

     state_output: process(clk, reset)
    begin
        if reset = '1' then
            mux_select_signal <= (others => '0');
            config_out_select_signal <= (others => '0');
            fifo_data_counter <= (others => '0');
            state <= AWAIT_THRESHOLD;
            debug_state_signal <= to_unsigned(0, debug_state_signal'length);
            y_valid_signal <= '0';
            fifo_hold_counter <= (others => '0');
            data_next <= '0';
        elsif rising_edge(clk) then
            case state is
                when AWAIT_THRESHOLD =>
                    y_valid_signal <= '0';

                    if fifo_data_counter >= FIFO_START_THR then
                        state <= LOAD_FIRST;
                        debug_state_signal <= to_unsigned(1, debug_state_signal'length);
                        mux_select_signal <= (others => '0');
                        data_next <= '1';
                    else
                        state <= AWAIT_THRESHOLD;
                        debug_state_signal <= to_unsigned(0, debug_state_signal'length);
                        data_next <= '0';
                    end if;

                when LOAD_FIRST =>data_next <= '0';
                    y_valid_signal <= '1';
                    state <= FLUSH_DATA;
                    debug_state_signal <= to_unsigned(2, debug_state_signal'length);

                when FLUSH_DATA =>
                    if fifo_data_counter > 0 and fifo_hold_counter = FIFO_HOLD_CYCLES - 2  then
                        data_next <= '1'; -- Not when the next layer interleaves data! This would be the case when r_in < 1
                    else
                        data_next <= '0';
                    end if;

                    if fifo_hold_counter = to_unsigned(FIFO_HOLD_CYCLES - 1, fifo_hold_counter'length) then
                        fifo_hold_counter <= (others =>'0');
                    else
                        fifo_hold_counter <= fifo_hold_counter + 1;
                    end if;
                    
                        if mux_select_signal = to_unsigned(INPUTS_PER_MUX - 1, mux_select_signal'length) then
                            mux_select_signal <= (others =>'0');
                        else
                            mux_select_signal <= mux_select_signal + 1;
                        end if;

                    if config_out_select_signal = to_unsigned(CONFIGURATIONS - 1, config_out_select_signal'length) then
                        config_out_select_signal <= (others =>'0');
                    else
                        config_out_select_signal <= config_out_select_signal + 1;
                    end if;

                    if data_next = '0' and mux_select_signal = INPUTS_PER_MUX - 1  then
                        state <= AWAIT_THRESHOLD;
                        debug_state_signal <= to_unsigned(0, debug_state_signal'length);
                        y_valid_signal <= '0';
                    else
                        state <= FLUSH_DATA;
                        debug_state_signal <= to_unsigned(2, debug_state_signal'length);
                        y_valid_signal <= '1';
                    end if;

                when others =>
                    data_next <= '0';
                    y_valid_signal <= '0';
            end case;

            if x_is_valid = '0' and data_next = '1' then
                fifo_data_counter <= fifo_data_counter - 1;
            elsif x_is_valid = '1' and data_next = '0' then
                fifo_data_counter <= fifo_data_counter + 1;
            end if;

        end if;
    end process;

    -- Simulation: Raise exception on buffer overflow!
    process(clk)
    begin
        if rising_edge(clk) then
            if fifo_data_counter >= FIFO_SIZE then
                assert false
                report "Interleaving layer poolavg_interleaving: FIFO Overflow!"
                severity warning;
            end if;
        end if;
    end process;

    -- Add a pipeline step
    PL_STEP_0_for_y_valid_pl: entity work.Pipe PORT MAP(clk, '1', y_valid_pl(0), y_valid_pl(1));
    PL_STEP_0_for_sel_config_pl: entity work.Pipe_Vector PORT MAP(clk, '1', sel_config_pl(0), sel_config_pl(1));
    PL_STEP_0_for_layer_yo_1_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_1_pl(0), layer_yo_1_pl(1));
    -- Add a pipeline step
    PL_STEP_1_for_y_valid_pl: entity work.Pipe PORT MAP(clk, '1', y_valid_pl(1), y_valid_pl(2));
    PL_STEP_1_for_sel_config_pl: entity work.Pipe_Vector PORT MAP(clk, '1', sel_config_pl(1), sel_config_pl(2));

    y_valid <= y_valid_pl(2);
    sel_config <= sel_config_pl(2);
    layer_yo_1 <= layer_yo_1_pl(1);

end Behavioral;