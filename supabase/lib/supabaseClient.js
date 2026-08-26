const SUPABASE_URL = "https://grecuvatvbzkgkbudofg.supabase.co";
const SUPABASE_ANON_KEY = "your-anon-key-here"; // Replace with your actual key from Supabase

// Initialize Supabase client
import { createClient } from "@supabase/supabase-js";

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Function to fetch GitHub user data
export async function fetchGitHubUser(username) {
  try {
    const response = await fetch(`https://api.github.com/users/${username}`);
    if (!response.ok) throw new Error("GitHub user not found");

    const userData = await response.json();
    return {
      github_username: userData.login,
      github_id: userData.id,
      avatar_url: userData.avatar_url,
      bio: userData.bio || "",
      email: userData.email || "",
      location: userData.location || "",
    };
  } catch (error) {
    console.error("Error fetching GitHub user:", error);
    throw error;
  }
}

// Function to sync GitHub user to Supabase
export async function syncGitHubUserToSupabase(username) {
  try {
    const gitHubData = await fetchGitHubUser(username);

    const { data, error } = await supabase
      .from("users")
      .upsert(gitHubData, { onConflict: "github_username" })
      .select();

    if (error) throw error;
    console.log("GitHub user synced to Supabase:", data);
    return data[0];
  } catch (error) {
    console.error("Error syncing GitHub user:", error);
    throw error;
  }
}

// Function to create a portfolio project
export async function createPortfolioProject(userId, projectData) {
  try {
    const { data, error } = await supabase
      .from("portfolio_projects")
      .insert([
        {
          user_id: userId,
          title: projectData.title,
          description: projectData.description,
          github_url: projectData.github_url,
          status: projectData.status || "in_progress",
          start_date: projectData.start_date,
          end_date: projectData.end_date,
        },
      ])
      .select();

    if (error) throw error;
    console.log("Portfolio project created:", data);
    return data[0];
  } catch (error) {
    console.error("Error creating portfolio project:", error);
    throw error;
  }
}

// Function to add SQL task
export async function addSQLTask(projectId, taskData) {
  try {
    const { data, error } = await supabase
      .from("sql_tasks")
      .insert([
        {
          project_id: projectId,
          task_name: taskData.task_name,
          task_description: taskData.task_description,
          difficulty_level: taskData.difficulty_level,
          completed: taskData.completed || false,
          solution_notes: taskData.solution_notes || "",
        },
      ])
      .select();

    if (error) throw error;
    console.log("SQL task added:", data);
    return data[0];
  } catch (error) {
    console.error("Error adding SQL task:", error);
    throw error;
  }
}

// Function to add analysis result
export async function addAnalysisResult(projectId, analysisData) {
  try {
    const { data, error } = await supabase
      .from("analysis_results")
      .insert([
        {
          project_id: projectId,
          analysis_title: analysisData.analysis_title,
          analysis_description: analysisData.analysis_description,
          key_findings: analysisData.key_findings || [],
          data_source: analysisData.data_source,
        },
      ])
      .select();

    if (error) throw error;
    console.log("Analysis result added:", data);
    return data[0];
  } catch (error) {
    console.error("Error adding analysis result:", error);
    throw error;
  }
}

// Function to fetch user profile with all projects
export async function getUserProfile(userId) {
  try {
    const { data: user, error: userError } = await supabase
      .from("users")
      .select(
        `
        id,
        github_username,
        avatar_url,
        bio,
        email,
        location,
        portfolio_projects (
          id,
          title,
          description,
          github_url,
          status,
          start_date,
          end_date,
          sql_tasks (
            id,
            task_name,
            difficulty_level,
            completed
          ),
          analysis_results (
            id,
            analysis_title,
            key_findings
          )
        )
      `
      )
      .eq("id", userId)
      .single();

    if (userError) throw userError;
    console.log("User profile fetched:", user);
    return user;
  } catch (error) {
    console.error("Error fetching user profile:", error);
    throw error;
  }
}

// Function to get all tasks for a project
export async function getProjectTasks(projectId) {
  try {
    const { data, error } = await supabase
      .from("sql_tasks")
      .select("*")
      .eq("project_id", projectId)
      .order("created_at", { ascending: false });

    if (error) throw error;
    return data;
  } catch (error) {
    console.error("Error fetching project tasks:", error);
    throw error;
  }
}

// Function to update task completion status
export async function updateTaskStatus(taskId, completed) {
  try {
    const { data, error } = await supabase
      .from("sql_tasks")
      .update({
        completed: completed,
        completed_at: completed ? new Date().toISOString() : null,
      })
      .eq("id", taskId)
      .select();

    if (error) throw error;
    console.log("Task status updated:", data);
    return data[0];
  } catch (error) {
    console.error("Error updating task status:", error);
    throw error;
  }
}

export default supabase;