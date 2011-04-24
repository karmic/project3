--load users
insert into users_view (name,username,password,division,department)
	values ('Catherine 
Buted','catherine','karmic','Administrator','Administrator');
insert into users_view (name,username,password,division,department)
	values ('Teddy Pomer','teddy','pomer','div1','div1');
insert into users_view (name,username,password,division,department)
	values ('Jane Doe','jane','doe','div1','deptA1');
insert into users_view (name,username,password,division,department)
	values ('Bill Gates','bill','gates','div1','deptB1');
insert into users_view (name,username,password,division,department)
	values ('Michael Hartl','michael','hartl','div2','div2');
insert into users_view (name,username,password,division,department)
	values ('John Doe','john','doe','div2','deptA2');
insert into users_view (name,username,password,division,department)
	values ('Steve Jobs','steve','jobs','div2','deptB2');

--load user_suggestion
insert into suggestions(user_id,suggestion,created_at,updated_at)
	values('1','Catherine''s suggestion 1','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');
insert into suggestions(user_id,suggestion,created_at,updated_at)
	values ('2,','Teddy''s suggestion 1','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');
insert into suggestions(user_id,suggestion,created_at,updated_at)
	values ('2','Teddy''s suggestion 2','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');
insert into suggestions(id,user_id,suggestion,created_at,updated_at)
	values ('1','3','Jane''s suggestion 1','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');
insert into suggestions(id,user_id,suggestion,created_at,updated_at)
	values ('2','4','Bill''s suggestion 1','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');
insert into suggestions(id,user_id,suggestion,created_at,updated_at)
	values ('3','5','Michael''s suggestion 1','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');
insert into suggestions(id,user_id,suggestion,created_at,updated_at)
	values ('4','5','Michael''s suggestion 2','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');
sinsert into suggestions(id,user_id,suggestion,created_at,updated_at)
	values ('5','6','John''s suggestion 1','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');
insert into suggestions(id,user_id,suggestion,created_at,updated_at)
	values ('6','6','John''s suggestion 2','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');
insert into suggestions(id,user_id,suggestion,created_at,updated_at)
	values ('7','7','Steve''s suggestion 1','2011-04-19 21:24:56 UTC','2011-04-19 21:24:56 UTC');

