# Gitea

## Table of Contents
* [Setup MySQL DB](#setup-mysql-db)

## Setup MySQL DB

Replace password with a real password!
```
mysql -u root -p
mysql> CREATE DATABASE `gitea` DEFAULT CHARACTER SET `utf8mb4` COLLATE `utf8mb4_general_ci`;
mysql> CREATE USER `gitea`@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON `gitea`.* TO `gitea`@`localhost`;
mysql> \q
```
