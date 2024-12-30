# read input from command line

import sys
import os
import re

# get the path of the image
new_path = sys.argv[1]
# print(new_path)

# read the hyperpaper config file do the changes then write it back
config_file = "/home/thomasdevasia/.config/hypr/hyprpaper.conf"
wallpaper_file_path = "~/.cache/wallpaper-selector/.wallpaper"

# read wallpaper path
with open(os.path.expanduser(wallpaper_file_path), 'r') as file:
    wallpaper = file.read().strip()

# read the config file
with open(config_file, "r") as f:
    config = f.read()

wallpaper_path = re.finditer(r"(/home/thomasdevasia/Pictures/.*)\n", config)

for i in wallpaper_path:
    # print(i.group(1))
    # replace the content
    config = config.replace(i.group(1), new_path)

# print(config)

# write the config file
with open(config_file, "w") as f:
    f.write(config)

# # read waybar config file and do the changes then write it back

# config_file = "/home/thomasdevasia/.config/waybar/tempStyle.css"

# # read the config file
# with open(config_file, "r") as f:
#     css = f.read()


# pywal_path = os.path.expanduser('~/.cache/wal/colors')

# with open(pywal_path, 'r') as file:
#     colors = []
#     for line in file:
#         print(line.strip())
#         colors.append(line.strip())

# with open(os.path.expanduser("~/.config/hypr/colors.conf"), 'w') as file:
#     for i, color in enumerate(colors):
#         file.write(f'$color{i} = "0xff{color.replace('#','')}"\n')

# hyprlock wallpaper change

# with open(os.path.expanduser("~/.config/hypr/hyprlock.conf"), 'r') as file:
#     content = file.read()
#
# content = re.sub(r'path = (/(.*))', f'path = {wallpaper}', content)
#
# with open(os.path.expanduser("~/.config/hypr/hyprlock.conf"), 'w') as file:
#     file.write(content)
#
