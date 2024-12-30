import os

with open(os.path.expanduser('~/.cache/wal/colors-kitty.conf'), 'r') as f:
    kitty_colors = f.read()

color_arr = []
rest_arr = []
for color in kitty_colors.split('\n'):
    if color.strip() == '':
        continue
    var = color.split(' ')[0].strip().replace('color', '')
    current_color = color.split(' ')[-1].strip()
    # print(f'"{var}" = "{current_color}"')
    if len(var) < 3:
        color_arr.append(f'palette = {var}={current_color}')
    else:
        if var == 'foreground':
            rest_arr.append(f'{var} = {current_color}')
            rest_arr.append(f'selection-background = {current_color}')
        if var == 'background':
            rest_arr.append(f'{var} = {current_color}')
            rest_arr.append(f'selection-foreground = {current_color}')
        if var == 'cursor':
            rest_arr.append(f'{var}-color = {current_color}')

output = '\n'.join(color_arr)
output += '\n' + '\n'.join(rest_arr)

with open(os.path.expanduser('~/dotfiles/.config/ghostty/themes/abc.conf'), 'w') as f:
    f.write(output)
