select topla(25,147);

select tam_ad_olustur('ömer','doğan');


-- Koçlar tablosunda tam ad, maaş, doğum tarihi

select tam_ad_olustur(name,surname) as "Tam Ad", salary, birth_date as "Doğum Tarihi"   from coachs;


select tam_ad_olustur(name,surname) as "Tam Ad", salary, age_calculate(birth_date) as "Yaşı"   from coachs;


select not_durumu(-25);


select * from maas_araligi_oyuncular(2500000,5500000);


select faktoriyel(-5);

select  * from teams order by id;

select takim_ortalama_yas(53);
