-- try/catch

BEGIN TRANSACTION

BEGIN TRY

Update Z SET z.emp_city='elizabeth'
FROM dbo.employees z

COMMIT TRANSACTION
END TRY
BEGIN CATCH

PRINT ERROR_LINE()
PRINT ERROR_MESSAGE()

ROLLBACK TRANSACTION
END CATCH

select emp_name
from employees;

-- get session id/info to use to kill something that has timed out (taking too long to process)
select
	r.session_id,
	r.status,
	r.command,
	r.cpu_time,
	r.total_elapsed_time,
	t.text
from sys.dm_exec_requests as r
	cross apply sys.dm_exec_sql_text(r.sql_handle) as t