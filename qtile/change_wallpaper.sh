#!/bin/bash

# Define absolute paths
WALLPAPER_DIR="/home/jason/MEGA/Pictures/Wallpapers"
LOG_FILE="/home/jason/.config/qtile/backgrounds.txt"
DEBUG_LOG="/home/jason/.config/qtile/debug.log"

# Ensure log files exist
mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE" "$DEBUG_LOG"
chmod 666 "$LOG_FILE" "$DEBUG_LOG"

# Log script start
echo "Script started at $(date)" | tee -a "$DEBUG_LOG"

# Ensure wallpaper directory exists
if [[ ! -d "$WALLPAPER_DIR" ]]; then
    echo "Error: Wallpaper directory does not exist: $WALLPAPER_DIR" | tee -a "$DEBUG_LOG"
    exit 1
fi

# Find a random wallpaper (only image files)
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Log selected wallpaper
echo "Selected wallpaper: $RANDOM_WALLPAPER" | tee -a "$DEBUG_LOG"

# Check if a wallpaper was found
if [[ -z "$RANDOM_WALLPAPER" ]]; then
    echo "Error: No wallpaper found in $WALLPAPER_DIR" | tee -a "$DEBUG_LOG"
    exit 1
fi

# Set the wallpaper
swaybg -i "$RANDOM_WALLPAPER" -m fill &

# Log the wallpaper filename
echo "$RANDOM_WALLPAPER" | tee -a "$LOG_FILE" "$DEBUG_LOG"

# Confirm script completion
echo "Wallpaper set successfully at $(date)" | tee -a "$DEBUG_LOG"

exit 0
