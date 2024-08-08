-- SQL script that creates a stored ComputeAverageScoreForUser
-- computes and stores average score for a student.
-- The stored procedure input parameter, the user_id of the student.
delimiter //
CREATE PROCEDURE ComputeAverageScoreForUser (
		IN user_id INT
)
BEGIN
	UPDATE users
	SET average_score = (
		SELECT AVG(score)
		FROM corrections
		WHERE corrections.user_id = user_id
	)
	WHERE id = user_id;
END//
delimiter ;
