# Edemia

## How to use

- Create env file for server
```bash
cp ./server/config/.env.example ./server/config/app.env
```
- Install [VScode Go extension](https://marketplace.visualstudio.com/items?itemName=golang.Go) for the linter

- The whole environment can be run with:
```bash
docker-compose up
```

## How to test

```sh
go test ./...
```

## How to deploy

### Deploy Server Staging
Create new pre-release on github. The app will be automatically deployed using github action

## Configuration
[Config](./docs/CONFIG.md)


## Reference
[DB Schema]()

[ER Diagram]()

[Swagger Docs]()
