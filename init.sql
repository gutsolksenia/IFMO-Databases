INSERT INTO Themes (name) VALUES
    ('star wars'),
    ('friends'),
    ('duplo'),
    ('ninjago'),
    ('city');
 
INSERT INTO Categories (name) VALUES
    ('transport'),
    ('building');

SELECT insert_product_with_theme('star wars',  'Imperial Death Trooper',        8, 99, 2016);
SELECT insert_product_with_theme('star wars',  'Duel on Naboo',                 8, 99, 2017);
SELECT insert_product_with_theme('friends',    'Camper Van',                    4, 10, 2018);
SELECT insert_product_with_theme('friends',    'Friendship House',              4, 10, 2016);
SELECT insert_product_with_theme('duplo',      'My First Race Car',             1, 3,  2016);
SELECT insert_product_with_theme('duplo',      'Airport',                       1, 5,  2018);
SELECT insert_product_with_theme('ninjago',    'SAMURAI VXL',                   5, 7,  2017);
SELECT insert_product_with_theme('ninjago',    'Temple of Resurrection',        6, 8,  2018);
SELECT insert_product_with_theme('city',       'MOUNTAIN POLICE HEADQUARTERS',  7, 12, 2018);
SELECT insert_product_with_theme('city',       'HEAVY CARGO TRANSPORT',         7, 12, 2017);

-- trigger should throw exception
SELECT insert_product_with_theme('city', 'BUS', 8, 7, 2017);

INSERT INTO ProductHasCategory(product_id, category_id) VALUES
    (3, 1),
    (4, 2),
    (5, 1),
    (6, 2),
    (7, 1),
    (8, 2),
    (9, 2),
    (10, 1);

INSERT INTO Characters (name, theme_id) VALUES
    ('Samurai X',     4),
    ('Lord Garmadon', 4),
    ('Mia',           2),
    ('Olivia',        2);

INSERT INTO Shapes (name) VALUES
    ('brick'),
    ('human');

INSERT INTO Styles (name) VALUES
    ('in dress'),
    ('with hat'),
    ('green'),
    ('yellow'),
    ('with sword'),
    ('in helmet');

INSERT INTO Details (name, style_id, shape_id) VALUES
    ('Samurai with sword', 5, 2),
    ('Ninja in helmet',    6, 2),
    ('Girl in dress',      1, 2),
    ('Girl in hat',        2, 2),
    ('Girl in green',      3, 2),
    ('yellow brick',       4, 1),
    ('green brick',        3, 1);

INSERT INTO DetailIsCharacter (detail_id, character_id) VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 3),
    (5, 4);

INSERT INTO ProductContainsDetail(product_id, detail_id, amount) VALUES 
   (3, 3, 1),
   (3, 4, 1),
   (4, 4, 1),
   (7, 1, 1),
   (8, 2, 1),
   (3, 6, 100),
   (3, 7, 15);

-- trigger should throw exception
INSERT INTO ProductContainsDetail(product_id, detail_id, amount) VALUES 
   (3, 1, 100);   