drop schema if exists norm_gen cascade;
create schema norm_gen;
set search_path to norm_gen;
\ir create_norm_gen_tables.sql;
\ir process_schema_pkg.sql
\ir ts_all.sql
\ir build_conditions_pkg.sql
