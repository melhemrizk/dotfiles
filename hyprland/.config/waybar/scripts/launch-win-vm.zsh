##      ## #### ##    ## ########   #######  ##      ##  ######     ##     ## ##     ##
##  ##  ##  ##  ###   ## ##     ## ##     ## ##  ##  ## ##    ##    ##     ## ###   ###
##  ##  ##  ##  ####  ## ##     ## ##     ## ##  ##  ## ##          ##     ## #### ####
##  ##  ##  ##  ## ## ## ##     ## ##     ## ##  ##  ##  ######     ##     ## ## ### ##
##  ##  ##  ##  ##  #### ##     ## ##     ## ##  ##  ##       ##     ##   ##  ##     ##
##  ##  ##  ##  ##   ### ##     ## ##     ## ##  ##  ## ##    ##      ## ##   ##     ##
 ###  ###  #### ##    ## ########   #######   ###  ###   ######        ###    ##     ##


#!/bin/zsh

# Set LIBVIRT_DEFAULT_URI
export LIBVIRT_DEFAULT_URI="qemu:///system"

# Get current display if not set
if [ -z "$DISPLAY" ]; then
    export DISPLAY=:1
fi

# Function to check display environment
check_display() {
    if ! xset q &>/dev/null; then
        echo "Warning: X11 display connection failed. Display might not work properly."
        return 1
    fi
    return 0
}

# Function to get exact VM name (case-sensitive)
get_vm_name() {
    local search_name=$1
    virsh -c qemu:///system list --all | grep -i "$search_name" | awk '{print $2}' | head -n 1
}

# Function to try different viewers
try_viewers() {
    local vm_name=$1
    local as_user=$2

    # Set display environment for sudo cases
    if [ -n "$as_user" ]; then
        export XAUTHORITY="/home/$as_user/.Xauthority"
    fi

    # Try virt-viewer first
    if command -v virt-viewer >/dev/null 2>&1; then
        echo "Trying virt-viewer..."
        if [ -n "$as_user" ]; then
            sudo -u "$as_user" DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY virt-viewer -c qemu:///system "$vm_name"
        else
            virt-viewer -cf qemu:///system "$vm_name"
        fi
        return
    fi

    # Try virt-manager
    if command -v virt-manager >/dev/null 2>&1; then
        echo "Trying virt-manager..."
        if [ -n "$as_user" ]; then
            sudo -u "$as_user" DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY virt-manager --connect qemu:///system --show-domain-console "$vm_name"
        else
            virt-manager --connect qemu:///system --show-domain-console "$vm_name"
        fi
        return
    fi

    # If neither viewer works, show connection info
    echo "Could not launch display viewer. You can connect to the VM using:"
    virsh domdisplay "$vm_name"
}

# Check display environment
check_display

# Get the exact VM name (case-sensitive)
SEARCH_NAME="win10"
VM_NAME=$(get_vm_name "$SEARCH_NAME")

if [ -z "$VM_NAME" ]; then
    echo "VM matching '$SEARCH_NAME' not found"
    echo "Available VMs:"
    virsh -c qemu:///system list --all
    exit 1
fi

echo "Found VM: $VM_NAME"

# Check if VM is already running
if virsh -c qemu:///system list | grep -q "$VM_NAME"; then
    echo "VM $VM_NAME is already running"
    echo "Opening display..."
    try_viewers "$VM_NAME" "$SUDO_USER"
    exit 0
fi

# Start the VM
echo "Starting VM $VM_NAME..."
virsh -c qemu:///system start "$VM_NAME"

# Wait a moment for VM to initialize
sleep 3

# Launch the display viewer
echo "Opening display..."
try_viewers "$VM_NAME" "$SUDO_USER"
