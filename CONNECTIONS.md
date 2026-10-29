# Portfolio Data Connections

Week 8 contains a Python sales-analysis pipeline that can connect to Supabase. This repository does not include credentials or raw customer data.

## Configure a local connection

1. Create a local `.env` file beside the Week 8 script.
2. Set `SUPABASE_URL` and `SUPABASE_KEY` using credentials managed in your Supabase project.
3. Keep the `.env` file private. It is excluded by `.gitignore`; do not paste credentials into source files, notebooks, README files, or commits.
4. Run the pipeline using the instructions in [Week 8 - Sales Analytics Pipeline](Week%208%20-%20Sales%20Analytics%20Pipeline/README.md).

Use the least-privileged key available for the intended task. Never expose a service-role key in client-side code or a public repository.
