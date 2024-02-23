# read input from command line

import sys
import os
import re

# get the path of the image
new_path = sys.argv[1]
# print(new_path)

# read the hyperpaper config file do the changes then write it back
config_file = "/home/thomasdevasia/.config/hypr/hyprpaper.conf"

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

