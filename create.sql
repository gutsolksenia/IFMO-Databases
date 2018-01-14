DROP DATABASE IF EXISTS lego;

CREATE DATABASE lego;
\c lego;

CREATE TABLE Styles (
    id         SERIAL       NOT NULL PRIMARY KEY,
    name       VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Shapes (
    id         SERIAL       NOT NULL PRIMARY KEY,
    name       VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Details (
    id         SERIAL       NOT NULL PRIMARY KEY,
    name       VARCHAR(200) UNIQUE,
    style_id   INTEGER      NOT NULL REFERENCES Styles (id) ON DELETE RESTRICT,
    shape_id   INTEGER      NOT NULL REFERENCES Shapes (id) ON DELETE RESTRICT
);

CREATE TABLE Themes (
    id         SERIAL       NOT NULL PRIMARY KEY,
    name       VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Categories (
    id         SERIAL       NOT NULL PRIMARY KEY,
    name       VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Products (
    id          SERIAL       NOT NULL PRIMARY KEY,
    name        VARCHAR(200) NOT NULL UNIQUE,
    theme_id    INTEGER      REFERENCES Themes (id) ON DELETE SET NULL,
    category_id INTEGER      REFERENCES Categories (id) ON DELETE SET NULL,
    min_age     INTEGER      NOT NULL,
    max_age     INTEGER,
    edition     INTEGER      NOT NULL,
    date        DATE
);

CREATE TABLE Catalogs (
    id          SERIAL       NOT NULL PRIMARY KEY,
    name        VARCHAR(200) NOT NULL UNIQUE,
    edition     INTEGER      NOT NULL,
    date        DATE
);

CREATE TABLE Characters (
    id          SERIAL       NOT NULL PRIMARY KEY,
    name        VARCHAR(200) NOT NULL UNIQUE,
    theme_id    INTEGER      REFERENCES Themes (id) ON DELETE CASCADE
);

CREATE TABLE ProductContainsDetail (
	product_id  INTEGER      NOT NULL REFERENCES Products (id) ON DELETE CASCADE,
	detail_id   INTEGER      NOT NULL REFERENCES Details (id) ON DELETE RESTRICT,
	amount      INTEGER      NOT NULL,
	PRIMARY KEY (product_id, detail_id)
);

CREATE TABLE CatalogContainsProduct (
	product_id   INTEGER      NOT NULL REFERENCES Products (id) ON DELETE RESTRICT,
	catalog_id   INTEGER      NOT NULL REFERENCES Catalogs (id) ON DELETE CASCADE,
	PRIMARY KEY (product_id, catalog_id)
);

CREATE TABLE DetailIsCharacter (
	detail_id     INTEGER      NOT NULL PRIMARY KEY REFERENCES Products (id) ON DELETE CASCADE,
	character_id  INTEGER      NOT NULL REFERENCES Characters (id) ON DELETE CASCADE
);