INSERT INTO Styles (id, name) VALUES
	(0, 'Oleg'),
	(1, 'Kisa'),
	(2, 'ya');

INSERT INTO Products (id, name, min_age, edition) VALUES 
    (0, 'duplo', 0, 5),
    (2, 'enot', 7, 43233);

INSERT INTO Themes (id, name) VALUES
    (0, 'Oleg'),
    (1, 'ya');

INSERT INTO Characters(id, name, theme_id) VALUES (0, 'Oleg', 0);

INSERT INTO Products (id, name, min_age, edition, theme_id) VALUES 
     (3, 'ne_duplo', 0, 5, 1);

INSERT INTO Shapes (id, name) VALUES (0, 'human');

INSERT INTO Details (id, name,  style_id, shape_id) VALUES (0, 'Oleg', 0, 0);
INSERT INTO Details (id, name,  style_id, shape_id) VALUES (1, 'ya', 2, 0);


INSERT INTO DetailIsCharacter (detail_id, character_id) VALUES (0, 0);

INSERT INTO ProductContainsDetail (product_id, detail_id, amount) VALUES (3, 1, 100);

INSERT INTO ProductContainsDetail (product_id, detail_id, amount) VALUES (3, 0, 10);