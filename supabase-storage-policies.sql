-- Run this in Supabase Dashboard → SQL Editor
-- Fixes 403 "new row violates row-level security policy" for recordings uploads

-- 1. Ensure the bucket exists and is public (safe to re-run)
INSERT INTO storage.buckets (id, name, public)
VALUES ('recordings', 'recordings', true)
ON CONFLICT (id) DO UPDATE SET public = true;

-- 2. Allow anonymous users to upload (INSERT) into the recordings bucket
DROP POLICY IF EXISTS "Allow anon uploads to recordings" ON storage.objects;
CREATE POLICY "Allow anon uploads to recordings"
ON storage.objects FOR INSERT
TO anon
WITH CHECK (bucket_id = 'recordings');

-- 3. Allow anyone to read (SELECT) from the recordings bucket (for share links)
DROP POLICY IF EXISTS "Allow public read recordings" ON storage.objects;
CREATE POLICY "Allow public read recordings"
ON storage.objects FOR SELECT
TO anon
USING (bucket_id = 'recordings');
