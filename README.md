# HA HAPROXY SETUP

## 1. Setup:
```shell
docker-compose up -d
```

## 2. Haproxy status:
```shell
http://localhost:28090/server/status
```

## 3. Testing certificates:
```shell
curl --insecure -iLv --resolve 'infojob.com:443:172.24.0.6' https://infojob.com 2>&1 | grep -A10 'Server certificate'
curl --insecure -iLv --resolve 'infojob2.com:443:172.24.0.7' https://infojob2.com 2>&1 | grep -A10 'Server certificate'
```

## 4. Simulate adding of new certificate
```shell
docker container exec -ti infojob_static_1 bash
./generate.sh
```

