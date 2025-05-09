LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv24_settings.all;

ENTITY conv24_core2_KPU1 IS
    GENERIC
    (
        PIPELINE_STEPS : natural := 0
    );
	PORT (
		clk    : in std_logic;
		rst    : in std_logic;
		x_is_valid : in std_logic;
        kpu_xi_1 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        kpu_xi_2 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        kpu_xi_3 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        kpu_xi_4 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        kpu_xi_5 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        kpu_xi_6 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        kpu_xi_7 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        kpu_xi_8 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        kpu_xi_9 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)

    
        big_undelayed_out_1 : out std_logic_vector(18-1 downto 0); --	sfix(6, -12)
        big_delayed_in_1 : in std_logic_vector(18-1 downto 0); --	sfix(6, -12)
        big_undelayed_out_2 : out std_logic_vector(19-1 downto 0); --	sfix(7, -12)
        big_delayed_in_2 : in std_logic_vector(19-1 downto 0); --	sfix(7, -12)

    
        small_undelayed_out_1 : out std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        small_delayed_in_1 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        small_undelayed_out_2 : out std_logic_vector(17-1 downto 0); --	sfix(5, -12)
        small_delayed_in_2 : in std_logic_vector(17-1 downto 0); --	sfix(5, -12)
        small_undelayed_out_3 : out std_logic_vector(18-1 downto 0); --	sfix(6, -12)
        small_delayed_in_3 : in std_logic_vector(18-1 downto 0); --	sfix(6, -12)
        small_undelayed_out_4 : out std_logic_vector(19-1 downto 0); --	sfix(7, -12)
        small_delayed_in_4 : in std_logic_vector(19-1 downto 0); --	sfix(7, -12)
        small_undelayed_out_5 : out std_logic_vector(19-1 downto 0); --	sfix(7, -12)
        small_delayed_in_5 : in std_logic_vector(19-1 downto 0); --	sfix(7, -12)
        small_undelayed_out_6 : out std_logic_vector(19-1 downto 0); --	sfix(7, -12)
        small_delayed_in_6 : in std_logic_vector(19-1 downto 0); --	sfix(7, -12)

		yo : OUT std_logic_vector(19-1 downto 0) --	sfix(7, -12)
	);
END conv24_core2_KPU1;

