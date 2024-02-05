DROP TABLE IF EXISTS Professor CASCADE;
DROP TABLE IF EXISTS Dept CASCADE;
DROP TABLE IF EXISTS Project CASCADE;
DROP TABLE IF EXISTS Graduate CASCADE;
DROP TABLE IF EXISTS work_dept CASCADE;
DROP TABLE IF EXISTS works_in CASCADE;
DROP TABLE IF EXISTS work_proj CASCADE;
DROP TABLE IF EXISTS Musicians CASCADE;
DROP TABLE IF EXISTS Album CASCADE;
DROP TABLE IF EXISTS Songs CASCADE;
DROP TABLE IF EXISTS Instrument CASCADE;
DROP TABLE IF EXISTS Place CASCADE;
DROP TABLE IF EXISTS Home CASCADE;
DROP TABLE IF EXISTS Lives CASCADE;
DROP TABLE IF EXISTS Plays CASCADE;
DROP TABLE IF EXISTS Perform CASCADE;

--First Example

--Entities
CREATE TABLE Professor (ssn CHAR(11) NOT NULL,name CHAR(30) NOT NULL, age INTEGER, rank INTEGER, specialty CHAR(30), PRIMARY KEY(ssn));

CREATE TABLE Dept (dno CHAR(30) NOT NULL, ssn CHAR(11) NOT NULL, dname CHAR(3) NOT NULL, office CHAR(30), PRIMARY KEY (dno), FOREIGN KEY(ssn) REFERENCES Professor(ssn));

CREATE TABLE Project (pno CHAR(30) NOT NULL, ssn CHAR(30) NOT NULL,sponsor CHAR(30), start_date CHAR(30), end_date CHAR(30), budget INTEGER, PRIMARY KEY(pno), FOREIGN KEY(ssn) REFERENCES Professor(ssn));

--CREATE TABLE Graduate (gssn CHAR(11) NOT NULL, dno CHAR(30) NOT NULL, adv_ssn CHAR(11), name CHAR(30) NOT NULL, age INTEGER, deg_pg CHAR(30), PRIMARY KEY(gssn), FOREIGN KEY(dno) REFERENCES Dept(dno), FOREIGN KEY(adv_ssn) REFERENCES gssn);

CREATE TABLE Graduate (gssn CHAR(11) NOT NULL, dno CHAR(30) NOT NULL, adv_ssn CHAR(30) NULL,name CHAR(30) NOT NULL, age INTEGER, deg_pg CHAR(30), PRIMARY KEY(gssn), FOREIGN KEY(dno) REFERENCES Dept(dno));

ALTER TABLE Graduate ADD FOREIGN KEY (adv_ssn) REFERENCES Graduate(gssn); 
--Relationships
CREATE TABLE work_dept (ssn CHAR(11) NOT NULL, dno CHAR(30), time_pc INTEGER, PRIMARY KEY(ssn,dno), FOREIGN KEY(ssn) REFERENCES Professor(ssn), FOREIGN KEY(dno) REFERENCES Dept(dno));
CREATE TABLE works_in (ssn CHAR(11) NOT NULL, pno CHAR(30), PRIMARY KEY(ssn,pno), FOREIGN KEY(ssn) REFERENCES Professor(ssn), FOREIGN KEY(pno) REFERENCES Project(pno));
CREATE TABLE work_proj (pno CHAR(30) NOT NULL, gssn CHAR(30) NOT NULL,ssn CHAR(30) NOT NULL, since CHAR(30), PRIMARY KEY(pno,ssn), FOREIGN KEY (pno) REFERENCES Project(pno), FOREIGN KEY (gssn) REFERENCES Graduate(gssn), FOREIGN KEY(ssn) REFERENCES Professor(ssn));

-- Second Example 
--Entities
CREATE TABLE Musicians (ssn CHAR(11) NOT NULL, name CHAR(30) NOT NULL, PRIMARY KEY(ssn));

CREATE TABLE Album (album_identifier CHAR(30) NOT NULL, ssn CHAR(30) NOT NULL, title CHAR(30) NOT NULL, copyright_date CHAR(30), speed INTEGER, PRIMARY KEY(album_identifier), FOREIGN KEY(ssn) REFERENCES Musicians(ssn));

CREATE TABLE Songs (song_id CHAR(30) NOT NULL, album_identifier CHAR(3) NOT NULL, title CHAR(30) NOT NULL, suffix CHAR(30), PRIMARY KEY(song_id), FOREIGN KEY(album_identifier) REFERENCES Album(album_identifier));

CREATE TABLE Instrument (instrid CHAR(30) NOT NULL, dname CHAR(30) NOT NULL, key CHAR(30), PRIMARY KEY(instrid));

CREATE TABLE Place (address CHAR(46) NOT NULL, PRIMARY KEY(address));

CREATE TABLE Home (address CHAR(46) NOT NULL, phone_no CHAR(11) NOT NULL, PRIMARY KEY(address,phone_no), FOREIGN KEY(address) REFERENCES Place(address));

--relationships
CREATE TABLE Lives (ssn CHAR(11) NOT NULL, address CHAR(46) NOT NULL ,phone_no CHAR(11) NOT NULL, PRIMARY KEY(ssn, address, phone_no), FOREIGN KEY(ssn) REFERENCES Musicians(ssn), FOREIGN KEY(address,phone_no) REFERENCES Home(address,phone_no));

CREATE TABLE Plays (ssn CHAR(11) NOT NULL, instrid CHAR(30) NOT NULL, PRIMARY KEY(ssn,instrid), FOREIGN KEY(ssn) REFERENCES Musicians(ssn), FOREIGN KEY(instrid) REFERENCES Instrument(instrid));

CREATE TABLE Perform (ssn CHAR(11) NOT NULL, song_id CHAR(30) NOT NULL, PRIMARY KEY(ssn,song_id), FOREIGN KEY(ssn) REFERENCES Musicians(ssn), FOREIGN KEY(song_id) REFERENCES Songs(song_id));

