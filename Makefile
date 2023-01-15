migrateup:
	migrate -path db/migrations/ -database "postgres://user:password@localhost:5432/edemia?sslmode=disable" up
migratedown:
	migrate -path db/migrations/ -database "postgres://user:password@localhost:5432/edemia?sslmode=disable" down