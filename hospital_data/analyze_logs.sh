#!/usr/bin/bash

LOG_DIR="./active_logs"
REPORT_FILE="./reports/analysis_report.txt"


echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate_log.log)"
echo "2) Temperature (temperature_log.log)"
echo "3) Water Usage (water_usage_log.log)"
read -p "Enter choice (1-3): " choice

# Validate input and map to file
case "$choice" in
    1)
        LOG_FILE="heart_rate_log.log"
        TITLE="Heart Rate Analysis"
        ;;
    2)
        LOG_FILE="temperature_log.log"
        TITLE="Temperature Analysis"
        ;;
    3)
        LOG_FILE="water_usage_log.log"
        TITLE="Water Usage Analysis"
        ;;
    *)
        echo "Invalid choice. Please select 1, 2, or 3."
        exit 1
        ;;
esac

LOG_PATH="$LOG_DIR/$LOG_FILE"

# Check if log file exists
if [ ! -f "$LOG_PATH" ]; then
    echo "Error: $LOG_FILE not found."
    exit 1
fi

echo "Analyzing $LOG_FILE..."

# Header for report
{
    echo "--------------------------------------"
    echo "$TITLE"
    echo "Log file: $LOG_FILE"
    echo "Analysis date: $(date)"
    echo ""
    echo "Device statistics:"
} >> "$REPORT_FILE"

# Count occurrences per device
awk '{print $1}' "$LOG_PATH" | sort | uniq -c | while read count device
do
    # First and last timestamps (bonus)
    first_time=$(grep "^$device" "$LOG_PATH" | head -n 1 | awk '{print $2, $3}')
    last_time=$(grep "^$device" "$LOG_PATH" | tail -n 1 | awk '{print $2, $3}')

    {
        echo "Device: $device"
        echo "  Total entries: $count"
        echo "  First entry: $first_time"
        echo "  Last entry:  $last_time"
        echo ""
    } >> "$REPORT_FILE"
done

echo "Analysis complete. Results appended to analysis_report.txt"

