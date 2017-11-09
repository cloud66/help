


## How to use the failover stack

If and when your main stack fails, you will need to switch to the failover stack.

1.  Set your main stack into [maintenance mode]({% if include.product == "skycap" %}https://help.cloud66.works/maestro/stack-management/network-configuration.html{% else %}https://help.cloud66.works/{{ include.product }}/stack-management/network-configuration.html{% endif %}), to prevent new data being written to it.
2.  Turn off the [database replication]({% if include.product == "skycap" %}https://help.cloud66.works/maestro/databases/database-replication.html{% else %}https://help.cloud66.works/{{ include.product }}https://help.cloud66.works/{{ include.product }}/databases/database-replication.html{% endif %}).
3.  Make your [database slave a master](https://help.cloud66.works/{{ include.product }}/tutorials/1987-09-22-psql-failover.html) - this will allow data to be written to the database.
4.  Turn off [maintenance mode]({% if include.product == "skycap" %}https://help.cloud66.works/maestro/stack-management/network-configuration.html{% else %}https://help.cloud66.works/{{ include.product }}/stack-management/network-configuration.html{% endif %}) on your failover stack.
5.  Use your [Failover group](https://help.cloud66.works/{{ include.product }}/failover-groups/failover-groups) menu to switch your traffic to the failover stack. The TTL on the Failover address is 5 minutes, so you should see your users on the new stack momentarily.