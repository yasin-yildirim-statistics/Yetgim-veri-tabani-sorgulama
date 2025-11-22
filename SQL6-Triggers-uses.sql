select * from test_messages;
select * from players where team_id=2;
select * from teams;


insert into test_messages(message) values ('Test Edildi');

insert into players (name,surname,number,player_value,"Gender",salary,birth_date,team_id,country_id) values
('Sinem','Kurşun','85',2500000,'Kadın',90,'1995-05-05',2,1);

update players set player_value = 600000000 where id=15;

delete from players where id = 10;