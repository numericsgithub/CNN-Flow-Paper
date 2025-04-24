library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_signed.ALL;

entity ClipTruncation is
    generic (
        MIN_VALUE	: integer := -31;
        MAX_VALUE   : integer := 31
    );
    Port ( 
        xi : in std_logic_vector;
        yo : out std_logic_vector
    );
end ClipTruncation;

architecture Behavioral of ClipTruncation is
    constant MIN_X : signed := to_signed(MIN_VALUE, xi'length);
    constant MIN_Y : std_logic_vector := std_logic_vector(to_signed(MIN_VALUE, yo'length));
    
    constant MAX_X : signed := to_signed(MAX_VALUE, xi'length);
    constant MAX_Y : std_logic_vector := std_logic_vector(to_signed(MAX_VALUE, yo'length));
    
begin

    clip: process(xi)
    begin
        if to_integer(signed(MIN_Y)) /= MIN_VALUE or to_integer(signed(MAX_Y)) /= MAX_VALUE then
            assert false
            report "yo cannot display the MIN or MAX value!"
            severity ERROR;
        end if;
    
        if (signed(xi) < MIN_X) then
            yo <= MIN_Y;
        elsif (signed(xi) > MAX_X) then
            yo <= MAX_Y;
        else
            yo <= xi(yo'length-1 downto 0); --std_logic_vector(resize(signed(xi), yo'length));
        end if;    
    end process;


end Behavioral;
