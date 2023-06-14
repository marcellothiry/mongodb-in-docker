#!/bin/bash

DELAY1=20
DELAY2=10

docker-compose up -d

sleep $DELAY1

docker exec -it mongo1 mongosh --eval "rs.initiate({
 _id: \"rs0\",
 members: [
   {_id: 0, host: \"mongo0\"},
   {_id: 1, host: \"mongo1\"},
   {_id: 2, host: \"mongo2\"}
 ]
})"

sleep $DELAY2

docker exec -it mongo1 mongosh --eval "db.createUser({
   user: 'root',
   pwd: '1234',
   roles: [
       {
           role: 'root',
           db: 'admin'
       }
   ]
})"

docker exec -it mongo1 mongosh --eval "show users"
