#!/bin/bash

# --------------------------------------------
# Log Cleaner & Error Report Generator
# --------------------------------------------
# Usage: ./log_cleaner.sh your_log_file.log
# Output: cleaned_errors_report.txt
# --------------------------------------------

# Check if input file is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

LOG_FILE=$1
OUTPUT_FILE="cleaned_errors_report.txt"

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' not found!"
    exit 1
fi

# Extract errors and sort
grep -E "ERROR|FAILURE" "$LOG_FILE" | sort | uniq > "$OUTPUT_FILE"

echo "Done! Cleaned report saved to $OUTPUT_FILE"
