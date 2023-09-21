import subprocess
from Variables.variables import *


def main_func():
    for test_suite_name in test_suite_list:
        # Define the test suite path
        test_suite_path = f"{current_working_dir}\Robot_Code\\{test_suite_name}.robot"

        # Combine the parent directory with the current timestamp to create the subfolder path
        sub_folder_path = os.path.join(parent_output_dir, test_suite_name)
        # Create the sub_folder
        os.makedirs(sub_folder_path)

        # Construct the Robot Framework command with the sub_folder path and timestamp
        command = f"robot --outputdir \"{sub_folder_path}\" --report report.html \"{test_suite_path}\""

        # Run the Robot Framework command
        subprocess.run(command, shell=True)


test_suite_list = ["main", "Home"]

main_func()
