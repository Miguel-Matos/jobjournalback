CREATE DATABASE IF NOT EXISTS `job_journal`;
USE `job_journal`;


CREATE TABLE `companies` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` varchar(45) DEFAULT NULL,
    `location` varchar(45) DEFAULT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `positions` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `platform` varchar(45) DEFAULT NULL,
    `position` varchar(45) DEFAULT NULL,
    `link` varchar(128) DEFAULT NULL UNIQUE,
    `date_applied` DATE NOT NULL,
    `company_id` INT NOT NULL,
    `result` TINYINT(1),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);

CREATE TABLE `interviews` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `interview_date` DATE,
    `interview_count` INT,
    `company_id` INT,
    `position_id` INT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`),
    FOREIGN KEY(`position_id`) REFERENCES `positions`(`id`)
);

CREATE TABLE `feedback` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `feedback_data` TEXT,
    `company_id` INT,
    `position_id` INT,
    `interview_id` INT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`),
    FOREIGN KEY(`position_id`) REFERENCES `positions`(`id`),
    FOREIGN KEY(`interview_id`) REFERENCES `interviews`(`id`)
);
