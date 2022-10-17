create table if not exists Genres(
	id SERIAL primary key,
	genre_name varchar(60) unique not null 
);

create table if not exists Perfomers(
	id SERIAl primary key,
	name varchar(60) unique not null
);

create table if not exists GenrePerfomer(
	genre_id integer references Genres(id),
	perfomer_id integer references Perfomers(id),
	constraint pk primary key (genre_id, perfomer_id)
);

create table if not exists Albums(
	id SERIAL primary key,
	album_name varchar(60) unique not null,
	release_year smallint check(release_year > 1950)
);

create table if not exists AlbumPerfomer(
	album_id integer references Albums(id),
	perfomer_id integer references Perfomers(id),
	constraint pk_album primary key (album_id, perfomer_id)
);

create table if not exists Tracks(
	id SERIAL primary key,
	album_id integer not null references Albums(id),
	duration_sec smallint check(duration < 1000),
	track_name varchar(60) unique not null
);

create table if not exists Collections(
	id SERIAL primary key,
	collection_name varchar(60) unique not null,
	release_year smallint check(release_year > 1950)
);

create table if not exists CollectionTrack(
	collection_id integer references Collections(id),
	track_id integer references Tracks(id),
	constraint pk_collection primary key (collection_id, track_id)
);