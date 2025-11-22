--iki tane sayıyı toplayan fonksiyon yazınız.
select topla(15,30);
--ömer,doğan = 'ÖMER DOĞAN'
select tam_ad_olustur('omer','dogan');

--koçlar tablosunda tam_ad, maaş, doğum tarihi

select upper(concat(name,' ',surname)) as "Tam Ad", salary as "Maaş", birth_date as "Doğum Tarihi" from coachs;

select tam_ad_olustur(name,surname) as "Tam Ad", salary as "Maaş", birth_date as "Doğum Tarihi", age(birth_date) as "Yaşı" from coachs;

select tam_ad_olustur(name,surname) as "Tam Ad", salary as "Maaş", birth_date as "Doğum Tarihi", yas_hesapla(birth_date) as "Yaşı" from coachs;

select tam_ad_olustur(name,surname) as "Tam Ad", salary as "Maaş", birth_date as "Doğum Tarihi", age_calculate(birth_date) as "Yaşı" from coachs;

select not_durumu(-15);

select maas_araligindaki_oyuncular(2500000, 5500000);