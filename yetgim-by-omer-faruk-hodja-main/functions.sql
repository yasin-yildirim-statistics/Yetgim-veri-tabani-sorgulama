-- Metinsel ifade fonksiyonları.

-- LENGTH : Metnin uzuznluğunu verir.
select  length('Galatasaray');

-- Takım adı, Ad uzunluğu
select name as "Takım Adı" , length(name)  as "Karakter uzunluğu"  from teams;

-- UPPER : Metnin her harfini büyük harfe çevirir.
select  upper('merhabalar');
select UPPER(name) as "Ülke Adı" from countries;

-- lower : Metnin her harfini küçük harfe çevirir.
select  lower(name) as "Ülke adı" from countries;

-- initcap : Metinde ki her kelimenin ilk harfini büyük yapar.
select initcap('gözyaşını sildiğin mendilin olayım.');
select INITCAP('gözyaşını sildiğin mendilin olayım.');


-- LEFT : Metnin sol tarafından karakter alır.
--  RIGHT : Metnin sağtarafından karakter alır.

select  left('selamlar',4);
select  "right"('selamlar',4);

-- Replace: Metnin içerisinde herhangi bir yeri değiştirmek için kullanılır.
select replace('Merhablar En Sevdiğim Programlama dili Python programlama dilidir.','Python','C#');

select LOWER(replace('Merhablar En Sevdiğim Programlama dili Python programlama dilidir.','Python','C#'));


-- REPEAT : Verilen metnin kaç kere tekrar edilmesi isteniyorsa o kadar tekrar eder.
select  repeat('Buse ',3);


-- Tarih fonksiyonları

select  now() ; -- SAAT + TARİH
SELECT  CURRENT_DATE; -- TARİH
SELECT  CURRENT_TIME -- SAAT

-- Gün Ay Yıl verileri alma

select extract(year  from  now());
select extract(month  from  now());
select extract(day  from  now());

select extract(year  from  '1987-05-12'::date);
select extract(month  from  '1987-05-12'::date);
select extract(day  from  '1987-05-12'::date);


select date_part('year', '1987-05-12'::date);


select name, surname, date_part('YEAR',birth_date) as "Doğum Yılı", (date_part('year',now()) - date_part('YEAR',birth_date)) as "Yaş" from players;



select concat(name,' ',surname) as "Tam Ad", date_part('YEAR',birth_date) as "Doğum Yılı",date_part('year',age( '2015-11-14',birth_date)) as "Yaş" from players order by "Yaş";

-- Zaman ekleme ve çıkarma

-- 2 gün ekleme
select now() + INTERVAL  '2 days';
-- 2 saat çıkarma
select now() - INTERVAL '2 hours';

-- Matematiksel fonksiyonlar

-- abs : mutlak değer
select abs(-2568);


-- sqrt : kare kök alır
select sqrt(16);

-- pow : üs alma işlemi
select  pow(2,3);
select  pow(27,0.3333333333333333)
select 10 %3 ;
select mod(10,3);

-- RANDOM SAYI ÜRETME
SELECT random();

select random(150.0,350.0);


select  sin(0);
select tan(1);

-- tip dönüşümü
select  cast('123' as INTEGER);
SELECT CAST(123 AS text);
select cast('A' as integer);
select ascii('B');


select '123':: INTEGER;
SELECT  123 :: text;
select 'z' :: INTEGER;




