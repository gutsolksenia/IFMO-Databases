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
    theme_id    INTEGER,
    category_id INTEGER,
    min_age     INTEGER,
    max_age     INTEGER,
    edition     INTEGER,
    date        DATE
)
AS $$
DECLARE
  characterId ALIAS FOR $1;
BEGIN
  RETURN QUERY SELECT 
    Products.id,
    Products.name,
    Products.theme_id,
    Products.category_id,
    Products.min_age,
    Products.max_age,
    Products.edition,
    Products.date
  FROM (Products INNER JOIN ProductContainsDetail
      ON Products.id = product_id)
      NATURAL JOIN DetailIsCharacter
      WHERE DetailIsCharacter.character_id = characterId;
END;
$$ LANGUAGE plpgsql;