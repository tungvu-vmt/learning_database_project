/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-pf-insert.sql

--Student ID: 30531438
--Student Name: Manh Tung Vu

/* Comments for your marker:




*/

--------------------------------------
--INSERT INTO visit
--------------------------------------
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id)
VALUES (1, TO_DATE('2024-05-01 10:00', 'YYYY-MM-DD HH24:MI'), 60, 'Annual checkup, prescribed worm prevention', 25.5, 1, 1001, 1);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id)
VALUES (2, TO_DATE('2024-05-02 14:30', 'YYYY-MM-DD HH24:MI'), 45, 'Vaccinations and microchip', 4.2, 5, 1004, 3);

--initial visit for ear infection
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id)
VALUES (3, TO_DATE('2024-05-02 14:30', 'YYYY-MM-DD HH24:MI'), 45, 'Ear infection', 6.9, 9, 1002, 4);

--Follow_up 1
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id, from_visit_id)
VALUES (4, TO_DATE('2024-05-10 09:15', 'YYYY-MM-DD HH24:MI'), 30, 'Follow-up for ear infection', 6.8, 9, 1002, 4, 3);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id)
VALUES (5, TO_DATE('2024-05-04 16:45', 'YYYY-MM-DD HH24:MI'), 75, 'Dental cleaning with anesthetic', 32.7, 10, 1009, 5);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id)
VALUES (6, TO_DATE('2024-05-05 11:30', 'YYYY-MM-DD HH24:MI'), 45, 'Routine checkup and vaccinations', 9.1, 11, 1006, 1);

--initial visit for surgery
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id)
VALUES (7, TO_DATE('2024-05-05 15:00', 'YYYY-MM-DD HH24:MI'), 60, 'Surgery', 7.5, 6, 1009, 5);

--Follow-up 2
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id, from_visit_id)
VALUES (8, TO_DATE('2024-05-20 15:00', 'YYYY-MM-DD HH24:MI'), 60, 'Follow-up after surgery', 7.5, 6, 1009, 5, 7);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id)
VALUES (9, TO_DATE('2024-06-01 09:00', 'YYYY-MM-DD HH24:MI'), 45, 'Scheduled puppy vaccines', 3.0, 12, 1003, 2);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, animal_id, vet_id, clinic_id)
VALUES (10, TO_DATE('2024-06-15 13:30', 'YYYY-MM-DD HH24:MI'), 30, 'Scheduled senior pet wellness exam', 11.2, 3, 1006, 1);

--Incomplete visit 1
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, animal_id, vet_id, clinic_id)
VALUES (11, TO_DATE('2024-07-01 16:00', 'YYYY-MM-DD HH24:MI'), 60, NULL, 4, 1007, 5);

--Incomplete visit 2
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, animal_id, vet_id, clinic_id)
VALUES (12, TO_DATE('2024-04-15 10:30', 'YYYY-MM-DD HH24:MI'), 45, NULL, 8, 1002, 4);

COMMIT;

--------------------------------------
--INSERT INTO visit_service
--------------------------------------
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (1, 'S011', 95.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (1, 'S007', 40.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (2, 'S002', 45.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (2, 'S003', 75.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (3, 'S010', 80.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (4, 'S010', 85.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (5, 'S006', 70.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (5, 'S005', 120.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (6, 'S001', 60.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (6, 'S002', 40.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (7, 'S014', 200.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (8, 'S001', 65.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (9, 'S002', 40.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (9, 'S018', 120.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (10, 'S011', 100.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (10, 'S017', 50.00);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
VALUES (10, 'S019', 70.00);

COMMIT;

--------------------------------------
--INSERT INTO visit_drug
--------------------------------------
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (1, 107, '0.1mg/kg', 'Monthly', 6, 16.00 * 6);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (3, 110, '2 drops', 'Twice daily 5 days', 1, 30.00);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (4, 110, '2 drops', 'Twice daily 10 days', 1, 30.00);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (5, 105, '0.2ml/kg', 1, 50.00);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (5, 114, '0.01mg/kg', 1, 14.00);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (6, 102, '1 dose', 1, 99.99);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (7, 105, '0.15ml/kg', 1, 50.00);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (7, 101, '5mg/kg twice daily', 5, 12.00 * 5);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (8, 101, '5mg/kg twice daily', 5, 12.00 * 5);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (9, 102, '1 vial', 1, 99.99);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (10, 117, '1 tablet daily', '30 days', 30, 30 * 1.5);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
VALUES (10, 111, '1 tablet daily', '30 days', 30, 30 * 1.2);

COMMIT;


--Update total cost for each visit
UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 1), 0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 1), 0)
WHERE
    visit_id = 1;

UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 2), 0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 2), 0)
WHERE
    visit_id = 2;

UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 3), 0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 3), 0)
WHERE
    visit_id = 3;

UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 4), 0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 4), 0)
WHERE
    visit_id = 4;

UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 5), 0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 5), 0)
WHERE
    visit_id = 5;

UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 6),0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 6), 0)
WHERE
    visit_id = 6;

UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 7), 0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 7), 0)
WHERE
    visit_id = 7;

UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 8),0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 8), 0)
WHERE
    visit_id = 8;

UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 9), 0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 9), 0)
WHERE
    visit_id = 9;

UPDATE visit 
SET 
    visit_total_cost = NVL((select sum(visit_service_linecost) from visit_service where visit_id = 10), 0) + NVL((select sum(visit_drug_linecost) from visit_drug where visit_id = 10), 0)
WHERE
    visit_id = 10;

COMMIT;