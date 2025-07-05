#!/bin/bash

# Cursor AI Utility Functions
# Usage: .cursor/utils.sh [function_name]

get_current_date() {
    date +%Y-%m-%d
}

get_current_datetime() {
    date '+%Y-%m-%d %H:%M'
}

get_current_week() {
    date '+%Y-W%U'
}

# Main execution
case "$1" in
    "date")
        get_current_date
        ;;
    "datetime")
        get_current_datetime
        ;;
    "week")
        get_current_week
        ;;
    *)
        echo "Usage: .cursor/utils.sh [date|datetime|week]"
        echo "  date     - Get current date (YYYY-MM-DD)"
        echo "  datetime - Get current date and time (YYYY-MM-DD HH:MM)"
        echo "  week     - Get current week (YYYY-WMM)"
        exit 1
        ;;
esac 