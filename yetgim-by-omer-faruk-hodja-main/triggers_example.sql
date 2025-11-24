select * from test_messages;
select * from players where team_id=17;
select * from teams;
insert into test_messages(message) values ('Test Edildi 123.');

insert into players(name, surname, number, player_value, "Gender", salary, birth_date, team_id, country_id) VALUES
('Sinem','Kurşun','85',25000000,'Kadın',90,'1995-05-05',2,1);

update players set player_value = 60000000 where id=15;

select  * from players_positions where player_id = 10;

delete from players where  id=10;