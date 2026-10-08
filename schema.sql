-- Run this once in Supabase: SQL Editor, New query, paste, Run.
-- Before running, change CHANGE-ME-PASSCODE (appears once, at the bottom) to your team passcode.

create table if not exists public.docs (
  collection text   not null,
  id         text   not null,
  data       jsonb  not null,
  ts         bigint not null default (extract(epoch from now()) * 1000)::bigint,
  primary key (collection, id)
);

create index if not exists docs_collection_ts on public.docs (collection, ts desc);

alter table public.docs enable row level security;

-- Only requests that send the team passcode can read or change anything.
create policy "team passcode" on public.docs
  for all
  to anon
  using      ((current_setting('request.headers', true)::json ->> 'x-team-code') = 'CHANGE-ME-PASSCODE')
  with check ((current_setting('request.headers', true)::json ->> 'x-team-code') = 'CHANGE-ME-PASSCODE');

grant select, insert, update, delete on public.docs to anon;
