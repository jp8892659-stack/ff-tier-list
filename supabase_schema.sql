-- FF TIER LIST schema (ใช้เฉพาะกรณียังไม่มีตาราง หรือปรับให้ตรงกับตารางเดิม)
create table if not exists public.applications (
  id uuid primary key default gen_random_uuid(),
  player_name text not null,
  uid text not null,
  region text default 'TH',
  proof_url text,
  status text not null default 'pending' check (status in ('pending','approved','rejected')),
  created_at timestamptz not null default now()
);
create table if not exists public.players (
  id uuid primary key default gen_random_uuid(),
  player_name text not null,
  uid text not null unique,
  tier text not null check (tier in ('HT1','HT2','LT1','LT2','LT3','HT3')),
  updated_at timestamptz not null default now()
);
alter table public.applications enable row level security;
alter table public.players enable row level security;
drop policy if exists "Public can submit applications" on public.applications;
create policy "Public can submit applications" on public.applications for insert to anon, authenticated with check (status = 'pending');
drop policy if exists "Admins can manage applications" on public.applications;
create policy "Admins can manage applications" on public.applications for all to authenticated using (public.is_ff_admin()) with check (public.is_ff_admin());
drop policy if exists "Public can view players" on public.players;
create policy "Public can view players" on public.players for select to anon, authenticated using (true);
drop policy if exists "Admins can manage players" on public.players;
create policy "Admins can manage players" on public.players for all to authenticated using (public.is_ff_admin()) with check (public.is_ff_admin());
