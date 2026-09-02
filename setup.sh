#!/bin/bash

# DACA Portfolio Setup Guide
# ==========================

echo "📦 DACA Portfolio - Supabase & GitHub Integration Setup"
echo "=========================================================\n"

# Step 1: Install dependencies
echo "Step 1: Installing dependencies..."
npm install
echo "✅ Dependencies installed\n"

# Step 2: Configure Supabase
echo "Step 2: Configuring Supabase..."
echo "📌 Your Supabase Project ID: grecuvatvbzkgkbudofg"
echo "📌 Dashboard: https://app.supabase.com/projects/grecuvatvbzkgkbudofg\n"

# Step 3: Get API Keys
echo "Step 3: Getting your Supabase API keys..."
echo "Go to: https://app.supabase.com/projects/grecuvatvbzkgkbudofg/settings/api"
echo "sb_publishable_sNp0OwSLdWnkuNSJxj5mdA_EtJH3feq\n"

# Step 4: Update the key
echo "Step 4: Updating supabase/lib/supabaseClient.js with your ANON KEY"
read -p "sb_publishable_sNp0OwSLdWnkuNSJxj5mdA_EtJH3feq " ANON_KEY

if [ -z "$sb_publishable_sNp0OwSLdWnkuNSJxj5mdA_EtJH3feq" ]; then
    echo "❌ No API key provided. Skipping setup."
    echo "You can run this script again with your API key.\n"
else
    # Update the file with the actual key
    sed -i.bak "s/const SUPABASE_ANON_KEY = .*/const SUPABASE_ANON_KEY = \"$sb_publishable_sNp0OwSLdWnkuNSJxj5mdA_EtJH3feq\";/" supabase/lib/supabaseClient.js
    echo "✅ API key configured\n"
    
    # Step 5: Run setup
    echo "Step 5: Running portfolio setup..."
    echo "This will:"
    echo "  • Sync your GitHub profile to Supabase"
    echo "  • Create your portfolio project"
    echo "  • Add Week 0 & Week 1 tasks\n"
    
    read -p "Ready to setup? (y/n): " confirm
    if [ "$confirm" = "y" ]; then
        npm run setup
        echo "\n✅ Setup complete!"
        echo "\n📊 View your portfolio:"
        echo "  Dashboard: https://app.supabase.com/projects/grecuvatvbzkgkbudofg"
        echo "  GitHub: https://github.com/katrinakirse/daca-portfolio"
    else
        echo "Setup cancelled."
    fi
fi

echo "\n📝 To complete setup manually:"
echo "  1. Update SUPABASE_ANON_KEY in supabase/lib/supabaseClient.js"
echo "  2. Run: npm run setup"
