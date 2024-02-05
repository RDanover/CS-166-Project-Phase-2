
--Entities
CREATE TABLE Airplane_Model (model_number CHAR(30) NOT NULL, type_of_fuel CHAR(30), airplane_weight FLOAT, seat_capacity INTEGER, PRIMARY KEY(model_number));
CREATE TABLE Airport_Employee (ssn CHAR(11) NOT NULL, union_membership_number CHAR(30) NOT NULL, PRIMARY KEY(ssn) );
CREATE TABLE Technician (technician_ssn CHAR(11) NOT NULL,last_name CHAR(30) NOT NULL, salary INTEGER, phone_number CHAR(11), home_address CHAR(46), PRIMARY KEY(technician_ssn), FOREIGN KEY(technician_ssn) REFERENCES Airport_Employee(ssn));
CREATE TABLE Air_Traffic_Controller (air_traffic_controller_ssn CHAR(11) NOT NULL, years_of_experience INTEGER, age INTEGER, PRIMARY KEY(air_traffic_controller_ssn_ssn), FOREIGN KEY(air_traffic_controller_ssn_ssn) REFERENCES Airport_Employee(ssn));
CREATE TABLE Air_Traffic_Controller_Exam (level_of_exam INTEGER NOT NULL, date_of_exam CHAR(30), exam_duration CHAR(30), PRIMARY KEY(level_of_exam) );
CREATE TABLE Airplane (registration_number CHAR(30) NOT NULL, model_number CHAR(30) NOT NULL,company_name CHAR(30), PRIMARY KEY(registration_number), FOREIGN KEY(model_number) REFERENCES Airplane_Model(model_number));
CREATE TABLE Airplane_Test (faa_number CHAR(30) NOT NULL, test_name CHAR(30), max_possible_score FLOAT, PRIMARY KEY(faa_number));

--Relationships: Tests, Can_fix, Has Passed 

CREATE TABLE Tests (registration_number CHAR(30) NOT NULL, faa_number CHAR(30) NOT NULL, technician_ssn CHAR(11) NOT NULL, number_of_hours INTEGER, date_of_test CHAR(30), score FLOAT,PRIMARY KEY(registration_number,faa_number), FOREIGN KEY(registration_number) REFERENCES Airplane(registration_number), FOREIGN KEY(faa_number) REFERENCES Airplane_Test(faa_number), FOREIGN KEY(technician_ssn) REFERENCES(technician_ssn));
CREATE TABLE Can_Fix (model_number CHAR(30) NOT NULL, technician_ssn CHAR(11), PRIMARY KEY(model_number,technician_ssn),FOREIGN KEY(model_number) REFERENCES Airplane_Model(model_number), FOREIGN KEY(technician_ssn) REFERENCES Technician(technician_ssn));
CREATE TABLE Has_Passed (air_traffic_controller_ssn CHAR(11) NOT NULL, level_of_exam INTEGER NOT NULL, PRIMARY KEY(air_traffic_controller_ssn,level_of_exam), FOREIGN KEY(air_traffic_controller_ssn) REFERENCES Air_Traffic_Controller(air_traffic_controller_ssn), FOREIGN KEY(level_of_exam) REFERENCES Air_Traffic_Controller_Exam(level_of_exam));