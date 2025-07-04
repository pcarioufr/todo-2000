#!/bin/bash

# Agentic Todo System - Quick Actions Script
# Usage: ./scripts/quick-actions.sh [action]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get today's date
TODAY=$(date +%Y-%m-%d)

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create a new project
create_project() {
    read -p "Enter project name (kebab-case): " project_name
    
    if [ -z "$project_name" ]; then
        print_error "Project name cannot be empty"
        return 1
    fi
    
    project_file="projects/${project_name}.md"
    
    if [ -f "$project_file" ]; then
        print_error "Project file already exists: $project_file"
        return 1
    fi
    
    cp projects/template.md "$project_file"
    print_success "Created project file: $project_file"
    
    # Open in default editor
    if command -v cursor &> /dev/null; then
        cursor "$project_file"
    elif command -v code &> /dev/null; then
        code "$project_file"
    else
        print_status "Edit the file manually: $project_file"
    fi
}

# Function to create a new person
create_person() {
    read -p "Enter person name (firstname-lastname): " person_name
    
    if [ -z "$person_name" ]; then
        print_error "Person name cannot be empty"
        return 1
    fi
    
    person_file="people/${person_name}.md"
    
    if [ -f "$person_file" ]; then
        print_error "Person file already exists: $person_file"
        return 1
    fi
    
    cp people/template.md "$person_file"
    print_success "Created person file: $person_file"
    
    # Open in default editor
    if command -v cursor &> /dev/null; then
        cursor "$person_file"
    elif command -v code &> /dev/null; then
        code "$person_file"
    else
        print_status "Edit the file manually: $person_file"
    fi
}

# Function to create meeting notes
create_meeting() {
    read -p "Enter meeting name (kebab-case): " meeting_name
    
    if [ -z "$meeting_name" ]; then
        print_error "Meeting name cannot be empty"
        return 1
    fi
    
    meeting_file="context/${TODAY}-${meeting_name}.md"
    
    if [ -f "$meeting_file" ]; then
        print_error "Meeting file already exists: $meeting_file"
        return 1
    fi
    
    cp context/meeting-notes-template.md "$meeting_file"
    print_success "Created meeting notes: $meeting_file"
    
    # Open in default editor
    if command -v cursor &> /dev/null; then
        cursor "$meeting_file"
    elif command -v code &> /dev/null; then
        code "$meeting_file"
    else
        print_status "Edit the file manually: $meeting_file"
    fi
}

# Function to create a new routine
create_routine() {
    read -p "Enter routine name (kebab-case): " routine_name
    
    if [ -z "$routine_name" ]; then
        print_error "Routine name cannot be empty"
        return 1
    fi
    
    routine_file="routines/${routine_name}.md"
    
    if [ -f "$routine_file" ]; then
        print_error "Routine file already exists: $routine_file"
        return 1
    fi
    
    cp routines/template.md "$routine_file"
    print_success "Created routine file: $routine_file"
    
    # Open in default editor
    if command -v cursor &> /dev/null; then
        cursor "$routine_file"
    elif command -v code &> /dev/null; then
        code "$routine_file"
    else
        print_status "Edit the file manually: $routine_file"
    fi
}

# Function to update last contact dates
update_contacts() {
    print_status "Updating last contact dates..."
    
    # Find all people files and update Last Contact to today
    for file in people/*.md; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "template.md" ]; then
            if grep -q "**Last Contact:**" "$file"; then
                # Update existing Last Contact date
                sed -i.bak "s/\*\*Last Contact:\*\* .*/\*\*Last Contact:\*\* $TODAY/" "$file"
                print_success "Updated last contact date in $(basename "$file")"
            fi
        fi
    done
    
    # Clean up backup files
    find people/ -name "*.bak" -delete 2>/dev/null || true
}

# Function to archive completed tasks
archive_completed() {
    print_status "Archiving completed tasks..."
    
    # Count completed tasks
    completed_count=$(grep -c "^- \[x\]" todo.md || echo "0")
    
    if [ "$completed_count" -eq 0 ]; then
        print_warning "No completed tasks to archive"
        return 0
    fi
    
    print_status "Found $completed_count completed tasks"
    
    # Create archive file for this week if it doesn't exist
    archive_file="archive/$(date +%Y-W%U).md"
    mkdir -p archive
    
    if [ ! -f "$archive_file" ]; then
        echo "# Completed Tasks - Week of $(date +%Y-%m-%d)" > "$archive_file"
        echo "" >> "$archive_file"
    fi
    
    # Extract completed tasks and append to archive
    echo "## Completed on $TODAY" >> "$archive_file"
    grep "^- \[x\]" todo.md >> "$archive_file" || true
    echo "" >> "$archive_file"
    
    # Remove completed tasks from todo.md
    grep -v "^- \[x\]" todo.md > todo.tmp && mv todo.tmp todo.md
    
    print_success "Archived $completed_count completed tasks to $archive_file"
}

