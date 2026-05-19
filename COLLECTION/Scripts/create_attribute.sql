USE Collections
GO

INSERT INTO COLLECTION.item_attribute_field (item_attr_name, type_id, return_length) VALUES
('PUBLISHER', 1, 255),
('COMPOSER', 1, 255),
('WORK_NAME', 1, 255),
('WORK_TYPE', 1, 50),
('SCORE_SIZE', 1, 50)
INSERT INTO COLLECTION.item_attribute_field (item_attr_name, type_id) VALUES
('SCORE_PAGES', 4)
