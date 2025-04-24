# --- GENERIC CONSTRAINTS ---

# Create a clock constraint for the top-level clock signal (generic, no device-specific information)
# Define the clock period (adjust the period for your clock frequency, e.g., 100 MHz -> 10 ns period)

# 50 MHz
# create_clock -period 20.0 [get_ports clk] -name clk

# 75 MHz
# create_clock -period 13.333333333333334 [get_ports clk] -name clk

# 100 MHz
# create_clock -period 10.0 [get_ports clk] -name clk

# 125 MHz
# create_clock -period 8.0 [get_ports clk] -name clk

# 150 MHz
# create_clock -period 6.666666666666667 [get_ports clk] -name clk

# 175 MHz
# create_clock -period 5.714285714285714 [get_ports clk] -name clk

# 200 MHz
# create_clock -period 5.0 [get_ports clk] -name clk

# 225 MHz
# create_clock -period 4.444444444444445 [get_ports clk] -name clk

# 250 MHz
# create_clock -period 4.0 [get_ports clk] -name clk

# 275 MHz
# create_clock -period 3.6363636363636362 [get_ports clk] -name clk

# 300 MHz
# create_clock -period 3.3333333333333335 [get_ports clk] -name clk

# 325 MHz
# create_clock -period 3.076923076923077 [get_ports clk] -name clk

# 350 MHz
create_clock -period 2.857142857142857 [get_ports clk] -name clk

# 375 MHz
# create_clock -period 2.6666666666666665 [get_ports clk] -name clk

# 400 MHz
# create_clock -period 2.5 [get_ports clk] -name clk

# 425 MHz
# create_clock -period 2.3529411764705883 [get_ports clk] -name clk

# 450 MHz
# create_clock -period 2.2222222222222223 [get_ports clk] -name clk

# 475 MHz
# create_clock -period 2.1052631578947367 [get_ports clk] -name clk

# 500 MHz
# create_clock -period 2.0 [get_ports clk] -name clk

# 525 MHz
# create_clock -period 1.9047619047619047 [get_ports clk] -name clk

# 550 MHz
# create_clock -period 1.8181818181818181 [get_ports clk] -name clk

# 575 MHz
# create_clock -period 1.7391304347826086 [get_ports clk] -name clk

# 600 MHz
# create_clock -period 1.6666666666666667 [get_ports clk] -name clk

# 625 MHz
# create_clock -period 1.6 [get_ports clk] -name clk

# 650 MHz
# create_clock -period 1.5384615384615385 [get_ports clk] -name clk

# 675 MHz
# create_clock -period 1.4814814814814814 [get_ports clk] -name clk

# 700 MHz
# create_clock -period 1.4285714285714286 [get_ports clk] -name clk

# 725 MHz
# create_clock -period 1.3793103448275863 [get_ports clk] -name clk

# 750 MHz
# create_clock -period 1.3333333333333333 [get_ports clk] -name clk

# 775 MHz
# create_clock -period 1.2903225806451613 [get_ports clk] -name clk

# 800 MHz
# create_clock -period 1.25 [get_ports clk] -name clk
