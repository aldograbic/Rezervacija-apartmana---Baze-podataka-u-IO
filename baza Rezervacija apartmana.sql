drop table if exists counties;
create table counties (
	id int auto_increment primary key,
    name varchar(255) NOT NULL
);

drop table if exists cities;
create table cities (
	id int auto_increment primary key,
    name varchar(50) NOT NULL,
    county_id int,
    
    foreign key (county_id)
    references counties(id)
    on delete cascade
);

drop table if exists apartments;
create table apartments (
	id int auto_increment primary key,
    name varchar(255) NOT NULL,
    number_of_rooms int default 1 NOT NULL,
    balcony tinyint NOT NULL,
    number_of_beds tinyint default 1 NOT NULL,
    apartment_size numeric NOT NULL,
    air_conditioning tinyint NOT NULL,
    wifi tinyint default 1 NOT NULL,
    pets tinyint NOT NULL,
    price numeric NOT NULL,
    city_id int,
    
	foreign key (city_id)
    references cities(id)
    on delete cascade
);

drop table if exists reservations;
create table reservations (
	id int auto_increment primary key,
    from_date date NOT NULL,
    to_date date NOT NULL,
    number_of_adults int NOT NULL,
    number_of_kids int NOT NULL,
    full_price numeric NOT NULL,
    created_at datetime default current_timestamp NOT NULL,
    apartment_id int,
    user_id int,
    
	foreign key(apartment_id) references apartments(id),
    foreign key(user_id) references users(id)
    on delete cascade
);

drop table if exists users;
create table users (
	id int auto_increment primary key,
    first_name varchar(35) NOT NULL,
    last_name varchar(35) NOT NULL,
    vat_number char(11) unique,
    birth_date date,
    user_email varchar(255) NOT NULL,
    user_password varchar(255) NOT NULL,
    created_at datetime default current_timestamp NOT NULL,
    profile_image VARCHAR(255)
);

drop table if exists reviews;
create table reviews (
	id int auto_increment primary key,
    review_text varchar(2048),
    rating char(1),
    user_id int,
    
    foreign key(user_id)
    references users(id)
    on delete cascade
);