CREATE DATABASE mappingtool;

USE mappingtool;

CREATE TABLE `mappingtool`.`projects` (
`project_id` INT NOT NULL AUTO_INCREMENT,
`project_name` VARCHAR(500) NULL,
`user_name` VARCHAR(100) NULL, /*Should this be researcher_name?*/
`project_description` VARCHAR(1000) NULL,
UNIQUE INDEX `project_id_UNIQUE` (`project_id` ASC) VISIBLE,
PRIMARY KEY (`project_id`)
);

CREATE TABLE `mappingtool`.`projects_goals` (
`project_goal_id` INT NOT NULL AUTO_INCREMENT,
`project_id` INT NULL,
`goal_id` INT NULL,
`overall_score` FLOAT NULL,
UNIQUE INDEX `project_goal_id_UNIQUE` (`project_goal_id` ASC) VISIBLE,
PRIMARY KEY (`project_goal_id`)
);

CREATE TABLE `mappingtool`.`goals` (
`goal_id` INT NOT NULL,
`goal_name` VARCHAR(200) NULL,
PRIMARY KEY (`goal_id`),
UNIQUE INDEX `goal_id_UNIQUE` (`goal_id` ASC) VISIBLE
);

CREATE TABLE `mappingtool`.`targets` (
`target_id` INT NOT NULL, /*we will have to change this as goal numbers are formatted ##.## */
`project_goal_id` INT NULL,
`indicator_id` INT NULL, /* is this ok? */
`target_desc` VARCHAR(500) NULL,
`score` FLOAT NULL,
UNIQUE INDEX `target_id_UNIQUE` (`target_id` ASC) VISIBLE,
PRIMARY KEY (`target_id`));

CREATE TABLE `mappingtool`.`indicators` (
`indicator_id` INT NOT NULL, /*we will have to change this as goal numbers are formatted ##.##.## */
`indicator_desc` VARCHAR(500) NULL,
`goal_id` INT NULL,
PRIMARY KEY (`indicator_id`),
UNIQUE INDEX `indicator_id_UNIQUE` (`indicator_id` ASC) VISIBLE
);

/*Re: Comments on target_id and indicator_id

/* One place we can cite for an idea how to solve https://www.tek-tips.com/viewthread.cfm?qid=876253 */
/* Another place we can cite for an idea how to solve https://stackoverflow.com/questions/20652678/store-hierarchy-number-pattern-like-1-1-1-in-numeric-format-in-a-sql-server-data */
/* Or maybe we can simply have the goal and index numbers be individual integers as they are now and have the id's of the target / target and goal they are attached to be foreign keys as well? */

INSERT INTO projects(project_name, user_name, project_description) values("Some Project", "Researcher 1", "A project in which stuff is done");
INSERT INTO goals(goal_id, goal_name) values(1, "No Poverty");
INSERT INTO targets(target_id, target_desc) values(1, "not null");
INSERT INTO indicators(indicator_id, indicator_desc) values(1, "Some indicator information");