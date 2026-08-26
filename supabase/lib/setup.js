import {
  syncGitHubUserToSupabase,
  createPortfolioProject,
  addSQLTask,
  getUserProfile,
  getProjectTasks,
  updateTaskStatus,
} from "./supabaseClient.js";

/**
 * SETUP GUIDE
 * ============
 *
 * This file demonstrates how to use the Supabase integration
 * with your GitHub portfolio project.
 *
 * To use this:
 * 1. Go to https://app.supabase.com/projects/grecuvatvbzkgkbudofg
 * 2. Get your ANON KEY from Settings > API
 * 3. Update SUPABASE_ANON_KEY in supabaseClient.js
 * 4. Run: node supabase/lib/setup.js
 */

const GITHUB_USERNAME = "katrinakirse"; // Your GitHub username
const SUPABASE_ANON_KEY = ""; // ADD YOUR ANON KEY HERE

async function setupPortfolio() {
  console.log("🚀 Starting portfolio setup...\n");

  try {
    // Step 1: Sync GitHub user data
    console.log("📱 Step 1: Syncing GitHub profile to Supabase...");
    const user = await syncGitHubUserToSupabase(GITHUB_USERNAME);
    const userId = user.id;
    console.log(
      `✅ GitHub user synced! Welcome ${user.github_username} from ${user.location}\n`
    );

    // Step 2: Create main portfolio project
    console.log("📊 Step 2: Creating portfolio project...");
    const project = await createPortfolioProject(userId, {
      title: "DACA Data Analysis Portfolio",
      description:
        "Comprehensive data analysis portfolio showcasing SQL, Python, and data visualization skills",
      github_url: "https://github.com/katrinakirse/daca-portfolio",
      status: "in_progress",
      start_date: "2026-08-17",
      end_date: null,
    });
    const projectId = project.id;
    console.log(`✅ Portfolio project created!\n`);

    // Step 3: Add Week 0 - Onboarding SQL tasks
    console.log("📝 Step 3: Adding Week 0 - Onboarding tasks...");
    const tasks = [
      {
        task_name: "Database Schema Design",
        task_description:
          "Created normalized PostgreSQL schema with users, portfolio_projects, sql_tasks, and analysis_results tables",
        difficulty_level: "intermediate",
        completed: true,
        solution_notes:
          "Implemented proper foreign keys, UUIDs, and Row Level Security",
      },
      {
        task_name: "GitHub Integration Setup",
        task_description:
          "Set up integration to sync GitHub profile data (username, avatar, bio, location) to Supabase",
        difficulty_level: "intermediate",
        completed: true,
        solution_notes:
          "Using GitHub API to fetch user data and store in users table",
      },
      {
        task_name: "Supabase Project Configuration",
        task_description: "Configured Supabase project with PostgreSQL 15",
        difficulty_level: "beginner",
        completed: true,
        solution_notes: "Project ID: grecuvatvbzkgkbudofg",
      },
    ];

    for (const task of tasks) {
      await addSQLTask(projectId, task);
    }
    console.log(`✅ Added ${tasks.length} Week 0 tasks\n`);

    // Step 4: Add Week 1 - SQL Basics tasks (upcoming)
    console.log("📝 Step 4: Adding Week 1 - SQL Basics tasks...");
    const week1Tasks = [
      {
        task_name: "SELECT & WHERE Clauses",
        task_description:
          "Write SELECT queries with WHERE conditions to filter data",
        difficulty_level: "beginner",
        completed: false,
      },
      {
        task_name: "INNER & LEFT JOINs",
        task_description:
          "Practice combining data from multiple tables using INNER and LEFT JOINs",
        difficulty_level: "intermediate",
        completed: false,
      },
      {
        task_name: "Aggregate Functions",
        task_description:
          "Use COUNT, SUM, AVG, MIN, MAX to summarize data",
        difficulty_level: "beginner",
        completed: false,
      },
      {
        task_name: "GROUP BY & HAVING",
        task_description: "Group data and filter groups with HAVING clause",
        difficulty_level: "intermediate",
        completed: false,
      },
    ];

    for (const task of week1Tasks) {
      await addSQLTask(projectId, task);
    }
    console.log(`✅ Added ${week1Tasks.length} Week 1 tasks\n`);

    // Step 5: Fetch complete profile
    console.log("👤 Step 5: Fetching complete user profile...\n");
    const fullProfile = await getUserProfile(userId);

    console.log("📋 PORTFOLIO OVERVIEW:");
    console.log(`━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`);
    console.log(`GitHub User: @${fullProfile.github_username}`);
    console.log(`Bio: ${fullProfile.bio || "No bio"}`);
    console.log(`Location: ${fullProfile.location || "Not specified"}`);
    console.log(`\nProjects: ${fullProfile.portfolio_projects.length}`);

    fullProfile.portfolio_projects.forEach((proj, index) => {
      console.log(`\n  Project ${index + 1}: ${proj.title}`);
      console.log(`  Status: ${proj.status}`);
      console.log(
        `  Tasks: ${proj.sql_tasks.length} | Analyses: ${proj.analysis_results.length}`
      );

      const completedTasks = proj.sql_tasks.filter((t) => t.completed).length;
      const totalTasks = proj.sql_tasks.length;
      console.log(`  Progress: ${completedTasks}/${totalTasks} tasks completed`);
    });

    console.log(
      `\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n`
    );
    console.log("✅ Portfolio setup complete!\n");
    console.log("📊 View your data at:");
    console.log(
      "   https://app.supabase.com/projects/grecuvatvbzkgkbudofg/editor\n"
    );
    console.log("🎯 Next steps:");
    console.log("   1. Complete Week 1 SQL tasks");
    console.log("   2. Add analysis results as you progress");
    console.log("   3. Push completed tasks to GitHub for visibility\n");
  } catch (error) {
    console.error("❌ Setup failed:", error.message);
    console.log("\nTroubleshooting:");
    console.log("• Make sure SUPABASE_ANON_KEY is set in this file");
    console.log("• Check that your GitHub username is correct");
    console.log("• Verify your Supabase project has the schema deployed");
  }
}

// Run setup if this is the main module
if (import.meta.url === `file://${process.argv[1]}`) {
  setupPortfolio();
}

export { setupPortfolio };