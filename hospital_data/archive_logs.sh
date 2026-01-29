#!usr/bin/bash
# Paths
ACTIVE_DIR="./hospital_data/active_logs"
ARCHIVE_DIR="./hospital_data/archived_logs"

# Menu
echo "Select a log file to archive:"
echo "1) heart_rate_log.log"
echo "2) temperature_log.log"
echo "3) water_usage_log.log"
read -p "Enter your choice (1-3): " choice

# Map choice to file and archive folder
case $choice in
    1)
        LOG_FILE="heart_rate_log.log"
        ARCHIVE_SUBDIR="heart_data_archive"
        ;;
    2)
        LOG_FILE="temperature_log.log"
        ARCHIVE_SUBDIR="temperature_data_archive"
        ;;
    3)
        LOG_FILE="water_usage_log.log"
        ARCHIVE_SUBDIR="water_usage_data_archive"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Full paths
ACTIVE_PATH="$ACTIVE_DIR/$LOG_FILE"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_SUBDIR"

# Check if log file exists
if [ ! -f "$ACTIVE_PATH" ]; then
    echo "Error: $LOG_FILE not found in active_logs."
    exit 1
fi

# Check if archive directory exists, create if missing
if [ ! -d "$ARCHIVE_PATH" ]; then
    echo "Archive directory $ARCHIVE_PATH missing. Creating it..."
    mkdir -p "$ARCHIVE_PATH"
    if [ $? -ne 0 ]; then
        echo "Failed to create archive directory. Exiting."
        exit 1
    fi
fi

# Timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")
ARCHIVED_FILE="$ARCHIVE_PATH/${LOG_FILE%.*}_$TIMESTAMP.log"

# Move and rename
mv "$ACTIVE_PATH" "$ARCHIVED_FILE"
if [ $? -ne 0 ]; then
    echo "Failed to move $LOG_FILE to archive."
    exit 1
fi

# Create a new empty log file
touch "$ACTIVE_PATH"

echo "Successfully archived $LOG_FILE to $ARCHIVED_FILE"
echo "New empty log file created at $ACTIVE_PATH"







