delimiter $$
drop trigger if exists test_upd$$
create trigger test_upd after update on test for each row
begin
	declare result Boolean;
	result = call add_reset_item('', old.id, 'resetkey');
	if result then 
		insert into result values ('success');
	end if;
end
delimiter ;