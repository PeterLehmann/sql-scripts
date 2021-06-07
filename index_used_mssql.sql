SELECT
    s.name AS Schema_Name,
    objects.name AS Table_name,
    indexes.name AS Index_name,
    dm_db_index_usage_stats.user_seeks,
    dm_db_index_usage_stats.user_scans,
    dm_db_index_usage_stats.user_updates,
	dm_db_index_usage_stats.last_user_seek, 
	dm_db_index_usage_stats.last_user_scan,
	dm_db_index_usage_stats.last_user_update
FROM
    sys.dm_db_index_usage_stats
    INNER JOIN sys.objects ON dm_db_index_usage_stats.OBJECT_ID = objects.OBJECT_ID
    INNER JOIN sys.indexes ON indexes.index_id = dm_db_index_usage_stats.index_id AND dm_db_index_usage_stats.OBJECT_ID = indexes.OBJECT_ID
	inner join sys.schemas s on objects.schema_id = s.schema_id
WHERE
    indexes.is_primary_key = 0 -- This condition excludes primary key constarint
    AND
    indexes. is_unique = 0 -- This condition excludes unique key constarint
	AND indexes.name is not null
ORDER BY
	Schema_Name,
    Table_name,
    dm_db_index_usage_stats.user_updates DESC