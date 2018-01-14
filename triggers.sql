CREATE OR REPLACE FUNCTION fun_check_theme()
  RETURNS TRIGGER AS $$
DECLARE
  character_theme INTEGER;
  product_theme INTEGER;
BEGIN
  SELECT theme_id
  INTO character_theme
  FROM DetailIsCharacter NATURAL JOIN Characters
  WHERE detail_id = new.detail_id;

  SELECT theme_id
  INTO product_theme
  FROM Products
  WHERE Products.id = new.product_id;
  
  IF product_theme <> character_theme AND character_theme IS NOT NULL
  THEN
    RAISE EXCEPTION 'different themes';
  END IF;
  RETURN new;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_theme
ON ProductContainsDetail;
CREATE TRIGGER check_theme
BEFORE INSERT OR UPDATE ON ProductContainsDetail
FOR EACH ROW EXECUTE PROCEDURE fun_check_theme();

CREATE OR REPLACE FUNCTION fun_check_age_interval()
  RETURNS TRIGGER AS $$
BEGIN
  IF new.max_age IS NOT NULL AND new.max_age < new.min_age
  THEN
    RAISE EXCEPTION 'min is greater then max';
  END IF;
  RETURN new;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_age_interval
ON Products;
CREATE TRIGGER check_age_interval
BEFORE INSERT OR UPDATE ON Products
FOR EACH ROW EXECUTE PROCEDURE fun_check_age_interval();