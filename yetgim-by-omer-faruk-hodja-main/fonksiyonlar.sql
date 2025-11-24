

-- bir fonksiyon yazılırlen saf sql sorgusu var ise fonksiyon dili sql olur.
-- bir fonksiyon yazılırken if , else, loop, exception vs gibi algoritmik yapılar da var ise burada dil olarak plpgsql kullanılır.

-- create or replace function fonksiyon_ismi(parametre)
-- returns veri_tipi
-- language sql | plpgsql
-- as $$
-- fonksiyon işlevi.
-- $$

-- İki tane sayıyı toplauan fonksiyon yazınız.

-- f(x) = 2x +5;
-- f(2) = 9
-- f(x,y) = 3x + 2y;
-- f(5,6) = 3.5 + 2.6 = 27;


create or replace function topla(a INTEGER, b INTEGER)
returns INTEGER
LANGUAGE  sql
as
$$
    select  a + b
$$;

-- ömer,doğan   = 'ÖMER DOĞAN'
create or replace function tam_ad_olustur(ad varchar, soyad varchar)
returns varchar language sql
as $$
select concat(upper(ad),' ',upper(soyad)) ;
$$;


create or replace function yas_hesapla(dogum_tarihi date)
returns INTEGER
LANGUAGE  sql
as $$
select  date_part('year', age(dogum_tarihi))
    $$;



-- plpgsql ile yapımı
create or replace function  age_calculate(dogum_tarih date)
returns INTEGER
LANGUAGE plpgsql
as $$
    DECLARE
        -- DEĞİŞKENLER
        yas INTEGER;

    BEGIN
        -- FONKSİYON İŞ YÜKLERİ
        yas:= date_part('year', age(dogum_tarih));
        return yas;
    end;
    $$;

-- 90<s  çok iyi
--80<s iyi,
-- 70<s orta
-- 50<s geçer
-- s<50 kaldı


create or replace function not_durumu(puan INTEGER)
returns varchar
language plpgsql
as $$
    DECLARE
        durum varchar;
    BEGIN
        if puan >= 90 and puan <= 100 then
            durum:= 'Çok İyi';
        elseif puan >= 80 then
            durum:= 'İyi';
        elseif puan >= 70 then
            durum:= 'Orta';
        elseif puan>=50 then
            durum:= 'Geçer';
        elseif puan < 50 and puan>0 then
            durum:= 'Kaldı';

        else

            -- throw new Excetion();
           RAISE EXCEPTION  'Girmiş olduğunuz değer 0 ile 100 arasında olmalıdır. değer : %',puan;
        end if;
        return durum;
    end;
    $$;

-- oyuncular tablosunda ki maaş aralığına göre oyuncuların listelenmesi.
create or replace function maas_araligi_oyuncular(min_maas numeric, max_maas numeric)
returns table(
oyuncu_adi varchar,
oyuncu_soyadi varchar,
maas numeric
)

language plpgsql
as $$
    BEGIN
        return query  select name,surname,salary  from players where salary between min_maas and max_maas order by salary;
    end;
    $$;

-- 5! = 1 * 2 * 3 * 4 * 5
-- 0! = 1, 1! = 1
-- -5! söz konusu değil.

create or replace function faktoriyel(n INTEGER)
returns BIGINT
LANGUAGE plpgsql
as $$
   DECLARE
       sonuc BIGINT:=1;

       -- 1 = 1 * 2
       -- 2 = 2 * 3
       -- 6 = 6 * 4
       --24 = 24*5
       --120
       i INTEGER;
    BEGIN
       IF n <0 then
           RAISE EXCEPTION 'Faktoriyel hesabında negatif değerler kullanılamaz. Değer : %',n;
       end if;

       if n <=1 then
           return 1;
           end if;

       FOR i in 2..n loop
           sonuc:= sonuc*i;
           end loop;
       return sonuc;
   end;

$$;

-- 1 ortalama yaş : 25
create or replace function takim_ortalama_yas(takim_id INTEGER)
returns numeric
language plpgsql
as $$
    DECLARE
    ortalama_yas numeric;
    oyuncu_sayisi INTEGER;

    BEGIN
        SELECT avg(date_part('year', age(birth_date))) , count(id) into ortalama_yas, oyuncu_sayisi from players where team_id = takim_id;

        if oyuncu_sayisi = 0 then
            raise NOTICE 'Takımda oyuncu bulunamadı';
            return null;
        end if;
        return ortalama_yas;
end;
    $$



