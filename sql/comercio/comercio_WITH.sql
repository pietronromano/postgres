


/*
    WITH, CTEs
    REFS: 
        - https://www.postgresql.org/docs/18/queries-with.html
        - Learn PostreSQL - Second Edition, Chapter 5 Advanced Statements->  Exploring CTEs
*/

select * from tags order by pk;
 pk |        tag        | parent
----+-------------------+--------
  1 | Database          |  
  2 | Operating Systems |  
  3 | PostgreSQL        |      1
(3 rows)

level  |          tag      
-------+------------------------
     1 | Database
     1 | Operating Systems
     2 | Database -> PostgreSQL
To reach this goal, we have to perform the following:
forumdb=> WITH RECURSIVE tags_tree AS (
 -- non recursive statement
SELECT tag, pk, 1 AS level
FROM tags WHERE parent IS NULL
UNION
-- recursive statement
SELECT tt.tag|| ' -> ' || ct.tag, ct.pk
, tt.level + 1
FROM tags ct
JOIN tags_tree tt ON tt.pk = ct.parent
)
SELECT level,tag FROM tags_tree
order by level;
 level |          tag      
-------+------------------------
     1 | Database
     1 | Operating Systems
     2 | Database -> PostgreSQL
(3 rows)
