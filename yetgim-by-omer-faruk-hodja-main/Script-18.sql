select * from players;
select * from teams;
-- Oyuncu adı , oyuncu soyadı, Oyuncu piyasa değeri , maaş, takım adı

select 
players.name as "Oyuncu Adı",
players.surname as "Oyuncu Soyadı",
players.player_value as "Piyasa değeri",
players.salary as "Maaş",
teams.name as "Takım adı"
from players inner join teams on players.team_id = teams.id ;



select
    t.name as "Takım Adı",
    b.name as "Branş Adı",
   ROUND(avg(p.salary::int),0) as "Maaş Ortalaması"
from teams t
inner join players p on t.id = p.team_id
inner join teams_branches tb on tb.team_id = t.id
inner join branchs b on b.id = tb.branch_id
GROUP BY "Takım Adı","Branş Adı";

