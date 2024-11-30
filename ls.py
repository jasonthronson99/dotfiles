import os
from colorama import Fore, Style, init

# Initialize colorama
init(autoreset=True)

# Current Directory
current_dir = os.getcwd()

def print_dict_in_columns(dictionary, column_height):
    items = sorted(dictionary.items())  # Sort the dictionary by keys and convert to a list
    for i in range(column_height):
        row = [
            f" {Fore.MAGENTA}{items[j][0]}{Fore.RED} ({str(items[j][1])})"
            for j in range(i, len(items), column_height)
        ]
        print(" |".join(row))  # Add "|" as the column separator
# Various Lists
hidden_dirs = []
hidden_files = []
dir_list = []
file_list = []
new_dict = {}

# Using os.scandir() for efficiency
with os.scandir(current_dir) as entries:
    for entry in entries:
        if entry.name.startswith(".") and not entry.is_dir():
            hidden_files.append(entry.name)
        elif entry.name.startswith(".") and entry.is_dir():
            hidden_dirs.append(entry.name) 
        elif entry.is_dir():
            dir_list.append(entry.name)
            new_dict[entry.name] = len(list(os.scandir(entry.path)))
        elif entry.is_file():
            file_list.append(entry.name)
# Sort Dictionary

# PRINT RESULTS
print("")
if hidden_files:
    print(Fore.YELLOW + "Hidden Files:" + Style.RESET_ALL, sorted(hidden_files), "\n")
if hidden_dirs:
    print(Fore.RED + "Hidden Directories:" + Style.RESET_ALL, sorted(hidden_dirs), "\n")
if new_dict:
    print(Fore.LIGHTBLUE_EX + "Normal Directories:")
    print_dict_in_columns(new_dict, 3)
    print("")
if file_list:
    print(Fore.GREEN + "Normal Files:" + Style.RESET_ALL, sorted(file_list), "\n")
