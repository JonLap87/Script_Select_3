CREATE TABLE IF NOT EXISTS  Musical_genres(
	id SERIAL PRIMARY KEY,
	NameMusgen VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS  Executors(
	id SERIAL PRIMARY KEY,
	NameExecut VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musgen_Execut (
	musgen_id INTEGER REFERENCES Musical_genres(id),
	execut_id INTEGER REFERENCES Executors(id),
	CONSTRAINT ME PRIMARY KEY (musgen_id , execut_id)
);

CREATE TABLE IF NOT EXISTS  Albums(
	id SERIAL PRIMARY KEY,
	NameAlbum VARCHAR(80) NOT null,
	YearAlbum date
);

CREATE TABLE IF NOT EXISTS Execut_Album (
	album_id INTEGER REFERENCES Albums(id),
	execut_id INTEGER REFERENCES Executors(id),
	CONSTRAINT EA PRIMARY KEY (album_id , execut_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES Albums(id),
	NameTrack VARCHAR(40) NOT null,
	Durarion INTEGER
	);

CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	NameCollect VARCHAR(40) NOT null,
	YearCollect date
	);

CREATE TABLE IF NOT EXISTS Track_Collect (
	track_id INTEGER REFERENCES Tracks(id),
	collect_id INTEGER REFERENCES Collections(id),
	CONSTRAINT TC PRIMARY KEY (track_id , collect_id)
);




-- один к одному (2 вариант)

CREATE TABLE IF NOT EXISTS Student (
	id SERIAL PRIMARY KEY,
	email VARCHAR(80) UNIQUE NOT NULL,
	name VARCHAR(40) NOT NULL,
	PASSWORD VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS StudentInfo (
	id INTEGER PRIMARY KEY REFERENCES Student(id),
	birthday date,
	city VARCHAR(60),
	roi TEXT
);

-- один ко многим

CREATE TABLE IF NOT EXISTS Course (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	description TEXT
);

CREATE TABLE IF NOT EXISTS HomeworkTask (
	id SERIAL PRIMARY KEY,
	course_id INTEGER NOT NULL REFERENCES Course(id),
	number INTEGER NOT NULL,
	description TEXT NOT NULL
);

-- многие ко многим (1 вариант)

CREATE TABLE IF NOT EXISTS CourseStudent (
	course_id INTEGER REFERENCES Course(id),
	student_id INTEGER REFERENCES Student(id),
	CONSTRAINT pk PRIMARY KEY (course_id, student_id)
);

-- многие ко многим (2 вариант)

CREATE TABLE IF NOT EXISTS HomeworkSolution (
	id SERIAL PRIMARY KEY,
	task_id INTEGER NOT NULL REFERENCES HomeworkTask(id),
	student_id INTEGER NOT NULL REFERENCES Student(id),
	solution TEXT NOT NULL
);