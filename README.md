# HA HAPROXY SETUP

## Setup:
```shell
docker-compose up -d
```

## Haproxy status:
```shell
http://localhost:28090/server/status
```

## Testing certificates:
```shell
curl --insecure -iLv --resolve 'infojob.com:443:172.24.0.6' https://infojob.com 2>&1 | grep -A10 'Server certificate'
curl --insecure -iLv --resolve 'infojob2.com:443:172.24.0.7' https://infojob2.com 2>&1 | grep -A10 'Server certificate'
```


