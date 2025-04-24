library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv11_core1_rmcm_weightsconstant_memory is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 64;
        WORDS_PER_ADDR                : natural := 64
    );
    Port (
        clk : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
    
        dout1    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout2    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout3    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout4    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout5    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout6    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout7    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout8    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout9    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout10    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout11    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout12    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout13    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout14    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout15    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout16    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout17    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout18    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout19    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout20    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout21    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout22    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout23    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout24    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout25    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout26    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout27    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout28    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout29    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout30    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout31    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout32    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout33    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout34    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout35    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout36    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout37    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout38    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout39    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout40    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout41    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout42    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout43    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout44    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout45    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout46    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout47    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout48    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout49    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout50    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout51    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout52    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout53    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout54    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout55    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout56    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout57    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout58    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout59    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout60    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout61    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout62    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout63    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout64    : out std_logic_vector((XI_WIDTH-1) downto 0)
    );
end conv11_core1_rmcm_weightsconstant_memory;

architecture Behavioral of conv11_core1_rmcm_weightsconstant_memory is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv11_core1_rmcm_weightsconstant_memory : entity is "yes";

    signal rom_data_out_signal : std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

begin

    ROM_BLOCK: entity conv11_core1_rmcm_weightsconstant_memoryROM generic map
    (
        XI_WIDTH        	=> XI_WIDTH,
        ARRAY_SIZE          => ARRAY_SIZE,
        WORDS_PER_ADDR      => WORDS_PER_ADDR
    )
    port map
    (
        clk => clk,
        data_index => data_index,
        dout => rom_data_out_signal
    );


    dout1 <= rom_data_out_signal((XI_WIDTH*64)-1 downto (XI_WIDTH*63));
    dout2 <= rom_data_out_signal((XI_WIDTH*63)-1 downto (XI_WIDTH*62));
    dout3 <= rom_data_out_signal((XI_WIDTH*62)-1 downto (XI_WIDTH*61));
    dout4 <= rom_data_out_signal((XI_WIDTH*61)-1 downto (XI_WIDTH*60));
    dout5 <= rom_data_out_signal((XI_WIDTH*60)-1 downto (XI_WIDTH*59));
    dout6 <= rom_data_out_signal((XI_WIDTH*59)-1 downto (XI_WIDTH*58));
    dout7 <= rom_data_out_signal((XI_WIDTH*58)-1 downto (XI_WIDTH*57));
    dout8 <= rom_data_out_signal((XI_WIDTH*57)-1 downto (XI_WIDTH*56));
    dout9 <= rom_data_out_signal((XI_WIDTH*56)-1 downto (XI_WIDTH*55));
    dout10 <= rom_data_out_signal((XI_WIDTH*55)-1 downto (XI_WIDTH*54));
    dout11 <= rom_data_out_signal((XI_WIDTH*54)-1 downto (XI_WIDTH*53));
    dout12 <= rom_data_out_signal((XI_WIDTH*53)-1 downto (XI_WIDTH*52));
    dout13 <= rom_data_out_signal((XI_WIDTH*52)-1 downto (XI_WIDTH*51));
    dout14 <= rom_data_out_signal((XI_WIDTH*51)-1 downto (XI_WIDTH*50));
    dout15 <= rom_data_out_signal((XI_WIDTH*50)-1 downto (XI_WIDTH*49));
    dout16 <= rom_data_out_signal((XI_WIDTH*49)-1 downto (XI_WIDTH*48));
    dout17 <= rom_data_out_signal((XI_WIDTH*48)-1 downto (XI_WIDTH*47));
    dout18 <= rom_data_out_signal((XI_WIDTH*47)-1 downto (XI_WIDTH*46));
    dout19 <= rom_data_out_signal((XI_WIDTH*46)-1 downto (XI_WIDTH*45));
    dout20 <= rom_data_out_signal((XI_WIDTH*45)-1 downto (XI_WIDTH*44));
    dout21 <= rom_data_out_signal((XI_WIDTH*44)-1 downto (XI_WIDTH*43));
    dout22 <= rom_data_out_signal((XI_WIDTH*43)-1 downto (XI_WIDTH*42));
    dout23 <= rom_data_out_signal((XI_WIDTH*42)-1 downto (XI_WIDTH*41));
    dout24 <= rom_data_out_signal((XI_WIDTH*41)-1 downto (XI_WIDTH*40));
    dout25 <= rom_data_out_signal((XI_WIDTH*40)-1 downto (XI_WIDTH*39));
    dout26 <= rom_data_out_signal((XI_WIDTH*39)-1 downto (XI_WIDTH*38));
    dout27 <= rom_data_out_signal((XI_WIDTH*38)-1 downto (XI_WIDTH*37));
    dout28 <= rom_data_out_signal((XI_WIDTH*37)-1 downto (XI_WIDTH*36));
    dout29 <= rom_data_out_signal((XI_WIDTH*36)-1 downto (XI_WIDTH*35));
    dout30 <= rom_data_out_signal((XI_WIDTH*35)-1 downto (XI_WIDTH*34));
    dout31 <= rom_data_out_signal((XI_WIDTH*34)-1 downto (XI_WIDTH*33));
    dout32 <= rom_data_out_signal((XI_WIDTH*33)-1 downto (XI_WIDTH*32));
    dout33 <= rom_data_out_signal((XI_WIDTH*32)-1 downto (XI_WIDTH*31));
    dout34 <= rom_data_out_signal((XI_WIDTH*31)-1 downto (XI_WIDTH*30));
    dout35 <= rom_data_out_signal((XI_WIDTH*30)-1 downto (XI_WIDTH*29));
    dout36 <= rom_data_out_signal((XI_WIDTH*29)-1 downto (XI_WIDTH*28));
    dout37 <= rom_data_out_signal((XI_WIDTH*28)-1 downto (XI_WIDTH*27));
    dout38 <= rom_data_out_signal((XI_WIDTH*27)-1 downto (XI_WIDTH*26));
    dout39 <= rom_data_out_signal((XI_WIDTH*26)-1 downto (XI_WIDTH*25));
    dout40 <= rom_data_out_signal((XI_WIDTH*25)-1 downto (XI_WIDTH*24));
    dout41 <= rom_data_out_signal((XI_WIDTH*24)-1 downto (XI_WIDTH*23));
    dout42 <= rom_data_out_signal((XI_WIDTH*23)-1 downto (XI_WIDTH*22));
    dout43 <= rom_data_out_signal((XI_WIDTH*22)-1 downto (XI_WIDTH*21));
    dout44 <= rom_data_out_signal((XI_WIDTH*21)-1 downto (XI_WIDTH*20));
    dout45 <= rom_data_out_signal((XI_WIDTH*20)-1 downto (XI_WIDTH*19));
    dout46 <= rom_data_out_signal((XI_WIDTH*19)-1 downto (XI_WIDTH*18));
    dout47 <= rom_data_out_signal((XI_WIDTH*18)-1 downto (XI_WIDTH*17));
    dout48 <= rom_data_out_signal((XI_WIDTH*17)-1 downto (XI_WIDTH*16));
    dout49 <= rom_data_out_signal((XI_WIDTH*16)-1 downto (XI_WIDTH*15));
    dout50 <= rom_data_out_signal((XI_WIDTH*15)-1 downto (XI_WIDTH*14));
    dout51 <= rom_data_out_signal((XI_WIDTH*14)-1 downto (XI_WIDTH*13));
    dout52 <= rom_data_out_signal((XI_WIDTH*13)-1 downto (XI_WIDTH*12));
    dout53 <= rom_data_out_signal((XI_WIDTH*12)-1 downto (XI_WIDTH*11));
    dout54 <= rom_data_out_signal((XI_WIDTH*11)-1 downto (XI_WIDTH*10));
    dout55 <= rom_data_out_signal((XI_WIDTH*10)-1 downto (XI_WIDTH*9));
    dout56 <= rom_data_out_signal((XI_WIDTH*9)-1 downto (XI_WIDTH*8));
    dout57 <= rom_data_out_signal((XI_WIDTH*8)-1 downto (XI_WIDTH*7));
    dout58 <= rom_data_out_signal((XI_WIDTH*7)-1 downto (XI_WIDTH*6));
    dout59 <= rom_data_out_signal((XI_WIDTH*6)-1 downto (XI_WIDTH*5));
    dout60 <= rom_data_out_signal((XI_WIDTH*5)-1 downto (XI_WIDTH*4));
    dout61 <= rom_data_out_signal((XI_WIDTH*4)-1 downto (XI_WIDTH*3));
    dout62 <= rom_data_out_signal((XI_WIDTH*3)-1 downto (XI_WIDTH*2));
    dout63 <= rom_data_out_signal((XI_WIDTH*2)-1 downto (XI_WIDTH*1));
    dout64 <= rom_data_out_signal((XI_WIDTH*1)-1 downto (XI_WIDTH*0));








end Behavioral;