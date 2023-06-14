# MongoDB in Docker: dev setups

This is the complementary repository for the video [How to run MongoDB in Docker: dev setups (Windows, Mac or Linux)](https://www.youtube.com/watch?v=cfmPk93mOeo) (channel
[@fromDev2Dev](https://www.youtube.com/@fromDev2Dev)).

[![How to run MongoDB in Docker: dev setups](https://img.youtube.com/vi/73NQuTACyus/0.jpg)](https://www.youtube.com/watch?v=cfmPk93mOeo)

```
docker images --filter "reference=mongo*"
```

```
docker pull mongo:latest
```

```
docker run --name mongodb1 -p 27020:27017 -d mongo
```

```
docker ps
```

```
docker container top mongodb1
```

```
docker exec mongo ps aux
```

```
docker exec -it mongodb bash
```

```
use admin

db.createUser(
  {
	user: "root",
	pwd: "1234",
	roles: [ { role: "root", db: "admin" } ]
  }
)

db.auth({user: "root", pwd: "1234"})
```

```
use online-shopping

db.createUser(
  {
	user: "shop-user",
	pwd: "1234",
	roles: [ { role: "readWrite", db: "online-shopping" } ]
  }
)

db.products.insertOne({
	name: "Yet another awesome product",
	price: 23400
})
```

```
db.products.find()
```

```
docker run -d \
	-p 27021:27017 \
	--name mongodb2 \
	-v ~/mongodb/data/m2:/data/db \
	-e MONGO_INITDB_ROOT_USERNAME=root \
	-e MONGO_INITDB_ROOT_PASSWORD=1234 \
	mongo:latest
```

```
docker-compose up -d
```
