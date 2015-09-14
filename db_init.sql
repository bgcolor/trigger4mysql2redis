delimiter $$

drop table if exists redis_reset_map$$
CREATE TABLE `redis_reset_map` (
  `itemId` bigint(20) NOT NULL,
  `resetKey` varchar(255) NOT NULL,
  PRIMARY KEY (`itemId`,`resetKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

drop table if exists `test`$$
create table `test` (
	`productId` int (20),
	`productName` varchar (255),
	`managerId` int (20)
)$$
delimiter ;