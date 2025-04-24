open_project "/home/tobi/Desktop/proj11RERE/project_11/project_11.xpr"
set_param general.maxThreads 24
set_property top examplemodel_sim [get_fileset sim_1]
launch_simulation -simset sim_1
remove_bps -all -quiet
restart
run 100000 s
puts "Simulation is done" 