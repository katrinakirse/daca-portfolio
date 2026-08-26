#!/bin/bash
# Quick setup for Supabase database schema

echo "🗄️  Deploying Supabase database schema..."
echo "Project ID: grecuvatvbzkgkbudofg\n"

# Check if Supabase CLI is installed
if ! command -v supabase &> /dev/null; then
    echo "❌ Supabase CLI not found. Installing..."
    npm install -g supabase
fi

# Link to Supabase project
echo "Linking to Supabase project..."
supabase link --project-ref grecuvatvbzkgkbudofg

# Deploy migrations
echo "\nDeploying migrations to Supabase..."
supabase db push

echo "\n✅ Database schema deployed!"
echo "View your tables at: https://app.supabase.com/projects/grecuvatvbzkgkbudofg/editor"