-- Kör i Supabase: SQL Editor → New query
create table if not exists public.offertforfragningar (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  namn text not null check (char_length(namn) between 1 and 200),
  telefon text not null check (char_length(telefon) between 3 and 50),
  epost text check (char_length(epost) <= 200),
  jobb text check (char_length(jobb) <= 100),
  meddelande text check (char_length(meddelande) <= 5000)
);
alter table public.offertforfragningar enable row level security;
-- Besökare får bara skicka in, aldrig läsa
create policy "Alla kan skicka förfrågan" on public.offertforfragningar
  for insert to anon with check (true);