# Function to generate status report
generate_report() {
    print_status "Generating status report..."
    
    echo ""
    echo "=== AGENTIC TODO SYSTEM STATUS REPORT ==="
    echo "Generated: $(date)"
    echo ""
    
    # Count active tasks
    active_tasks=$(grep -c "^- \[ \]" todo.md || echo "0")
    echo "📋 Active Tasks: $active_tasks"
    
    # Count today's focus items
    focus_tasks=$(awk '/## 🎯 Today'\''s Focus/,/^---/ { if(/^- \[ \]/) count++ } END { print count+0 }' todo.md)
    echo "🎯 Today's Focus: $focus_tasks"
    
    # Count active projects
    active_projects=$(grep -c "**Status:** Active" projects/*.md 2>/dev/null || echo "0")
    echo "🚀 Active Projects: $active_projects"
    
    # Count high-priority contacts
    high_priority_people=$(grep -c "**Priority:** High" people/*.md 2>/dev/null || echo "0")
    echo "👥 High Priority Contacts: $high_priority_people"
    
    # Count routines
    total_routines=$(find routines/ -name "*.md" -not -name "template.md" | wc -l 2>/dev/null || echo "0")
    echo "🔄 Total Routines: $total_routines"
    
    # Show overdue items (simple check for "Due:" in the past)
    echo ""
    echo "⚠️  Items with Due Dates:"
    grep -r "Due:" . --include="*.md" | grep -v ".git" | head -5
    
    echo ""
    echo "=== END REPORT ==="
}



# Function to sync todo.md dashboard from all context files
sync_todo_dashboard() {
    print_status "Syncing todo.md dashboard from all context files..."
    
    # Backup existing Today's Focus section if it exists
    today_focus=""
    if [ -f "todo.md" ] && grep -q "## 🎯 Today's Focus" todo.md; then
        today_focus=$(awk '/## 🎯 Today'\''s Focus/,/^## / {if($0 !~ /^## / || $0 ~ /^## 🎯 Today'\''s Focus/) print $0}' todo.md | sed '$d')
    fi
    
    # Create new todo.md header
    cat > todo.md << 'EOF'
# Todo Dashboard 📋

EOF
    echo "*Last updated: $(date +%Y-%m-%d)*" >> todo.md
    echo "" >> todo.md
    echo "This dashboard aggregates action items from all context files. **Update tasks in their source files** (projects/, people/, routines/) and use \`./todo.sh sync\` to refresh this view." >> todo.md
    echo "" >> todo.md
    
    # Preserve Today's Focus section
    if [ -n "$today_focus" ]; then
        echo "$today_focus" >> todo.md
        echo "" >> todo.md
    else
        echo "## 🎯 Today's Focus" >> todo.md
        echo "*Edit this section manually for daily priorities*" >> todo.md
        echo "" >> todo.md
        echo "- [ ] " >> todo.md
        echo "- [ ] " >> todo.md
        echo "- [ ] " >> todo.md
        echo "" >> todo.md
    fi
    
    # Extract action items from project files
    echo "## 🚀 Project Action Items" >> todo.md
    echo "" >> todo.md
    for file in projects/*.md; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "template.md" ]; then
            project_name=$(grep "^\*\*Project Name:\*\*" "$file" | sed 's/^\*\*Project Name:\*\* //')
            if [ -n "$project_name" ]; then
                echo "### $project_name" >> todo.md
                echo "*Source: [$file]($file)*" >> todo.md
                echo "" >> todo.md
                
                # Extract current milestones
                if grep -q "Current Milestones" "$file"; then
                    awk '/Current Milestones/,/^## / {if($0 ~ /^- \[ \]/) print $0}' "$file" >> todo.md
                fi
                
                # Extract action items
                if grep -q "Action Items" "$file"; then
                    awk '/Action Items/,/^## / {if($0 ~ /^- \[ \]/) print $0}' "$file" >> todo.md
                fi
                
                echo "" >> todo.md
            fi
        fi
    done
    
    # Extract action items from people files
    echo "## 👥 People Action Items" >> todo.md
    echo "" >> todo.md
    for file in people/*.md; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "template.md" ]; then
            person_name=$(grep "^\*\*Name:\*\*" "$file" | sed 's/^\*\*Name:\*\* //')
            if [ -n "$person_name" ]; then
                # Check if there are action items
                if grep -q "Action Items" "$file"; then
                    echo "### $person_name" >> todo.md
                    echo "*Source: [$file]($file)*" >> todo.md
                    echo "" >> todo.md
                    awk '/Action Items/,/^## / {if($0 ~ /^- \[ \]/) print $0}' "$file" >> todo.md
                    echo "" >> todo.md
                fi
            fi
        fi
    done
    
    # Extract routine items that are due
    echo "## 🔄 Routine Items" >> todo.md
    echo "" >> todo.md
    for file in routines/*.md; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "template.md" ]; then
            routine_name=$(grep "^\*\*Routine Name:\*\*" "$file" | sed 's/^\*\*Routine Name:\*\* //')
            if [ -n "$routine_name" ]; then
                # Check if routine has next due date
                if grep -q "Next Due:" "$file"; then
                    next_due=$(grep "Next Due:" "$file" | sed 's/.*Next Due: *//')
                    echo "- [ ] $routine_name (Due: $next_due)" >> todo.md
                    echo "  *Source: [$file]($file)*" >> todo.md
                fi
            fi
        fi
    done
    echo "" >> todo.md
    
    # Add risks and blockers section
    echo "## 🚨 Risks & Blockers" >> todo.md
    echo "" >> todo.md
    
    # Extract blockers from project files
    echo "### Project Blockers" >> todo.md
    for file in projects/*.md; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "template.md" ]; then
            project_name=$(grep "^\*\*Project Name:\*\*" "$file" | sed 's/^\*\*Project Name:\*\* //')
            if [ -n "$project_name" ] && grep -q "### Blockers" "$file"; then
                echo "- **$project_name**" >> todo.md
                awk '/### Blockers/,/^## / {if($0 ~ /^- / && $0 !~ /^## /) print "  " $0}' "$file" >> todo.md
            fi
        fi
    done
    
    # Extract routine challenges
    echo "### Routine Challenges" >> todo.md
    for file in routines/*.md; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "template.md" ]; then
            routine_name=$(grep "^\*\*Routine Name:\*\*" "$file" | sed 's/^\*\*Routine Name:\*\* //')
            if [ -n "$routine_name" ] && grep -q "Current challenges:" "$file"; then
                challenges=$(grep "Current challenges:" "$file" | sed 's/.*Current challenges: *//')
                echo "- **$routine_name** - $challenges" >> todo.md
            fi
        fi
    done
    
    # Add system health check
    echo "### System Health" >> todo.md
    if [ -f "todo.md" ]; then
        while IFS= read -r line; do
            if echo "$line" | grep -q "Project:"; then
                project_name=$(echo "$line" | sed 's/.*Project: \([^-]*\).*/\1/' | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
                if [ ! -f "projects/${project_name}.md" ]; then
                    echo "- Referenced project not found: projects/${project_name}.md" >> todo.md
                fi
            fi
        done < todo.md
    fi
    echo "" >> todo.md
    
    # Add wins and achievements section
    echo "## 🎉 Wins & Achievements" >> todo.md
    echo "" >> todo.md
    
    # Extract completed milestones from project files
    echo "### Project Achievements" >> todo.md
    for file in projects/*.md; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "template.md" ]; then
            project_name=$(grep "^\*\*Project Name:\*\*" "$file" | sed 's/^\*\*Project Name:\*\* //')
            if [ -n "$project_name" ] && grep -q "Completed Milestones" "$file"; then
                echo "- **$project_name**" >> todo.md
                awk '/Completed Milestones/,/^## / {if($0 ~ /^- \\[x\\]/) print "  ✅" substr($0, 7)}' "$file" >> todo.md
            fi
        fi
    done
    
    # Extract lessons learned
    echo "### Key Learnings" >> todo.md
    for file in projects/*.md; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "template.md" ]; then
            project_name=$(grep "^\*\*Project Name:\*\*" "$file" | sed 's/^\*\*Project Name:\*\* //')
            if [ -n "$project_name" ] && grep -q "Lessons Learned" "$file"; then
                echo "- **$project_name**" >> todo.md
                awk '/Lessons Learned/,/^## / {if($0 ~ /^- / && $0 !~ /^## /) print "  " $0}' "$file" >> todo.md
            fi
        fi
    done
    
    # Extract routine optimization successes
    echo "### Routine Optimizations" >> todo.md
    for file in routines/*.md; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "template.md" ]; then
            routine_name=$(grep "^\*\*Routine Name:\*\*" "$file" | sed 's/^\*\*Routine Name:\*\* //')
            if [ -n "$routine_name" ] && grep -q "Potential improvements:" "$file"; then
                improvements=$(grep "Potential improvements:" "$file" | sed 's/.*Potential improvements: *//')
                echo "- **$routine_name**: $improvements" >> todo.md
            fi
        fi
    done
    echo "" >> todo.md
    
    # Add quick navigation
    echo "## 🗂️ Quick Navigation" >> todo.md
    echo "" >> todo.md
    echo "- [📊 Status Report](./todo.sh report)" >> todo.md
    echo "- [🚀 All Projects](./projects/)" >> todo.md
    echo "- [👥 All People](./people/)" >> todo.md
    echo "- [🔄 All Routines](./routines/)" >> todo.md
    echo "" >> todo.md
    
    echo "---" >> todo.md
    echo "*This dashboard is generated from context files. Use \`./todo.sh sync\` to refresh after updating source files.*" >> todo.md
    
    print_success "Todo dashboard synced from all context files"
}

# Function to check system health
check_health() {
    print_status "Checking system health..."
    
    errors=0
    
    # Check for required directories
    for dir in projects people context routines; do
        if [ ! -d "$dir" ]; then
            print_error "Missing directory: $dir"
            ((errors++))
        fi
    done
    
    # Check for required templates
    for template in "projects/template.md" "people/template.md" "context/meeting-notes-template.md" "routines/template.md"; do
        if [ ! -f "$template" ]; then
            print_error "Missing template: $template"
            ((errors++))
        fi
    done
    
    # Check for main todo file
    if [ ! -f "todo.md" ]; then
        print_error "Missing main todo file: todo.md"
        ((errors++))
    fi
    
    # Check for broken project references
    if [ -f "todo.md" ]; then
        while IFS= read -r line; do
            if echo "$line" | grep -q "Project:"; then
                project_name=$(echo "$line" | sed 's/.*Project: \([^-]*\).*/\1/' | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
                if [ ! -f "projects/${project_name}.md" ]; then
                    print_warning "Referenced project not found: projects/${project_name}.md"
                fi
            fi
        done < todo.md
    fi
    
    if [ $errors -eq 0 ]; then
        print_success "System health check passed!"
    else
        print_error "Found $errors errors in system health check"
        return 1
    fi
}

# Main menu
show_menu() {
    echo ""
    echo "=== AGENTIC TODO SYSTEM - QUICK ACTIONS ==="
    echo "1. Create new project"
    echo "2. Create new person"
    echo "3. Create meeting notes"
    echo "4. Create new routine"
    echo "5. Sync todo dashboard"
    echo "6. Update contact dates"
    echo "7. Archive completed tasks"
    echo "8. Generate status report"
    echo "9. Check system health"
    echo "10. Exit"
    echo ""
    read -p "Select an option (1-10): " choice
    
    case $choice in
        1) create_project ;;
        2) create_person ;;
        3) create_meeting ;;
        4) create_routine ;;
        5) sync_todo_dashboard ;;
        6) update_contacts ;;
        7) archive_completed ;;
        8) generate_report ;;
        9) check_health ;;
        10) print_success "Goodbye!"; exit 0 ;;
        *) print_error "Invalid option. Please try again." ;;
    esac
}

# Main execution
if [ $# -eq 0 ]; then
    # Interactive mode
    while true; do
        show_menu
        echo ""
        read -p "Press Enter to continue or Ctrl+C to exit..."
    done
else
    # Command line mode
    case $1 in
        "project") create_project ;;
        "person") create_person ;;
        "meeting") create_meeting ;;
        "routine") create_routine ;;
        "sync") sync_todo_dashboard ;;
        "update-contacts") update_contacts ;;
        "archive") archive_completed ;;
        "report") generate_report ;;
        "health") check_health ;;
        *) 
            echo "Usage: $0 [project|person|meeting|routine|sync|update-contacts|archive|report|health]"
            echo "   or: $0 (for interactive mode)"
            exit 1
            ;;
    esac
fi 