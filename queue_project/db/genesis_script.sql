CREATE SCHEMA `queuesystem`;

CREATE TABLE `queuesystem`.`userlist` (
  `username` VARCHAR(26) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`)
);

CREATE TABLE `queuesystem`.`userdetails` (
  `username` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `middlename` VARCHAR(45) NULL,
  `course` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`username`),
  FOREIGN KEY (`username`) REFERENCES `queuesystem`.`userlist` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
