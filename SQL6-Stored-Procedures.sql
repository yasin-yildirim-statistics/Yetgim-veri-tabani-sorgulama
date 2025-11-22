-- STORED PROCEDURE postgre 11+ versiyonundan sonra gelmiştir.
-- diğer programlama dillerinde ki void fonksiyonların karşılığıdır.
-- select içersinde kullanılamaz
-- genellikle iş yükleri , ekleme , silme , güncelleme gibi operasyonel süreçlerde kullanılır.
-- Returns keywordu kullanılamaz.
create or replace procedure sp_hello()
language plpgsql
AS $$
BEGIN
    RAISE NOTICE  'Bu bir stored Procedure dur.';
end;
    $$;



create or replace procedure sp_create_country(c_name varchar)
language plpgsql
as $$
    DECLARE

    count_country INTEGER:= 0;

BEGIN

    select count(name) into count_country from countries where name = c_name;


    if count_country >0 then
        raise exception  'Ülke adı Benzersiz olmalıdır. Ülke Adı : %',c_name;
    end if;



    INSERT INTO countries(name) values (c_name);
end;

$$


create or replace procedure sp_player_insert(
p_name varchar,
p_surname varchar,
p_number varchar,
p_value numeric,
p_gender varchar,
p_salary numeric,
p_birth_date date,
team_name varchar,
country_name varchar
)
language plpgsql
as $$
    DECLARE
        team_id INTEGER:=0;
        country_id INTEGER:=0;
    begin
        select id into team_id  from teams where name= team_name;
        select id into country_id from countries where name = country_name;

        if  team_id is null then
            RAISE EXCEPTION  'Takım bulunamadı.';
        end if;


        if country_id is null then
            RAISE EXCEPTION  'Ülke bulunamadı.';
        end if;


        INSERT INTO players(name, surname, number, player_value, "Gender", salary, birth_date, team_id, country_id) values
        (p_name,p_surname,p_number,p_value,p_gender,p_salary,p_birth_date,team_id,country_id);

    end;

    $$


create or replace procedure sp_update_team_value(t_id INTEGER, t_value numeric)
language plpgsql
as $$
    DECLARE
        t_name varchar;

    BEGIN
        select  name into t_name from teams where id = t_id;

        if t_name is null then
            RAISE EXCEPTION 'Takım Bulunamadı.';
        end if;

        UPDATE teams SET team_value = t_value where id = t_id;
        COMMIT;

        RAISE NOTICE ' % takımının yeni değeri : % $ olmuştur.', t_name, t_value;

    end;


    $$;

