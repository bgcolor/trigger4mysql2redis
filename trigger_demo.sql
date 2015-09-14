delimiter $$
drop trigger if exists test_upd$$

create trigger test_upd after update on test for each row
begin
	call add_reset_item(concat(new.productid, concat('|', new.managerid)), 'resetkey1|resetkey2');
end$$
delimiter ;