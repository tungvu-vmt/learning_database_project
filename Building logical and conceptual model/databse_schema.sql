-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-05-01 23:43:28 AEST
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c
-- Group G291
-- Group member: Manh Tung Vu, Mo Feng, Xingyu Cui

set echo on 
spool pat_schema_output.txt

DROP TABLE country CASCADE CONSTRAINTS;

DROP TABLE driver CASCADE CONSTRAINTS;

DROP TABLE driver_language CASCADE CONSTRAINTS;

DROP TABLE driver_training CASCADE CONSTRAINTS;

DROP TABLE language CASCADE CONSTRAINTS;

DROP TABLE location CASCADE CONSTRAINTS;

DROP TABLE official CASCADE CONSTRAINTS;

DROP TABLE training CASCADE CONSTRAINTS;

DROP TABLE trip CASCADE CONSTRAINTS;

DROP TABLE vehicle CASCADE CONSTRAINTS;

DROP TABLE vehicle_feature CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE country (
    country_code       CHAR(3 CHAR) NOT NULL,
    country_name       VARCHAR2(30 CHAR) NOT NULL,
    country_population NUMBER(10) NOT NULL
);

COMMENT ON COLUMN country.country_code IS
    'National Olympic Committee code';

COMMENT ON COLUMN country.country_name IS
    'country''s name';

COMMENT ON COLUMN country.country_population IS
    'country''s population';

ALTER TABLE country ADD CONSTRAINT country_pk PRIMARY KEY ( country_code );

CREATE TABLE driver (
    driver_id                CHAR(10 CHAR) NOT NULL,
    driver_gname             VARCHAR2(30 CHAR) NOT NULL,
    driver_fname             VARCHAR2(30) NOT NULL,
    driver_lice_num          CHAR(18 CHAR) NOT NULL,
    driver_birthdate         DATE NOT NULL,
    driver_level_of_security CHAR(1 CHAR) DEFAULT 'R' NOT NULL,
    driver_flag              CHAR(1 CHAR) DEFAULT 'N' NOT NULL,
    driver_num_of_training   NUMBER(2) NOT NULL
);

ALTER TABLE driver
    ADD CONSTRAINT driver_security_chk CHECK ( driver_level_of_security IN ( 'F', 'R' ) );

ALTER TABLE driver
    ADD CONSTRAINT driver_flag_suspension_chk CHECK ( driver_flag IN ( 'N', 'Y' ) );

COMMENT ON COLUMN driver.driver_id IS
    'unique driver id';

COMMENT ON COLUMN driver.driver_gname IS
    'driver''s given name';

COMMENT ON COLUMN driver.driver_fname IS
    'driver''s family name';

COMMENT ON COLUMN driver.driver_lice_num IS
    '18 character-long licesence number';

COMMENT ON COLUMN driver.driver_birthdate IS
    'driver''s date of birth';

COMMENT ON COLUMN driver.driver_level_of_security IS
    'driver''s level of security, F: Full, R: Restricted';

COMMENT ON COLUMN driver.driver_flag IS
    'driver''s flag for suspension, Y: Suspended, N: Not suspended, default is N';

COMMENT ON COLUMN driver.driver_num_of_training IS
    'driver''s total number of training completed';

ALTER TABLE driver ADD CONSTRAINT driver_pk PRIMARY KEY ( driver_id );

CREATE TABLE driver_language (
    driver_id     CHAR(10 CHAR) NOT NULL,
    language_code CHAR(2 CHAR) NOT NULL
);

COMMENT ON COLUMN driver_language.driver_id IS
    'unique driver id';

COMMENT ON COLUMN driver_language.language_code IS
    'language code';

ALTER TABLE driver_language ADD CONSTRAINT driver_language_pk PRIMARY KEY ( driver_id,
                                                                            language_code );

CREATE TABLE driver_training (
    dt_no                    NUMBER(4) NOT NULL,
    driver_id                CHAR(10 CHAR) NOT NULL,
    training_code            CHAR(10 CHAR) NOT NULL,
    driver_training_datetime DATE NOT NULL
);

COMMENT ON COLUMN driver_training.driver_id IS
    'unique driver id';

COMMENT ON COLUMN driver_training.training_code IS
    'training code';

COMMENT ON COLUMN driver_training.driver_training_datetime IS
    'date and time when a driver completes a training module';

ALTER TABLE driver_training ADD CONSTRAINT driver_training_pk PRIMARY KEY ( dt_no );

