create table
  public.courses (
    id uuid not null default gen_random_uuid (),
    created_at timestamp with time zone not null default now(),
    title text not null,
    description text null,
    tags text[] null,
    subject text not null,
    author text null,
    price double precision null,
    constraint courses_pkey primary key (id)
  ) tablespace pg_default;

  create table
  public.test_series (
    id uuid not null default gen_random_uuid (),
    created_at timestamp with time zone not null default now(),
    title text not null,
    subject text not null,
    tags text[] null,
    url text not null,
    price bigint not null,
    solution_url text null,
    description text null,
    n_questions bigint not null,
    constraint test_series_pkey primary key (id)
  ) tablespace pg_default;

  create table
  public.user_profiles (
    id uuid not null,
    created_at timestamp with time zone not null default now(),
    name text not null,
    email character varying not null,
    phone text null,
    courses uuid[] null,
    picture text null,
    test_series uuid[] null,
    constraint user_profiles_pkey primary key (id),
    constraint user_profiles_id_fkey foreign key (id) references auth.users (id) on update cascade on delete cascade
  ) tablespace pg_default;

  create table
  public.videos (
    id uuid not null default gen_random_uuid (),
    created_at timestamp with time zone not null default now(),
    course_id uuid not null,
    title text not null,
    duration double precision not null,
    url text not null,
    constraint videos_pkey primary key (id),
    constraint videos_course_id_fkey foreign key (course_id) references courses (id)
  ) tablespace pg_default;