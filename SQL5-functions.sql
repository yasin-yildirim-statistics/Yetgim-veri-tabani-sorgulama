--metinsel ifade fonksiyonları

--length : metnin uzunluğunu verir.
select length('galatasaray');

--takım adı, ad uzunluğu
select name as "Takım Adı", length(name) as "Karakter Uzunluğu" from teams;

--upper : metnin her harfini büyük harfe çevirir.
select UPPER('merhabalar');

--ÜLKELER büyük harf
select UPPER(name) as "Ülke Adı" from countries;

--lower : metnin her harfini küçük harfe çevirir.
select LOWER(name) as "Ülke Adı" from countries;

--initcap : metinde ki her kelimenin ilk harfini büyük yapar.
select initcap('buraya bir şeyler yazıyorum bakalım ne olacak');

--left : metnin sol tarafından karakter alır.
--right : metnin sağ tarafından karakter alır.
select left('selamlar',4);
select right('selamlar',5);

--replace : metnin içerisinde herhangi bir yeri değitirmek için kullanılır.
select replace ('Merhabalar en sevdiğim programlama dili python programlama dilir.','python','C#')
select LOWER(replace ('Merhabalar en sevdiğim programlama dili python programlama dilir.','python','C#'));

--repeat : verilen metnin kaç kere tekrar edilmesi isteniyorsa o kadar tekrar eder.
select repeat('Buse ',3);

--tarih fonskiyonları
select now();  --saat + tarih
select current_date;
select current_time;

--gün ay yıl verilerini alma
select extract(year from now());
select extract(month from now());
select extract(day from now());
select extract(hour from now());

select extract(year from '1987-05-12'::date);
select extract(month from '1987-05-12'::date);
select extract(day from '1987-05-12'::date);

select date_part('year','1987-05-12'::date);

select name, surname, date_part('year',birth_date) as "Doğum Yılı", date_part('year',now()) - date_part('year',birth_date) as "Yaş" from players;

select name, surname, date_part('year',birth_date) as "Doğum Yılı", date_part('year',age(birth_date)) as "Yaş" from players;
--eksik
select concat(name,' ',surname) as "Tam Ad", date_part('year',birth_date) as "Doğum Yılı", date_part('year',age('2015.11.14',birth_date)) as "Yaş" from players order by "Yaş" from players."Yaş" ;

--zaman ekleme ve çıkarma
--2 gün ekleme
select now() + interval '2 days';
--2 saat çıkarma
select now() - interval '2 hours';

--matematiksel fonksiyonlar
--abs : mutaklak değer absolute
select abs(-2568);

--sqrt : kara kök
select sqrt(16);

--pow/power : üs alma işlemini yapar
select power(2,3);
select power(27,0.333333333333333);
select 10 %3;
select mod(10,3);

--random sayı üretme
select random();
select random(150.0,350.0);

--trigonometri
select sin(0);
select tan(1);	

--tip dönüşümü
select cast('123' as integer);
select cast('123' as text);
select cast('a' as integer);
select ascii('B');

select '123':: integer;
select 123 :: text;
select 'z' :: INTEGER;










