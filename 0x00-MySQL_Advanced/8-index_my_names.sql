-- SQL script that creates an index idx_name_first table names
-- first letter of name
CREATE INDEX idx_name_first ON names (name(1));
