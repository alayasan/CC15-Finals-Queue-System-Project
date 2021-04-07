CREATE SCHEMA `queuesystem` ;

CREATE TABLE `queuesystem`.`userlist` (
  `username` VARCHAR(26) NOT NULL UNIQUE PRIMARY KEY,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL
);

