# Agentic Todo System 🤖

A strategic daily focus system that intelligently curates 3-5 priorities from your initiatives, people, routines, customers, and scratch notes. Built to work seamlessly with AI agents like Cursor.

## 🎯 How It Works

**Source-first, focus-driven approach:**
- **Work happens in structured files** (`knowledge/initiatives/`, `people/`, `routines/`, `customers/`, `scratch/`)
- **AI generates your daily focus** - 3-5 strategic priorities with clear reasoning
- **Just talk to Cursor** - "What should I focus on today?" then "adjust my focus"
- **Progress preserved automatically** - tick boxes freely, AI updates source files when refreshing

## 📁 File Structure

```
todo-2000/
├── todo.md                 # 🎯 Daily strategic focus (private - see example below)
├── .cursorrules            # 🧠 AI automation rules
├── .cursor/utils.sh        # 🔧 Date/time utilities
└── knowledge/
    ├── initiatives/        # 🚀 Focused work streams
    │   ├── _template.md
    │   ├── mobile-app-redesign.md
    │   └── website-refresh.md
    ├── people/             # 👥 Team development
    │   ├── _template.md
    │   ├── sarah-johnson.md
    │   └── mike-chen.md
    ├── routines/           # 🔄 Recurring activities
    │   ├── _template.md
    │   └── email-processing.md
    ├── customers/          # 🏢 Relationship management
    │   ├── _template.md
    │   └── acme-corp.md
    └── scratch/            # 📝 Quick capture (create as needed)
        ├── _template.md
        ├── general.md
        └── 2025-01.md
```

## 📋 Task Format

**All tasks across all files follow this consistent format:**
- **Your tasks**: `- [ ] [Task description]` or `- [ ] [Task description] (Due: YYYY-MM-DD)`
- **Delegated tasks**: `- [>] [Task description] (Delegated to: [Name], Due: YYYY-MM-DD)`
- **Waiting tasks**: `- [?] [Task description] (Waiting for: [What/Who])`
- **Completed tasks**: Mark with `[x]` instead of `[ ]`
- **Subtasks**: Use additional indentation below main task

## 📋 Example AI-Generated Focus

Here's what your `todo.md` looks like when AI generates your strategic daily focus:

```markdown
# Today's Focus 🎯

*Generated: 2025-01-15*

## Your Strategic Priorities for Today

- [ ] Review Sarah's technical presentation before 2 PM meeting (Due: 2025-01-15)
  *From: sarah-johnson.md | Why: Time-sensitive, supports her promotion goal | Context: Leadership review meeting scheduled, she's nervous and needs your feedback*

- [ ] Finalize API documentation outline (Due: 2025-01-16)
  *From: website-refresh.md | Why: Team blocked without specs | Context: Your input needed before Mike can start implementation*

- [ ] Email Processing (Monday routine)
  *From: email-processing.md | Why: Monday routine, foundation for other work | Context: Inbox at 47 messages, includes client responses*

- [ ] Follow up on Acme Corp contract renewal (Due: 2025-01-18)
  *From: acme-corp.md | Why: Contract expires next week, at-risk status | Context: Need to address their pricing concerns before renewal deadline*

## Check on Your Reports

- [>] Complete user interview analysis for mobile app redesign (Delegated to: Sarah, Due: 2025-01-15)
  *From: mobile-app-redesign.md | Why: Due today | Context: 5 interviews completed, check if synthesis is ready for team meeting*

- [>] Update customer onboarding documentation (Delegated to: Mike, Due: 2025-01-14) 
  *From: big-client.md | Why: Overdue by 1 day | Context: New client starts Monday, check progress and offer help*

---
*This focus is AI-generated from your source files. Say "adjust my focus" to negotiate these priorities.*
```

**Key Features:**
- **3-5 strategic priorities** intelligently selected for your own work
- **Separate delegation tracking** - check on reports with due/overdue delegated tasks  
- **Clear reasoning** for each item: source file, why chosen, and context
- **Management-friendly** - distinguishes your work from team oversight
- **Negotiable** - adjust through natural conversation with AI

## 🎯 Getting Started

### First Time Setup
1. **Generate your first focus**: *"What should I focus on today?"*
2. **Copy templates**: Create files from `knowledge/*//_template.md` as needed
3. **Start simple**: Don't try to build everything at once

### Daily Use
1. **Morning**: *"What should I focus on today?"* (AI generates intelligent priorities)
2. **Throughout the day**: Tick off completed tasks as you go
3. **Refresh when needed**: *"Refresh my focus"* (AI preserves completed work and generates new priorities)

### Common Commands
Just tell Cursor what you need in natural language:
- *"Update [initiative/person/customer] status"*
- *"Add a task for [person/customer]"*
- *"Create a new [initiative/routine/scratch] file"*
- *"Help me process my scratch items"*
- *"Show me current risks and blockers"*

---

## 📚 Reference

<details>
<summary>Template Snippets & Commands</summary>

### Task Examples
```markdown
# Task types
- [ ] [Your task] (Due: 2025-01-20)
- [ ] [Your task without due date]
- [>] [Delegated task] (Delegated to: [Name], Due: 2025-01-15)
- [?] [Task waiting for input] (Waiting for: [What/Who])

# Task with subtasks
- [ ] Main task description (Due: 2025-01-25)
  - [ ] Subtask 1
  - [ ] Subtask 2
```

### Scratch File Strategies
- **Single file**: `general.md` - One universal capture space
- **Monthly files**: `2025-01.md`, `2025-02.md` - Rolling monthly capture
- **By context**: `work-persona.md`, `personal.md` - Separate contexts
- **By project**: `mobile-app.md`, `website.md` - Project-specific capture

### Common Cursor Commands
```
"What should I focus on today?"       # Generate daily focus
"Adjust my focus"                     # Negotiate priorities
"Refresh my focus"                    # Update after completing tasks
"Create a new initiative for X"       # Copy template and fill out
"Add a person file for Y"             # Copy people template
"Show me my current status"           # Sync dashboard
"Help me process my scratch items"    # Organize capture files
```

</details>

---
