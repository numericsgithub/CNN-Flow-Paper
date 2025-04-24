library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity muxB_64to1 is
	generic
			(
				DATA_WIDTH : natural := 31;
				N          : natural := 64
			);
	port
		(
			signal xi_1  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_2  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_3  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_4  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_5  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_6  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_7  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_8  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_9  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_10  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_11  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_12  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_13  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_14  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_15  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_16  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_17  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_18  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_19  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_20  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_21  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_22  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_23  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_24  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_25  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_26  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_27  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_28  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_29  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_30  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_31  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_32  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_33  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_34  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_35  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_36  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_37  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_38  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_39  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_40  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_41  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_42  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_43  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_44  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_45  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_46  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_47  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_48  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_49  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_50  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_51  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_52  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_53  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_54  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_55  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_56  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_57  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_58  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_59  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_60  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_61  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_62  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_63  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_64  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal sel 	: in std_logic_vector((bits(N - 1) - 1) downto 0);

			signal yo   : out std_logic_vector((DATA_WIDTH-1) downto 0)
		);
end muxB_64to1;

architecture rtl of muxB_64to1 is
begin
	process(xi_1,xi_2,xi_3,xi_4,xi_5,xi_6,xi_7,xi_8,xi_9,xi_10,xi_11,xi_12,xi_13,xi_14,xi_15,xi_16,xi_17,xi_18,xi_19,xi_20,xi_21,xi_22,xi_23,xi_24,xi_25,xi_26,xi_27,xi_28,xi_29,xi_30,xi_31,xi_32,xi_33,xi_34,xi_35,xi_36,xi_37,xi_38,xi_39,xi_40,xi_41,xi_42,xi_43,xi_44,xi_45,xi_46,xi_47,xi_48,xi_49,xi_50,xi_51,xi_52,xi_53,xi_54,xi_55,xi_56,xi_57,xi_58,xi_59,xi_60,xi_61,xi_62,xi_63,xi_64, sel)
	begin
		case to_integer(unsigned(sel)) is
            when 0 =>  yo <= xi_1;
            when 1 =>  yo <= xi_2;
            when 2 =>  yo <= xi_3;
            when 3 =>  yo <= xi_4;
            when 4 =>  yo <= xi_5;
            when 5 =>  yo <= xi_6;
            when 6 =>  yo <= xi_7;
            when 7 =>  yo <= xi_8;
            when 8 =>  yo <= xi_9;
            when 9 =>  yo <= xi_10;
            when 10 =>  yo <= xi_11;
            when 11 =>  yo <= xi_12;
            when 12 =>  yo <= xi_13;
            when 13 =>  yo <= xi_14;
            when 14 =>  yo <= xi_15;
            when 15 =>  yo <= xi_16;
            when 16 =>  yo <= xi_17;
            when 17 =>  yo <= xi_18;
            when 18 =>  yo <= xi_19;
            when 19 =>  yo <= xi_20;
            when 20 =>  yo <= xi_21;
            when 21 =>  yo <= xi_22;
            when 22 =>  yo <= xi_23;
            when 23 =>  yo <= xi_24;
            when 24 =>  yo <= xi_25;
            when 25 =>  yo <= xi_26;
            when 26 =>  yo <= xi_27;
            when 27 =>  yo <= xi_28;
            when 28 =>  yo <= xi_29;
            when 29 =>  yo <= xi_30;
            when 30 =>  yo <= xi_31;
            when 31 =>  yo <= xi_32;
            when 32 =>  yo <= xi_33;
            when 33 =>  yo <= xi_34;
            when 34 =>  yo <= xi_35;
            when 35 =>  yo <= xi_36;
            when 36 =>  yo <= xi_37;
            when 37 =>  yo <= xi_38;
            when 38 =>  yo <= xi_39;
            when 39 =>  yo <= xi_40;
            when 40 =>  yo <= xi_41;
            when 41 =>  yo <= xi_42;
            when 42 =>  yo <= xi_43;
            when 43 =>  yo <= xi_44;
            when 44 =>  yo <= xi_45;
            when 45 =>  yo <= xi_46;
            when 46 =>  yo <= xi_47;
            when 47 =>  yo <= xi_48;
            when 48 =>  yo <= xi_49;
            when 49 =>  yo <= xi_50;
            when 50 =>  yo <= xi_51;
            when 51 =>  yo <= xi_52;
            when 52 =>  yo <= xi_53;
            when 53 =>  yo <= xi_54;
            when 54 =>  yo <= xi_55;
            when 55 =>  yo <= xi_56;
            when 56 =>  yo <= xi_57;
            when 57 =>  yo <= xi_58;
            when 58 =>  yo <= xi_59;
            when 59 =>  yo <= xi_60;
            when 60 =>  yo <= xi_61;
            when 61 =>  yo <= xi_62;
            when 62 =>  yo <= xi_63;
            when 63 =>  yo <= xi_64;
			when others =>  yo <= (others => '0');
		end case;
	end process;
end rtl;