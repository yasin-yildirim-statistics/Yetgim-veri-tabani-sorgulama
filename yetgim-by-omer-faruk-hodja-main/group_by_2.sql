-- Takım Adı : Bayern Munih
-- Toplam sponsorluk geliri : 76m

select * from teams_sponsorships;
select * from sponsorships;
select
t.id as "Takım İd",
t.name as "Takım Adı",
sum(s.value) as "Toplam Sponsorluk geliri"
from teams t
inner join teams_sponsorships ts on t.id = ts.team_id
inner join sponsorships s on s.id = ts.sponsorship_id
group by "Takım İd","Takım Adı";

-- Branş Adı : Futbol
-- Pozisyon : Forvet,
-- Oyuncuların Ortalama maaşı : 25m,
-- Kişi Sayısı : 10


select
b.name as "Branş Adı",
pos.name as "Pozisyon",
avg(p.salary) as "Ortalama maaş",
count(p.id) as "Kişi Sayısı"
from branchs b
inner join  teams_branches tb on b.id = tb.branch_id
inner join  teams t on t.id = tb.team_id
inner join players p on  t.id = p.team_id
inner join players_positions pp on p.id = pp.player_id
inner join positions pos on pp.position_id = pos.id
group by "Branş Adı", "Pozisyon";


select * from players_positions;
select * from players;
select * from positions;



