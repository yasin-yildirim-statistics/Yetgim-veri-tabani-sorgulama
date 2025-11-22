create table test_messages(
id serial primary key,
message text,
created_at timestamp
);

create or replace function set_created_date()
returns trigger
language plpgsql
as $$
	begin
		new.created_at:= current_timestamp;
		return new;
	end;
$$;

create or replace trigger trg_set_created_date
before insert on test_messages
for each row execute function set_created_date();


create or replace function validate_player_salary()
returns trigger
language plpgsql
as $$
begin
	if new.salary < 0 then
	raise exception 'MAAŞ Negatif Olamaz.';
	end if;

	if new.salary < 100000 then
	raise warning 'Dikkat Düşük Maaş Uyarısı. Girmek istediğiniz maaş: %, oyuncu adı : % %',new.salary, new.name, new.surname;
	end if;
	
	return new;
end;
$$;

create or replace trigger trg_validate_player_salary
before insert on players
for each row execute function validate_player_salary();


create or replace function update_team_value()
returns trigger
language plpgsql
as $$
	declare
		v_team_id int;
		v_total_value numeric;
	begin
		if tg_op = 'DELETE' then
			v_team_id:=old.team_id;
		else
			v_team_id:=new.team_id;
		end if;

		select sum(player_value) into v_total_value  from players where team_id = v_team_id;

		update teams set team_value = v_total_value where id = v_team_id;

		raise notice 'id si % Olan Takım Değeri Güncellendi, değer : %', v_team_id, v_total_value;

		if tg_op = 'delete' then
			return old;

		else return new;
		end if;

	end
$$;


create or replace trigger trg_upodate_team_value_when_inserted_player
after insert on players
for each row execute function update_team_value();


create or replace trigger trg_upodate_team_value_when_deleted_player
after delete on players
for each row execute function update_team_value();


create or replace trigger trg_upodate_team_value_when_updated_player
after update of player_value, team_id on players
for each row execute function update_team_value();


