create table user_type						--��� ������������
(
	id					serial				primary key,
	user_type_name		varchar(20)			not null
);

create table users							--������������
(
	user_id				serial				primary key,
	user_type			int 				references user_type(id) not null,
	full_name			varchar(100)		not null,
	user_age			int 				not null,
	user_gender			varchar(10)         not null,
	phone_number		int 				unique not null,
	user_password		varchar(50)			not null,
	registration_time	timestamp			not null
);

create table user_log						--����
(
	log_id				serial				primary key,
	user_id				int					references users(user_id) not null,
	login_time			timestamp			not null
);

create table car							--�������������	
(
	car_id				serial				primary key,
	user_id				int 				references	users(user_id) not null,
	car_model			varchar(50)			not null,
	car_number			varchar(15)			unique not null,
	color				varchar(15)			not null
);

create table baggage						--����� ���������
(
	baggage_id			serial				primary key,
	user_id				int					references users(user_id) not null,
	dimensions			int 				not null,
	weight				int 				not null
);

create table locality						--���������� �����
(
	id					serial				primary key,
	name_locality		varchar(30)			unique not null
);

create table route							--�������
(
	route_id			serial				primary key,
	point_A				int					references locality(id) not null,
	point_B				int 				references locality(id) not null,
	distance_km			int					
);

create table advert							--���������� 
(
	advert_id			serial				primary key,
	author				int 				references users(user_id) not null,
	route				int					references route(route_id) not null,
	time_start			timestamp			not null,
	price				int,
	catcher				int 				references users(user_id)	--�����������
);





















