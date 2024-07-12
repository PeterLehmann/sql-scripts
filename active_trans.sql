select db_name(s.database_id), * from sys.dm_tran_active_snapshot_database_transactions t 
inner join sys.dm_exec_sessions s on t.session_id = s.session_id

