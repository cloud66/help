<!--  post: -->


#### Redis

1. Run following command to flatten the folder 



{%include _inlines/Databases/common/database-backup/code_database-backup_redis-findpathto-v1.md  product = include.product %}




2. Run following command to find the data file



{%include _inlines/Databases/common/database-backup/code_database-backup_redis-findpathto-2-v1.md  product = include.product %}




3. If the result of previous step has a *.gz extension run following command to unzip it, unless go to next step.



{%include _inlines/Databases/common/database-backup/code_database-backup_redis-gzipdpath-v1.md  product = include.product %}




3. Use following command to stop Redis service : 



{%include _inlines/Databases/common/database-backup/code_database-backup_redis-sudobluepill-v1.md  product = include.product %}




4. Use following command to delete Redis data file



