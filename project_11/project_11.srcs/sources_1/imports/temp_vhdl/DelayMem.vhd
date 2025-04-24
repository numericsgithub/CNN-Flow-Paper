--Delay implemented with memories.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

LIBRARY work;
USE work.Components.ALL;

entity DelayMem is
	generic(	
	  WL: integer:= 8;			-- Word Length
	  BL: integer:= 64);		   -- Buffer Length
	port(
	  rst:  in  std_logic;
	  clk:  in  std_logic;
	  enable: in std_logic;
      delay_mem_counter: in std_logic_vector(bits(BL-1) -1 downto 0);
	  Din:  in  std_logic_vector(WL -1 downto 0);
	  Dout: out std_logic_vector(WL -1 downto 0)
     );
end DelayMem;


architecture arch of DelayMem is

begin

   NoDelay: if BL = 0 generate
         Dout <= Din;
   end generate;

   GenMem: if BL > 0 generate

      type memory is array (nextPow2(BL) -1 downto 0) of std_logic_vector(WL -1 downto 0);
      signal mem: memory := (others => (others => '0')); -- We assume that the first input sample is used to initialize all delays
      signal rdData:  std_logic_vector(WL - 1 downto 0);
      --signal counter: unsigned(bits(BL-1) -1 downto 0);

      attribute ram_style : string;
      attribute ram_style of mem : signal is "block";

   begin

      RW: process(clk)
         begin
            if rising_edge(clk) then
               if enable = '1' then
                   mem(to_integer(unsigned(delay_mem_counter))) <= Din;
                   Dout <= rdData;
               end if;
            end if;
      end process;
          
      rdData <= mem(to_integer(unsigned(delay_mem_counter)));               
   
   end generate;

end arch;
