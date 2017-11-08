<!-- usedin: [ _includes/_inlines/Tutorials/common/1998-12-08-seeding-db/1998-12-08-seeding-db_deploy-hook-v1.md] -->

```
production:
  after_symlink: # Or use after_rails depending on your application
    - source: /.cloud66/dbseed.sh
      destination: /tmp/dbseed.sh
      target: rails
      execute: true
      run_on: single_server
      apply_during: build_only      
```