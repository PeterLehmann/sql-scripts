select db_name(r.database_id), r.percent_complete, r.wait_type, r.wait_time, r.wait_resource, r.command, s.login_name, s.host_name,  * from sys.dm_exec_requests r 
inner join sys.dm_exec_sessions s on r.session_id = s.session_id 
where r.status not in ('sleeping', 'background')
and r.session_id <> @@SPID
