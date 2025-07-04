# Agentic Todo System 🤖

A structured todo management system designed to maintain context about projects, people, and tasks - built to work intelligently with AI agents like Cursor for seamless task management.

## 📁 Structure

```
todo-2000/
├── todo.sh                 # 🤖 Automation engine (handled by Cursor)
├── todo.md                 # 📋 Main dashboard with tasks, risks, and wins
├── .cursorrules            # 🧠 Cursor AI rules & context
├── .cursor/
│   ├── settings.json       # ⚙️ Workspace settings
│   └── extensions.json     # 🔧 Recommended extensions
├── projects/              # 🚀 Project-specific information
│   ├── template.md        # Template for new projects
│   └── website-redesign.md # Example project
├── people/               # 👥 People and contact management
│   ├── template.md       # Template for new contacts
│   └── sarah-johnson.md  # Example person
├── routines/             # 🔄 Recurring activities and processes
│   ├── template.md       # Template for new routines
│   ├── slack-notifications.md # Daily routine example
│   ├── email-processing.md    # Weekly routine example
│   └── performance-reviews.md # Monthly routine example
├── context/              # 📝 Meeting notes and additional context
│   └── meeting-notes-template.md
└── README.md             # 📖 This file
```

## 🎯 Core Concept

This system is designed around the principle that effective task management requires **context**. Traditional todo apps exist in isolation, but real work happens in the context of:

- **Projects** with timelines, stakeholders, and dependencies
- **People** with their own priorities, communication styles, and availability
- **Routines** that need to be done regularly to maintain productivity
- **Context** from meetings, decisions, and ongoing discussions

All of this is consolidated into a single **todo.md dashboard** that includes action items, risks & blockers, and wins & achievements in one unified view.

## 🚀 How It Works

### **Context-First Dashboard Approach** 📊
This system follows a **dashboard-based approach**:
- **Work happens in context files** (`projects/`, `people/`, `routines/`)
- **todo.md is a unified dashboard** that aggregates action items, risks, and wins from all context files
- **Rich context stays where it belongs** - in dedicated files for each domain
- **Daily priorities are managed** in the "Today's Focus" section of todo.md
- **Update tasks in their source files**, then sync the dashboard with one command

### **Just Talk to Cursor** 💬
This system is fully **agentic** - you don't need to learn commands or remember syntax. Just tell Cursor what you want in natural language:

**"Create a new project for mobile app redesign"**
→ Cursor automatically creates the project file and helps you fill it out

**"Show me my current workload"**
→ Cursor generates a status report with your active tasks and priorities

**"Add John Smith to my contacts"**
→ Cursor creates a person file and sets up the template

**"Archive my completed tasks"**
→ Cursor moves completed items to the archive automatically

**"Create meeting notes for today's standup"**
→ Cursor creates a meeting notes file with today's date

**"Set up a routine for weekly email processing"**
→ Cursor creates a routine file with template and scheduling info

**"What are my current risks and blockers?"**
→ Cursor syncs todo.md dashboard showing risks section with current blockers

**"Show me recent wins and achievements"**
→ Cursor syncs todo.md dashboard showing wins section with achievements

**"Sync my todo dashboard"**
→ Cursor refreshes todo.md with latest action items, risks, and wins from all context files

## 📋 Natural Language Workflows

### Daily Management
Instead of manual commands, just tell Cursor:
- *"Show me what I should focus on today"*
- *"Add a new task to review the quarterly report"*
- *"Mark the API documentation as completed"*
- *"What's my current status?"*

### Project Management
Simply say:
- *"I need to track a new project called [project name]"*
- *"Update the website redesign project status"*
- *"What projects are currently active?"*
- *"Show me the timeline for [project name]"*

### People Management
Just ask:
- *"Add [person name] to my contacts"*
- *"I had a meeting with Sarah yesterday, update her notes"*
- *"When did I last talk to [person name]?"*
- *"Update my contact dates"*

### Meeting & Context
Tell Cursor:
- *"Create meeting notes for [meeting name]"*
- *"I need to document today's project review"*
- *"Add action items from the client call"*

### Routine Management
Ask Cursor:
- *"Set up a routine for weekly email processing"*
- *"Create a daily routine for slack notifications"*
- *"Add my performance reviews routine to this month's tasks"*
- *"Schedule my weekly planning routine"*

### Dashboard Management
Tell Cursor:
- *"Sync my todo dashboard"*
- *"Refresh my todo list"*
- *"Show me my current risks and blockers"*
- *"What wins should I celebrate this week?"*
- *"Update my dashboard with latest changes"*
- *"Show me aggregated action items"*

