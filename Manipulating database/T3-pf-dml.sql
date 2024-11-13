/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T3-pf-dml.sql

--Student ID: 30531438
--Student Name: Manh Tung Vu

/* Comments for your marker:




*/

/*(a)*/
DROP SEQUENCE visit_id_seq;

CREATE SEQUENCE visit_id_seq START WITH 100 INCREMENT BY 10;

/*(b)*/
INSERT INTO VISIT VALUES (
    VISIT_ID_SEQ.NEXTVAL,
    TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI'),
    30,
    NULL,
    NULL,
    NULL,
    (
        SELECT ANIMAL_ID 
        FROM ANIMAL 
        WHERE UPPER(ANIMAL_NAME) = UPPER('Oreo') 
            AND OWNER_ID = (
                SELECT OWNER_ID 
                FROM OWNER 
                WHERE UPPER(OWNER_GIVENNAME) = UPPER('Jack') 
                AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES')
                )
    ),
    (
        SELECT VET_ID 
        FROM VET 
        WHERE UPPER(VET_FAMILYNAME) = 'KOWALSKI' 
            AND UPPER(VET_GIVENNAME) = 'ANNA'
    ),
    3,
    NULL
);

COMMIT;

/*(c)*/

INSERT INTO VISIT_SERVICE (VISIT_ID, SERVICE_CODE, VISIT_SERVICE_LINECOST)
VALUES (
    (SELECT VISIT_ID
     FROM VISIT
     WHERE VISIT_DATE_TIME = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI')
     AND ANIMAL_ID = (SELECT ANIMAL_ID
                      FROM ANIMAL
                      WHERE UPPER(ANIMAL_NAME) = UPPER('Oreo')
                      AND OWNER_ID = (SELECT OWNER_ID
                                      FROM OWNER
                                      WHERE UPPER(OWNER_GIVENNAME) = UPPER('Jack')
                                      AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES')
                                     )
                     )
    ),
    (SELECT SERVICE_CODE 
     FROM SERVICE 
     WHERE UPPER(SERVICE_DESC) LIKE '%EAR INFECTION%'
    ),
    (SELECT SERVICE_STD_COST 
     FROM SERVICE 
     WHERE UPPER(SERVICE_DESC) LIKE '%EAR INFECTION%'
    )
);


INSERT INTO VISIT_DRUG (VISIT_ID, DRUG_ID, VISIT_DRUG_DOSE, VISIT_DRUG_FREQUENCY, VISIT_DRUG_QTYSUPPLIED, VISIT_DRUG_LINECOST)
VALUES (
    (SELECT VISIT_ID
     FROM VISIT
     WHERE VISIT_DATE_TIME = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI')
     AND ANIMAL_ID = (SELECT ANIMAL_ID
                      FROM ANIMAL
                      WHERE UPPER(ANIMAL_NAME) = UPPER('Oreo')
                      AND OWNER_ID = (SELECT OWNER_ID
                                      FROM OWNER
                                      WHERE UPPER(OWNER_GIVENNAME) = UPPER('Jack')
                                      AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES')
                                     )
                     )
    ),
    (SELECT DRUG_ID 
     FROM DRUG 
     WHERE UPPER(DRUG_NAME) = UPPER('CLOTRIMAZOLE')
    ),
    '0.1 mL per kg',
    '2 drops twice daily',
    1,
    (SELECT DRUG_STD_COST 
     FROM DRUG 
     WHERE UPPER(DRUG_NAME) = UPPER('CLOTRIMAZOLE')
    )
);

