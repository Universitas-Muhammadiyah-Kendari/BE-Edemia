<h1 align="center">Welcome to Learning management System API</h1>
<div align="center">

![GitHub](https://img.shields.io/github/license/Learning-Management-System-Kelompok-42/BE-LMS?style=flat-square)
![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/Learning-Management-System-Kelompok-42/BE-LMS?style=flat-square)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/Learning-Management-System-Kelompok-42/BE-LMS?style=flat-square)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/Learning-Management-System-Kelompok-42/BE-LMS)

![image](https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Go](https://img.shields.io/badge/go-%2300ADD8.svg?style=for-the-badge&logo=go&logoColor=white)
</div><br><br>


## About The Project
___

Learning Management System is a platform used for online and structured learning. Edemia is a Learning Management System platform that we created from scratch, this product we developed for companies that want to have an LMS platform for their employees.

In this project, we implement Clean Architecture with Hexagonal patterns. So, it can be expanded easily and quickly by people who want to contribute.

<br>

## Technology and Framework used :
___

- [Go](https://go.dev/) as programming languages
- [Echo](https://echo.labstack.com) as main framework on Golang
- [Gorm](https://gorm.io/index.html) as ORM for Golang
- [Keycloak]() as Open Source identity and access management
- [Viper](https://github.com/spf13/viper) read file environment configuration
- [Air](https://github.com/cespare/reflex) as live reload for increase development
- [AWS SDK Go](https://github.com/aws/aws-sdk-go) as library for connection into AWS Service
- [Google UUID](https://github.com/google/uuid) as generate unique ID

<br>

## Getting Starded
___

### Requirements

- Go 1.18+
- Postgres 15.1+

### How to run

- Clone repository
````
$ git clone git@github.com:Universitas-Muhammadiyah-Kendari/BE-Edemia.git
$ cd BE-Edemia
````

- Create env file for server
```bash
cp ./server/config/.env.example ./server/config/app.env
cp ./server/config/.env.ci ./server/config/test.env
```

- The whole environment can be run with:
```bash
docker-compose up
```

- Run golang-migrate
```bash
$ brew install golang-migrate
```

- Create migrations file
```bash
$ migrate create -ext sql -dir db/migrations -seq create_{table_name}_table
```

- Open migrations file that generated and add sql syntax
- Run makefile command
```bash
make migrateup
```


### Contact
___

- Muchlis Harly Winata - academyynetworking@gmail.com
  
## 📝 License
___

Copyright © 2022 [Muchlis Harly Winata](https://github.com/w33h).<br />
This project is [MIT](https://github.com/Learning-Management-System-Kelompok-42/BE-LMS/blob/development/LICENSE) licensed.