## 🧠 Intelligent Features

### **Context Awareness**
Cursor understands the relationships between:
- Tasks and their associated projects
- People and their involvement in projects
- Routines and their scheduling requirements
- Meeting notes and action items
- Deadlines and priorities
- **All consolidated in one unified dashboard**

### **Proactive Suggestions**
Cursor will:
- Suggest updating related files when you make changes
- Recommend archiving completed tasks
- Remind you to update contact information
- Suggest when routines are due based on frequency
- Automatically sync dashboard when context files are updated
- Help maintain consistency across files

### **Smart Automation**
Behind the scenes, Cursor:
- Uses appropriate templates for new files
- Maintains proper file naming conventions
- Updates cross-references automatically
- Keeps metadata consistent
- Tracks routine completion and scheduling
- **Consolidates everything into one unified dashboard automatically**

## 🎯 Getting Started

### First Time Setup
1. **Ask Cursor**: *"Check if my todo system is working properly"*
2. **Request**: *"Show me my current system status"*
3. **Customize**: *"Help me update the example files with my actual projects"*

### Daily Use
1. **Morning**: *"Show me what I should focus on today"*
2. **Throughout the day**: *"Add [task] to my todo list"*
3. **Evening**: *"Archive my completed tasks"*

### Weekly Review
1. **Status check**: *"Generate a weekly status report"*
2. **Maintenance**: *"Update my contact dates"*
3. **Planning**: *"Help me plan next week's priorities"*

## 🔧 Customization

### Tailoring to Your Needs
Tell Cursor what you want:
- *"Modify the project template to include budget tracking"*
- *"Add a new section to the todo list for client work"*
- *"Update the people template with additional fields"*

### Adapting Workflows
Ask Cursor to:
- *"Create a custom template for weekly reviews"*
- *"Set up a recurring task for monthly planning"*
- *"Add emoji categories that match my workflow"*

## 💡 Best Practices

### **Natural Communication**
- Speak to Cursor as you would to a colleague
- Be specific about what you want to achieve
- Don't worry about exact syntax or commands

### **Trust the Automation**
- Let Cursor handle file creation and maintenance
- Focus on content rather than structure
- Ask for help when you need clarification

### **Regular Interaction**
- Check in with Cursor daily for status updates
- Ask for weekly reviews and maintenance
- Use Cursor to spot patterns and suggest improvements

## 🚀 Future Enhancements

This system is designed to evolve with advanced AI capabilities:
- **Predictive task scheduling** based on patterns
- **Automatic priority adjustment** based on deadlines
- **Smart meeting preparation** with relevant context
- **Natural language querying** of your entire system

## 🧠 Cursor Integration

This system is fully optimized for Cursor:
- **Intelligent understanding** of your project structure
- **Proactive automation** based on natural language
- **Context-aware suggestions** for better productivity
- **Seamless maintenance** without manual intervention

---

## 📚 Reference

<details>
<summary>Technical Commands (for reference - Cursor handles these automatically)</summary>

### Manual Commands (if needed)
```bash
# Interactive menu
./todo.sh

# Direct commands
./todo.sh project         # Create new project
./todo.sh person          # Create new person
./todo.sh meeting         # Create meeting notes
./todo.sh routine         # Create new routine
./todo.sh sync            # Sync todo.md dashboard from context files
./todo.sh report          # Generate status report
./todo.sh health          # Check system health
./todo.sh archive         # Archive completed tasks
./todo.sh update-contacts # Update contact dates
```

### Maintenance Commands
```bash
# Search across all files
grep -r "- \[ \]" . --include="*.md" | grep -v ".git"

# File consistency checks
for file in projects/*.md; do
    if ! grep -q "^**Status:**" "$file"; then
        echo "Missing status in $file"
    fi
done

# Status updates
today=$(date +%Y-%m-%d)
sed -i.bak "s/Last updated: .*/Last updated: $today/" projects/*.md
```

### Template Snippets
```markdown
# Quick task addition
- [ ] [Task description] - [Due date]

# Project reference
### Project: [Project Name]
- [ ] [Task related to project]

# Person interaction
### [Date] - [Interaction Type]
- **Topic:** [What was discussed]
- **Outcome:** [Key decisions or next steps]
- **Follow-up:** [Any follow-up needed]
```

</details>

---

*This system grows with you - just tell Cursor what you need, and it handles the rest! Focus on your work, not the mechanics.* 