SELECT
    username,
    sid,
    serial#,
    status,
    state,
    to_char(logon_time, 'MONdd hh24:mi') AS "Logon Time"
FROM
    v$session
WHERE
    type = 'USER'
    AND username = user
    AND upper(osuser)!= 'ORACLE'
ORDER BY
    "Logon Time";

DECLARE
    sid     NUMBER;
    serial# NUMBER;
    CURSOR INACTIVE_SESSIONS IS
    SELECT
        SID,
        SERIAL#
    FROM
        V$SESSION
    WHERE
        TYPE = 'USER'
        AND USERNAME = USER
        AND UPPER(OSUSER) != 'ORACLE'
        AND STATUS = 'INACTIVE';
BEGIN
    OPEN INACTIVE_SESSIONS;
    LOOP
        FETCH INACTIVE_SESSIONS INTO SID, SERIAL#;
        EXIT WHEN INACTIVE_SESSIONS%NOTFOUND;
        KILL_OWN_SESSION(SID, SERIAL#);
    END LOOP;

    CLOSE INACTIVE_SESSIONS;
END;

-- SELECT
--     ANIMAL_ID
-- FROM
--     ANIMAL
-- WHERE
--     UPPER(ANIMAL_NAME) = UPPER('Oreo')
--     AND OWNER_ID = (
--         SELECT
--             OWNER_ID
--         FROM
--             OWNER
--         WHERE
--             UPPER(OWNER_GIVENNAME) = UPPER('Jack')
--             AND UPPER(OWNER_FAMILYNAME) = UPPER('JONES')
--     );

-- SELECT *
-- FROM ANIMAL;

-- SELECT *
-- FROM OWNER;

-- SELECT * FROM VISIT WHERE visit_id = 100;

-- SELECT * FROM VISIT_SERVICE WHERE visit_id = 100;

-- SELECT * FROM VISIT_DRUG WHERE visit_id = 100;

-- DESC visit;

-- SELECT * FROM visit;

-- SELECT * FROM service;