ALTER TABLE driver_training
    ADD CONSTRAINT driver_training_nk UNIQUE ( driver_training_datetime,
                                               driver_id,
                                               training_code );

CREATE TABLE language (
    language_code CHAR(2 CHAR) NOT NULL,
    language_name VARCHAR2(30 CHAR) NOT NULL
);

COMMENT ON COLUMN language.language_code IS
    'language code';

COMMENT ON COLUMN language.language_name IS
    'language name';

ALTER TABLE language ADD CONSTRAINT language_pk PRIMARY KEY ( language_code );

CREATE TABLE location (
    loc_id      NUMBER(2) NOT NULL,
    loc_name    VARCHAR2(50 CHAR) NOT NULL,
    loc_type    VARCHAR2(30 CHAR) NOT NULL,
    loc_address VARCHAR2(100 CHAR) NOT NULL
);

COMMENT ON COLUMN location.loc_id IS
    'location id';

COMMENT ON COLUMN location.loc_name IS
    'location''s name';

COMMENT ON COLUMN location.loc_type IS
    'location type';

COMMENT ON COLUMN location.loc_address IS
    'location address';

ALTER TABLE location ADD CONSTRAINT location_pk PRIMARY KEY ( loc_id );

CREATE TABLE official (
    official_id    CHAR(7 CHAR) NOT NULL,
    official_fname VARCHAR2(30 CHAR) NOT NULL,
    official_gname VARCHAR2(30 CHAR) NOT NULL,
    official_role  VARCHAR2(30 CHAR) NOT NULL,
    country_code   CHAR(3 CHAR) NOT NULL,
    manager_id     CHAR(7 CHAR)
);

COMMENT ON COLUMN official.official_id IS
    'official''s olympic id';

COMMENT ON COLUMN official.official_fname IS
    'official''s family name';

COMMENT ON COLUMN official.official_gname IS
    'official''s given name';

COMMENT ON COLUMN official.official_role IS
    'official''s role';

COMMENT ON COLUMN official.country_code IS
    'National Olympic Committee code';

COMMENT ON COLUMN official.manager_id IS
    'official''s olympic id';

ALTER TABLE official ADD CONSTRAINT official_pk PRIMARY KEY ( official_id );

CREATE TABLE training (
    training_code          CHAR(10 CHAR) NOT NULL,
    training_name          VARCHAR2(50 CHAR) NOT NULL,
    training_description   VARCHAR2(100 CHAR) NOT NULL,
    training_expiry_period NUMBER(2),
    training_length        NUMBER(1) NOT NULL
);

COMMENT ON COLUMN training.training_code IS
    'training code';

COMMENT ON COLUMN training.training_name IS
    'training module''s name';

COMMENT ON COLUMN training.training_description IS
    'training module''s description';

COMMENT ON COLUMN training.training_expiry_period IS
    'training module''s expiry period';

COMMENT ON COLUMN training.training_length IS
    'training module''s length';

ALTER TABLE training ADD CONSTRAINT training_pk PRIMARY KEY ( training_code );

CREATE TABLE trip (
    trip_id                    NUMBER(4) NOT NULL,
    trip_num_of_psng           NUMBER(2) NOT NULL,
    trip_intended_pickup_time  DATE NOT NULL,
    trip_actual_pickup_time    DATE,
    trip_intended_dropoff_time DATE NOT NULL,
    trip_actual_dropoff_time   DATE,
    driver_id                  CHAR(10 CHAR) NOT NULL,
    official_id                CHAR(7 CHAR) NOT NULL,
    pickup_loc_id              NUMBER(2) NOT NULL,
    dropoff_loc_id             NUMBER(2) NOT NULL,
    language_code              CHAR(2 CHAR) NOT NULL,
    vehicle_no                 CHAR(17 CHAR) NOT NULL
);

COMMENT ON COLUMN trip.trip_id IS
    'trip id';

COMMENT ON COLUMN trip.trip_num_of_psng IS
    'number of passengers on the trip';

COMMENT ON COLUMN trip.trip_intended_pickup_time IS
    'trip intended pick up date and time';

COMMENT ON COLUMN trip.trip_actual_pickup_time IS
    'Actual pick-up time of trip';

COMMENT ON COLUMN trip.trip_intended_dropoff_time IS
    'Intended drop-off time of trip';

COMMENT ON COLUMN trip.trip_actual_dropoff_time IS
    'trip actual dropoff time';

COMMENT ON COLUMN trip.driver_id IS
    'unique driver id';

