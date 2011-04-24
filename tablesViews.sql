-- tablesViews.sql

-- create sequences
drop sequence if exists user_id_seq cascade;
create sequence user_id_seq;
--drop sequence if exists suggestion_id_seq cascade;
--create sequence suggestion_id_seq;
drop sequence if exists suggest_id_seq cascade;
create sequence suggest_id_seq;
drop sequence if exists rate_id_seq cascade;
create sequence rate_id_seq;
drop sequence if exists survey_id_seq cascade;
create sequence survey_id_seq;

-- create tables
drop table if exists users cascade;
create table users(
	id integer not null primary key default nextval('user_id_seq'),
	name text,
	username text unique,
	password text,
--	division text,
--	department text,
	enc_pass text,
	salt text
);
--drop table if exists suggestions cascade;
--create table suggestions(
--	id integer not null primary key default nextval('suggestion_id_seq'),
--	user_id integer references users(id),
--	suggestion text,
--	created_at timestamp,
--	updated_at timestamp
--);

drop table if exists suggests cascade;
create table suggests(
	id integer not null primary key default nextval('suggest_id_seq'),
	survey_id integer references surveys(id),
	suggest text
);
drop table if exists rates cascade;
create table rates(
	id integer not null primary key default nextval('rate_id_seq'),
	suggest_id integer references suggests(id),
	rate text
);
drop table if exists surveys cascade;
create table surveys(
	id integer not null primary key default nextval('survey_id_seq'),
	survey text,
	created_at timestamp,
	updated_at timestamp
);
-- create view

--drop view if exists user_suggestion_view cascade;
--create view user_suggestion_view as
--	select users.id as userid,users.name,users.department,users.division,suggestions.id as 
--	suggestionid,suggestions.suggestion,suggestions.created_at,suggestions.updated_at from 
--	users join suggestions on users.id=suggestions.user_id;

drop view if exists survey_suggest_rate_view cascade;
create view survey_suggest_view as
	select surveys.id as surveyid,surveys.survey,surveys.created_at,surveys.updated_at,suggests.id as 
	suggestid,suggests.suggest from surveys join suggests on 
	surveys.id=suggests.survey_id;
drop view if exists suggest_rate_view cascade;
create view suggest_rate_view as
	select suggests.id as suggestid,suggests.suggest,rates.id as rateid,
	rates.rate from suggests join rates on suggests.id=rates.suggest_id;
