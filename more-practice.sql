-- Include your solutions to the More Practice problems in this file.



-- Insert a Brand

cars=# insert into brands values ('sub', 'Subaru', 2015, 'Tokyo, Japan');
INSERT 0 1



-- Insert Models (I did sub 1st and the che, when it was supposed to be the other way, but I updated the tables later)

cars=# INSERT INTO models (year, brand_id, name) VALUES (2015, 'sub', 'Subaru Outback');                                            
INSERT 0 1
cars=# INSERT INTO models (year, brand_id, name) VALUES (2015, 'che', 'Chevrolet Malibu');                                          
INSERT 0 1
       


-- Create an Awards Table

cars=# CREATE TABLE awards (
cars(# id SERIAL PRIMARY KEY,
cars(# name VARCHAR(20) NOT NULL,
cars(# year INTEGER NOT NULL,
cars(# winner_id INTEGER REFERENCES models);


-- Insert Awards

cars=# INSERT INTO awards (name, year, winner_id) VALUES ('IIHS Safety Award', 2015, 47);
INSERT 0 1
cars=# INSERT INTO awards (name, year, winner_id) VALUES ('IIHS Safety Award', 2015, 48);
INSERT 0 1
cars=# INSERT INTO awards (name, year) VALUES ('Best in Class', 2015);                                               
INSERT 0 1

-- **************************************   QUIZ.PY THAT DIDN'T WORK ****************************
-- Same result than expected, but different order.

SQL [13]> SELECT b.brand_id FROM brands AS b LEFT JOIN models AS m USING ( brand_id) GROUP BY brand_id HAVING count(model_id) > 5;  
 brand_id 
----------
 che      
 for      
 pon      
(3 rows)

(results do not match answer)


The correct result set is:

 brand_id 
----------
 che
 pon
 for
(3 rows)

***************************************************************************
-- I don't know why this one is not working, but I added OFFSET here to show that is working.

SQL [10]> SELECT b.name, m.year, m.name FROM brands AS b INNER JOIN models AS m USING ( brand_id ) ORDER BY b.name OFFSET 45;

    name    | year  |  name  
------------+-------+--------
 Studebaker |  1963 | Avanti 
 Studebaker |  1962 | Avanti 
 Subaru     |  2015 | Malibu 
(3 rows)

(results do not match answer)


SQL [10]> SELECT b.name, m.year, m.name FROM brands AS b LEFT JOIN models AS m USING ( brand_id ) ORDER BY b.name OFFSET 45;        

    name    | year  |  name  
------------+-------+--------
 Studebaker |  1961 | Avanti 
 Studebaker |  1963 | Avanti 
 Subaru     |  2015 | Malibu 
 Tesla      |       |        
(4 rows)

(results do not match answer)