ARCHITECTURE structural OF conv24_core2_KPU1 IS

    -- All all_additional_output_int_bits are:         [0, 2, 3, 3, 4, 4, 4, 4, 3]
    -- All all_additional_output_int_bits_weights are: [[31.0, 23.0, 50.0, 26.0, -77.0, -19.0, 34.0, 65.0, -27.0, -47.0, -19.0, 33.0, 22.0, -17.0, 33.0, 27.0, -20.0, -15.0, -20.0, 56.0, 29.0, -21.0, -46.0, 46.0, -17.0, 40.0, 43.0, 41.0, -22.0, 60.0, -11.0, 55.0, 46.0, -75.0, -49.0, 37.0, 41.0, 31.0, 34.0, 34.0, 45.0, -20.0, -30.0, 44.0, 37.0, -21.0, -19.0, -22.0, 37.0, 37.0, 43.0, -15.0, 46.0, -40.0, 43.0, 38.0, 38.0, -18.0, -22.0, 38.0, 39.0, -48.0, 35.0, 67.0, 31.0, 34.0, 36.0, 39.0, 39.0, -22.0, 34.0, -23.0, 18.0, 40.0, 41.0, 61.0, 36.0, 38.0, 42.0, 37.0, -75.0, -20.0, 25.0, -48.0, -34.0, 45.0, -52.0, -20.0, 40.0, 50.0, -26.0, 46.0, -30.0, 33.0, -18.0, -94.0, -46.0, 35.0, 42.0, 42.0, 46.0, 30.0, -32.0, 36.0, -21.0, -38.0, 45.0, 37.0, 39.0, 37.0, -28.0, 30.0, 35.0, -16.0, 48.0, 42.0, -22.0, -25.0, -28.0, 39.0, -22.0, 6.0, 25.0, -18.0, 44.0, -47.0, -24.0, -27.0, 33.0, 36.0, -22.0, -20.0, -18.0, 29.0, 44.0, 49.0, 40.0, -23.0, -21.0, 56.0, -20.0, 32.0, -38.0, -47.0, 39.0, 38.0, 35.0, -21.0, -39.0, -20.0, 34.0, -19.0, 34.0, -16.0, 46.0, -30.0, 34.0, 24.0, 21.0, -17.0, 36.0, -64.0, 51.0, 47.0, 74.0, 35.0, 35.0, 59.0, 49.0, -21.0, 37.0, -22.0, 33.0, 29.0, -19.0, -40.0, 39.0, 49.0, -33.0, -60.0, 63.0, -37.0, -26.0, 35.0, -34.0, -38.0, 58.0, 35.0, -29.0, 30.0, -17.0, 43.0, 34.0, 38.0, -22.0, 36.0, -19.0, 42.0, 41.0, -17.0, -35.0, 44.0, 34.0, -15.0, -21.0, 41.0, 33.0, 53.0, -66.0, 30.0, 40.0, -17.0, -54.0, -39.0, -45.0, -20.0, -19.0, -22.0, 34.0, 32.0, 44.0, -18.0, 29.0, -30.0, -25.0, 61.0, 38.0, 41.0, 40.0, 32.0, 35.0, 31.0, -16.0, -29.0, 31.0, 37.0, 50.0, 32.0, 35.0, 43.0, -57.0, 44.0, 36.0, -49.0, 43.0, -31.0, -19.0, 36.0, -42.0, 59.0, 41.0, -20.0, -18.0, -19.0, -23.0, 37.0], [37.0, 31.0, 55.0, 31.0, -79.0, -20.0, 45.0, 77.0, -26.0, -42.0, -22.0, 39.0, 24.0, -23.0, 41.0, 28.0, -23.0, -17.0, -23.0, 73.0, 36.0, -24.0, -34.0, 57.0, -21.0, 53.0, 50.0, 49.0, -25.0, 75.0, -12.0, 53.0, 59.0, -64.0, -46.0, 45.0, 52.0, 40.0, 47.0, 42.0, 57.0, -19.0, -27.0, 50.0, 47.0, -23.0, -21.0, -24.0, 45.0, 47.0, 51.0, -19.0, 54.0, -44.0, 54.0, 40.0, 47.0, -22.0, -23.0, 50.0, 45.0, -54.0, 45.0, 67.0, 39.0, 41.0, 37.0, 42.0, 50.0, -26.0, 44.0, -28.0, 27.0, 53.0, 50.0, 20.0, 40.0, 41.0, 54.0, 46.0, -84.0, -25.0, -5.0, -63.0, -32.0, 46.0, -41.0, -24.0, 40.0, 57.0, -24.0, 51.0, -27.0, 40.0, -21.0, -95.0, -44.0, 40.0, 53.0, 59.0, 49.0, 38.0, -30.0, 45.0, -24.0, -35.0, 57.0, 45.0, 55.0, 45.0, -33.0, 49.0, 46.0, -20.0, 56.0, 55.0, -23.0, -24.0, -36.0, 49.0, -26.0, 13.0, 24.0, -19.0, 55.0, -54.0, -30.0, -30.0, 42.0, 45.0, -21.0, -19.0, -18.0, 37.0, 52.0, 67.0, 51.0, -27.0, -19.0, 60.0, -25.0, 43.0, -36.0, -49.0, 52.0, 48.0, 44.0, -25.0, -44.0, -26.0, 41.0, -22.0, 44.0, -20.0, 52.0, -28.0, 32.0, 33.0, 25.0, -21.0, 20.0, -71.0, 65.0, 46.0, 85.0, 42.0, 42.0, 68.0, 61.0, -24.0, 46.0, -27.0, 39.0, 36.0, -21.0, -51.0, 48.0, 58.0, 95.0, -65.0, 72.0, -35.0, -30.0, 43.0, -40.0, -46.0, 78.0, 38.0, -30.0, 35.0, -20.0, 52.0, 41.0, 47.0, -11.0, 41.0, -19.0, 50.0, 49.0, -21.0, -31.0, 54.0, 35.0, -19.0, -19.0, 53.0, 39.0, 57.0, -65.0, 35.0, 52.0, -20.0, -56.0, -35.0, -43.0, -24.0, -20.0, -20.0, 44.0, 41.0, 53.0, -23.0, 34.0, -32.0, -29.0, 67.0, 45.0, 47.0, 49.0, 43.0, 44.0, 39.0, -17.0, -35.0, 40.0, 42.0, 64.0, 39.0, 46.0, 53.0, -60.0, 56.0, 45.0, -44.0, 54.0, -31.0, -22.0, 46.0, -39.0, 63.0, 50.0, -24.0, -20.0, -22.0, -26.0, 44.0], [20.0, 13.0, 27.0, 16.0, -43.0, -13.0, 25.0, 28.0, -16.0, -27.0, -14.0, 19.0, 20.0, -12.0, 21.0, 15.0, -13.0, -8.0, -10.0, 36.0, 20.0, -14.0, -34.0, 30.0, -11.0, 28.0, 31.0, 24.0, -14.0, 32.0, -5.0, 41.0, 33.0, -61.0, -34.0, 26.0, 26.0, 21.0, 23.0, 22.0, 28.0, -13.0, -17.0, 30.0, 25.0, -11.0, -11.0, -14.0, 24.0, 19.0, 22.0, -10.0, 26.0, -25.0, 25.0, 22.0, 22.0, -11.0, -14.0, 26.0, 24.0, -30.0, 21.0, 43.0, 24.0, 20.0, 22.0, 24.0, 28.0, -16.0, 22.0, -15.0, 8.0, 29.0, 25.0, -11.0, 23.0, 27.0, 27.0, 25.0, -33.0, -12.0, -50.0, -33.0, -26.0, 27.0, -30.0, -11.0, 25.0, 36.0, -18.0, 33.0, -20.0, 21.0, -11.0, -55.0, -24.0, 27.0, 27.0, 27.0, 33.0, 23.0, -21.0, 21.0, -13.0, -30.0, 26.0, 26.0, 26.0, 23.0, -19.0, 8.0, 28.0, -10.0, 19.0, 28.0, -17.0, -18.0, -21.0, 29.0, -13.0, 22.0, 14.0, -10.0, 25.0, -32.0, -16.0, -20.0, 24.0, 26.0, -12.0, -15.0, -11.0, 18.0, 23.0, 30.0, 30.0, -17.0, -11.0, 36.0, -15.0, 22.0, -19.0, -20.0, 25.0, 23.0, 23.0, -13.0, -19.0, -16.0, 24.0, -12.0, 21.0, -11.0, 34.0, -20.0, 22.0, 15.0, 23.0, -11.0, -62.0, -19.0, 38.0, 38.0, 4.0, 25.0, 20.0, 48.0, 28.0, -12.0, 24.0, -15.0, 22.0, 19.0, -14.0, -17.0, 25.0, 36.0, -34.0, -31.0, 45.0, -22.0, -16.0, 22.0, -17.0, -13.0, 8.0, 28.0, -13.0, 29.0, -12.0, 25.0, 24.0, 20.0, -23.0, 22.0, -12.0, 25.0, 28.0, -10.0, -21.0, 31.0, 20.0, -9.0, -14.0, 27.0, 21.0, 23.0, -39.0, 21.0, 24.0, -11.0, -34.0, -27.0, -30.0, -14.0, -11.0, -16.0, 22.0, 20.0, 28.0, -11.0, 19.0, -16.0, -14.0, 35.0, 25.0, 24.0, 22.0, 22.0, 21.0, 20.0, -10.0, -17.0, 20.0, 18.0, 31.0, 24.0, 23.0, 29.0, -33.0, 29.0, 28.0, -26.0, 25.0, -18.0, -12.0, 22.0, -28.0, 40.0, 26.0, -13.0, -12.0, -12.0, -17.0, 23.0], [39.0, 35.0, 1.0, 31.0, -63.0, -24.0, 52.0, 16.0, -26.0, -44.0, -25.0, 33.0, -4.0, -23.0, 43.0, 29.0, -22.0, -19.0, -21.0, 81.0, 40.0, -25.0, -40.0, -24.0, -17.0, 51.0, 59.0, 53.0, -29.0, 50.0, 12.0, 59.0, 60.0, 83.0, -46.0, 43.0, 49.0, 39.0, 45.0, 43.0, 52.0, -18.0, -28.0, 27.0, 49.0, -20.0, -17.0, -29.0, 46.0, 48.0, 39.0, -21.0, 55.0, 0.0, 50.0, 40.0, 48.0, -21.0, -21.0, 50.0, 47.0, 0.0, 40.0, 70.0, 49.0, 41.0, 36.0, 5.0, 51.0, -26.0, 40.0, -31.0, -8.0, 51.0, 42.0, 46.0, 46.0, 45.0, 47.0, 46.0, -69.0, -22.0, 22.0, -44.0, -18.0, 39.0, -40.0, -24.0, -9.0, 56.0, -22.0, 56.0, -31.0, 40.0, -21.0, 8.0, -41.0, 59.0, 54.0, 55.0, 56.0, 35.0, -29.0, 42.0, -22.0, -39.0, 53.0, 48.0, 63.0, 49.0, -32.0, 54.0, 46.0, -18.0, 39.0, 53.0, -22.0, -27.0, -34.0, 52.0, -23.0, 11.0, 36.0, -20.0, 48.0, -19.0, -30.0, -31.0, 40.0, 46.0, -19.0, -21.0, -16.0, 37.0, 0.0, 70.0, 50.0, -24.0, -23.0, 2.0, -28.0, 43.0, -43.0, -37.0, 60.0, 43.0, 43.0, -25.0, -37.0, -28.0, 45.0, -21.0, 46.0, -22.0, 51.0, -25.0, 34.0, -19.0, 41.0, -22.0, 35.0, -52.0, 63.0, 80.0, -31.0, 46.0, 41.0, 51.0, 51.0, -19.0, 51.0, -28.0, 41.0, 37.0, -21.0, -54.0, 47.0, 57.0, -33.0, -56.0, 72.0, -44.0, -31.0, 39.0, -37.0, -40.0, 44.0, 35.0, -27.0, 34.0, -21.0, 52.0, 42.0, 42.0, 55.0, 40.0, -20.0, 51.0, 52.0, -20.0, -34.0, 55.0, 34.0, -20.0, -23.0, 54.0, 38.0, 47.0, 1.0, 40.0, 46.0, -19.0, -3.0, -45.0, -47.0, -22.0, -20.0, -17.0, 46.0, 43.0, 47.0, -23.0, 32.0, -31.0, -27.0, 59.0, 44.0, 54.0, 46.0, 43.0, 45.0, 39.0, -20.0, -38.0, 37.0, 34.0, 67.0, 38.0, 45.0, 53.0, -9.0, 58.0, 61.0, -49.0, 47.0, -28.0, -21.0, 44.0, -38.0, 72.0, 46.0, -22.0, -20.0, -19.0, -28.0, 45.0], [47.0, 42.0, -1.0, 32.0, -83.0, -27.0, 56.0, 20.0, -27.0, -40.0, -30.0, 38.0, -5.0, -26.0, 55.0, 36.0, -27.0, -24.0, -25.0, 98.0, 51.0, -31.0, -34.0, -27.0, -19.0, 64.0, 72.0, 63.0, -33.0, 60.0, 10.0, 64.0, 77.0, 88.0, -20.0, 54.0, 65.0, 51.0, 56.0, 54.0, 70.0, -19.0, -26.0, 33.0, 59.0, -24.0, -17.0, -35.0, 59.0, 61.0, 45.0, -22.0, 70.0, -5.0, 64.0, 42.0, 58.0, -26.0, -22.0, 63.0, 57.0, 0.0, 52.0, 82.0, 65.0, 50.0, 32.0, 9.0, 64.0, -33.0, 52.0, -38.0, -5.0, 65.0, 50.0, 14.0, 57.0, 52.0, 60.0, 60.0, -82.0, -28.0, -9.0, -46.0, -13.0, 43.0, -22.0, -28.0, -11.0, 61.0, -22.0, 60.0, -34.0, 48.0, -24.0, 10.0, -39.0, 69.0, 69.0, 71.0, 62.0, 45.0, -18.0, 53.0, -26.0, -14.0, 66.0, 62.0, 75.0, 62.0, -38.0, 61.0, 58.0, -22.0, 54.0, 66.0, -20.0, -24.0, -43.0, 68.0, -24.0, 14.0, 39.0, -19.0, 64.0, -18.0, -38.0, -33.0, 48.0, 54.0, -24.0, -16.0, -15.0, 48.0, 4.0, 91.0, 62.0, -31.0, -26.0, 3.0, -34.0, 54.0, -34.0, -47.0, 78.0, 56.0, 52.0, -28.0, -36.0, -33.0, 55.0, -26.0, 58.0, -24.0, 54.0, -17.0, 39.0, -21.0, 41.0, -31.0, 25.0, -72.0, 78.0, 60.0, -43.0, 52.0, 54.0, 77.0, 64.0, -22.0, 63.0, -34.0, 49.0, 44.0, -27.0, -61.0, 62.0, 67.0, 78.0, -50.0, 102.0, -49.0, -33.0, 51.0, -45.0, -43.0, 73.0, 35.0, -32.0, 47.0, -22.0, 68.0, 52.0, 51.0, 58.0, 50.0, -19.0, 60.0, 61.0, -23.0, -32.0, 72.0, 38.0, -24.0, -23.0, 66.0, 50.0, 57.0, -4.0, 47.0, 58.0, -25.0, 6.0, -25.0, -44.0, -27.0, -21.0, -15.0, 56.0, 55.0, 53.0, -25.0, 41.0, -27.0, -29.0, 70.0, 56.0, 68.0, 60.0, 56.0, 56.0, 50.0, -24.0, -43.0, 46.0, 44.0, 83.0, 45.0, 58.0, 67.0, -12.0, 73.0, 73.0, -45.0, 58.0, -23.0, -26.0, 57.0, -28.0, 85.0, 59.0, -29.0, -20.0, -17.0, -31.0, 53.0], [25.0, 26.0, -11.0, 20.0, -33.0, -19.0, 37.0, 16.0, -23.0, -26.0, -17.0, 23.0, -7.0, -15.0, 31.0, 24.0, -15.0, -12.0, -14.0, 59.0, 27.0, -15.0, -32.0, -21.0, -12.0, 42.0, 38.0, 34.0, -20.0, 23.0, 8.0, 38.0, 39.0, 44.0, -39.0, 29.0, 33.0, 28.0, 32.0, 33.0, 32.0, -12.0, -23.0, 18.0, 35.0, -13.0, -12.0, -22.0, 33.0, 32.0, 27.0, -12.0, 41.0, 7.0, 31.0, 28.0, 31.0, -15.0, -14.0, 36.0, 38.0, 7.0, 29.0, 32.0, 37.0, 29.0, 28.0, 1.0, 34.0, -18.0, 30.0, -20.0, -7.0, 41.0, 24.0, -14.0, 33.0, 31.0, 33.0, 34.0, -33.0, -15.0, -42.0, -28.0, -11.0, 25.0, -26.0, -19.0, -8.0, 39.0, -15.0, 49.0, -26.0, 30.0, -14.0, -2.0, -26.0, 41.0, 41.0, 42.0, 38.0, 26.0, -25.0, 28.0, -15.0, -35.0, 36.0, 33.0, 43.0, 34.0, -23.0, 22.0, 36.0, -13.0, 29.0, 39.0, -19.0, -22.0, -26.0, 37.0, -14.0, 20.0, 25.0, -15.0, 34.0, -11.0, -24.0, -25.0, 29.0, 33.0, -15.0, -18.0, -12.0, 24.0, -2.0, 46.0, 34.0, -17.0, -16.0, 3.0, -21.0, 29.0, -28.0, -18.0, 41.0, 28.0, 27.0, -20.0, -26.0, -21.0, 30.0, -14.0, 32.0, -15.0, 36.0, -22.0, 24.0, -14.0, 30.0, -16.0, -56.0, -33.0, 46.0, 26.0, -8.0, 31.0, 24.0, 31.0, 35.0, -14.0, 35.0, -21.0, 30.0, 24.0, -14.0, -29.0, 29.0, 37.0, -26.0, -29.0, 59.0, -27.0, -27.0, 29.0, -19.0, -25.0, 8.0, 27.0, -17.0, 27.0, -15.0, 31.0, 34.0, 29.0, 37.0, 30.0, -15.0, 33.0, 39.0, -14.0, -23.0, 43.0, 21.0, -13.0, -15.0, 39.0, 24.0, 35.0, 3.0, 28.0, 30.0, -15.0, 2.0, -32.0, -37.0, -16.0, -15.0, -14.0, 34.0, 24.0, 29.0, -16.0, 24.0, -23.0, -17.0, 31.0, 33.0, 36.0, 32.0, 32.0, 32.0, 27.0, -14.0, -21.0, 27.0, 20.0, 47.0, 28.0, 31.0, 40.0, -5.0, 39.0, 48.0, -37.0, 30.0, -17.0, -14.0, 28.0, -26.0, 57.0, 33.0, -17.0, -14.0, -14.0, -23.0, 31.0], [20.0, 25.0, -39.0, 16.0, -35.0, -17.0, 37.0, -21.0, -18.0, -33.0, -18.0, 15.0, -59.0, -16.0, 24.0, 35.0, -12.0, -15.0, -13.0, 59.0, 21.0, -14.0, -33.0, -53.0, -8.0, 33.0, 31.0, 30.0, -18.0, 18.0, 41.0, 35.0, 34.0, -65.0, -36.0, 24.0, 27.0, 23.0, 26.0, 29.0, 22.0, -14.0, -26.0, 13.0, 29.0, -13.0, -9.0, -24.0, 25.0, 28.0, 22.0, -13.0, 31.0, 48.0, 25.0, 25.0, 28.0, -16.0, -12.0, 29.0, 28.0, 49.0, 22.0, 31.0, 39.0, 24.0, 29.0, -48.0, 30.0, -17.0, 25.0, -21.0, -44.0, 35.0, 20.0, 31.0, 28.0, 30.0, 23.0, 26.0, -21.0, -11.0, 12.0, -29.0, 2.0, 34.0, -28.0, -19.0, -49.0, 32.0, -21.0, 37.0, -25.0, 23.0, -14.0, 83.0, -35.0, 48.0, 34.0, 37.0, 31.0, 19.0, -20.0, 26.0, -11.0, -35.0, 26.0, 31.0, 47.0, 29.0, -20.0, 11.0, 34.0, -12.0, 31.0, 29.0, -17.0, -18.0, -23.0, 30.0, -12.0, 9.0, 52.0, -12.0, 21.0, 10.0, -20.0, -20.0, 23.0, 29.0, -18.0, -19.0, -12.0, 20.0, -35.0, 46.0, 26.0, -12.0, -26.0, -46.0, -21.0, 24.0, -23.0, -11.0, 41.0, 18.0, 21.0, -18.0, -21.0, -20.0, 26.0, -12.0, 28.0, -14.0, 34.0, -23.0, 30.0, -57.0, 41.0, -16.0, 34.0, -26.0, 35.0, 5.0, 86.0, 28.0, 25.0, 39.0, 30.0, -11.0, 28.0, -17.0, 25.0, 20.0, -13.0, -24.0, 23.0, 27.0, -8.0, -32.0, 49.0, -31.0, -23.0, 21.0, -20.0, -25.0, -6.0, 23.0, -17.0, 30.0, -14.0, 29.0, 25.0, 31.0, -45.0, 23.0, -16.0, 27.0, 35.0, -12.0, -25.0, 34.0, 23.0, -14.0, -15.0, 33.0, 22.0, 25.0, 67.0, 22.0, 23.0, -16.0, 32.0, -38.0, -36.0, -15.0, -15.0, -22.0, 26.0, 22.0, 26.0, -15.0, 19.0, -26.0, -15.0, 37.0, 27.0, 35.0, 28.0, 24.0, 26.0, 23.0, -15.0, -22.0, 23.0, 15.0, 43.0, 27.0, 26.0, 29.0, 25.0, 32.0, 54.0, -34.0, 24.0, -18.0, -12.0, 24.0, -29.0, 42.0, 25.0, -17.0, -15.0, -11.0, -20.0, 25.0], [28.0, 33.0, -44.0, 18.0, -42.0, -19.0, 44.0, -34.0, -20.0, -37.0, -22.0, 15.0, -44.0, -19.0, 33.0, 36.0, -16.0, -18.0, -12.0, 71.0, 29.0, -19.0, -32.0, -54.0, -12.0, 42.0, 43.0, 39.0, -24.0, 13.0, 46.0, 39.0, 43.0, 36.0, -43.0, 32.0, 35.0, 30.0, 37.0, 36.0, 30.0, -16.0, -26.0, 20.0, 38.0, -15.0, -10.0, -30.0, 34.0, 36.0, 20.0, -13.0, 42.0, 45.0, 31.0, 29.0, 35.0, -18.0, -15.0, 39.0, 35.0, 49.0, 27.0, 44.0, 47.0, 32.0, 33.0, -50.0, 41.0, -21.0, 29.0, -28.0, -45.0, 45.0, 28.0, 4.0, 34.0, 35.0, 30.0, 38.0, -33.0, -15.0, -7.0, -40.0, 2.0, 39.0, -30.0, -20.0, -47.0, 38.0, -27.0, 44.0, -29.0, 30.0, -18.0, 92.0, -35.0, 53.0, 47.0, 44.0, 42.0, 25.0, -25.0, 32.0, -14.0, -38.0, 30.0, 39.0, 52.0, 40.0, -25.0, 30.0, 44.0, -15.0, 29.0, 39.0, -20.0, -23.0, -30.0, 47.0, -14.0, 16.0, 58.0, -16.0, 29.0, 12.0, -25.0, -25.0, 31.0, 37.0, -21.0, -21.0, -13.0, 25.0, -39.0, 61.0, 37.0, -16.0, -26.0, -58.0, -25.0, 31.0, -31.0, -19.0, 55.0, 24.0, 30.0, -22.0, -24.0, -25.0, 34.0, -15.0, 38.0, -16.0, 36.0, -24.0, 35.0, -61.0, 47.0, -21.0, 16.0, -31.0, 45.0, 24.0, 80.0, 35.0, 29.0, 36.0, 38.0, -12.0, 35.0, -22.0, 33.0, 26.0, -17.0, -32.0, 31.0, 37.0, 39.0, -32.0, 67.0, -40.0, -29.0, 26.0, -23.0, -32.0, 4.0, 26.0, -23.0, 36.0, -19.0, 32.0, 34.0, 36.0, -42.0, 28.0, -17.0, 34.0, 44.0, -15.0, -28.0, 47.0, 30.0, -17.0, -18.0, 43.0, 28.0, 24.0, 65.0, 32.0, 32.0, -19.0, 33.0, -40.0, -43.0, -19.0, -16.0, -19.0, 37.0, 27.0, 31.0, -15.0, 26.0, -28.0, -19.0, 38.0, 33.0, 43.0, 34.0, 34.0, 35.0, 32.0, -18.0, -28.0, 31.0, 25.0, 54.0, 32.0, 33.0, 41.0, 28.0, 42.0, 60.0, -44.0, 31.0, -27.0, -17.0, 31.0, -31.0, 61.0, 34.0, -20.0, -15.0, -15.0, -26.0, 32.0], [10.0, 20.0, -24.0, 13.0, -11.0, -10.0, 26.0, -18.0, -11.0, -13.0, -11.0, 9.0, -29.0, -11.0, 12.0, 21.0, -7.0, -10.0, -6.0, 33.0, 9.0, -6.0, -23.0, -32.0, -3.0, 20.0, 16.0, 17.0, -10.0, 15.0, 27.0, 23.0, 19.0, -70.0, -21.0, 9.0, 13.0, 13.0, 19.0, 16.0, 10.0, -7.0, -12.0, 6.0, 16.0, -7.0, -3.0, -16.0, 15.0, 17.0, 15.0, -7.0, 20.0, 32.0, 14.0, 17.0, 15.0, -7.0, -5.0, 18.0, 18.0, 30.0, 12.0, 31.0, 23.0, 13.0, 18.0, -32.0, 14.0, -10.0, 12.0, -14.0, -27.0, 22.0, 14.0, -6.0, 14.0, 18.0, 11.0, 17.0, 8.0, -5.0, -29.0, -9.0, 2.0, 25.0, -12.0, -13.0, -30.0, 17.0, -12.0, 20.0, -12.0, 13.0, -8.0, 52.0, -16.0, 31.0, 24.0, 24.0, 10.0, 10.0, -12.0, 14.0, -6.0, -29.0, 18.0, 14.0, 32.0, 21.0, -11.0, -4.0, 21.0, -7.0, 26.0, 14.0, -10.0, -9.0, -16.0, 26.0, -9.0, 25.0, 32.0, -10.0, 13.0, 6.0, -12.0, -13.0, 12.0, 16.0, -10.0, -11.0, -7.0, 11.0, -25.0, 32.0, 18.0, -4.0, -15.0, -31.0, -14.0, 16.0, -5.0, 3.0, 24.0, 9.0, 14.0, -12.0, -6.0, -12.0, 15.0, -7.0, 17.0, -8.0, 25.0, -13.0, 22.0, -39.0, 22.0, -10.0, -46.0, -1.0, 17.0, -4.0, 52.0, 19.0, 12.0, 35.0, 19.0, -6.0, 15.0, -11.0, 15.0, 11.0, -7.0, -6.0, 14.0, 9.0, 7.0, -12.0, 28.0, -14.0, -16.0, 13.0, -9.0, -10.0, -15.0, 14.0, -7.0, 28.0, -7.0, 9.0, 17.0, 21.0, -37.0, 10.0, -6.0, 13.0, 20.0, -6.0, -12.0, 20.0, 12.0, -9.0, -10.0, 20.0, 14.0, 22.0, 46.0, 13.0, 15.0, -8.0, 10.0, -23.0, -22.0, -8.0, -8.0, -13.0, 16.0, 16.0, 15.0, -9.0, 11.0, -16.0, -5.0, 22.0, 16.0, 19.0, 15.0, 15.0, 14.0, 14.0, -11.0, -12.0, 13.0, 7.0, 32.0, 19.0, 14.0, 18.0, 22.0, 17.0, 33.0, -17.0, 13.0, -9.0, -6.0, 14.0, -18.0, 27.0, 11.0, -10.0, -10.0, -5.0, -12.0, 12.0]]
    signal adder_1_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_2_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_3_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(2, -12)
    signal adder_4_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_5_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_6_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(2, -12)
    signal adder_7_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_8_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_9_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(3, -12)

    -- To keep things simple, we add an bogus adder at the start. But there is none. This is just a small simplification.
    -- Unreshaped Adder would be: sfix(3, -12) + nothing = sfix(3, -12)
    -- Reshaped Adder would be:   sfix(3, -12) + sfix(3, -12) = sfix(3, -12)
    -- 
    signal adder_1_output    : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_2_input_sum : std_logic_vector(15-1 downto 0); --	sfix(3, -12)



    -- Unreshaped Adder would be: sfix(3, -12) + sfix(3, -12) = sfix(5, -12)
    -- Reshaped Adder would be:   sfix(3, -12) + sfix(3, -12) = sfix(5, -12)
    -- 
    signal adder_2_output    : std_logic_vector(17-1 downto 0); --	sfix(5, -12)
    signal adder_3_input_sum : std_logic_vector(17-1 downto 0); --	sfix(5, -12)



    -- Unreshaped Adder would be: sfix(2, -12) + sfix(5, -12) = sfix(6, -12)
    -- Reshaped Adder would be:   sfix(5, -12) + sfix(5, -12) = sfix(6, -12)
    -- 
    signal adder_3_output    : std_logic_vector(18-1 downto 0); --	sfix(6, -12)
    signal adder_4_input_sum : std_logic_vector(18-1 downto 0); --	sfix(6, -12)



    -- Unreshaped Adder would be: sfix(3, -12) + sfix(6, -12) = sfix(6, -12)
    -- Reshaped Adder would be:   sfix(6, -12) + sfix(6, -12) = sfix(6, -12)
    -- 
    signal adder_4_output    : std_logic_vector(18-1 downto 0); --	sfix(6, -12)
    signal adder_5_input_sum : std_logic_vector(18-1 downto 0); --	sfix(6, -12)



    -- Unreshaped Adder would be: sfix(3, -12) + sfix(6, -12) = sfix(7, -12)
    -- Reshaped Adder would be:   sfix(6, -12) + sfix(6, -12) = sfix(7, -12)
    -- 
    signal adder_5_output    : std_logic_vector(19-1 downto 0); --	sfix(7, -12)
    signal adder_6_input_sum : std_logic_vector(19-1 downto 0); --	sfix(7, -12)



    -- Unreshaped Adder would be: sfix(2, -12) + sfix(7, -12) = sfix(7, -12)
    -- Reshaped Adder would be:   sfix(7, -12) + sfix(7, -12) = sfix(7, -12)
    -- 
    signal adder_6_output    : std_logic_vector(19-1 downto 0); --	sfix(7, -12)
    signal adder_7_input_sum : std_logic_vector(19-1 downto 0); --	sfix(7, -12)



    -- Unreshaped Adder would be: sfix(3, -12) + sfix(7, -12) = sfix(7, -12)
    -- Reshaped Adder would be:   sfix(7, -12) + sfix(7, -12) = sfix(7, -12)
    -- 
    signal adder_7_output    : std_logic_vector(19-1 downto 0); --	sfix(7, -12)
    signal adder_8_input_sum : std_logic_vector(19-1 downto 0); --	sfix(7, -12)



    -- Unreshaped Adder would be: sfix(3, -12) + sfix(7, -12) = sfix(7, -12)
    -- Reshaped Adder would be:   sfix(7, -12) + sfix(7, -12) = sfix(7, -12)
    -- 
    signal adder_8_output    : std_logic_vector(19-1 downto 0); --	sfix(7, -12)
    signal adder_9_input_sum : std_logic_vector(19-1 downto 0); --	sfix(7, -12)



    -- Unreshaped Adder would be: sfix(3, -12) + sfix(7, -12) = sfix(7, -12)
    -- Reshaped Adder would be:   sfix(7, -12) + sfix(7, -12) = sfix(7, -12)
    -- 
    signal adder_9_output    : std_logic_vector(19-1 downto 0); --	sfix(7, -12)
    signal adder_10_input_sum : std_logic_vector(19-1 downto 0); --	sfix(7, -12)




