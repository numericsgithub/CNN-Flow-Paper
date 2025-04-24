library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package PoolingFunctions is
    function Max_Pooling_signed(a : std_logic_vector; b : std_logic_vector) return std_logic_vector;
    function Max_Pooling_unsigned(a : std_logic_vector; b : std_logic_vector) return std_logic_vector;
    --function Avg_Pooling(x_new : std_logic_vector; x_buffed : std_logic_vector) return std_logic_vector;
end PoolingFunctions;

package body PoolingFunctions is
    function Max_Pooling_signed(a : std_logic_vector; b : std_logic_vector) return std_logic_vector is
        variable result : std_logic_vector(a'range);
    begin
        if signed(a) > signed(b)  then
            result := a;
        else
            result := b;
        end if;
        return result;
    end function;

    function Max_Pooling_unsigned(a : std_logic_vector; b : std_logic_vector) return std_logic_vector is
        variable result : std_logic_vector(a'range);
    begin
        if unsigned(a) > unsigned(b)  then
            result := a;
        else
            result := b;
        end if;
        return result;
    end function;

    --function Avg_Pooling(x_new : std_logic_vector; x_buffed : std_logic_vector) return std_logic_vector is
    --    variable result : std_logic_vector(x_new'range);  -- Use the range of x_new to define the result
    --begin
    --    -- Safely check if x_new is negative
    --    if signed(x_new) > signed(x_buffed)  then
    --        result := x_new;  -- Set all bits to '0' if negative
    --    else
    --        result := x_buffed;  -- Keep x_new unchanged if not negative
    --    end if;
    --    return result;  -- Return the result
    --end function;

end PoolingFunctions;
