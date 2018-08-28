.read fa17data.sql
.read sp18data.sql

-- Q2
CREATE TABLE obedience AS
  SELECT seven, denero FROM students;

-- Q3
CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 15 
  ORDER BY smallest LIMIT 20;

-- Q4
CREATE TABLE matchmaker AS
  SELECT a.pet as pet, b.song as song, a.color as color1, b.color as color2
  FROM students AS a, students AS b
  WHERE a.pet = b.pet AND a.song = b.song AND a.time < b.time;

