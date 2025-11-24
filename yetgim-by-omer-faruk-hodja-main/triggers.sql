create table test_messages(
    id serial primary key ,
    message text,
    created_At timestamp
);


create or replace function set_created_date()
returns trigger
language plpgsql
as $$
    BEGIN
        NEW.created_At:= CURRENT_TIMESTAMP;
        return NEW;
    end;
$$;


create or replace trigger trg_set_created_date
before insert on  test_messages
for each row execute function set_created_date();


create or replace function validate_player_salary()
returns trigger
language plpgsql
as $$
    BEGIN

    if NEW.salary < 0 then
        RAISE EXCEPTION 'MAAŞ Negatif olamaz.';
    end if;

    IF NEW.salary < 100000 then
        RAISE warning 'Dikkat düşük maaş uyarısı girmek istediğiniz maaş %, oyunu adı : % % ', new.salary, new.name, new.surname;
    end if;

    return new;
end;
$$


create or replace trigger trg_validate_player_salary
before insert on players
for each row  EXECUTE FUNCTION validate_player_salary();




create or replace function update_team_value()
returns trigger
language plpgsql
as $$
    DECLARE
        v_team_id Integer;
        v_total_value  numeric;

    BEGIN
        IF TG_OP = 'DELETE' THEN
            v_team_id:= old.team_id;
        else
            v_team_id:= new.team_id;
        end if;

        select sum(player_value) into v_total_value from players where  team_id = v_team_id;

        update teams set team_value = v_total_value where id = v_team_id;

        RAISE NOTICE 'Id si %  olan Takım değeri Güncellendi  değer : %', v_team_id, v_total_value;

        IF tg_op = 'delete' then
            return  old;

        ELSE RETURN  new;
        end if;
    end;
    $$;


create or replace trigger trg_update_team_value_when_inserted_player
after insert on players
for each row execute function  update_team_value();


create or replace trigger trg_update_team_value_when_deleted_player
after delete on players
for each row execute function  update_team_value();


create or replace trigger trg_update_team_value_when_updated_player
after update of player_value, team_id on players
for each row execute function update_team_value();

