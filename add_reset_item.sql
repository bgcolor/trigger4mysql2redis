delimiter $$
drop function if exists `add_reset_item`$$
create function `add_reset_item`(field varchar(20), value bigint, resetKey varchar(255)) returns boolean DETERMINISTIC
begin
	declare result int;
	if strcmp(field, '') = 0 then
		set field = 'id';
	end if;

	insert into `redis_reset_map` values (field, value, resetKey);
	
	if row_count() > 0 then
		return true;
	else 
		return false;
	end if;
end$$
delimiter ;