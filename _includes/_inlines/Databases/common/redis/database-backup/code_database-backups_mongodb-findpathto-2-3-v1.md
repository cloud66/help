<!-- usedin: [ _includes/_inlines/Databases/common/database-backup/database-backups_mongodb-v1.md] -->


```
$ find /path/to/unarchived/folder '(' -name 'MongoDB.tar' -o -name 'Mongo*.tar.gz' ')' -type f -exec basename {} ';'    
```