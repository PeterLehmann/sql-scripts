select r.status, r.command, r.start_time, r.wait_time, s.login_name, s.host_name, t.text, p.query_plan from sys.dm_exec_requests r 
inner join sys.dm_exec_sessions s on s.session_id = r.session_id
cross apply sys.dm_exec_sql_text(r.sql_handle) t
cross apply sys.dm_exec_query_plan(r.plan_handle) p
where r.database_id = db_id()
