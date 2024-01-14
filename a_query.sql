-- Initializing the Base-case: Counting Followers

WITH RECURSIVE FollowerCount (root_person_id, follower_id, hops) 
AS (
    SELECT
        p.id,                                  -- root_person_id placeholder
        p.id,                                  -- follower_id placeholder, updated later with last follower
        1 AS hops                              -- hops set to 1, indicating the initial starting point
    FROM person AS p
    INNER JOIN follow AS f ON (p.id = f.followed_person_id)
    WHERE p.year_of_birth = 1990 AND f.follows_since BETWEEN '2015-06-01' AND '2016-06-01'

    UNION ALL

    -- Recursive step: Traverse the follower relationships up to 5 hops
    SELECT
        fc.root_person_id,                    -- each recursion step selects root_person_id
        f.person_id,                         -- person_id from the previous step in the follow table, up to 5 hops
        fc.hops + 1                          -- increment hops by 1 in each recursive step
    FROM FollowerCount AS fc
    INNER JOIN follow AS f ON (fc.follower_id = f.followed_person_id)
    WHERE f.follows_since BETWEEN '2015-06-01' AND '2016-06-01'
    AND fc.hops < 5
)

-- Final query: Format and order the results
SELECT 
    fc.root_person_id,
    p.firstname,
    p.lastname,
    fc.hops,
    COUNT(fc.follower_id) AS follower_count
FROM FollowerCount AS fc
INNER JOIN person AS p ON (fc.root_person_id = p.id)
GROUP BY fc.root_person_id, p.firstname, p.lastname, fc.hops
ORDER BY fc.root_person_id, fc.hops;
