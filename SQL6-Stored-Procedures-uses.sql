call sp_hello();
call sp_create_country('Amerika');
select * from countries c ;
call sp_create_country('Kolonya Cumhuriyeti');


select * from teams t  ;
call sp_player_insert('Serdar','Dursun','25','1250000','Erkek','850000','1985-05-06','Kocaelispor','Türkiye');
--call sp_player_insert(team_name := 'Galatasaray', p_name := '')

call sp_update_team_value(17, 3350000000);








