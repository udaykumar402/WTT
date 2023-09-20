import os
import datetime

# Current working dir path fetching
path = os.getcwd().split('\\')
path.pop()
current_working_dir = "\\".join(path)

browser = "chrome"

website = "https://wtt-51243-react-native.b51243.dev.eastus.az.svc.builder.cafe/"

# Get the current timestamp in the desired format
timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")

# Define the parent output directory
parent_output_dir = f"{current_working_dir}\Test_Logs\{timestamp}"
