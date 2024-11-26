import os
from colorama import Fore, Style, init

# Initialize colorama
init(autoreset=True)

# Current Directory
current_dir = os.getcwd()

# Various Lists
hidden_files = []
dir_list = []
file_list = []
new_dict = {}

# Using os.scandir() for efficiency
with os.scandir(current_dir) as entries:
    for entry in entries:
        if entry.name.startswith("."):
            hidden_files.append(entry.name)
        elif entry.is_dir():
            dir_list.append(entry.name)
            # Count files in the directory efficiently
            new_dict[entry.name] = sum(1 for _ in os.scandir(entry.path))
        elif entry.is_file():
            file_list.append(entry.name)

# Print Results with Color
print("")
if hidden_files:
    print(Fore.YELLOW + "Hidden Files:" + Style.RESET_ALL, hidden_files, "\n")
if new_dict:
    print(Fore.CYAN + "Directory Counts:" + Style.RESET_ALL, new_dict, "\n")
if file_list:
    print(Fore.GREEN + "Normal Files:" + Style.RESET_ALL, file_list, "\n")
