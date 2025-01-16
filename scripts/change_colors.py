import os
import re

colors_file_path = '/home/thomasdevasia/.config/hypr/colors-hyprland.conf'
lock_file_path = '/home/thomasdevasia/.config/hypr/hyprlock.conf'

# wallpaper lock color
colors = {}
with open(colors_file_path, 'r') as file:
    content = file.read()
    for color in content.split('\n'):
        var = color.split('=')[0].strip()
        val = color.split('=')[1].strip()
        colors[var] = val

with open(lock_file_path, 'r') as file:
    content = file.read()

content = re.sub(r'    color = rgb\(.*\)',
                 f'    color = {colors["$color1"]}', content)

with open(lock_file_path, 'w') as file:
    file.write(content)

print('done-----------------------------------------------')
