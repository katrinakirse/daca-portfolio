# DACA Portfolio - Complete Setup Guide

## 🚀 Quick Start (5 minutes)

### Step 1: Deploy Your Database Schema

Your Supabase project ID: **`grecuvatvbzkgkbudofg`**

**Option A: Using Supabase Dashboard (Easiest)**
1. Go to: https://app.supabase.com/projects/grecuvatvbzkgkbudofg
2. Click **SQL Editor** in the sidebar
3. Click **New Query**
4. Copy and paste the contents of `supabase/migrations/20260826_initial_schema.sql`
5. Click **Run**

**Option B: Using Supabase CLI**
```bash
npm install -g supabase
supabase link --project-ref grecuvatvbzkgkbudofg
supabase db push
```

---

### Step 2: Get Your API Keys

1. Go to: https://app.supabase.com/projects/grecuvatvbzkgkbudofg/settings/api
2. Copy your **ANON KEY** (public key)
3. Open `supabase/lib/supabaseClient.js`
4. Replace `your-anon-key-here` with your actual ANON KEY

Example:
```javascript
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";
```

---

### Step 3: Install Dependencies & Run Setup

```bash
# Install Node dependencies
npm install

# Run the setup script
npm run setup
```

This will:
- ✅ Sync your GitHub profile to Supabase
- ✅ Create your portfolio project
- ✅ Add all Week 0 & Week 1 tasks
- ✅ Display your portfolio overview

---

## 📊 What Gets Connected

### GitHub → Supabase Data Flow

```
1. Your GitHub Profile
   ↓
2. Fetched by GitHub API
   ↓
3. Stored in Supabase "users" table
   ↓
4. Linked to portfolio projects & tasks
   ↓
5. Visible on GitHub (this repository)
```

### Supabase Tables Overview

| Table | Purpose | Records |
|-------|---------|----------|
| **users** | GitHub profile data | 1 (you) |
| **portfolio_projects** | Your projects | 1+ |
| **sql_tasks** | SQL exercises & tasks | 20+ |
| **analysis_results** | Data analysis work | (add as you progress) |

---

## 📱 Your Portfolio Structure

```
daca-portfolio (GitHub Repo)
├── README.md (Overview)
├── SUPABASE_PORTFOLIO.md (Detailed docs)
├── supabase/
│   ├── config.toml (Supabase config)
│   ├── migrations/
│   │   └── 20260826_initial_schema.sql (Database schema)
│   └── lib/
│       ├── supabaseClient.js (Connection code)
│       └── setup.js (Setup script)
├── package.json (Dependencies)
├── setup.sh (Setup instructions)
└── deploy-db.sh (Deploy to Supabase)

↓ Connected to ↓

Supabase Project: grecuvatvbzkgkbudofg
├── users table (Your GitHub profile)
├── portfolio_projects table (DACA Portfolio)
├── sql_tasks table (Week 0, 1, 2... tasks)
└── analysis_results table (Your analyses)
```

---

## ✅ Weekly Task Tracking

All tasks are stored in Supabase and visible in:
- 📊 Supabase Dashboard: https://app.supabase.com/projects/grecuvatvbzkgkbudofg
- 💻 This GitHub Repository: https://github.com/katrinakirse/daca-portfolio
- 📝 SUPABASE_PORTFOLIO.md (This repo)

### Week 0: Onboarding ✅ (Completed)
- [x] Database Schema Design
- [x] GitHub Integration Setup
- [x] Supabase Configuration

### Week 1: SQL Basics ⏳ (In Progress)
- [ ] SELECT & WHERE Clauses
- [ ] INNER & LEFT JOINs
- [ ] Aggregate Functions (COUNT, SUM, AVG)
- [ ] GROUP BY & HAVING

### Week 2: SQL Data Cleaning 📋 (Upcoming)
- [ ] Data Validation Queries
- [ ] Handling NULL Values
- [ ] String Manipulation
- [ ] Date/Time Operations

---

## 🔗 Viewing Your Work

### On GitHub
Visit your repository to see all documentation and code:
- **Repository**: https://github.com/katrinakirse/daca-portfolio
- **Schema**: `supabase/migrations/20260826_initial_schema.sql`
- **Setup**: Run `npm run setup` locally

### On Supabase
View your actual data and tables:
- **Dashboard**: https://app.supabase.com/projects/grecuvatvbzkgkbudofg
- **SQL Editor**: Add and run custom queries
- **Data Browser**: View/edit table data directly

### Progression Visibility
Anyone viewing your GitHub repo will see:
1. ✅ Complete database schema
2. ✅ Integration with GitHub profile
3. ✅ Weekly task tracking
4. ✅ Skills demonstrated

---

## 🛠️ Useful Commands

```bash
# Install dependencies
npm install

# Run initial portfolio setup (syncs GitHub + creates tasks)
npm run setup

# Watch mode (auto-restart)
npm run dev

# Manual GitHub sync
npm run sync-github

# Deploy database to Supabase
bash deploy-db.sh
```

---

## 📖 How to Add New Tasks

### Via Supabase Dashboard
1. Go to: https://app.supabase.com/projects/grecuvatvbzkgkbudofg
2. Click **Editor** → **sql_tasks**
3. Click **Insert row**
4. Fill in: task_name, task_description, difficulty_level, etc.

### Via Code (Node.js)
```javascript
import { addSQLTask } from "./supabase/lib/supabaseClient.js";

await addSQLTask(projectId, {
  task_name: "My SQL Challenge",
  task_description: "Description of what I did",
  difficulty_level: "intermediate",
  completed: false,
});
```

---

## ❓ Troubleshooting

### "GitHub user not found"
- Check your GitHub username in `supabase/lib/setup.js`
- Make sure it's spelled correctly

### "Supabase connection failed"
- Verify ANON KEY is correctly set in `supabase/lib/supabaseClient.js`
- Check that your Supabase project is active

### "Tables don't exist"
- Run the SQL migration in Supabase SQL Editor (copy/paste from `supabase/migrations/20260826_initial_schema.sql`)
- Or use: `supabase db push`

### "npm: command not found"
- Install Node.js from https://nodejs.org/
- Restart your terminal

---

## 🎯 What This Portfolio Shows Employers

✅ **Database Design Skills**
- Normalized schema with proper relationships
- UUID keys, indexes, constraints

✅ **SQL Knowledge**
- Creating tables, foreign keys, indexes
- Ready for advanced queries

✅ **GitHub Integration**
- Connecting external APIs to databases
- Syncing real-world data

✅ **Project Management**
- Tracking tasks and progress
- Version control best practices

✅ **Learning Progress**
- Documented weekly growth
- Real projects with measurable tasks

---

## 📞 Next Steps

1. **Complete Step 2**: Get your ANON KEY
2. **Complete Step 3**: Run `npm install && npm run setup`
3. **Verify**: Check Supabase dashboard to see your data
4. **Start Week 1**: Complete SQL tasks and update completion status
5. **Share**: This GitHub link shows employers your work!

---

**Your Portfolio is Ready!** 🎉

- GitHub Repo: https://github.com/katrinakirse/daca-portfolio
- Supabase Project: https://app.supabase.com/projects/grecuvatvbzkgkbudofg
- Project ID: `grecuvatvbzkgkbudofg`