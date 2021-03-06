-- create pspgsql language
drop language if exists plpgsql cascade;
create language plpgsql;

-- create function for adding User and returning id
create or replace function insertUser(_name text)
	returns integer as
	$func$
	begin
		execute 'insert into users (name)' ||
			'values (' || quote_literal(_name) || ')';
		return currval('user_id_seq');
	end;
	$func$
	language 'plpgsql';

-- create function for adding Survey and returning id
create or replace function insertSurvey(_survey text)
	returns integer as
	$func$
	begin
		execute 'insert into surveys (survey) 
		values (' || quote_literal(_survey) || ')';
	return currval('survey_id_seq');
	end;
	$func$
	language 'plpgsql';

-- create function for adding Suggest and returning id
create or replace function insertSuggest(survey_id integer,_suggest text)
	returns integer as
	$func$
	begin
		execute 'insert into suggests (survey_id, suggest,created_at,updated_at)
		values (' || user_id || ',' || quote_literal(_suggest) ||',now(),now())';
	return currval('suggest_id_seq');
	end;
	$func$
	language 'plpgsql';
