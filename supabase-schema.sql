-- Wedding Planner — Supabase schema
-- Run this once in your Supabase project's SQL Editor.

-- Singleton table: one row holds the shared planner data.
create table if not exists public.planner_state (
  id int primary key default 1,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id),
  constraint planner_state_singleton check (id = 1)
);

-- Seed the singleton row.
insert into public.planner_state (id, data) values (1, '{}'::jsonb)
  on conflict (id) do nothing;

-- Enable Row Level Security.
alter table public.planner_state enable row level security;

-- Anyone authenticated can read and update the shared row.
drop policy if exists "auth read shared planner" on public.planner_state;
create policy "auth read shared planner"
  on public.planner_state for select
  to authenticated using (true);

drop policy if exists "auth write shared planner" on public.planner_state;
create policy "auth write shared planner"
  on public.planner_state for update
  to authenticated using (true) with check (true);

-- Trigger: stamp updated_at and updated_by on every write.
create or replace function public.set_planner_updated_metadata()
returns trigger language plpgsql security definer as $$
begin
  new.updated_at := now();
  new.updated_by := auth.uid();
  return new;
end;
$$;

drop trigger if exists trg_planner_state_updated on public.planner_state;
create trigger trg_planner_state_updated
  before update on public.planner_state
  for each row execute function public.set_planner_updated_metadata();

-- Enable realtime broadcasts on this table so connected clients see live updates.
alter publication supabase_realtime add table public.planner_state;
