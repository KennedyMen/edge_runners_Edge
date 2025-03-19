# Create the Vivado/Journals and Vivado/Logs directories if they do not exist
exec mkdir -p Vivado/Journals
exec mkdir -p Vivado/Logs

# Create a new project in the same directory as this script
create_project -force uart_project Vivado/Sims -part xc7z020clg484-1

# Add source files
add_files /home/deck/Documents/Edge_Runner/edge_runners/uart/receiver.sv
add_files /home/deck/Documents/Edge_Runner/edge_runners/uart/transmitter.sv
add_files /home/deck/Documents/Edge_Runner/edge_runners/uart/uart.sv
add_files /home/deck/Documents/Edge_Runner/edge_runners/testBench/uart_top_tb.sv
add_files /home/deck/Documents/Edge_Runner/edge_runners/definitions_pkg.sv
# Create the target directory for the testImages folder
exec mkdir -p Vivado/Sims/uart_project.sim/sim_1/behav/xsim/

# Control where the simulation files go 
set_property directory Vivado/Sims [get_filesets sim_1]

# Set the top module
set_property top uart_top_tb [get_filesets sim_1]

# Launch the simulation
launch_simulation

# Run the simulation
run 2000ns

# Define the backup folder for logs and journal files
set backup_folder "/home/deck/Documents/Edge_Runner/edge_runners/Backups_logs_journals"

# Create the backup folder if it doesn't exist
exec mkdir -p $backup_folder

# Move all backup log and journal files to the backup folder - with error handling
exec bash -c "find . -name \"*.backup.log\" | xargs -r mv -t $backup_folder"
exec bash -c "find . -name \"*.backup.jou\" | xargs -r mv -t $backup_folder"

puts "Simulation complete. Results available in Vivado/Sims"
puts "All backup log and journal files have been moved to $backup_folder"