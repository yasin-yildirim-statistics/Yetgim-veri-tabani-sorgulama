CALL sp_hello();
call sp_create_country('Kolonya Cumhuriyeti');
select * from countries;
select * from teams;

call sp_player_insert('Serdar','Dursun','25',1250000,'Erkek',850000,'1985-05-06','Kocaelispor','Türkiyes');
--call sp_player_insert(team_name := 'Galatasaray', p_name := '')

select * from players;


call sp_update_team_value(1000,335000000);


