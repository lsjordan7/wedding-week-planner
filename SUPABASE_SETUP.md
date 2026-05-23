# Supabase Setup Guide

This walks you through enabling cloud sync — every authorized user edits the same shared planner, with changes synced live across devices.

**Time required:** ~5 minutes

---

## 1. Create your Supabase project (free)

1. Go to [supabase.com](https://supabase.com) and sign up if you haven't.
2. Click **New project**.
3. Fill in:
   - **Name:** `wedding-planner` (anything works)
   - **Database password:** generate a strong one — store it somewhere safe, you'll rarely need it but Supabase will ask for it on certain operations
   - **Region:** pick one close to where most users live (e.g., `East US (N. Virginia)` or `West EU (Ireland)`)
   - **Pricing plan:** Free is fine — well within free-tier limits for this app
4. Click **Create new project**. Wait ~2 minutes while it provisions.

## 2. Create the data table

1. In the left sidebar, click **SQL Editor**.
2. Click **+ New query**.
3. Open the file `supabase-schema.sql` from this repo, copy the entire contents, paste into the editor.
4. Click **Run** (bottom-right, or `⌘↵`).
5. You should see green "Success. No rows returned" — that's correct.

## 3. Lock down sign-ups (important)

By default Supabase allows anyone to sign up. We want only the users *you* add.

1. Left sidebar → **Authentication** → **Providers**.
2. Click **Email** to expand it.
3. Toggle **OFF** `Enable Email Signup`.
4. Leave `Enable Email Logins` **ON**.
5. (Optional) Toggle **OFF** `Confirm email` — easier for the small private group; users can sign in immediately after you create them.
6. Click **Save**.

## 4. Add your users

For each person who needs access (you, your husband, the wedding planner, etc.):

1. Left sidebar → **Authentication** → **Users**.
2. Click **Add user** → **Create new user**.
3. Enter their **email** and a **password** (you choose it; share securely).
4. Toggle **Auto Confirm User** **ON**.
5. Click **Create user**.

Each user can change their password later via "Forgot password?" on the sign-in screen.

## 5. Send me the project credentials

1. Left sidebar → gear icon (**Project Settings**, bottom-left) → **API**.
2. Copy these two values and send them to me:

   - **Project URL** — looks like `https://abcdefghijklm.supabase.co`
   - **anon / public key** — long JWT string starting with `eyJ...`

> 🔒 **The anon key is safe to share publicly.** It will be visible in the deployed JS, but Row Level Security (set up in step 2) means only authenticated users can read or write data. The anon key alone grants no access.
>
> Do **NOT** send the `service_role` key — that one is sensitive.

Once you send those two values, I'll wire them into the app, push, and you'll have cloud sync live within a minute.
