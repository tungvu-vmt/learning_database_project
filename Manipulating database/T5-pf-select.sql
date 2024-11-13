/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-pf-select.sql

--Student ID: 30531438
--Student Name: Manh Tung Vu


/* Comments for your marker:




*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
  clinic_id        AS clinicid,
  vet_id           AS vetid,
  vetname,
  ishead,
  animaltype,
  numberappts,
  lpad(to_char(round(100.0 * numberappts / total_appts, 1), '999.0')
       || '%', 20) AS percentageappts
FROM
  (
    SELECT
      v.clinic_id,
      v.vet_id,
      v.vet_givenname
      || ' '
      || v.vet_familyname  AS vetname,
      CASE
        WHEN v.vet_id = c.vet_id THEN
          'HEAD VET'
      END                  AS ishead,
      at.atype_description AS animaltype,
      COUNT(vs.visit_id)   AS numberappts,
      (
        SELECT
          SUM(COUNT(visit_id))
        FROM
          visit       vs2
          JOIN vet v2
          ON vs2.vet_id = v2.vet_id
          JOIN animal a2
          ON vs2.animal_id = a2.animal_id
          JOIN animal_type at2
          ON a2.atype_id = at2.atype_id
        WHERE
          at2.atype_description IN ('Dog', 'Cat')
          AND v2.clinic_id = v.clinic_id
        GROUP BY
          v2.clinic_id
      ) AS total_appts
    FROM
      visit       vs
      JOIN vet v
      ON vs.vet_id = v.vet_id
      JOIN animal a
      ON vs.animal_id = a.animal_id
      JOIN animal_type at
      ON a.atype_id = at.atype_id
      JOIN clinic c
      ON vs.clinic_id = c.clinic_id
    WHERE
      at.atype_description IN ('Dog', 'Cat')
    GROUP BY
      v.clinic_id,
      v.vet_id,
      v.vet_givenname,
      v.vet_familyname,
      CASE
        WHEN v.vet_id = c.vet_id THEN
          'HEAD VET'
      END,
      at.atype_description
  )
ORDER BY
  clinic_id,
  CASE
    WHEN ishead = 'HEAD VET' THEN
      0
    ELSE
      1
  END,
  vet_id,
  animaltype;

/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Pets First wishes to analyse visit service charges made by a vet during a visit. They
-- would like to determine, for a particular service code, which vets charged more than the
-- average charged for that service code across all visits.
-- For services where the vet charged more than the average charge, the output should
-- show the service code, service description, the vet ID, the vet given and family names,
-- the clinic ID and the clinic name, the visit ID, the visit date and time and the actual
-- charge the vet made.

SELECT
  s.service_code,
  s.service_desc,
  vt.vet_id,
  vt.vet_givenname,
  vt.vet_familyname,
  c.clinic_id,
  c.clinic_name,
  vs.visit_id,
  to_char(v.visit_date_time, 'dd-mon-yyyy hh:mi AM') as visitdatetime,
  vs.visit_service_linecost
FROM
  visit_service vs
  JOIN visit v
  ON vs.visit_id = v.visit_id
  JOIN vet vt
  ON v.vet_id = vt.vet_id
  JOIN clinic c
  ON v.clinic_id = c.clinic_id
  JOIN service s
  ON vs.service_code = s.service_code
WHERE
  vs.visit_service_linecost > (
    SELECT
      AVG(visit_service_linecost)
    FROM
      visit_service
    WHERE
      service_code = s.service_code
  )
ORDER BY
  s.service_code;