CREATE OR REPLACE FUNCTION count_details(INT)
  RETURNS INT AS
$$
DECLARE
  id ALIAS FOR $1;
  count INT;
BEGIN
  SELECT SUM(amount)
  INTO count
  FROM ProductContainsDetail
  WHERE product_id = id;

  RETURN count;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION products_with_character(INT)
  RETURNS TABLE(
    id          INTEGER,
    name        VARCHAR,
    min_age     INTEGER,
    max_age     INTEGER,
    year        INTEGER,
    theme_id    INTEGER
)
AS $$
DECLARE
  characterId ALIAS FOR $1;
BEGIN
  RETURN QUERY SELECT 
    Products.id,
    Products.name,
    Products.min_age,
    Products.max_age,
    Products.year,
    Products.theme_id
  FROM (Products INNER JOIN ProductContainsDetail
      ON Products.id = product_id)
      NATURAL JOIN DetailIsCharacter
      WHERE DetailIsCharacter.character_id = characterId;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_product_with_theme(VARCHAR, VARCHAR, INT, INT, INT)
  RETURNS VOID AS
$$
DECLARE
  theme_name   ALIAS FOR $1;
  product_name ALIAS FOR $2;
  min_age      ALIAS FOR $3;
  max_age      ALIAS FOR $4;
  year         ALIAS FOR $5;
  theme_id     INTEGER;
BEGIN
   SELECT id
   INTO theme_id
   FROM Themes
   WHERE Themes.name = theme_name;

   INSERT INTO Products (name, min_age, max_age, year, theme_id) VALUES 
     (product_name, min_age, max_age, year, theme_id); 
END;
$$ LANGUAGE plpgsql;