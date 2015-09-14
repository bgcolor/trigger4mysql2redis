delimiter $$
drop procedure if exists add_reset_item$$

create procedure add_reset_item(IN resetIds varchar(255), IN resetKeys varchar(255))
proc_label:begin
	declare idsLen int;
	declare keysLen int;
	declare resetId varchar(255);
	declare resetKey varchar(255);
	declare i int default 1;
	declare continue handler for 1062 begin end;

	set idsLen = substr_count(resetIds, '|') + 1;
	set keysLen = substr_count(resetKeys, '|') + 1;

	if idsLen <> keysLen then 
		leave proc_label;
	end if;

	while i <= idsLen do
		set resetId = split_str(resetIds, '|', i);
		set resetKey = split_str(resetKeys, '|', i);
		insert into redis_reset_map values (resetId, resetKey);
		set i = i + 1;
	end while;
end$$
delimiter ;