UPDATE VISIT
SET
    VISIT_NOTES = 'Ear infection',
    VISIT_WEIGHT = 10,
    VISIT_TOTAL_COST = ((
        SELECT
            SUM(VISIT_SERVICE_LINECOST)
        FROM
            VISIT_SERVICE
        WHERE
            VISIT_ID = (
                SELECT
                    VISIT_ID
                FROM
                    VISIT
                WHERE
                    VISIT_DATE_TIME = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI')
                    AND ANIMAL_ID = (
                        SELECT
                            ANIMAL_ID
                        FROM
                            ANIMAL
                        WHERE
                            UPPER(ANIMAL_NAME) = UPPER('Oreo')
                            AND OWNER_ID = (
                                SELECT
                                    OWNER_ID
                                FROM
                                    OWNER
                                WHERE
                                    UPPER(OWNER_GIVENNAME) = UPPER('Jack')
                                    AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES')
                            )
                    )
            )
        GROUP BY
            VISIT_ID
    ) + (
        SELECT
            SUM(VISIT_DRUG_LINECOST)
        FROM
            VISIT_DRUG
        WHERE
            VISIT_ID = (
                SELECT
                    VISIT_ID
                FROM
                    VISIT
                WHERE
                    VISIT_DATE_TIME = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI')
                    AND ANIMAL_ID = (
                        SELECT
                            ANIMAL_ID
                        FROM
                            ANIMAL
                        WHERE
                            UPPER(ANIMAL_NAME) = UPPER('Oreo')
                            AND OWNER_ID = (
                                SELECT
                                    OWNER_ID
                                FROM
                                    OWNER
                                WHERE
                                    UPPER(OWNER_GIVENNAME) = UPPER('Jack')
                                    AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES')
                            )
                    )
            )
        GROUP BY
            VISIT_ID
    ))
WHERE
    VISIT_ID = (
        SELECT
            VISIT_ID
        FROM
            VISIT
        WHERE
            VISIT_DATE_TIME = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI')
            AND ANIMAL_ID = (
                SELECT
                    ANIMAL_ID
                FROM
                    ANIMAL
                WHERE
                    UPPER(ANIMAL_NAME) = UPPER('Oreo')
                    AND OWNER_ID = (
                        SELECT
                            OWNER_ID
                        FROM
                            OWNER
                        WHERE
                            UPPER(OWNER_GIVENNAME) = UPPER('Jack')
                            AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES')
                    )
            )
    );

COMMIT;

--Schedule a follow up
INSERT INTO VISIT VALUES (
    VISIT_ID_SEQ.NEXTVAL,
    TO_DATE('2024-05-26 14:00', 'YYYY-MM-DD HH24-MI'),
    30,
    NULL,
    NULL,
    NULL,
    (SELECT ANIMAL_ID FROM ANIMAL WHERE UPPER(ANIMAL_NAME) = UPPER('Oreo') AND OWNER_ID = (SELECT OWNER_ID FROM OWNER WHERE UPPER(OWNER_GIVENNAME) = UPPER('Jack') AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES'))),
    (SELECT VET_ID FROM VET WHERE UPPER(VET_FAMILYNAME) = 'KOWALSKI' AND UPPER(VET_GIVENNAME) = 'ANNA'),
    3,
    (SELECT VISIT_ID FROM VISIT WHERE VISIT_DATE_TIME = TO_DATE('2024-05-19 14:00', 'YYYY-MM-DD HH24:MI') AND ANIMAL_ID = (SELECT ANIMAL_ID FROM ANIMAL WHERE UPPER(ANIMAL_NAME) = UPPER('Oreo') AND OWNER_ID = (SELECT OWNER_ID FROM OWNER WHERE UPPER(OWNER_GIVENNAME) = UPPER('Jack') AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES'))))
);
 /*(d)*/

DELETE FROM VISIT
WHERE VISIT_DATE_TIME = TO_DATE('2024-05-26 14:00', 'YYYY-MM-DD HH24:MI')
  AND ANIMAL_ID = (SELECT ANIMAL_ID FROM ANIMAL WHERE UPPER(ANIMAL_NAME) = UPPER('Oreo') AND OWNER_ID = (SELECT OWNER_ID FROM OWNER WHERE UPPER(OWNER_GIVENNAME) = UPPER('Jack') AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES')));
