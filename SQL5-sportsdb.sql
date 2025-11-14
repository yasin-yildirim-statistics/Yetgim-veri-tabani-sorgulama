--Takım Adı : Bayern Munih
--Toplam sponsorluk geliri : 76m

select * from teams t;
select * from sponsorships s;
select * from teams_sponsorships ts;

select
t.id as "Takım id",
t.name as "Takım Adı",
s.name as "Sponsorluk Adı",
SUM(s.value) as "Toplam Sponsorluk Geliri"
from teams t 
inner join teams_sponsorships ts on ts.team_id  = t.id
inner join sponsorships s on s.id = ts.sponsorship_id
group by "Takım id", "Takım Adı" , "Sponsorluk Adı"
order by "Takım id";


--branş adı : futbol
--pozisyon : futbol
--oyuncuların ortalama maaşı : 25m
--kişi sayısı : 10

--by me
select
b."name" as "Branş Adı",
po."name" as "Pozisyon Adı",
avg(p.salary ) as "Oyuncuların Ortalama Maaşı",
count(p.id ) as "Kişi Sayısı"
from branchs b 
inner join teams_branches tb on tb.branch_id = b.id 
inner join teams t on t.id = tb.team_id 
inner join players p on p.team_id = t.id 
inner join positions po on po.branch_id = b.id
group by "Branş Adı", "Pozisyon Adı";

--by hodja
select
b."name" as "Branş Adı",
pos."name" as "Pozisyon",
avg(p.salary ) as "Ortalama Maaş",
count(p.id ) as "Kişi Sayısı"
from branchs b 
inner join teams_branches tb on b.id = tb.branch_id
inner join teams t on t.id = tb.team_id 
inner join players p on t.id = p.team_id 
inner join players_positions pp on p.id = pp.player_id
inner join positions pos on pp.position_id  = pos.id
group by "Branş Adı", "Pozisyon";


