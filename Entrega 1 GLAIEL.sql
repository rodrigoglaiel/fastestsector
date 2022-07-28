create schema library;
use library;
 
 create table university (
		id int PRIMARY KEY AUTO_INCREMENT,
        name varchar (100),
        short_name varchar (10),
        country varchar (50),
        created_at datetime,
        updated_at datetime,
        deleted_at datetime);

create table school (
		id int PRIMARY KEY AUTO_INCREMENT,
        name varchar (100),
        short_name varchar (10),
        university_id int,
        created_at datetime,
        updated_at datetime,
        deleted_at datetime);
        
create table careers (
		id int PRIMARY KEY AUTO_INCREMENT,
        name varchar (50),
        school_id int,
        university_id int,
        short_name varchar (30),
        created_at datetime,
        updated_at datetime,
        deleted_at datetime);

create table subjects (
		id int PRIMARY KEY AUTO_INCREMENT,
        name varchar (100),
        created_at datetime,
        updated_at datetime,
        deleted_at datetime);

create table career_subject (
		id int PRIMARY KEY AUTO_INCREMENT,
        career_id int,
        subject_id int,
        created_at datetime,
        updated_at datetime,
        deleted_at datetime);

create table files (
		id int PRIMARY KEY AUTO_INCREMENT,
        title varchar (50),
        description varchar (100),
        category_id int,
        subject_id int,
        user_id int,
        created_at datetime,
        updated_at datetime,
        deleted_at datetime);

create table users (
		id int PRIMARY KEY AUTO_INCREMENT,
        name varchar (50),
        last_name varchar (50),
        email varchar (100),
        phone int,
        career_id int,
        career_verified_at datetime,
        created_at datetime,
        updated_at datetime,
        deleted_at datetime);

create table category (
		id int PRIMARY KEY AUTO_INCREMENT,
		name varchar (50),
        created_at datetime,
        deleted_at datetime);

alter table school
ADD	foreign key (university_id) REFERENCES university(id);

alter table careers
ADD foreign key (university_id) REFERENCES university(id),
ADD foreign key (school_id) REFERENCES school(id);

alter table career_subject
ADD foreign key (career_id) REFERENCES careers(id),
ADD foreign key (subject_id) REFERENCES subjects(id);

alter table users
ADD foreign key (career_id) REFERENCES careers(id);

alter table files
ADD foreign key (category_id) REFERENCES category(id),
ADD foreign key (subject_id) REFERENCES subjects(id),
ADD foreign key (user_id) REFERENCES users(id);