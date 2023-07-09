#!/bin/bash

# Update configuration files
update_configs() {
    # Update config_file1.conf
    # Example: sed -i 's/old_value/new_value/g' /path/to/config_file1.conf

    # Update config_file2.conf
    # Example: sed -i 's/old_value/new_value/g' /path/to/config_file2.conf

    # Update config_file3.conf
    # Example: sed -i 's/old_value/new_value/g' /path/to/config_file3.conf
}

# Check for package updates
check_updates() {
    sudo dnf update -y
}

# Install packages from a script
install_packages() {
    # Install package1
    sudo dnf install polybar dunst

}

# Run the script
update_configs
check_updates
install_packages