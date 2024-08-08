-- SQL script that creates an index idx_name_first table names
-- first character of the name and score 
CREATE INDEX idx_name_first_score ON names (name(1), score);
