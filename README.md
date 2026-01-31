Project- Hospital Data Monitoring & Archival System


What the Project Does 
This project demonstrates an automated hospital data-monitoring, archival, and analysis system built with Linux shell scripting and command-line tools.
For this lab, Python scripts simulate three hospital devices: heart rate monitors, temperature sensors, and water usage meters. These simulators continuously generate log data that is written to active log files. The system includes interactive shell scripts that allow a user to archive selected logs and analyze log data without disrupting the running monitoring processes.
It demonstrates how system administrators can:
- Manage continuously growing log files
- Perform log rotation without stopping services
- Maintain organized historical archives using timestamps
- Analyze operational data using standard Linux CLI tools
The project reinforces best practices in automation, file management, and data analysis, which are essential skills for system administration and DevOps roles.

How Users Can Get Started with the Project
a) Environment Requirements
- Linux-based environment
- Bash shell
- Python 3 installed
- 
b) Initialization
After cloning the repository, monitoring simulators are started in separate terminals to generate live data:

bash
cd hospital_data
python3 heart_monitor.py
python3 temp_sensory.py
python3 water_meter.py

Where Users can get help
a) Checking terminal output and error messages for guidance
b) Contacting the project contributors for clarification

Who maintains and contributes to the project
a) Pauline Miyienda
b) Nziza Denilson
c) Tendai Lynn Mtakiwa
d) Griphen Mweene
e) Jeremiah Oluwatobi