COMMENT ON COLUMN trip.official_id IS
    'official''s olympic id';

COMMENT ON COLUMN trip.pickup_loc_id IS
    'location id';

COMMENT ON COLUMN trip.dropoff_loc_id IS
    'location id';

COMMENT ON COLUMN trip.language_code IS
    'language code';

COMMENT ON COLUMN trip.vehicle_no IS
    '17 character-long vehicle number';

ALTER TABLE trip ADD CONSTRAINT trip_pk PRIMARY KEY ( trip_id );

CREATE TABLE vehicle (
    vehicle_no          CHAR(17 CHAR) NOT NULL,
    vehicle_plate       CHAR(7 CHAR) NOT NULL,
    vehicle_make        VARCHAR2(20 CHAR) NOT NULL,
    vehicle_model       VARCHAR2(30 CHAR) NOT NULL,
    vehicle_odometer    NUMBER(6) NOT NULL,
    vehicle_num_of_psng NUMBER(2) NOT NULL,
    vehicle_year        DATE NOT NULL
);

COMMENT ON COLUMN vehicle.vehicle_no IS
    '17 character-long vehicle number';

COMMENT ON COLUMN vehicle.vehicle_plate IS
    '7 character-long vehicle plate';

COMMENT ON COLUMN vehicle.vehicle_make IS
    'vehicle''s manufacturer';

COMMENT ON COLUMN vehicle.vehicle_model IS
    'vehicle model';

COMMENT ON COLUMN vehicle.vehicle_odometer IS
    'vehicle odometer reading';

COMMENT ON COLUMN vehicle.vehicle_num_of_psng IS
    'vehicle maximum carrying capacity';

COMMENT ON COLUMN vehicle.vehicle_year IS
    'vehicle year of manufacture';

ALTER TABLE vehicle ADD CONSTRAINT vehicle_pk PRIMARY KEY ( vehicle_no );

CREATE TABLE vehicle_feature (
    vehicle_no CHAR(17 CHAR) NOT NULL,
    vf_name    VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN vehicle_feature.vehicle_no IS
    '17 character-long vehicle number';

ALTER TABLE vehicle_feature ADD CONSTRAINT vehicle_feature_pk PRIMARY KEY ( vehicle_no,
                                                                            vf_name );

ALTER TABLE official
    ADD CONSTRAINT country_has_member_official FOREIGN KEY ( country_code )
        REFERENCES country ( country_code );

ALTER TABLE trip
    ADD CONSTRAINT driver_drive_trip FOREIGN KEY ( driver_id )
        REFERENCES driver ( driver_id );

ALTER TABLE driver_training
    ADD CONSTRAINT driver_enrolls_in_training FOREIGN KEY ( driver_id )
        REFERENCES driver ( driver_id );

ALTER TABLE driver_language
    ADD CONSTRAINT driver_speaks_language FOREIGN KEY ( driver_id )
        REFERENCES driver ( driver_id );

ALTER TABLE driver_language
    ADD CONSTRAINT language_is_spoken_by_driver FOREIGN KEY ( language_code )
        REFERENCES language ( language_code );

ALTER TABLE trip
    ADD CONSTRAINT language_trip FOREIGN KEY ( language_code )
        REFERENCES language ( language_code );

ALTER TABLE trip
    ADD CONSTRAINT location_dropoff_trip FOREIGN KEY ( dropoff_loc_id )
        REFERENCES location ( loc_id );

ALTER TABLE trip
    ADD CONSTRAINT location_pickup_trip FOREIGN KEY ( pickup_loc_id )
        REFERENCES location ( loc_id );

ALTER TABLE trip
    ADD CONSTRAINT official FOREIGN KEY ( official_id )
        REFERENCES official ( official_id );

ALTER TABLE official
    ADD CONSTRAINT official_official FOREIGN KEY ( manager_id )
        REFERENCES official ( official_id );

ALTER TABLE driver_training
    ADD CONSTRAINT training_completedby_driver FOREIGN KEY ( training_code )
        REFERENCES training ( training_code );

ALTER TABLE vehicle_feature
    ADD CONSTRAINT vehicle_has_feature FOREIGN KEY ( vehicle_no )
        REFERENCES vehicle ( vehicle_no );

ALTER TABLE trip
    ADD CONSTRAINT vehicle_is_used_in_trip FOREIGN KEY ( vehicle_no )
        REFERENCES vehicle ( vehicle_no );

set echo off
spool off

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
