# hand pen 🌙

### how to use it:
1. allow camera access
2. **hold the SHIFT key** on your keyboard to start drawing ink (this is the trick to make it look clean without the ink dragging everywhere)
3. let go of shift to move your hand to the next letter
4. hit the spacebar if u mess up and want to clear the screen

feel free to mess around with the colors or the smoothing math.

### sharing recordings (Supabase)
When you stop drawing, the recording is uploaded to Supabase Storage and a **shareable link** is shown. Send that link to anyone to let them watch the video.

**One-time setup in Supabase:**
1. Open your [Supabase project](https://supabase.com/dashboard) → **Storage**.
2. Create a new bucket named **`recordings`** (same as in the app).
3. Set the bucket to **Public** so share links work, or add a policy:
   - **Allow public read**: `bucket_id = 'recordings'` and `SELECT` (or read) for `anon`.
   - **Allow upload**: `bucket_id = 'recordings'` and `INSERT` for `anon` (so the app can upload without auth).

**If you see `403 Unauthorized` / "new row violates row-level security policy":**  
The Storage bucket is blocking uploads. In Supabase → **Storage** → **Policies** for the `recordings` bucket, add a policy that allows **INSERT** for the `anon` role (e.g. policy expression `true` for INSERT, or use the policy builder and enable "Insert" for "anon").

ramadan mubarak! 🤲🏽💻
