CREATE INDEX ON Products USING BTREE (min_age, max_age);
CREATE INDEX ON Products USING BTREE (year);
CREATE INDEX ON Products USING BTREE (name);
CREATE INDEX ON Products USING BTREE (theme_id);

CREATE INDEX ON Catalogs USING BTREE (name, year);
CREATE INDEX ON Catalogs USING BTREE (year, name);

CREATE INDEX ON ProductHasCategory USING BTREE (category_id);