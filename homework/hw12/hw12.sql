CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size 
  FROM dogs, sizes
  WHERE height > min AND height <= max; 

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child
  FROM parents, dogs
  WHERE parent = name
  ORDER BY height DESC;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child as "name1", b.child as "name2"
  FROM parents AS a, parents AS b
  WHERE a.parent = b.parent AND a.child <> b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT DISTINCT MIN(s.name1, s.name2) || " and " || MAX(s.name1, s.name2) || " are " || x.size || " siblings"
  FROM siblings AS s, size_of_dogs as x, size_of_dogs as y
  WHERE s.name1 = x.name AND s.name2 = y.name 
  AND x.size = y.size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

INSERT INTO stacks_helper (dogs, stack_height, last_height)
SELECT d1.name || ", " || d2.name || ", " || d3.name || ", " || d4.name ,
d1.height + d2.height + d3.height + d4.height, max(d1.height, d2.height, d3.height, d4.height)
FROM dogs as d1, dogs as d2, dogs as d3, dogs as d4
where d1.height < d2.height AND d2.height < d3.height AND
d3.height < d4.height;

-- Add your INSERT INTOs here


CREATE TABLE stacks AS
  SELECT dogs, stack_height FROM stacks_helper
  WHERE stack_height > 170
  ORDER BY stack_height;