BEGIN


    adder_1_input_xi <= kpu_xi_1;






    adder_2_input_xi <= kpu_xi_2;






    adder_2_input_sum <= adder_1_output;






    adder_3_input_xi <= kpu_xi_3;






    adder_3_input_sum <= adder_2_output;






    adder_4_input_xi <= kpu_xi_4;






    adder_4_input_sum <= adder_3_output;






    adder_5_input_xi <= kpu_xi_5;






    adder_5_input_sum <= adder_4_output;






    adder_6_input_xi <= kpu_xi_6;






    adder_6_input_sum <= adder_5_output;






    adder_7_input_xi <= kpu_xi_7;






    adder_7_input_sum <= adder_6_output;






    adder_8_input_xi <= kpu_xi_8;






    adder_8_input_sum <= adder_7_output;






    adder_9_input_xi <= kpu_xi_9;






    adder_9_input_sum <= adder_8_output;









    small_undelayed_out_1 <= adder_1_input_xi;
    PL_STEP_FOR_FIRST_INPUT: entity work.DelayReg 
        generic map(WL => small_delayed_in_1'length, BL => PIPELINE_STEPS)
        PORT MAP(clk, '0', x_is_valid, small_delayed_in_1, adder_1_output);
	--adder_1_output <= small_delayed_in_1;
	adder_2: entity work.IntMultiAdder_S_in3_m12_3_m12_out5_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv24_core2_KPU1_adder2", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_2_input_xi, adder_2_input_sum, small_undelayed_out_2);
	adder_2_output <= small_delayed_in_2;

    line_adder_3: entity work.IntMultiAdder_S_in2_m12_5_m12_out6_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv24_core2_KPU1_adder3", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_3_input_xi, adder_3_input_sum, big_undelayed_out_1);
	adder_3_output <= big_delayed_in_1;
	adder_4: entity work.IntMultiAdder_S_in3_m12_6_m12_out6_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv24_core2_KPU1_adder4", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_4_input_xi, adder_4_input_sum, small_undelayed_out_3);
	adder_4_output <= small_delayed_in_3;
	adder_5: entity work.IntMultiAdder_S_in3_m12_6_m12_out7_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv24_core2_KPU1_adder5", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_5_input_xi, adder_5_input_sum, small_undelayed_out_4);
	adder_5_output <= small_delayed_in_4;

    line_adder_6: entity work.IntMultiAdder_S_in2_m12_7_m12_out7_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv24_core2_KPU1_adder6", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_6_input_xi, adder_6_input_sum, big_undelayed_out_2);
	adder_6_output <= big_delayed_in_2;
	adder_7: entity work.IntMultiAdder_S_in3_m12_7_m12_out7_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv24_core2_KPU1_adder7", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_7_input_xi, adder_7_input_sum, small_undelayed_out_5);
	adder_7_output <= small_delayed_in_5;
	adder_8: entity work.IntMultiAdder_S_in3_m12_7_m12_out7_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv24_core2_KPU1_adder8", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_8_input_xi, adder_8_input_sum, small_undelayed_out_6);
	adder_8_output <= small_delayed_in_6;

    last_stage: entity work.IntMultiAdder_S_in3_m12_7_m12_out7_m12_wrapper_wrapper
        generic map(ADDER_LOCATION => "conv24_core2_KPU1_adder9", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_9_input_xi, adder_9_input_sum, yo );
	--last_stage : entity work.conv_stage_last GENERIC MAP(XI_WIDTH => XI_WIDTH, WI_WIDTH => WI_WIDTH)
	--PORT MAP(kpu_xi_9, adder_output_8, adder_output_9);


    -- yo <= adder_output_9;
	-- add_bias : entity work. PORT MAP(yo, adder_output_9, bias_extend);

	-- yi_array(0) <= (OTHERS => '0');--input of 1st stage's adder.

END structural;