--create database our_first_database;
--create table city1 (
	--id int not null identity(1, 1),
	--city_name char(128) not null,
	--lat decimal(9, 6) not null,
	--long decimal(9, 6) not null,
	--country_id int not null,
	--constraint city_pk1 primary key (id)
	--);
--create table country (
	--id int not null identity(1, 1),
	--country_name char(128) not null,
	--country_name_eng char(128) not null,
	--country_code char(8) not null,
	--constraint country_ak_1 unique (country_name),
	--constraint country_ak_2 unique (country_name_eng),
	--constraint country_ak_3 unique (country_code),
	--constraint country_pk primary key (id)
	--);
--alter table city1 add constraint city_country
	--foreign key (country_id)
	--references country (id);
--INSERT INTO table_name (column_list) VALUES (column_values);
--INSERT INTO table_name VALUES (column_list);

--insert into country (country_name, country_name_eng, country_code) values ('Deutschland', 'Germany', 'DEU');
--insert into country (country_name, country_name_eng, country_code) values ('Srbija', 'Serbia', 'SRB');
--insert into country (country_name, country_name_eng, country_code) values ('Hrvatska', 'Croatia', 'HRV');
--insert into country (country_name, country_name_eng, country_code) values ('United States of America', 'United States of America', 'USA');
--insert into country (country_name, country_name_eng, country_code) values ('Polska', 'Poland', 'POL');
insert into country (country_name, country_name_eng, country_code) values ('Canada', 'Canada', 'CAN');

select * from country;

