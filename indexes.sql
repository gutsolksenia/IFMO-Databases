CREATE INDEX ON products USING BTREE (category_id, theme_id);
CREATE INDEX ON products USING BTREE (theme_id, category_id);
CREATE INDEX ON products USING BTREE (min_age, max_age);
CREATE INDEX ON products USING BTREE (date);
CREATE INDEX ON products USING BTREE (name);

CREATE INDEX ON catalogs USING BTREE (name, date);
CREATE INDEX ON catalogs USING BTREE (date, name);