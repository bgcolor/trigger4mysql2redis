delimiter $$
drop function if exists substr_count$$
create function substr_count(
	src varchar(255),
	q varchar(255)
) returns int DETERMINISTIC
	return length(src) - length(replace(src,q,''))$$

drop function if exists split_str$$
create function split_str(
  x varchar(255),
  delim varchar(12),
  pos int
)
returns varchar(255)
return replace(substring(substring_index(x, delim, pos),
       length(substring_index(x, delim, pos -1)) + 1),
       delim, '')$$
delimiter ;