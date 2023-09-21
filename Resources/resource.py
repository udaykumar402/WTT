import subprocess
from Variables.variables import *


# Run this function to install required modules using pip
def configuration():
    subprocess.run("pip install --upgrade pip", shell=True)
    command = f"python -m pip install -r {current_working_dir}\Resources\\resource.txt"
    subprocess.run(command, shell=True)


configuration()
