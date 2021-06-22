
CREATE TABLE `container_frames`  ( 
	`id`           	bigint(20) UNSIGNED AUTO_INCREMENT NOT NULL,
	`uuid`         	binary(16) NOT NULL,
	`network_id`   	bigint(20) UNSIGNED NOT NULL,
	`client_code`  	varchar(13) NOT NULL,
	`phisical_type`	varchar(32) NOT NULL,
	`private_ipv4` 	int(10) UNSIGNED NOT NULL,
	`tfstate_url`  	varchar(1024) NULL,
	`created_at`   	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`created_by`   	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	`updated_at`   	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_by`   	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY(`id`)
)
ENGINE = InnoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
AUTO_INCREMENT = 1;

CREATE TABLE `containers`  ( 
	`id`                	bigint(20) UNSIGNED AUTO_INCREMENT NOT NULL,
	`container_frame_id`	bigint(20) UNSIGNED NOT NULL,
	`created_at`        	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`created_by`        	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	`updated_at`        	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_by`        	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY(`id`)
)
ENGINE = InnoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
AUTO_INCREMENT = 1;

CREATE TABLE `network_members`  ( 
	`id`        	bigint(20) UNSIGNED AUTO_INCREMENT NOT NULL,
	`network_id`	bigint(20) UNSIGNED NOT NULL,
	`user_uuid` 	binary(16) NOT NULL,
	`owner`     	tinyint(1) NOT NULL,
	`created_at`	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`created_by`	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	`updated_at`	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_by`	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY(`id`)
)
ENGINE = InnoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
AUTO_INCREMENT = 1;

CREATE TABLE `networks`  ( 
	`id`                        	bigint(20) UNSIGNED AUTO_INCREMENT NOT NULL,
	`uuid`                      	binary(16) NOT NULL,
	`name`                      	varchar(32) NOT NULL,
	`code`                      	varchar(13) NOT NULL,
	`description`               	text NULL,
	`status`                    	varchar(32) NOT NULL,
	`control_plane_public_ipv4` 	int(10) UNSIGNED NULL,
	`control_plane_private_ipv4`	int(10) UNSIGNED NOT NULL,
	`private_subnet`            	varchar(18) NOT NULL,
	`reserved_port_from`        	int(10) UNSIGNED NOT NULL,
	`created_at`                	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`created_by`                	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	`updated_at`                	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_by`                	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY(`id`)
)
ENGINE = InnoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
AUTO_INCREMENT = 1;

CREATE TABLE `users`  ( 
	`id`        	bigint(20) UNSIGNED AUTO_INCREMENT NOT NULL,
	`uuid`      	binary(16) NOT NULL,
	`okta_id`   	varchar(128) NOT NULL,
	`nickname`  	varchar(512) NOT NULL,
	`email`     	varchar(256) NOT NULL,
	`created_at`	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`created_by`	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	`updated_at`	datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_by`	bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	`deleted`   	tinyint(1) UNSIGNED NULL DEFAULT '0',
	PRIMARY KEY(`id`)
)
ENGINE = InnoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
AUTO_INCREMENT = 1;

ALTER TABLE `container_frames`
	ADD CONSTRAINT `uuid`
	UNIQUE (`uuid`);

ALTER TABLE `network_members`
	ADD CONSTRAINT `network_id`
	UNIQUE (`network_id`, `user_uuid`);

ALTER TABLE `networks`
	ADD CONSTRAINT `uuid`
	UNIQUE (`uuid`);

ALTER TABLE `users`
	ADD CONSTRAINT `uuid`
	UNIQUE (`uuid`);

ALTER TABLE `users`
	ADD CONSTRAINT `email`
	UNIQUE (`email`);

ALTER TABLE `users`
	ADD CONSTRAINT `okta_id`
	UNIQUE (`okta_id`);

ALTER TABLE `containers`
	ADD CONSTRAINT `containers_ibfk_1`
	FOREIGN KEY(`container_frame_id`)
	REFERENCES `container_frames`(`id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

ALTER TABLE `container_frames`
	ADD CONSTRAINT `container_frames_ibfk_1`
	FOREIGN KEY(`network_id`)
	REFERENCES `networks`(`id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT ;

ALTER TABLE `network_members`
	ADD CONSTRAINT `network_members_ibfk_1`
	FOREIGN KEY(`network_id`)
	REFERENCES `networks`(`id`)
	ON DELETE CASCADE 
	ON UPDATE RESTRICT ;

ALTER TABLE `network_members`
	ADD CONSTRAINT `network_members_ibfk_2`
	FOREIGN KEY(`user_uuid`)
	REFERENCES `users`(`uuid`);

CREATE INDEX `network_id` USING BTREE 
	ON `container_frames`(`network_id`);

CREATE INDEX `container_frame_id` USING BTREE 
	ON `containers`(`container_frame_id`);

