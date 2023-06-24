CREATE DATABASE IF NOT EXISTS `C-SCORE-MLD` DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8_general_ci;
USE `C-SCORE-MLD`;

CREATE TABLE `ACCESS_TO` (
  `codefolder` VARCHAR(42),
  `codeuser` VARCHAR(42),
  PRIMARY KEY (`codefolder`, `codeuser`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `ACCESS_TO1` (
  `codesection` VARCHAR(42),
  `codeuser` VARCHAR(42),
  PRIMARY KEY (`codesection`, `codeuser`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `BIDDER` (
  `codebidder` VARCHAR(42),
  `name` VARCHAR(42),
  `description` VARCHAR(42),
  PRIMARY KEY (`codebidder`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `CHAPTER` (
  `codechapter` VARCHAR(42),
  `label` VARCHAR(42),
  `order` VARCHAR(42),
  `created_at` VARCHAR(42),
  `updated_at` VARCHAR(42),
  `codeuser` VARCHAR(42),
  PRIMARY KEY (`codechapter`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `FOLDER` (
  `codefolder` VARCHAR(42),
  `reference` VARCHAR(42),
  `label` VARCHAR(42),
  `description` VARCHAR(42),
  `status` VARCHAR(42),
  `created_at` VARCHAR(42),
  `updated_at` VARCHAR(42),
  `codeuser` VARCHAR(42),
  PRIMARY KEY (`codefolder`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `HAS` (
  `codefolder` VARCHAR(42),
  `codesection` VARCHAR(42),
  PRIMARY KEY (`codefolder`, `codesection`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `HAS1` (
  `codesection` VARCHAR(42),
  `codechapter` VARCHAR(42),
  PRIMARY KEY (`codesection`, `codechapter`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `HAS2` (
  `codechapter` VARCHAR(42),
  `codequestion` VARCHAR(42),
  PRIMARY KEY (`codechapter`, `codequestion`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `HAS3` (
  `codechapter` VARCHAR(42),
  `codechapter_1` VARCHAR(42),
  PRIMARY KEY (`codechapter`, `codechapter_1`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `LINKED_TO` (
  `codefolder` VARCHAR(42),
  `codebidder` VARCHAR(42),
  PRIMARY KEY (`codefolder`, `codebidder`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `QUESTION` (
  `codequestion` VARCHAR(42),
  `label` VARCHAR(42),
  `moderation` VARCHAR(42),
  `order` VARCHAR(42),
  `created_at` VARCHAR(42),
  `updated_at` VARCHAR(42),
  `codeuser` VARCHAR(42),
  PRIMARY KEY (`codequestion`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `RESPONSE` (
  `coderesponse` VARCHAR(42),
  `moderation` VARCHAR(42),
  `comment` VARCHAR(42),
  `created_at` VARCHAR(42),
  `updated_at` VARCHAR(42),
  `codequestion` VARCHAR(42),
  PRIMARY KEY (`coderesponse`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `SECTION` (
  `codesection` VARCHAR(42),
  `label` VARCHAR(42),
  `order` VARCHAR(42),
  `created_at` VARCHAR(42),
  `updated_at` VARCHAR(42),
  `codeuser` VARCHAR(42),
  PRIMARY KEY (`codesection`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `USER` (
  `codeuser` VARCHAR(42),
  `last_name` VARCHAR(42),
  `first_name` VARCHAR(42),
  `email` VARCHAR(42),
  `role` VARCHAR(42),
  PRIMARY KEY (`codeuser`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

ALTER TABLE `ACCESS_TO` ADD FOREIGN KEY (`codeuser`) REFERENCES `USER` (`codeuser`);
ALTER TABLE `ACCESS_TO` ADD FOREIGN KEY (`codefolder`) REFERENCES `FOLDER` (`codefolder`);
ALTER TABLE `ACCESS_TO1` ADD FOREIGN KEY (`codeuser`) REFERENCES `USER` (`codeuser`);
ALTER TABLE `ACCESS_TO1` ADD FOREIGN KEY (`codesection`) REFERENCES `SECTION` (`codesection`);
ALTER TABLE `CHAPTER` ADD FOREIGN KEY (`codeuser`) REFERENCES `USER` (`codeuser`);
ALTER TABLE `FOLDER` ADD FOREIGN KEY (`codeuser`) REFERENCES `USER` (`codeuser`);
ALTER TABLE `HAS` ADD FOREIGN KEY (`codesection`) REFERENCES `SECTION` (`codesection`);
ALTER TABLE `HAS` ADD FOREIGN KEY (`codefolder`) REFERENCES `FOLDER` (`codefolder`);
ALTER TABLE `HAS1` ADD FOREIGN KEY (`codechapter`) REFERENCES `CHAPTER` (`codechapter`);
ALTER TABLE `HAS1` ADD FOREIGN KEY (`codesection`) REFERENCES `SECTION` (`codesection`);
ALTER TABLE `HAS2` ADD FOREIGN KEY (`codequestion`) REFERENCES `QUESTION` (`codequestion`);
ALTER TABLE `HAS2` ADD FOREIGN KEY (`codechapter`) REFERENCES `CHAPTER` (`codechapter`);
ALTER TABLE `HAS3` ADD FOREIGN KEY (`codechapter_1`) REFERENCES `CHAPTER` (`codechapter`);
ALTER TABLE `HAS3` ADD FOREIGN KEY (`codechapter`) REFERENCES `CHAPTER` (`codechapter`);
ALTER TABLE `LINKED_TO` ADD FOREIGN KEY (`codebidder`) REFERENCES `BIDDER` (`codebidder`);
ALTER TABLE `LINKED_TO` ADD FOREIGN KEY (`codefolder`) REFERENCES `FOLDER` (`codefolder`);
ALTER TABLE `QUESTION` ADD FOREIGN KEY (`codeuser`) REFERENCES `USER` (`codeuser`);
ALTER TABLE `RESPONSE` ADD FOREIGN KEY (`codequestion`) REFERENCES `QUESTION` (`codequestion`);
ALTER TABLE `SECTION` ADD FOREIGN KEY (`codeuser`) REFERENCES `USER` (`codeuser`);