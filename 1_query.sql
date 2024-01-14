-- Initializing the Base-case: Victor Hall selecting

WITH RECURSIVE FollowPath (person_id, following, path, hops) 
AS ( 
	SELECT 
	p.id,			-- person_id from Mr. Hall (kind of placeholder)
 	p.id,			-- person_id from Mr. Hall (kind of placeholder, updated later with last followee of follow-path)
 	CONCAT(p.id), 	-- path initialized with Halls ID, laster updated with every followee of follow-path
 	0 AS hops 		-- hops set to 0, indicating initial starting point.
 	FROM person AS p WHERE p.firstname = 'Victor' AND p.lastname = 'Hall'

 	UNION ALL		-- recursively expanded search by identifying all users 
					-- followed by the users already in the FollowPath CTE
					-- appends the results of the recursive step to the initial results.

  -- Recursive step: Folge den follow-Beziehungen bis zu 3 Hops
 	SELECT
 	fp.person_id,			-- each recursion step it selects person_id from Mr. Hall
 	f.followed_person_id,	-- every recursive calls person_id from previous step, of follow table till inkl. the 3rd hop
 	CONCAT(fp.path, '->', f.followed_person_id),
	-- updating the "follow-path" by appending the new connection
 	fp.hops + 1 AS hops		-- increment hops +1 each "loop"
 	FROM FollowPath AS fp
 	JOIN follow AS f ON fp.following = f.person_id
	-- Joining FollowPath with the follow table based on the following and person_id columns.
 	WHERE fp.hops < 3		--  preventing an infinite loop, stops when no more 3 hops found
)

-- Final query: Ergebnis formatieren und sortieren
SELECT * FROM FollowPath
ORDER BY hops 
OFFSET 1;			-- skip the first row, Victor Hall himself
