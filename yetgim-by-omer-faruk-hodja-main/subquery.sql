-- Maaşı maaş ortalamasından yüksek oyuncular.
-- Tam Ad, maaş

-- Dinamik filtreler uygulamak için kullanılır.
select * from players;

select  avg(salary) from players;

-- Statik filtre

select concat(name,' ',surname) as "Tam Ad" , salary as "Maaş"  from players where salary > 20053409.090909090909;

--- dinamik filtre
select concat(name,' ',surname) as "Tam Ad" , salary as "Maaş"  from players where  salary > (select  avg(salary) from players);


select * from countries order by name;

-- Ülke ismi İ ile başlayan ülkelerin futbolcuları.
select
p.name as "Oyuncu Adı",
p.surname as "Oyuncu soyadı",
c.name as "Ülke"
from players p inner join countries c on p.country_id = c.id
where c.name like 'İ%';


select * from players where players.country_id in (select id from countries where  countries.name like 'İ%');
select id from countries where  countries.name like 'İ%';

select * from teams;
select * from team_leagues;

insert into teams(name,
team_value,
since) values ('Trabzonspor',0.0,'1967-08-02'), ('Kocaelispor',0.0,'1985-04-03'),('Olympique Lyonnais',0.0,'1900-01-03');


-- Herhangi bir ligde olmayan takımların listesi.
select * from teams where id not in (select team_id from team_leagues);

-- Herhangi bir branşı olmayan takımların listesi.
select * from teams where id not in (select team_id from teams_branches);

