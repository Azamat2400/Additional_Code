SELECT 
    username, 
    default_tablespace, 
    created "YARATILISH SANASI", 
    expiry_date "TUGASH SANASI",
    last_login,
    profile, 
    authentication_type
FROM
    dba_users
WHERE 
    account_status = 'OPEN';