
INSERT INTO `networks`
(
`uuid`,
`name`,
`code`,
`description`,
`status`,
`control_plane_public_ipv4`,
`control_plane_private_ipv4`,
`private_subnet`,
`reserved_port_from`,
`created_at`,
`created_by`,
`updated_at`,
`updated_by`)
VALUES
(
UUID_TO_BIN('23f6d786-7527-c93d-7720-6406b23b93f6'),
'Test Network1',
'test_nw1',
'Test Network1',
'PROVISIONING',
INET_ATON('18.237.111.61'),
INET_ATON('10.0.2.36'),
'10.0.2.0/26',
1029,
CURRENT_TIMESTAMP,
0,
CURRENT_TIMESTAMP,
0
);

INSERT INTO `container_frames`
(
`uuid`,
`network_id`,
`client_code`,
`phisical_type`,
`private_ipv4`,
`tfstate_url`,
`created_at`,
`created_by`,
`updated_at`,
`updated_by`)
VALUES
(
UUID_TO_BIN('202ad737-50fe-47f6-db97-2dcc4395b048'),
1,
'client_code1',
'PC',
INET_ATON('192.168.100.2'),
null,
CURRENT_TIMESTAMP,
0,
CURRENT_TIMESTAMP,
0
);


INSERT INTO `containers`
(
`container_frame_id`,
`created_at`,
`created_by`,
`updated_at`,
`updated_by`)
VALUES
(
1,
CURRENT_TIMESTAMP,
0,
CURRENT_TIMESTAMP,
0
);


INSERT INTO `users`
(
`uuid`,
`okta_id`,
`nickname`,
`email`,
`created_at`,
`created_by`,
`updated_at`,
`updated_by`
)
VALUES
(
UUID_TO_BIN('f2d7296b-2543-b8f2-f73f-c216b1ff3575'),
'00u113ojlfJIxwv8T5d7',
'testuser1',
'tc-dev+user1@tc3.co.jp',
CURRENT_TIMESTAMP,
0,
CURRENT_TIMESTAMP,
0
);

INSERT INTO `network_members`
(
`network_id`,
`user_uuid`,
`owner`,
`created_at`,
`created_by`,
`updated_at`,
`updated_by`)
VALUES
(
1,
UUID_TO_BIN('f2d7296b-2543-b8f2-f73f-c216b1ff3575'),
1,
CURRENT_TIMESTAMP,
0,
CURRENT_TIMESTAMP,
0
);
