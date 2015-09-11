drop table if exists `redis_reset_map`;
create table `redis_reset_map` (
	`itemId` bigint (20),
	`resetKey` varchar (255)
); 