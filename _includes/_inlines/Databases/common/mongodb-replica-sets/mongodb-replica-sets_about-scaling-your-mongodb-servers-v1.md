<!-- usedin: [ _legacy_docker/Databases/mongodb-replica-sets-v1.md, _maestro/Databases/mongodb-replica-sets-v1.md, _node/Databases/mongodb-replica-sets-v1.md, _rails/databases/mongodb-replica-sets-v1.md] -->


## About scaling your MongoDB servers

When it comes to MongoDB replication, **you really need to know how MongoDB replica sets work and how to use them** before trying to scale up your MongoDB backend. This is to ensure continuity of service without interruptions.

There is a lot of excellent material about [MongoDB replica sets](http://docs.mongodb.org/manual/replication/) on the Internet, so we're not going to repeat this information. For the purpose of this document, we will focus on how Cloud 66 scales your MongoDB servers and how you can use them in your code.
