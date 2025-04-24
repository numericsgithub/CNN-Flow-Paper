library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package ActivationFunctions is
    function ReLu(x_n : std_logic_vector) return std_logic_vector;
    function ReLu6(x_n : std_logic_vector; MAX_SFIX : std_logic_vector) return std_logic_vector;
end ActivationFunctions;

package body ActivationFunctions is
    function ReLu(x_n : std_logic_vector) return std_logic_vector is
        variable result : std_logic_vector(x_n'length-2 downto 0);  -- Use the range of x_n to define the result
    begin
        -- Safely check if x_n is negative
        if signed(x_n) < 0 then
            result := (others => '0');  -- Set all bits to '0' if negative
        else
            result := x_n(x_n'length-2 downto 0);  -- Keep x_n unchanged if not negative
        end if;
        return result;  -- Return the result
    end function;

    function ReLu6(x_n : std_logic_vector; MAX_SFIX : std_logic_vector) return std_logic_vector is
        variable result : std_logic_vector(x_n'length-2 downto 0);  -- Use the range of x_n to define the result
    begin
        -- Safely check if x_n is negative
        if signed(x_n) < 0 then
            result := (others => '0');  -- Set all bits to '0' if negative
        elsif signed(x_n) > signed(MAX_SFIX) then
            result := MAX_SFIX;
        else
            result := x_n(x_n'length-2 downto 0);  -- Keep x_n unchanged if not negative
        end if;
        return result;  -- Return the result
    end function;
end ActivationFunctions;
