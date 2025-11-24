SELECT
players.name as "Oyuncu Adı",
players.surname as "Oyuncu Soyadı",
players.player_value as "Piyasa değeri",
players.salary as "Maaş",
teams.name as "Takım adı"
    FROM players inner join teams on  teams.id = players.team_id;


--  "Oyuncu Adı","Oyuncu Soyadı","Piyasa değeri","Maaş", "Ülke Adı"

select * from players;

SELECT
p.name as "Oyuncu Adı",
p.surname as "Oyuncu Soyadı",
p.player_value as "Oyuncu Değeri",
p.salary as "Oyuncu Maaşı",
c.name as "Ülke adı"
FROM players  p inner join countries c on p.country_id = c.id;


--  "Oyuncu Adı","Oyuncu Soyadı","Piyasa değeri","Maaş", "Ülke Adı", "Takım Adı"

select
p.name as "Oyuncu Adı",
p.surname as "Oyuncu Soyadı",
p.player_value as "Oyuncu Değeri",
p.salary as "Oyuncu Maaşı",
c.name as "Oyuncu Ülkesi",
t.name as "Takım Adı"
from players p
inner join countries c on p.country_id = c.id
inner join teams t on p.team_id = t.id;



-- Takım adı , Branş Adı
select
t.name as "Takım Adı",
b.name as "Branş ADI"
from teams_branches tb
inner join teams t on t.id = tb.team_id
inner join branchs b on b.id = tb.branch_id


-- Takım Adı, Sponsorluk adı, Sponsorluk açıklaması

select
t.name as "Takım Adı",
s.name as "Sponsorluk Adı",
s.description as "Sponsorluk açıklaması"
from teams_sponsorships ts
inner join sponsorships s on  ts.sponsorship_id = s.id
inner join teams  t on t.id = ts.team_id



-- Oyuncu Adı , Takım Adı, Koç Adı , Branş adı, Lig Adı, Pozisyonu, Ülkesi

select * from players where name = 'Edin';


select
concat(p.name,' ', p.surname) as  "Oyunu Tam Adı" ,
t.name as "Takım Adı",
c.name as "Koç Adı",
b.name as "Branş Adı",
l.name as "Lig Adı",
pos.name as "Pozisyon ADI",
cnt.name as "Ülke Adı"
from players p
inner join teams t on p.team_id = t.id
inner join coachs c on c.team_id = t.id
inner join branchs b on b.id = c.branch_id
inner join team_leagues tl on t.id = tl.team_id
inner join leagues l on l.id = tl.league_id
inner join players_positions pp on p.id = pp.player_id
inner join positions pos on pp.position_id = pos.id
inner join countries cnt on p.country_id = cnt.id



-- Takım Adı alanında Galatasaray ile başlayan verileri listeleyiniz.

select
concat(p.name,' ', p.surname) as  "Oyunu Tam Adı" ,
t.name as "Takım Adı",
c.name as "Koç Adı",
b.name as "Branş Adı",
l.name as "Lig Adı",
pos.name as "Pozisyon ADI",
cnt.name as "Ülke Adı"
from players p
inner join teams t on p.team_id = t.id
inner join coachs c on c.team_id = t.id
inner join branchs b on b.id = c.branch_id
inner join team_leagues tl on t.id = tl.team_id
inner join leagues l on l.id = tl.league_id
inner join players_positions pp on p.id = pp.player_id
inner join positions pos on pp.position_id = pos.id
inner join countries cnt on p.country_id = cnt.id
where t.name ilike  'galata%'



-- Sıralama işlemleri
select
concat(p.name,' ', p.surname) as  "Oyuncu Tam Adı" ,
t.name as "Takım Adı",
c.name as "Koç Adı",
b.name as "Branş Adı",
l.name as "Lig Adı",
pos.name as "Pozisyon ADI",
cnt.name as "Ülke Adı"
from players p
inner join teams t on p.team_id = t.id
inner join coachs c on c.team_id = t.id
inner join branchs b on b.id = c.branch_id
inner join team_leagues tl on t.id = tl.team_id
inner join leagues l on l.id = tl.league_id
inner join players_positions pp on p.id = pp.player_id
inner join positions pos on pp.position_id = pos.id
inner join countries cnt on p.country_id = cnt.id
-- Asc artan
-- desc azalan
order by "Oyuncu Tam Adı" desc


-- Türkiye de ki takımları listeleyiniz. Koç ADINA göre de a dan z ye olacak şekilde sıralayınız.
select
concat(p.name,' ', p.surname) as  "Oyuncu Tam Adı" ,
t.name as "Takım Adı",
concat(c.name,' ', c.surname) as "Koç Adı",
b.name as "Branş Adı",
l.name as "Lig Adı",
pos.name as "Pozisyon ADI",
cnt.name as "Ülke Adı"
from players p
inner join teams t on p.team_id = t.id
inner join coachs c on c.team_id = t.id
inner join branchs b on b.id = c.branch_id
inner join team_leagues tl on t.id = tl.team_id
inner join leagues l on l.id = tl.league_id
inner join players_positions pp on p.id = pp.player_id
inner join positions pos on pp.position_id = pos.id
inner join countries cnt on p.country_id = cnt.id
where cnt.name = 'Türkiye'
order by "Koç Adı" ,"Ülke Adı"

-- View : Sorgunun sanal tablo olarak kaydedilmiş halidir.
-- bir tablo gibi davranır ama tablo değildir.
-- İlerlyen zamanlarda veya çalışma zamanında bir sorguyu sürekli olarak kopyalayıp yapıştırmamak için kullanırız.
--  create view isim as

create view vw_player_details as
select
concat(p.name,' ', p.surname) as  "Oyuncu Tam Adı" ,
t.name as "Takım Adı",
concat(c.name,' ', c.surname) as "Koç Adı",
b.name as "Branş Adı",
l.name as "Lig Adı",
pos.name as "Pozisyon ADI",
cnt.name as "Ülke Adı"
from players p
inner join teams t on p.team_id = t.id
inner join coachs c on c.team_id = t.id
inner join branchs b on b.id = c.branch_id
inner join team_leagues tl on t.id = tl.team_id
inner join leagues l on l.id = tl.league_id
inner join players_positions pp on p.id = pp.player_id
inner join positions pos on pp.position_id = pos.id
inner join countries cnt on p.country_id = cnt.id;



select * from vw_player_details where "Branş Adı" ilike '%ut%';






