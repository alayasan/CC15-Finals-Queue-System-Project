CREATE SCHEMA `queuesystem`;

CREATE TABLE `queuesystem`.`userlist` (
  `username` VARCHAR(26) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `userrole` VARCHAR(45) NOT NULL,
  `status` 	VARCHAR(45) NOT NULL DEFAULT 'student',
  `userID` VARCHAR(45) NOT NULL,
  CONSTRAINT user_status CHECK (`status` IN ('', 'IN', 'OUT', 'AWAY')),
  CONSTRAINT role_name CHECK (userrole IN ('student', 'faculty', 'admin')),
  PRIMARY KEY (`username`)
);

INSERT INTO userlist (username, `password`, userrole) VALUES ('admin', '1234', 'admin');

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

CREATE TABLE `queuesystem`.`facultydetails` (
	`username` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`username`),
    `firstname` VARCHAR(45) NOT NULL,
	`lastname` VARCHAR(45) NOT NULL,
	`middlename` VARCHAR(45) NULL,
    `department` VARCHAR(45) NOT NULL,
    FOREIGN KEY (`username`) REFERENCES `queuesystem`.`userlist` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `queuesystem`.`appointmenthistory` (
  `referenceID` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `appointmentFrom` VARCHAR(45) NOT NULL,
  `appointmentWith` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `time` VARCHAR(45) NOT NULL,
  `reason` VARCHAR(280) NOT NULL DEFAULT '',
  `status` VARCHAR(280) NOT NULL DEFAULT 'PENDING',
  CONSTRAINT appointment_status CHECK (`status` IN ('PENDING', 'FINISHED', 'CANCELLED', 'UPCOMING')),
  FOREIGN KEY (`appointmentFrom`) REFERENCES `queuesystem`.`userlist` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
