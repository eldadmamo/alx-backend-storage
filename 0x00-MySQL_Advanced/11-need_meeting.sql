-- SQL script that creates view need_meeting that
-- lists students that have a score under 80
-- following requirements:
-- 1. the score is under 80
-- 2. AND no last_meeting date OR the last_meeting is more than 1 months ago
CREATE VIEW need_meeting
AS
SELECT name
FROM students
WHERE score < 80
AND (last_meeting IS NULL OR last_meeting < ADDDATE(CURDATE(), INTERVAL -1 MONTH));
