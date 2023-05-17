CREATE TABLE
    classroom (
        building varchar(15),
        room_number varchar(7),
        capacity number(4, 0),
        primary key (building, room_number)
    );

CREATE TABLE
    department (
        dept_name varchar(20),
        building varchar(15),
        budget number(12, 2) check (budget > 0),
        primary key (dept_name)
    );

CREATE TABLE
    course (
        course_id varchar(5),
        title varchar(50),
        dept_name varchar(20),
        credits number(2, 0) check (credits > 0),
        course_type number(5, 1) check (course_type > 1),
        term number(8, 0),
        primary key (course_id),
        foreign key (dept_name) references department ON delete
        SET null
    );

CREATE TABLE
    instructor (
        ID VARCHAR(7) NOT NULL,
        name VARCHAR(20) NOT NULL,
        dept_name VARCHAR(20),
        salary NUMBER(8, 2) CHECK (salary > 29000),
        title VARCHAR(20),
        gender VARCHAR(10),
        native_place VARCHAR(50) ,
        primary key (ID),
        foreign key (dept_name) references department ON delete
        SET null
    );

CREATE TABLE
    section (
        course_id varchar(5),
        sec_id varchar(8),
        semester varchar(6),
        year number(4, 0),
        building varchar(15),
        room_number varchar(7),
        time_slot_id varchar(4),
        memo varchar(4),
        primary key (
            course_id,
            sec_id,
            semester,
            year
        ),
        foreign key (course_id) references course ON DELETE cascade,
        foreign key (building, room_number) references classroom ON delete
        SET null
    );

CREATE TABLE
    teaches (
        ID varchar(7),
        course_id varchar(5),
        sec_id varchar(8),
        semester varchar(6),
        year number(4, 0),
        primary key (
            ID,
            course_id,
            sec_id,
            semester,
            year
        ),
        foreign key (
            course_id,
            sec_id,
            semester,
            year
        ) references section ON DELETE cascade,
        foreign key (ID) references instructor ON DELETE cascade
    );

CREATE TABLE
    student (
        ID varchar(10) NOT NULL PRIMARY KEY,
        name varchar(20) NOT NULL,
        dept_name varchar(20),
        status number(1, 0) NOT NULL,
        time number(4, 0) NOT NULL,
        class varchar(20),
        FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE
        SET NULL
    );

CREATE TABLE
    takes (
        ID varchar(10),
        course_id varchar(5),
        sec_id varchar(8),
        semester varchar(6),
        year number(4, 0),
        grade varchar(2),
        primary key (
            ID,
            course_id,
            sec_id,
            semester,
            year
        ),
        foreign key (
            course_id,
            sec_id,
            semester,
            year
        ) references section ON DELETE cascade,
        foreign key (ID) references student ON DELETE cascade
    );

CREATE TABLE
    advisor (
        s_ID varchar(7),
        i_ID varchar(10),
        primary key (s_ID),
        foreign key (i_ID) references instructor (ID) ON delete
        SET
            null,
            foreign key (s_ID) references student (ID) ON DELETE cascade
    );

CREATE TABLE
    time_slot (
        time_slot_id varchar(4),
        day varchar(1),
        start_hr number(2) check (
            start_hr >= 0
            AND start_hr < 24
        ),
        start_min number(2) check (
            start_min >= 0
            AND start_min < 60
        ),
        end_hr number(2) check (
            end_hr >= 0
            AND end_hr < 24
        ),
        end_min number(2) check (
            end_min >= 0
            AND end_min < 60
        ),
        primary key (
            time_slot_id,
            day,
            start_hr,
            start_min
        )
    );

CREATE TABLE
    prereq (
        course_id varchar(5),
        prereq_id varchar(5),
        primary key (course_id, prereq_id),
        foreign key (course_id) references course ON DELETE cascade,
        foreign key (prereq_id) references course
    );

CREATE TABLE
    T_Professional (
        ProfessionalName VARCHAR2(50) NOT NULL,
        ProfessionalDepartment VARCHAR2(50) NOT NULL,
        EstablishmentYear DATE NOT NULL,
        PRIMARY KEY (ProfessionalName)
    );

CREATE TABLESS
    T_Class (
        ClassName VARCHAR2(50) NOT NULL,
        ProfessionalName VARCHAR2(50) NOT NULL,
        EnrollmentYear DATE NOT NULL,
        PRIMARY KEY (ClassName),
        FOREIGN KEY (ProfessionalName) REFERENCES T_Professional (ProfessionalName)
    );