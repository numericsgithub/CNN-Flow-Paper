library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FxPReshape is
	generic 
	   (
            XI_MSB   	: integer := 8;
            XI_LSB   	: integer := 8;
            
            YO_MSB   	: integer := 8;
            YO_LSB   	: integer := 8
        );
	port
		(
		  signal xi : in std_logic_vector((XI_MSB - XI_LSB-1) downto 0);
		  signal yo : out std_logic_vector((YO_MSB - YO_LSB-1) downto 0)
		);
end FxPReshape;

architecture structural of FxPReshape is

    constant XI_LEFT_SHIFT_FRAC_CORRECTION : integer := YO_LSB - XI_LSB;
    signal xi_correct_fracs : std_logic_vector((XI_MSB - YO_LSB-1) downto 0);
    signal xi_correct_signal : std_logic_vector((YO_MSB - YO_LSB-1) downto 0);

begin

    process(xi, xi_correct_signal, xi_correct_fracs)
    begin
        if (YO_LSB > XI_LSB) then
            -- Shift to the right and resize
            xi_correct_fracs <= std_logic_vector(resize(shift_right(signed(xi), natural(XI_LEFT_SHIFT_FRAC_CORRECTION)), xi_correct_fracs'length));
        elsif (YO_LSB < XI_LSB) then
            -- Resize and shift to the left
            xi_correct_fracs <= std_logic_vector(shift_left(resize(signed(xi), xi_correct_fracs'length), natural(-XI_LEFT_SHIFT_FRAC_CORRECTION)));
        else
            xi_correct_fracs <= xi;
        end if;
        
        --if (YO_LSB < XI_LSB) then
        --    -- You either have to round, or you have to be sure that those lost integer bits are not used!
        --    assert false
        --    report "Cannot decrease Integer fraction! Not implemented!"
        --    severity ERROR;
        --end if;
        
        xi_correct_signal <= std_logic_vector(resize(signed(xi_correct_fracs), xi_correct_signal'length));
        yo <= xi_correct_signal;
    end process;

end;