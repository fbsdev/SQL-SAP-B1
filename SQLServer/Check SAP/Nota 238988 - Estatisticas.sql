-- User Defined Statistics check
-- Scripts de teste da nota 238988
-- https://launchpad.support.sap.com/#/notes/2358988
--

SELECT t.name, st.*
FROM
    sys.stats AS st
    INNER JOIN sys.tables AS t
        ON st.object_id = t.object_id
WHERE
    st.user_created = 1

/*
-- apagando as estatisticas extras.
SELECT st.*, ('DROP STATISTICS [' + t.name + '].[' + st.name + ']') as apagar
FROM
    sys.stats AS st
    INNER JOIN sys.tables AS t
        ON st.object_id = t.object_id
WHERE
    st.user_created = 1
*/

