--maaşı maaş ortalamasından yüksek oyuncular
--tam adı ve maaş ekran çıktısı

--dinamik filtreler uygulamak için kullanılır.
select * from players;

select avg(salary) from players;

--statik filtre
select concat(name,' ',surname) as "Tam Ad", salary as "Maaş"
from players where salary > 20053409.090909090909

--dinamik (subquery) filtre
select concat(name,' ',surname) as "Tam Ad", salary as "Maaş" from players where salary > (select AVG(salary) from players);

select * from countries order by "name";

--ülke ismi İ ile başlayan ülkelerin futbolcuları

select 
p."name" as "Oyuncu Adı",
p.surname as "Oyuncu Soyadı",
c."name" as "Oyuncu Ülkesi"
from players p 
inner join countries c on c.id = p.country_id
where c."name" like 'İ%';

--select * from countries where "name" ilike 'i%';

select * from players where players.country_id in (select id from countries where countries."name" like 'İ%');

select id from countries where countries."name" like 'İ%';


select* from teams t;
select * from team_leagues tl;


insert into teams("name",team_value,since) values ('Trabzonspor',0.0,'1967-08-02'), ('Kocaelispor',0.0,'1985-04-03'),('Olympique Lyonnais',0.0,'1900-01-03');


--herhangi bir ligde olmayan takımların listesi.
select * from teams where id not in (select team_id  from team_leagues tl);


--herhangi bir branşı olmayan takımların listesi

select * from teams_branches tb;

select * from teams where id not in (select team_id from teams_branches tb );
--or
select * from teams t where not exists (select team_id from teams_branches tb where tb.team_id = t.id);












