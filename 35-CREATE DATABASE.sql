CREATE DATABASE NVDB
ON (
NAME = 'nvdb_data',
FILENAME = 'C:\Data_study\nvdb_data.mdf',
SIZE = 10MB,
MAXSIZE = 100MB,
FILEGROWTH = 5MB)
LOG ON (
NAME = 'nvdb_log',
FILENAME = 'C:\Data_study\nvdb_log.df',
SIZE = 5MB,
MAXSIZE = 50MB,
FILEGROWTH = 5MB)

-- Ở MYSQL:
CREATE DATABASE NVDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
