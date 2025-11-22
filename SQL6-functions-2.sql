--bir fonksiyon yazılırken saf sql sorgusu var ise fonksiyon dili sql olur.
--bir fonksiyon yazılırken if, else, loop, exception vs gibi algoritmik yapılar var ise burada dil olarak plpsql kullanılır.


--create or replace function fonksiyon_ismi('parametre')
--returns veri_tipi
--language sql / plpqsql
--as $$
--fonksiyonun işlevi.
--$$

--iki tane sayıyı toplayan fonksiyon yazınız.

--f(x) = 2x +5;
--f(2) = 9
--f(x,y) = 3x + 2y;
--f(5,6) = 3.5 + 2.6 = 27


create or replace function topla(a INTEGER, b INTEGER)
returns INTEGER
language sql
as 
$$
	select a + b
$$;

--ömer,doğan = 'ÖMER DOĞAN'

create or replace function tam_ad_oluştur(ad varchar, soyad varchar)
returns varchar
language sql
as
$$
select upper(concat(ad,' ',soyad));
$$

--yaş hesaplama
create or replace function yas_hesapla(dogum_tarihi date)
returns INTEGER
language sql
as
$$
select date_part('year', age(dogum_tarihi))
$$

--plpgsql yaş hesaplama
create or replace function age_calculate(dogum_tarihi date)
returns integer
language plpgsql
as $$
declare
	--değişkenler
	yas integer;

begin
	--fonksiyon iş yükleri
	yas:= date_part('year', age(dogum_tarihi));
	return yas;
end;
$$;

--90 üstü çok iyi
--80 üstü iyi
--70 üstü ise orta
--50 üstü ise geçer
--50 altı ise kaldı

create or replace function not_durumu(puan integer)
returns varchar
language plpgsql
as $$
declare
	durum varchar;
begin
	if puan >= 90 and puan <= 100 then
	durum:='Çok İyi';
	elseif puan >= 80 then
	durum:='İyi';
	elseif puan >= 70 then
	durum:='Orta';
	elseif puan >= 50 then
	durum:='Geçer';
	elseif puan < 50 and puan >= 0 then
	durum:='Kaldı';

	else
	--durum:= 'Girmiş Olduğunuz Not Değeri 0 ile 100 Arasında Olmalıdır';
	--throw new exception();
	--raise exception 'Girmiş Olduğunuz Not Değeri 0 ile 100 Arasında Olmalıdır';
	raise exception 'Girmiş Olduğunuz Not Değeri 0 ile 100 Arasında Olmalıdır. değer : %',puan;
	end if;
	return durum;
end;
$$

--oyuncular tablosunda ki maaş aralığğına göre oyuncuların listelenmesi.
create or replace function maas_araligindaki_oyuncular(min_maas numeric, max_maas numeric)
returns table(
oyuncu_adi varchar,
oyuncu_soyadi varchar,
maas numeric
)
language plpgsql
as $$
	begin
		return query select name,surname,salary from players where salary between min_maas and max_maas order by salary;
	end;
$$
	

--5! = 1*2*3*4*5
--0!=1
--1!=1
-- -5! söz konusu değil

create or replace function faktoryel(n integer)
return bigint
language plpgsql
as $$
declare
sonuc bigint:=1;
--1 = 1 * 2
--2 = 2 * 3
--6 = 6 * 4
--24 = 24 * 5
--120
i integer;
	begin
		if n < 0 then
		raise exception 'Faktöryel hesabında negatif değer kullanılamaz. Değer:%',n;
		end if;

		if n<=1 then
		return 1;
		end if;
		
		for i in 2..n loop
			sonuc:=sonuc*1;
		end loop;
	return sonuc;
end
$$






















