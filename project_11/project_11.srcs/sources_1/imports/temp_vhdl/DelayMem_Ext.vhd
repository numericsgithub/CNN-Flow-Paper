--Delay implemented with memories.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

LIBRARY work;
USE work.Components.ALL;

ENTITY DelayMem_Ext IS
   GENERIC (
      WL : INTEGER := 8; -- Word Length
      BL : INTEGER := 64 -- Buffer Length
   );
   PORT (
      rst : IN STD_LOGIC;
      clk : IN STD_LOGIC;
      Din : IN STD_LOGIC_VECTOR(WL - 1 DOWNTO 0);
      Dout : OUT STD_LOGIC_VECTOR(WL - 1 DOWNTO 0);
      counter : IN unsigned(bits(BL - 1) - 1 DOWNTO 0)
   );
END DelayMem_Ext;
ARCHITECTURE arch OF DelayMem_Ext IS

BEGIN

   NoDelay : IF BL = 0 GENERATE
      Dout <= Din;
   END GENERATE;

   GenMem : IF BL > 0 GENERATE

      TYPE memory IS ARRAY (nextPow2(BL) - 1 DOWNTO 0) OF STD_LOGIC_VECTOR(WL - 1 DOWNTO 0);
      SIGNAL mem : memory;
      SIGNAL rdData : STD_LOGIC_VECTOR(WL - 1 DOWNTO 0);
      --signal counter: unsigned(bits(BL-1) -1 downto 0);

      ATTRIBUTE ram_style : STRING;
      ATTRIBUTE ram_style OF mem : SIGNAL IS "block";

   BEGIN

--      Control: process(rst, clk)
--         begin
--            if rst = '1' then
--               counter <= (others => '0');
--            elsif rising_edge(clk) then
--               if (counter - 1) = to_unsigned(BL -1 -1,bits(BL-1)) then  
--                  counter <= (others =>'0');
--               else
--                  counter <= counter + 1;
--               end if;
--            end if;
--      end process;
      RW : PROCESS (clk)
      BEGIN
         IF rising_edge(clk) THEN
            mem(to_integer(counter)) <= Din;
            Dout <= rdData;
         END IF;
      END PROCESS;

      rdData <= mem(to_integer(counter));

   END GENERATE;

END arch;