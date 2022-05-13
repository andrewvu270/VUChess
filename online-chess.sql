create database online_chess;

use online_chess;

-- Tables
create table users(
	id int auto_increment primary key,
    username varchar(255) unique,
	email varchar(255) unique,
    password varchar(255)
);

create table user_info(
	user_id int,
    user_rank enum('beginner', 'intermediate', 'advanced', 'expert') default 'beginner',
    user_points int default 1000,
    key userID(user_id),
    constraint userID foreign key(user_id) references users(id) on delete cascade
);


-- Procedures
delimiter $$
create procedure createUser(
	in _username varchar(255),
    in _email varchar(255),
    in _password varchar(255)
)
begin
	declare userId int;
    
    insert into users(username, email, password) values(_username,_email,_password);
    select id into userId from users where username=_username;
    insert into user_info(user_id) values(userId);
end $$
delimiter ;

-- Queries
select * from users;

select * from user_info;

