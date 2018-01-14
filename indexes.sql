CREATE INDEX ON Products USING BTREE (min_age, max_age);
CREATE INDEX ON Products USING BTREE (date);
CREATE INDEX ON Products USING BTREE (name);

CREATE INDEX ON Catalogs USING BTREE (name, date);
CREATE INDEX ON Catalogs USING BTREE (date, name);

CREATE INDEX ON ProductHasTheme USING BTREE (theme_id);
CREATE INDEX ON ProductHasCategory USING BTREE (category_id);