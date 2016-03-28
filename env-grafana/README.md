# Docker-grafana

Build a container (http://grafana.org/)

### Building

```
docker build -t grafana .
```

### Running
```
docker run -d --name grafana -p 3000:3000 grafana
```

If everything works as expected then you can check the logs
```
2016/03/28 12:04:17 [I] Starting Grafana
2016/03/28 12:04:17 [I] Version: master, Commit: NA, Build date: 1970-01-01 00:00:00 +0000 UTC
2016/03/28 12:04:17 [I] Configuration Info
Config files:
  [0]: /usr/share/grafana/conf/defaults.ini
  [1]: /usr/share/grafana/conf/defaults.ini
Paths:
  home: /usr/share/grafana
  data: /usr/share/grafana/data
  logs: /usr/share/grafana/data/log

2016/03/28 12:04:17 [I] Database: sqlite3
2016/03/28 12:04:17 [I] Migrator: Starting DB migration
2016/03/28 12:04:17 [I] Migrator: exec migration id: create migration_log table
2016/03/28 12:04:17 [I] Migrator: exec migration id: create user table
2016/03/28 12:04:17 [I] Migrator: exec migration id: add unique index user.login
2016/03/28 12:04:18 [I] Migrator: exec migration id: add unique index user.email
2016/03/28 12:04:18 [I] Migrator: exec migration id: drop index UQE_user_login - v1
2016/03/28 12:04:18 [I] Migrator: exec migration id: drop index UQE_user_email - v1
2016/03/28 12:04:19 [I] Migrator: exec migration id: Rename table user to user_v1 - v1
2016/03/28 12:04:19 [I] Migrator: exec migration id: create user table v2
2016/03/28 12:04:19 [I] Migrator: exec migration id: create index UQE_user_login - v2
2016/03/28 12:04:20 [I] Migrator: exec migration id: create index UQE_user_email - v2
2016/03/28 12:04:20 [I] Migrator: exec migration id: copy data_source v1 to v2
2016/03/28 12:04:21 [I] Migrator: exec migration id: Drop old table user_v1
2016/03/28 12:04:21 [I] Migrator: exec migration id: create temp user table v1-7
2016/03/28 12:04:21 [I] Migrator: exec migration id: create index IDX_temp_user_email - v1-7
2016/03/28 12:04:21 [I] Migrator: exec migration id: create index IDX_temp_user_org_id - v1-7
2016/03/28 12:04:22 [I] Migrator: exec migration id: create index IDX_temp_user_code - v1-7
2016/03/28 12:04:22 [I] Migrator: exec migration id: create index IDX_temp_user_status - v1-7
2016/03/28 12:04:23 [I] Migrator: exec migration id: create star table
2016/03/28 12:04:23 [I] Migrator: exec migration id: add unique index star.user_id_dashboard_id
2016/03/28 12:04:24 [I] Migrator: exec migration id: create org table v1
2016/03/28 12:04:24 [I] Migrator: exec migration id: create index UQE_org_name - v1
2016/03/28 12:04:24 [I] Migrator: exec migration id: create org_user table v1
2016/03/28 12:04:25 [I] Migrator: exec migration id: create index IDX_org_user_org_id - v1
2016/03/28 12:04:25 [I] Migrator: exec migration id: create index UQE_org_user_org_id_user_id - v1
2016/03/28 12:04:26 [I] Migrator: exec migration id: copy data account to org
2016/03/28 12:04:26 [I] Migrator: skipping migration id: copy data account to org, condition not fulfilled
2016/03/28 12:04:26 [I] Migrator: exec migration id: copy data account_user to org_user
2016/03/28 12:04:26 [I] Migrator: skipping migration id: copy data account_user to org_user, condition not fulfilled
2016/03/28 12:04:26 [I] Migrator: exec migration id: Drop old table account
2016/03/28 12:04:26 [I] Migrator: exec migration id: Drop old table account_user
2016/03/28 12:04:26 [I] Migrator: exec migration id: create dashboard table
2016/03/28 12:04:27 [I] Migrator: exec migration id: add index dashboard.account_id
2016/03/28 12:04:27 [I] Migrator: exec migration id: add unique index dashboard_account_id_slug
2016/03/28 12:04:27 [I] Migrator: exec migration id: create dashboard_tag table
2016/03/28 12:04:28 [I] Migrator: exec migration id: add unique index dashboard_tag.dasboard_id_term
2016/03/28 12:04:28 [I] Migrator: exec migration id: drop index UQE_dashboard_tag_dashboard_id_term - v1
2016/03/28 12:04:28 [I] Migrator: exec migration id: Rename table dashboard to dashboard_v1 - v1
2016/03/28 12:04:29 [I] Migrator: exec migration id: create dashboard v2
2016/03/28 12:04:29 [I] Migrator: exec migration id: create index IDX_dashboard_org_id - v2
2016/03/28 12:04:30 [I] Migrator: exec migration id: create index UQE_dashboard_org_id_slug - v2
2016/03/28 12:04:30 [I] Migrator: exec migration id: copy dashboard v1 to v2
2016/03/28 12:04:31 [I] Migrator: exec migration id: drop table dashboard_v1
2016/03/28 12:04:31 [I] Migrator: exec migration id: alter dashboard.data to mediumtext v1
2016/03/28 12:04:31 [I] Migrator: exec migration id: create data_source table
2016/03/28 12:04:31 [I] Migrator: exec migration id: add index data_source.account_id
2016/03/28 12:04:32 [I] Migrator: exec migration id: add unique index data_source.account_id_name
2016/03/28 12:04:32 [I] Migrator: exec migration id: drop index IDX_data_source_account_id - v1
2016/03/28 12:04:33 [I] Migrator: exec migration id: drop index UQE_data_source_account_id_name - v1
2016/03/28 12:04:34 [I] Migrator: exec migration id: Rename table data_source to data_source_v1 - v1
2016/03/28 12:04:34 [I] Migrator: exec migration id: create data_source table v2
2016/03/28 12:04:34 [I] Migrator: exec migration id: create index IDX_data_source_org_id - v2
2016/03/28 12:04:35 [I] Migrator: exec migration id: create index UQE_data_source_org_id_name - v2
2016/03/28 12:04:35 [I] Migrator: exec migration id: copy data_source v1 to v2
2016/03/28 12:04:35 [I] Migrator: exec migration id: Drop old table data_source_v1 #2
2016/03/28 12:04:36 [I] Migrator: exec migration id: Add column with_credentials
2016/03/28 12:04:36 [I] Migrator: exec migration id: create api_key table
2016/03/28 12:04:36 [I] Migrator: exec migration id: add index api_key.account_id
2016/03/28 12:04:37 [I] Migrator: exec migration id: add index api_key.key
2016/03/28 12:04:37 [I] Migrator: exec migration id: add index api_key.account_id_name
2016/03/28 12:04:37 [I] Migrator: exec migration id: drop index IDX_api_key_account_id - v1
2016/03/28 12:04:38 [I] Migrator: exec migration id: drop index UQE_api_key_key - v1
2016/03/28 12:04:38 [I] Migrator: exec migration id: drop index UQE_api_key_account_id_name - v1
2016/03/28 12:04:38 [I] Migrator: exec migration id: Rename table api_key to api_key_v1 - v1
2016/03/28 12:04:39 [I] Migrator: exec migration id: create api_key table v2
2016/03/28 12:04:39 [I] Migrator: exec migration id: create index IDX_api_key_org_id - v2
2016/03/28 12:04:40 [I] Migrator: exec migration id: create index UQE_api_key_key - v2
2016/03/28 12:04:40 [I] Migrator: exec migration id: create index UQE_api_key_org_id_name - v2
2016/03/28 12:04:40 [I] Migrator: exec migration id: copy api_key v1 to v2
2016/03/28 12:04:41 [I] Migrator: exec migration id: Drop old table api_key_v1
2016/03/28 12:04:41 [I] Migrator: exec migration id: create dashboard_snapshot table v4
2016/03/28 12:04:41 [I] Migrator: exec migration id: drop table dashboard_snapshot_v4 #1
2016/03/28 12:04:42 [I] Migrator: exec migration id: create dashboard_snapshot table v5 #2
2016/03/28 12:04:42 [I] Migrator: exec migration id: create index UQE_dashboard_snapshot_key - v5
2016/03/28 12:04:43 [I] Migrator: exec migration id: create index UQE_dashboard_snapshot_delete_key - v5
2016/03/28 12:04:43 [I] Migrator: exec migration id: create index IDX_dashboard_snapshot_user_id - v5
2016/03/28 12:04:43 [I] Migrator: exec migration id: alter dashboard_snapshot to mediumtext v2
2016/03/28 12:04:43 [I] Migrator: exec migration id: create quota table v1
2016/03/28 12:04:44 [I] Migrator: exec migration id: create index UQE_quota_org_id_user_id_target - v1
2016/03/28 12:04:44 [I] Created default admin user: admin
2016/03/28 12:04:44 [I] Listen: http://0.0.0.0:3000
```



