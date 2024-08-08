-- SQL script that creates stored procedure AddBonus adds a new
-- correction for a student. The stored procedure student's user_id
-- project_name, and score.
delimiter //
CREATE PROCEDURE AddBonus (
		IN user_id INT,
		IN project_name varchar(255),
		IN score INT
)
BEGIN
	DECLARE project_id INT;

	IF NOT EXISTS (SELECT * FROM projects WHERE name = project_name) THEN
		INSERT INTO projects (name) VALUES (project_name);
	END IF;
  
	SET @project_id = (SELECT id FROM projects WHERE name = project_name);

	INSERT INTO corrections (user_id, project_id, score) 
	VALUES (user_id, @project_id, score);
END//
delimiter ;
