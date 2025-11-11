##      ## #### ##    ## ########   #######  ##      ##  ######     ##     ## ##     ##
##  ##  ##  ##  ###   ## ##     ## ##     ## ##  ##  ## ##    ##    ##     ## ###   ###
##  ##  ##  ##  ####  ## ##     ## ##     ## ##  ##  ## ##          ##     ## #### ####
##  ##  ##  ##  ## ## ## ##     ## ##     ## ##  ##  ##  ######     ##     ## ## ### ##
##  ##  ##  ##  ##  #### ##     ## ##     ## ##  ##  ##       ##     ##   ##  ##     ##
##  ##  ##  ##  ##   ### ##     ## ##     ## ##  ##  ## ##    ##      ## ##   ##     ##
 ###  ###  #### ##    ## ########   #######   ###  ###   ######        ###    ##     ##


##!/bin/zsh


# First add the user to the libvirt group: sudo usermod -aG libvirt $(whoami)
# --- Configuration ---
# The name to search for (case-insensitive)
SEARCH_NAME="win10"
# Set connection URI explicitly
export LIBVIRT_DEFAULT_URI="qemu:///system"

# --- Functions ---

# Function to check X11 display environment (useful for X/Wayland sessions)
check_display() {
    # Check if a display variable is set
    if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
        echo "Error: Neither \$DISPLAY (X11) nor \$WAYLAND_DISPLAY is set." >&2
        echo "Cannot launch graphical viewer." >&2
        return 1
    fi

    # If X11 is likely in use, check connectivity
    if [ -n "$DISPLAY" ] && ! xset q &>/dev/null; then
        echo "Warning: X11 display connection failed. Viewer might not work properly." >&2
        # We don't exit here, as it might be a Wayland session using Xwayland
    fi
    return 0
}

# Function to get exact VM name (case-sensitive)
get_vm_name() {
    local search_name=$1
    # Use grep -i and awk to reliably find the name (column 2)
    virsh -c qemu:///system list --all | grep -i "$search_name" | awk '{print $2}' | head -n 1
}

# Function to try different viewers
try_viewers() {
    local vm_name=$1

    # Try virt-viewer first (it's the preferred, lightweight console viewer)
    if command -v virt-viewer >/dev/null 2>&1; then
        echo "Trying virt-viewer..."
        # -c connects, -f focuses the window
        virt-viewer -cf qemu:///system "$vm_name" &
        return
    fi

    # Try virt-manager
    if command -v virt-manager >/dev/null 2>&1; then
        echo "Trying virt-manager..."
        # --show-domain-console opens the console directly
        virt-manager --connect qemu:///system --show-domain-console "$vm_name" &
        return
    fi

    # If neither viewer works, show connection info
    echo "Could not launch display viewer (virt-viewer or virt-manager not found)." >&2
    echo "You can try connecting manually using:"
    virsh domdisplay "$vm_name"
}

# --- Main Script Logic ---

# 1. Check Display Environment
if ! check_display; then
    exit 1
fi

# 2. Get the exact VM name (case-sensitive)
VM_NAME=$(get_vm_name "$SEARCH_NAME")

if [ -z "$VM_NAME" ]; then
    echo "VM matching '$SEARCH_NAME' not found." >&2
    echo "Available VMs:"
    virsh -c qemu:///system list --all
    exit 1
fi

echo "Found VM: **$VM_NAME**"

# 3. Check if VM is already running
if virsh -c qemu:///system list | grep -q -E "[[:space:]]+$VM_NAME[[:space:]]+running$"; then
    echo "VM $VM_NAME is already running."
    echo "Opening display..."
    try_viewers "$VM_NAME"
    exit 0
fi

# 4. Start the VM
echo "Starting VM $VM_NAME..."
if ! virsh -c qemu:///system start "$VM_NAME"; then
    echo "Error starting VM. Check libvirt logs or verify user is in the 'libvirt' group." >&2
    exit 1
fi

# 5. Wait a moment for VM to initialize
sleep 3

# 6. Launch the display viewer
echo "Opening display..."
try_viewers "$VM_NAME"
