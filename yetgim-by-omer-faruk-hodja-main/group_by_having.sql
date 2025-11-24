

-- Fenerbahçe   3.5m ₺

select * from players;
select * from teams;

-- Bir takımda ki oyuncuların ortalama maaşları
select
    t.name as "Takım Adı",
    b.name as "Branş Adı",
   ROUND(avg(p.salary::int),0) as "Maaş Ortalaması"
from teams t
inner join players p on t.id = p.team_id
inner join teams_branches tb on tb.team_id = t.id
inner join branchs b on b.id = tb.branch_id
GROUP BY "Takım Adı","Branş Adı" order by "Maaş Ortalaması" desc

-- Bir takımda ki oyuncuların ortalama maaşları Filtre olarak sadece Futbol branşında ki takımlar

select
    t.name as "Takım Adı",
    b.name as "Branş Adı",
   ROUND(avg(p.salary::int),0) as "Maaş Ortalaması"
from teams t
inner join players p on t.id = p.team_id
inner join teams_branches tb on tb.team_id = t.id
inner join branchs b on b.id = tb.branch_id
where b.name = 'Futbol'
GROUP BY "Takım Adı","Branş Adı" order by "Maaş Ortalaması" desc


-- Bir takımda ki oyuncuların ortalama maaşları listelenecek ama ortalaması 20 m dan fazla olanlar.

select
    t.name as "Takım Adı",
    b.name as "Branş Adı",
   ROUND(avg(p.salary::int),0) as "Maaş Ortalaması"
from teams t
inner join players p on t.id = p.team_id
inner join teams_branches tb on tb.team_id = t.id
inner join branchs b on b.id = tb.branch_id
GROUP BY "Takım Adı","Branş Adı"
HAVING avg(p.salary)> 20000000
order by "Maaş Ortalaması" desc;

-- Branşa göre Oyuncu ve koç maaş ortalaması
-- Futbol  25m
-- Basketbol 10m

select
b.name as "Branş Adı",
avg(p.salary) as "Oyuncu maaş ortalaması",
avg(c.salary) as "Koç maaş ortalaması"
from branchs b
inner join teams_branches tb on b.id =tb.branch_id
inner join teams t on t.id = tb.team_id
inner join players p on p.team_id = t.id
inner join coachs c on c.branch_id = b.id
group by "Branş Adı"
order by "Oyuncu maaş ortalaması", "Koç maaş ortalaması";


-- Koçlar ve oyuncuların branşlara göre maaş ortalaması baz alınarak listelenmesi gerekir.
-- Filtre1 (AGR): Oyuncu Maaş Ortalamaları 27500000 ile 36250000 arasında olmalıdır.
-- Filtre 2 : Branş Adında metnin herhangi bir yerinde bol kelimesi geçiyormu.


select
b.name as "Branş Adı",
avg(p.salary) as "Oyuncu maaş ortalaması",
avg(c.salary) as "Koç maaş ortalaması"
from branchs b
inner join teams_branches tb on b.id =tb.branch_id
inner join teams t on t.id = tb.team_id
inner join players p on p.team_id = t.id
inner join coachs c on c.branch_id = b.id
where b.name ilike  '%bol%'
group by "Branş Adı"
having avg(p.salary) between 27500000 and 36250000
order by "Oyuncu maaş ortalaması", "Koç maaş ortalaması"


-- view kullanarak grup tablosu oluşturma

create view vw_coach_and_player_group_by_avg_salary as
select
b.name as "Branş Adı",
avg(p.salary) as "Oyuncu maaş ortalaması",
avg(c.salary) as "Koç maaş ortalaması"
from branchs b
inner join teams_branches tb on b.id =tb.branch_id
inner join teams t on t.id = tb.team_id
inner join players p on p.team_id = t.id
inner join coachs c on c.branch_id = b.id
group by "Branş Adı"
order by "Oyuncu maaş ortalaması", "Koç maaş ortalaması";

-- view kullanmadan
select
b.name as "Branş Adı",
avg(p.salary) as "Oyuncu maaş ortalaması",
avg(c.salary) as "Koç maaş ortalaması"
from branchs b
inner join teams_branches tb on b.id =tb.branch_id
inner join teams t on t.id = tb.team_id
inner join players p on p.team_id = t.id
inner join coachs c on c.branch_id = b.id
where b.name ilike  '%bol%'
group by "Branş Adı"
having avg(p.salary) between 27500000 and 36250000
order by "Oyuncu maaş ortalaması", "Koç maaş ortalaması";

-- view kullanarak
select * from  vw_coach_and_player_group_by_avg_salary
where ("Oyuncu maaş ortalaması" between 27500000 and 36250000) and
      "Branş Adı" ilike '%bol%'


select * from teams_sponsorships;
-- Takım Adı : Bayern Munih
-- Toplam sponsorluk geliri : 76m


