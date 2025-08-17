qid1	SELECT count(*) FROM architect WHERE gender  =  "女"	architecture
qid2	SELECT name ,  nationality ,  id FROM architect WHERE gender  =  "男" ORDER BY name	architecture
qid3	SELECT max(T1.length_meters) ,  T2.name FROM bridge AS T1 JOIN architect AS T2 ON T1.architect_id  =  T2.id	architecture
qid4	SELECT avg(length_feet) FROM bridge	architecture
qid5	SELECT name ,  built_year FROM mill WHERE TYPE  =  "风车"	architecture
qid6	SELECT DISTINCT T1.name ,  T1.nationality FROM architect AS T1 JOIN mill AS t2 ON T1.id  =  T2.architect_id	architecture
qid7	SELECT name FROM mill WHERE LOCATION != "长沙"	architecture
qid8	SELECT DISTINCT T1.type FROM mill AS T1 JOIN architect AS t2 ON T1.architect_id  =  T2.id WHERE T2.nationality  =  "美国" OR T2.nationality  =  "加拿大"	architecture
qid9	SELECT T1.id ,  T1.name FROM architect AS T1 JOIN bridge AS T2 ON T1.id  =  T2.architect_id GROUP BY T1.id HAVING count(*)  >=  3	architecture
qid10	SELECT T1.id ,  T1.name ,  T1.nationality FROM architect AS T1 JOIN mill AS T2 ON T1.id  =  T2.architect_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1	architecture
qid11	SELECT T1.id ,  T1.name ,  T1.gender FROM architect AS T1 JOIN bridge AS T2 ON T1.id  =  T2.architect_id GROUP BY T1.id HAVING count(*)  =  2 UNION SELECT T1.id ,  T1.name ,  T1.gender FROM architect AS T1 JOIN mill AS T2 ON T1.id  =  T2.architect_id GROUP BY T1.id HAVING count(*)  =  1	architecture
qid12	SELECT LOCATION FROM bridge WHERE name  =  "长江大桥" OR name  =  "赵州桥"	architecture
qid13	SELECT name FROM mill WHERE name LIKE "%江%"	architecture
qid14	SELECT DISTINCT T1.name FROM mill AS T1 JOIN architect AS t2 ON T1.architect_id  =  T2.id JOIN bridge AS T3 ON T3.architect_id  =  T2.id WHERE T3.length_meters  >  80	architecture
qid15	SELECT TYPE ,  count(*) FROM mill GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1	architecture
qid16	SELECT count(*) FROM architect WHERE id NOT IN ( SELECT architect_id FROM mill WHERE built_year  <  1850 );	architecture
qid17	SELECT t1.name FROM bridge AS t1 JOIN architect AS t2 ON t1.architect_id  =  t2.id WHERE t2.nationality  =  "美国" ORDER BY t1.length_feet	architecture
qid18	SELECT LOCATION FROM cinema EXCEPT SELECT LOCATION FROM cinema WHERE capacity  >  800	cinema
qid19	SELECT LOCATION FROM cinema WHERE openning_year  =  2010 INTERSECT SELECT LOCATION FROM cinema WHERE openning_year  =  2011	cinema
qid20	SELECT count(*) FROM cinema	cinema
qid21	SELECT count(*) FROM cinema	cinema
qid22	SELECT name ,  openning_year ,  capacity FROM cinema	cinema
qid23	SELECT name ,  LOCATION FROM cinema WHERE capacity  >  (SELECT avg(capacity) FROM cinema)	cinema
qid24	SELECT DISTINCT LOCATION FROM cinema	cinema
qid25	SELECT DISTINCT LOCATION FROM cinema	cinema
qid26	SELECT name ,  openning_year FROM cinema ORDER BY openning_year DESC	cinema
qid27	SELECT name ,  LOCATION FROM cinema ORDER BY capacity DESC LIMIT 1	cinema
qid28	SELECT avg(capacity) ,  min(capacity) ,  max(capacity) FROM cinema WHERE openning_year  >=  2011	cinema
qid29	SELECT LOCATION ,  count(*) FROM cinema GROUP BY LOCATION	cinema
qid30	SELECT LOCATION FROM cinema WHERE openning_year  >=  2010 GROUP BY LOCATION ORDER BY count(*) DESC LIMIT 1	cinema
qid31	SELECT LOCATION FROM cinema WHERE capacity  >  300 GROUP BY LOCATION HAVING count(*)  >=  2	cinema
qid32	SELECT LOCATION FROM cinema WHERE capacity  >  300 GROUP BY LOCATION HAVING count(*)  >=  2	cinema
qid33	SELECT title ,  directed_by FROM film	cinema
qid34	SELECT title ,  directed_by FROM film	cinema
qid35	SELECT DISTINCT directed_by FROM film	cinema
qid36	SELECT DISTINCT directed_by FROM film	cinema
qid37	SELECT directed_by ,  count(*) FROM film GROUP BY directed_by	cinema
qid38	SELECT T2.name ,  sum(T1.show_times_per_day) FROM schedule AS T1 JOIN cinema AS T2 ON T1.cinema_id  =  T2.cinema_id GROUP BY T1.cinema_id	cinema
qid39	SELECT T2.title ,  max(T1.price) FROM schedule AS T1 JOIN film AS T2 ON T1.film_id  =  T2.film_id GROUP BY T1.film_id	cinema
qid40	SELECT T2.title ,  max(T1.price) FROM schedule AS T1 JOIN film AS T2 ON T1.film_id  =  T2.film_id GROUP BY T1.film_id	cinema
qid41	SELECT T3.name ,  T2.title ,  T1.date ,  T1.price FROM schedule AS T1 JOIN film AS T2 ON T1.film_id  =  T2.film_id JOIN cinema AS T3 ON T1.cinema_id  =  T3.cinema_id	cinema
qid42	SELECT title ,  directed_by FROM film WHERE film_id NOT IN (SELECT film_id FROM schedule)	cinema
qid43	SELECT T2.directed_by FROM schedule AS T1 JOIN film AS T2 ON T1.film_id  =  T2.film_id GROUP BY T2.directed_by ORDER BY sum(T1.show_times_per_day) DESC LIMIT 1	cinema
qid44	SELECT LOCATION FROM cinema WHERE capacity  >  300 GROUP BY LOCATION HAVING count(*)  >  1	cinema
qid45	SELECT LOCATION FROM cinema WHERE capacity  >  300 GROUP BY LOCATION HAVING count(*)  >  1	cinema
qid46	SELECT count(*) FROM film WHERE title LIKE "故事"	cinema
qid47	SELECT count(*) FROM film WHERE title LIKE "故事"	cinema
qid48	SELECT count(*) FROM COURSE	college_3
qid49	SELECT count(*) FROM COURSE	college_3
qid50	SELECT count(*) FROM COURSE WHERE Credits  >  2	college_3
qid51	SELECT count(*) FROM COURSE WHERE Credits  >  2	college_3
qid52	SELECT CName FROM COURSE WHERE Credits  =  1	college_3
qid53	SELECT CName FROM COURSE WHERE Credits  =  1	college_3
qid54	SELECT CName FROM COURSE WHERE Days  =  "星期一"	college_3
qid55	SELECT CName FROM COURSE WHERE Days  =  "星期一"	college_3
qid56	SELECT count(*) FROM DEPARTMENT WHERE Division  =  "管理部"	college_3
qid57	SELECT count(*) FROM DEPARTMENT WHERE Division  =  "管理部"	college_3
qid58	SELECT DPhone FROM DEPARTMENT WHERE Room  =  268	college_3
qid59	SELECT DPhone FROM DEPARTMENT WHERE Room  =  268	college_3
qid60	SELECT COUNT(DISTINCT StuID) FROM ENROLLED_IN WHERE Grade  =  "B"	college_3
qid61	SELECT COUNT(DISTINCT StuID) FROM ENROLLED_IN WHERE Grade  =  "B"	college_3
qid62	SELECT max(gradepoint) ,  min(gradepoint) FROM GRADECONVERSION	college_3
qid63	SELECT max(gradepoint) ,  min(gradepoint) FROM GRADECONVERSION	college_3
qid64	SELECT DISTINCT Fname FROM STUDENT WHERE Fname LIKE 'a'	college_3
qid65	SELECT DISTINCT Fname FROM STUDENT WHERE Fname LIKE 'a'	college_3
qid66	SELECT Fname ,  Lname FROM FACULTY WHERE sex  =  "男" AND Building  =  "行政"	college_3
qid67	SELECT Fname ,  Lname FROM FACULTY WHERE sex  =  "男" AND Building  =  "行政"	college_3
qid68	SELECT Room FROM FACULTY WHERE Rank  =  "教授" AND Building  =  "行政"	college_3
qid69	SELECT Room FROM FACULTY WHERE Rank  =  "教授" AND Building  =  "行政"	college_3
qid70	SELECT DName FROM DEPARTMENT WHERE Building  =  "逸夫"	college_3
qid71	SELECT DName FROM DEPARTMENT WHERE Building  =  "逸夫"	college_3
qid72	SELECT * FROM COURSE ORDER BY Credits	college_3
qid73	SELECT * FROM COURSE ORDER BY Credits	college_3
qid74	SELECT CName FROM COURSE ORDER BY Credits	college_3
qid75	SELECT CName FROM COURSE ORDER BY Credits	college_3
qid76	SELECT Fname FROM STUDENT ORDER BY Age DESC	college_3
qid77	SELECT Fname FROM STUDENT ORDER BY Age DESC	college_3
qid78	SELECT LName FROM STUDENT WHERE Sex  =  "F" ORDER BY Age DESC	college_3
qid79	SELECT LName FROM STUDENT WHERE Sex  =  "F" ORDER BY Age DESC	college_3
qid80	SELECT Lname FROM FACULTY WHERE Building  =  "行政楼" ORDER BY Lname	college_3
qid81	SELECT Lname FROM FACULTY WHERE Building  =  "行政楼" ORDER BY Lname	college_3
qid82	SELECT Fname FROM FACULTY WHERE Rank  =  "教授" ORDER BY Fname	college_3
qid83	SELECT Fname FROM FACULTY WHERE Rank  =  "教授" ORDER BY Fname	college_3
qid84	SELECT T1.DName FROM DEPARTMENT AS T1 JOIN MINOR_IN AS T2 ON T1.DNO  =  T2.DNO GROUP BY T2.DNO ORDER BY count(*) DESC LIMIT 1	college_3
qid85	SELECT T1.DName FROM DEPARTMENT AS T1 JOIN MINOR_IN AS T2 ON T1.DNO  =  T2.DNO GROUP BY T2.DNO ORDER BY count(*) DESC LIMIT 1	college_3
qid86	SELECT DName FROM DEPARTMENT EXCEPT SELECT T1.DName FROM DEPARTMENT AS T1 JOIN MINOR_IN AS T2 ON T1.DNO  =  T2.DNO	college_3
qid87	SELECT DName FROM DEPARTMENT EXCEPT SELECT T1.DName FROM DEPARTMENT AS T1 JOIN MINOR_IN AS T2 ON T1.DNO  =  T2.DNO	college_3
qid88	SELECT T1.DName FROM DEPARTMENT AS T1 JOIN MEMBER_OF AS T2 ON T1.DNO  =  T2.DNO GROUP BY T2.DNO ORDER BY count(*) ASC LIMIT 1	college_3
qid89	SELECT T1.DName FROM DEPARTMENT AS T1 JOIN MEMBER_OF AS T2 ON T1.DNO  =  T2.DNO GROUP BY T2.DNO ORDER BY count(*) ASC LIMIT 1	college_3
qid90	SELECT Rank FROM FACULTY GROUP BY Rank ORDER BY count(*) ASC LIMIT 1	college_3
qid91	SELECT Rank FROM FACULTY GROUP BY Rank ORDER BY count(*) ASC LIMIT 1	college_3
qid92	SELECT T2.Fname ,  T2.Lname FROM COURSE AS T1 JOIN FACULTY AS T2 ON T1.Instructor  =  T2.FacID GROUP BY T1.Instructor ORDER BY count(*) DESC LIMIT 3	college_3
qid93	SELECT T2.Fname ,  T2.Lname FROM COURSE AS T1 JOIN FACULTY AS T2 ON T1.Instructor  =  T2.FacID GROUP BY T1.Instructor ORDER BY count(*) DESC LIMIT 3	college_3
qid94	SELECT T2.Building FROM COURSE AS T1 JOIN FACULTY AS T2 ON T1.Instructor  =  T2.FacID GROUP BY T1.Instructor ORDER BY count(*) DESC LIMIT 1	college_3
qid95	SELECT T2.Building FROM COURSE AS T1 JOIN FACULTY AS T2 ON T1.Instructor  =  T2.FacID GROUP BY T1.Instructor ORDER BY count(*) DESC LIMIT 1	college_3
qid96	SELECT T1.CName FROM COURSE AS T1 JOIN ENROLLED_IN AS T2 ON T1.CID  =  T2.CID GROUP BY T2.CID HAVING COUNT(*)  >=  5	college_3
qid97	SELECT T1.CName FROM COURSE AS T1 JOIN ENROLLED_IN AS T2 ON T1.CID  =  T2.CID GROUP BY T2.CID HAVING COUNT(*)  >=  5	college_3
qid98	SELECT T2.Fname ,  T2.Lname FROM COURSE AS T1 JOIN FACULTY AS T2 ON T1.Instructor  =  T2.FacID WHERE T1.CName  =  "计算机基础"	college_3
qid99	SELECT T2.Fname ,  T2.Lname FROM COURSE AS T1 JOIN FACULTY AS T2 ON T1.Instructor  =  T2.FacID WHERE T1.CName  =  "计算机基础"	college_3
qid100	SELECT T2.Dname ,  T2.Room FROM COURSE AS T1 JOIN DEPARTMENT AS T2 ON T1.DNO  =  T2.DNO WHERE T1.CName  =  "计算机导论"	college_3
qid101	SELECT T2.Dname ,  T2.Room FROM COURSE AS T1 JOIN DEPARTMENT AS T2 ON T1.DNO  =  T2.DNO WHERE T1.CName  =  "计算机导论"	college_3
qid102	SELECT T3.Fname ,  T3.LName ,  T2.gradepoint FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID	college_3
qid103	SELECT T3.Fname ,  T3.LName ,  T2.gradepoint FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID	college_3
qid104	SELECT DISTINCT T3.Fname FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T2.gradepoint  >=  3.8	college_3
qid105	SELECT DISTINCT T3.Fname FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T2.gradepoint  >=  3.8	college_3
qid106	SELECT T1.Fname ,  T1.Lname FROM FACULTY AS T1 JOIN MEMBER_OF AS T2 ON T1.FacID  =  T2.FacID WHERE T2.DNO  =  520	college_3
qid107	SELECT T1.Fname ,  T1.Lname FROM FACULTY AS T1 JOIN MEMBER_OF AS T2 ON T1.FacID  =  T2.FacID WHERE T2.DNO  =  520	college_3
qid108	SELECT T2.Fname ,  T2.Lname FROM MINOR_IN AS T1 JOIN STUDENT AS T2 ON T1.StuID  =  T2.StuID WHERE T1.DNO  =  140	college_3
qid109	SELECT T2.Fname ,  T2.Lname FROM MINOR_IN AS T1 JOIN STUDENT AS T2 ON T1.StuID  =  T2.StuID WHERE T1.DNO  =  140	college_3
qid110	SELECT T2.Lname FROM DEPARTMENT AS T1 JOIN FACULTY AS T2 ON T1.DNO  =  T3.DNO JOIN MEMBER_OF AS T3 ON T2.FacID  =  T3.FacID WHERE T1.DName  =  "计算机科学"	college_3
qid111	SELECT T2.Lname FROM DEPARTMENT AS T1 JOIN FACULTY AS T2 ON T1.DNO  =  T3.DNO JOIN MEMBER_OF AS T3 ON T2.FacID  =  T3.FacID WHERE T1.DName  =  "计算机科学"	college_3
qid112	SELECT avg(T2.gradepoint) FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T3.LName  =  "帅"	college_3
qid113	SELECT avg(T2.gradepoint) FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T3.LName  =  "帅"	college_3
qid114	SELECT max(T2.gradepoint) ,  min(T2.gradepoint) FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T3.city_code  =  "上海"	college_3
qid115	SELECT max(T2.gradepoint) ,  min(T2.gradepoint) FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T3.city_code  =  "上海"	college_3
qid116	SELECT CName FROM COURSE WHERE Credits  =  3 UNION SELECT CName FROM COURSE WHERE Credits  =  1 AND Hours  =  4	college_3
qid117	SELECT CName FROM COURSE WHERE Credits  =  3 UNION SELECT CName FROM COURSE WHERE Credits  =  1 AND Hours  =  4	college_3
qid118	SELECT DName FROM DEPARTMENT WHERE Division  =  "管理部" UNION SELECT DName FROM DEPARTMENT WHERE Division  =  "财务部" AND Building  =  "行政"	college_3
qid119	SELECT DName FROM DEPARTMENT WHERE Division  =  "管理部" UNION SELECT DName FROM DEPARTMENT WHERE Division  =  "财务部" AND Building  =  "行政"	college_3
qid120	SELECT Fname FROM STUDENT WHERE StuID NOT IN (SELECT StuID FROM ENROLLED_IN)	college_3
qid121	SELECT Fname FROM STUDENT WHERE StuID NOT IN (SELECT StuID FROM ENROLLED_IN)	college_3
qid122	SELECT count(*) FROM singer	concert_singer
qid123	SELECT count(*) FROM singer	concert_singer
qid124	SELECT name ,  country ,  age FROM singer ORDER BY age DESC	concert_singer
qid125	SELECT name ,  country ,  age FROM singer ORDER BY age DESC	concert_singer
qid126	SELECT avg(age) ,  min(age) ,  max(age) FROM singer WHERE country  =  '法国'	concert_singer
qid127	SELECT avg(age) ,  min(age) ,  max(age) FROM singer WHERE country  =  '法国'	concert_singer
qid128	SELECT song_name ,  song_release_year FROM singer ORDER BY age LIMIT 1	concert_singer
qid129	SELECT song_name ,  song_release_year FROM singer ORDER BY age LIMIT 1	concert_singer
qid130	SELECT DISTINCT country FROM singer WHERE age  >  20	concert_singer
qid131	SELECT DISTINCT country FROM singer WHERE age  >  20	concert_singer
qid132	SELECT country ,  count(*) FROM singer GROUP BY country	concert_singer
qid133	SELECT country ,  count(*) FROM singer GROUP BY country	concert_singer
qid134	SELECT song_name FROM singer WHERE age  >  (SELECT avg(age) FROM singer)	concert_singer
qid135	SELECT song_name FROM singer WHERE age  >  (SELECT avg(age) FROM singer)	concert_singer
qid136	SELECT LOCATION ,  name FROM stadium WHERE capacity BETWEEN 5000 AND 10000	concert_singer
qid137	SELECT LOCATION ,  name FROM stadium WHERE capacity BETWEEN 5000 AND 10000	concert_singer
qid138	SELECT avg(capacity) ,  max(capacity) FROM stadium	concert_singer
qid139	SELECT avg(capacity) ,  max(capacity) FROM stadium	concert_singer
qid140	SELECT name ,  capacity FROM stadium ORDER BY average DESC LIMIT 1	concert_singer
qid141	SELECT name ,  capacity FROM stadium ORDER BY average DESC LIMIT 1	concert_singer
qid142	SELECT count(*) FROM concert WHERE YEAR  =  2014 OR YEAR  =  2015	concert_singer
qid143	SELECT count(*) FROM concert WHERE YEAR  =  2014 OR YEAR  =  2015	concert_singer
qid144	SELECT T2.name ,  count(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id GROUP BY T1.stadium_id	concert_singer
qid145	SELECT T2.name ,  count(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id GROUP BY T1.stadium_id	concert_singer
qid146	SELECT T2.name ,  T2.capacity FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T1.year  >=  2014 GROUP BY T2.stadium_id ORDER BY count(*) DESC LIMIT 1	concert_singer
qid147	SELECT T2.name ,  T2.capacity FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T1.year  >=  2014 GROUP BY T2.stadium_id ORDER BY count(*) DESC LIMIT 1	concert_singer
qid148	SELECT YEAR FROM concert GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	concert_singer
qid149	SELECT YEAR FROM concert GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	concert_singer
qid150	SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)	concert_singer
qid151	SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)	concert_singer
qid152	SELECT country FROM singer WHERE age  >  40 INTERSECT SELECT country FROM singer WHERE age  <  30	concert_singer
qid153	SELECT name FROM stadium EXCEPT SELECT T2.name FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T1.year  =  2014	concert_singer
qid154	SELECT name FROM stadium EXCEPT SELECT T2.name FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T1.year  =  2014	concert_singer
qid155	SELECT T2.concert_name ,  T2.theme ,  count(*) FROM singer_in_concert AS T1 JOIN concert AS T2 ON T1.concert_id  =  T2.concert_id GROUP BY T2.concert_id	concert_singer
qid156	SELECT T2.concert_name ,  T2.theme ,  count(*) FROM singer_in_concert AS T1 JOIN concert AS T2 ON T1.concert_id  =  T2.concert_id GROUP BY T2.concert_id	concert_singer
qid157	SELECT T2.name ,  count(*) FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.singer_id  =  T2.singer_id GROUP BY T2.singer_id	concert_singer
qid158	SELECT T2.name ,  count(*) FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.singer_id  =  T2.singer_id GROUP BY T2.singer_id	concert_singer
qid159	SELECT T2.name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.singer_id  =  T2.singer_id JOIN concert AS T3 ON T1.concert_id  =  T3.concert_id WHERE T3.year  =  2014	concert_singer
qid160	SELECT T2.name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.singer_id  =  T2.singer_id JOIN concert AS T3 ON T1.concert_id  =  T3.concert_id WHERE T3.year  =  2014	concert_singer
qid161	SELECT name ,  country FROM singer WHERE song_name LIKE '你'	concert_singer
qid162	SELECT name ,  country FROM singer WHERE song_name LIKE '你'	concert_singer
qid163	SELECT T2.name ,  T2.location FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T1.Year  =  2014 INTERSECT SELECT T2.name ,  T2.location FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T1.Year  =  2015	concert_singer
qid164	SELECT T2.name ,  T2.location FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T1.Year  =  2014 INTERSECT SELECT T2.name ,  T2.location FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T1.Year  =  2015	concert_singer
qid165	SELECT count(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id ORDER BY T2.Capacity DESC LIMIT 1	concert_singer
qid166	SELECT count(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id ORDER BY T2.Capacity DESC LIMIT 1	concert_singer
qid167	SELECT count(*) FROM premises	customers_campaigns_ecommerce
qid168	SELECT DISTINCT premises_type FROM premises	customers_campaigns_ecommerce
qid169	SELECT premises_type ,  premise_details FROM premises ORDER BY premises_type	customers_campaigns_ecommerce
qid170	SELECT premises_type ,  count(*) FROM premises GROUP BY premises_type	customers_campaigns_ecommerce
qid171	SELECT product_category ,  count(*) FROM mailshot_campaigns GROUP BY product_category	customers_campaigns_ecommerce
qid172	SELECT customer_name ,  customer_phone FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM mailshot_customers)	customers_campaigns_ecommerce
qid173	SELECT T1.customer_name ,  T1.customer_phone FROM customers AS T1 JOIN mailshot_customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.outcome_code  =  '无回应'	customers_campaigns_ecommerce
qid174	SELECT outcome_code ,  count(*) FROM mailshot_customers GROUP BY outcome_code	customers_campaigns_ecommerce
qid175	SELECT T2.customer_name FROM mailshot_customers AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE outcome_code  =  '预定' GROUP BY T1.customer_id HAVING count(*)  >=  2	customers_campaigns_ecommerce
qid176	SELECT T2.customer_name FROM mailshot_customers AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1	customers_campaigns_ecommerce
qid177	SELECT T2.customer_name ,  T2.payment_method FROM mailshot_customers AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.outcome_code  =  '预定' INTERSECT SELECT T2.customer_name ,  T2.payment_method FROM mailshot_customers AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.outcome_code  =  '无回应'	customers_campaigns_ecommerce
qid178	SELECT T2.premises_type ,  T1.address_type_code FROM customer_addresses AS T1 JOIN premises AS T2 ON T1.premise_id  =  T2.premise_id	customers_campaigns_ecommerce
qid179	SELECT DISTINCT address_type_code FROM customer_addresses	customers_campaigns_ecommerce
qid180	SELECT order_shipping_charges ,  customer_id FROM customer_orders WHERE order_status_code  =  '取消' OR order_status_code  =  '付款'	customers_campaigns_ecommerce
qid181	SELECT T1.customer_name FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id WHERE shipping_method_code  =  '顺丰快递' AND order_status_code  =  '付款'	customers_campaigns_ecommerce
qid182	SELECT count(*) FROM Accounts	customers_card_transactions
qid183	SELECT count(*) FROM Accounts	customers_card_transactions
qid184	SELECT account_id ,  customer_id ,  account_name FROM Accounts	customers_card_transactions
qid185	SELECT account_id ,  customer_id ,  account_name FROM Accounts	customers_card_transactions
qid186	SELECT other_account_details FROM Accounts WHERE account_name  =  "338"	customers_card_transactions
qid187	SELECT other_account_details FROM Accounts WHERE account_name  =  "338"	customers_card_transactions
qid188	SELECT T2.customer_first_name ,  T2.customer_last_name ,  T2.customer_phone FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.account_name  =  "162"	customers_card_transactions
qid189	SELECT T2.customer_first_name ,  T2.customer_last_name ,  T2.customer_phone FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.account_name  =  "162"	customers_card_transactions
qid190	SELECT count(*) FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  "艺术" AND T2.customer_last_name  =  "王"	customers_card_transactions
qid191	SELECT count(*) FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  "艺术" AND T2.customer_last_name  =  "王"	customers_card_transactions
qid192	SELECT customer_id ,  count(*) FROM Accounts GROUP BY customer_id	customers_card_transactions
qid193	SELECT customer_id ,  count(*) FROM Accounts GROUP BY customer_id	customers_card_transactions
qid194	SELECT customer_id ,  count(*) FROM Accounts GROUP BY customer_id ORDER BY count(*) DESC LIMIT 1	customers_card_transactions
qid195	SELECT customer_id ,  count(*) FROM Accounts GROUP BY customer_id ORDER BY count(*) DESC LIMIT 1	customers_card_transactions
qid196	SELECT T2.customer_first_name ,  T2.customer_last_name ,  T1.customer_id FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1	customers_card_transactions
qid197	SELECT T2.customer_first_name ,  T2.customer_last_name ,  T1.customer_id FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1	customers_card_transactions
qid198	SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Accounts)	customers_card_transactions
qid199	SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Accounts)	customers_card_transactions
qid200	SELECT customer_first_name ,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Accounts AS T2 ON T1.customer_id  =  T2.customer_id	customers_card_transactions
qid201	SELECT customer_first_name ,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Accounts AS T2 ON T1.customer_id  =  T2.customer_id	customers_card_transactions
qid202	SELECT DISTINCT T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Accounts AS T2 ON T1.customer_id  =  T2.customer_id	customers_card_transactions
qid203	SELECT DISTINCT T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Accounts AS T2 ON T1.customer_id  =  T2.customer_id	customers_card_transactions
qid204	SELECT count(DISTINCT customer_id) FROM Accounts	customers_card_transactions
qid205	SELECT count(DISTINCT customer_id) FROM Accounts	customers_card_transactions
qid206	SELECT count(*) FROM Customers	customers_card_transactions
qid207	SELECT count(*) FROM Customers	customers_card_transactions
qid208	SELECT customer_id ,  customer_first_name ,  customer_last_name ,  customer_phone FROM Customers	customers_card_transactions
qid209	SELECT customer_id ,  customer_first_name ,  customer_last_name ,  customer_phone FROM Customers	customers_card_transactions
qid210	SELECT customer_phone ,  customer_email FROM Customers WHERE customer_first_name  =  "许" AND customer_last_name  =  "海超"	customers_card_transactions
qid211	SELECT customer_phone ,  customer_email FROM Customers WHERE customer_first_name  =  "许" AND customer_last_name  =  "海超"	customers_card_transactions
qid212	SELECT count(*) FROM Customers_cards	customers_card_transactions
qid213	SELECT count(*) FROM Customers_cards	customers_card_transactions
qid214	SELECT card_id ,  customer_id ,  card_type_code ,  card_number FROM Customers_cards	customers_card_transactions
qid215	SELECT card_id ,  customer_id ,  card_type_code ,  card_number FROM Customers_cards	customers_card_transactions
qid216	SELECT date_valid_from ,  date_valid_to FROM Customers_cards WHERE card_number  =  "4560596484842"	customers_card_transactions
qid217	SELECT date_valid_from ,  date_valid_to FROM Customers_cards WHERE card_number  =  "4560596484842"	customers_card_transactions
qid218	SELECT T2.customer_first_name ,  T2.customer_last_name ,  T2.customer_phone FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.card_number  =  "4560596484842"	customers_card_transactions
qid219	SELECT T2.customer_first_name ,  T2.customer_last_name ,  T2.customer_phone FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.card_number  =  "4560596484842"	customers_card_transactions
qid220	SELECT count(*) FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  "艺术" AND T2.customer_last_name  =  "王"	customers_card_transactions
qid221	SELECT count(*) FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  "艺术" AND T2.customer_last_name  =  "王"	customers_card_transactions
qid222	SELECT count(*) FROM Customers_cards WHERE card_type_code  =  "借记卡"	customers_card_transactions
qid223	SELECT count(*) FROM Customers_cards WHERE card_type_code  =  "借记卡"	customers_card_transactions
qid224	SELECT count(*) FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  "白" AND T2.customer_last_name  =  "启光" AND T1.card_type_code  =  "信用卡"	customers_card_transactions
qid225	SELECT count(*) FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  "白" AND T2.customer_last_name  =  "启光" AND T1.card_type_code  =  "信用卡"	customers_card_transactions
qid226	SELECT customer_id ,  count(*) FROM Customers_cards GROUP BY customer_id	customers_card_transactions
qid227	SELECT customer_id ,  count(*) FROM Customers_cards GROUP BY customer_id	customers_card_transactions
qid228	SELECT customer_id ,  count(*) FROM Customers_cards GROUP BY customer_id ORDER BY count(*) DESC LIMIT 1	customers_card_transactions
qid229	SELECT customer_id ,  count(*) FROM Customers_cards GROUP BY customer_id ORDER BY count(*) DESC LIMIT 1	customers_card_transactions
qid230	SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2	customers_card_transactions
qid231	SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2	customers_card_transactions
qid232	SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1	customers_card_transactions
qid233	SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1	customers_card_transactions
qid234	SELECT card_type_code ,  count(*) FROM Customers_cards GROUP BY card_type_code	customers_card_transactions
qid235	SELECT card_type_code ,  count(*) FROM Customers_cards GROUP BY card_type_code	customers_card_transactions
qid236	SELECT card_type_code FROM Customers_cards GROUP BY card_type_code ORDER BY count(*) DESC LIMIT 1	customers_card_transactions
qid237	SELECT card_type_code FROM Customers_cards GROUP BY card_type_code ORDER BY count(*) DESC LIMIT 1	customers_card_transactions
qid238	SELECT card_type_code FROM Customers_cards GROUP BY card_type_code HAVING count(*)  >=  5	customers_card_transactions
qid239	SELECT card_type_code FROM Customers_cards GROUP BY card_type_code HAVING count(*)  >=  5	customers_card_transactions
qid240	SELECT card_type_code ,  count(DISTINCT customer_id) FROM Customers_cards GROUP BY card_type_code	customers_card_transactions
qid241	SELECT card_type_code ,  count(DISTINCT customer_id) FROM Customers_cards GROUP BY card_type_code	customers_card_transactions
qid242	SELECT customer_id ,  customer_first_name FROM Customers EXCEPT SELECT T1.customer_id ,  T2.customer_first_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE card_type_code  =  "信用卡"	customers_card_transactions
qid243	SELECT customer_id ,  customer_first_name FROM Customers EXCEPT SELECT T1.customer_id ,  T2.customer_first_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE card_type_code  =  "信用卡"	customers_card_transactions
qid244	SELECT DISTINCT card_type_code FROM Customers_Cards	customers_card_transactions
qid245	SELECT DISTINCT card_type_code FROM Customers_Cards	customers_card_transactions
qid246	SELECT count(DISTINCT card_type_code) FROM Customers_Cards	customers_card_transactions
qid247	SELECT count(DISTINCT card_type_code) FROM Customers_Cards	customers_card_transactions
qid248	SELECT DISTINCT transaction_type FROM Financial_Transactions	customers_card_transactions
qid249	SELECT DISTINCT transaction_type FROM Financial_Transactions	customers_card_transactions
qid250	SELECT count(DISTINCT transaction_type) FROM Financial_Transactions	customers_card_transactions
qid251	SELECT count(DISTINCT transaction_type) FROM Financial_Transactions	customers_card_transactions
qid252	SELECT avg(transaction_amount) ,  sum(transaction_amount) FROM Financial_transactions	customers_card_transactions
qid253	SELECT avg(transaction_amount) ,  sum(transaction_amount) FROM Financial_transactions	customers_card_transactions
qid254	SELECT T2.card_type_code ,  count(*) FROM Financial_transactions AS T1 JOIN Customers_cards AS T2 ON T1.card_id  =  T2.card_id GROUP BY T2.card_type_code	customers_card_transactions
qid255	SELECT T2.card_type_code ,  count(*) FROM Financial_transactions AS T1 JOIN Customers_cards AS T2 ON T1.card_id  =  T2.card_id GROUP BY T2.card_type_code	customers_card_transactions
qid256	SELECT transaction_type ,  count(*) FROM Financial_transactions GROUP BY transaction_type	customers_card_transactions
qid257	SELECT transaction_type ,  count(*) FROM Financial_transactions GROUP BY transaction_type	customers_card_transactions
qid258	SELECT transaction_type FROM Financial_transactions GROUP BY transaction_type ORDER BY sum(transaction_amount) DESC LIMIT 1	customers_card_transactions
qid259	SELECT transaction_type FROM Financial_transactions GROUP BY transaction_type ORDER BY sum(transaction_amount) DESC LIMIT 1	customers_card_transactions
qid260	SELECT account_id ,  count(*) FROM Financial_transactions GROUP BY account_id	customers_card_transactions
qid261	SELECT account_id ,  count(*) FROM Financial_transactions GROUP BY account_id	customers_card_transactions
qid262	SELECT document_name ,  access_count FROM documents ORDER BY document_name	document_management
qid263	SELECT document_name ,  access_count FROM documents ORDER BY document_name	document_management
qid264	SELECT document_name ,  access_count FROM documents ORDER BY access_count DESC LIMIT 1	document_management
qid265	SELECT document_name ,  access_count FROM documents ORDER BY access_count DESC LIMIT 1	document_management
qid266	SELECT document_type_code FROM documents GROUP BY document_type_code HAVING count(*)  >  4	document_management
qid267	SELECT document_type_code FROM documents GROUP BY document_type_code HAVING count(*)  >  4	document_management
qid268	SELECT sum(access_count) FROM documents GROUP BY document_type_code ORDER BY count(*) DESC LIMIT 1	document_management
qid269	SELECT sum(access_count) FROM documents GROUP BY document_type_code ORDER BY count(*) DESC LIMIT 1	document_management
qid270	SELECT avg(access_count) FROM documents	document_management
qid271	SELECT avg(access_count) FROM documents	document_management
qid272	SELECT t2.document_structure_description FROM documents AS t1 JOIN document_structures AS t2 ON t1.document_structure_code  =  t2.document_structure_code GROUP BY t1.document_structure_code ORDER BY count(*) DESC LIMIT 1	document_management
qid273	SELECT t2.document_structure_description FROM documents AS t1 JOIN document_structures AS t2 ON t1.document_structure_code  =  t2.document_structure_code GROUP BY t1.document_structure_code ORDER BY count(*) DESC LIMIT 1	document_management
qid274	SELECT document_type_code FROM documents WHERE document_name  =  "张伟的简历"	document_management
qid275	SELECT document_type_code FROM documents WHERE document_name  =  "张伟的简历"	document_management
qid276	SELECT document_name FROM documents GROUP BY document_type_code ORDER BY count(*) DESC LIMIT 3 INTERSECT SELECT document_name FROM documents GROUP BY document_structure_code ORDER BY count(*) DESC LIMIT 3	document_management
qid277	SELECT document_name FROM documents GROUP BY document_type_code ORDER BY count(*) DESC LIMIT 3 INTERSECT SELECT document_name FROM documents GROUP BY document_structure_code ORDER BY count(*) DESC LIMIT 3	document_management
qid278	SELECT document_type_code FROM documents GROUP BY document_type_code HAVING sum(access_count)  >  10000	document_management
qid279	SELECT document_type_code FROM documents GROUP BY document_type_code HAVING sum(access_count)  >  10000	document_management
qid280	SELECT t2.section_title FROM documents AS t1 JOIN document_sections AS t2 ON t1.document_code  =  t2.document_code WHERE t1.document_name  =  "张伟的简历"	document_management
qid281	SELECT t2.section_title FROM documents AS t1 JOIN document_sections AS t2 ON t1.document_code  =  t2.document_code WHERE t1.document_name  =  "张伟的简历"	document_management
qid282	SELECT document_name FROM documents WHERE document_code NOT IN (SELECT document_code FROM document_sections)	document_management
qid283	SELECT document_name FROM documents WHERE document_code NOT IN (SELECT document_code FROM document_sections)	document_management
qid284	SELECT user_name ,  password FROM users GROUP BY role_code ORDER BY count(*) DESC LIMIT 1	document_management
qid285	SELECT user_name ,  password FROM users GROUP BY role_code ORDER BY count(*) DESC LIMIT 1	document_management
qid286	SELECT avg(t1.access_count) FROM documents AS t1 JOIN document_functional_areas AS t2 ON t1.document_code  =  t2.document_code JOIN functional_areas AS t3 ON t2.functional_area_code  =  t3.functional_area_code WHERE t3.functional_area_description  =  "致谢"	document_management
qid287	SELECT avg(t1.access_count) FROM documents AS t1 JOIN document_functional_areas AS t2 ON t1.document_code  =  t2.document_code JOIN functional_areas AS t3 ON t2.functional_area_code  =  t3.functional_area_code WHERE t3.functional_area_description  =  "致谢"	document_management
qid288	SELECT document_name FROM documents EXCEPT SELECT t1.document_name FROM documents AS t1 JOIN document_sections AS t2 ON t1.document_code  =  t2.document_code JOIN document_sections_images AS t3 ON t2.section_id  =  t3.section_id	document_management
qid289	SELECT document_name FROM documents EXCEPT SELECT t1.document_name FROM documents AS t1 JOIN document_sections AS t2 ON t1.document_code  =  t2.document_code JOIN document_sections_images AS t3 ON t2.section_id  =  t3.section_id	document_management
qid290	SELECT t1.document_name FROM documents AS t1 JOIN document_sections AS t2 ON t1.document_code  =  t2.document_code GROUP BY t1.document_code ORDER BY count(*) DESC LIMIT 1	document_management
qid291	SELECT t1.document_name FROM documents AS t1 JOIN document_sections AS t2 ON t1.document_code  =  t2.document_code GROUP BY t1.document_code ORDER BY count(*) DESC LIMIT 1	document_management
qid292	SELECT document_name FROM documents WHERE document_name LIKE "简历"	document_management
qid293	SELECT document_name FROM documents WHERE document_name LIKE "简历"	document_management
qid294	SELECT count(*) FROM users WHERE user_login  =  1	document_management
qid295	SELECT count(*) FROM users WHERE user_login  =  1	document_management
qid296	SELECT role_description FROM ROLES WHERE role_code  =  (SELECT role_code FROM users WHERE user_login  =  1 GROUP BY role_code ORDER BY count(*) DESC LIMIT 1)	document_management
qid297	SELECT role_description FROM ROLES WHERE role_code  =  (SELECT role_code FROM users WHERE user_login  =  1 GROUP BY role_code ORDER BY count(*) DESC LIMIT 1)	document_management
qid298	SELECT avg(access_count) FROM documents GROUP BY document_structure_code ORDER BY count(*) ASC LIMIT 1	document_management
qid299	SELECT avg(access_count) FROM documents GROUP BY document_structure_code ORDER BY count(*) ASC LIMIT 1	document_management
qid300	SELECT image_name ,  image_url FROM images ORDER BY image_name	document_management
qid301	SELECT image_name ,  image_url FROM images ORDER BY image_name	document_management
qid302	SELECT count(*) ,  role_code FROM users GROUP BY role_code	document_management
qid303	SELECT count(*) ,  role_code FROM users GROUP BY role_code	document_management
qid304	SELECT document_type_code FROM documents GROUP BY document_type_code HAVING count(*)  >  2	document_management
qid305	SELECT document_type_code FROM documents GROUP BY document_type_code HAVING count(*)  >  2	document_management
qid306	SELECT count(*) FROM COURSES	e_learning
qid307	SELECT count(*) FROM COURSES	e_learning
qid308	SELECT course_description FROM COURSES WHERE course_name  =  "数据库"	e_learning
qid309	SELECT course_description FROM COURSES WHERE course_name  =  "数据库"	e_learning
qid310	SELECT address_line_1 FROM Course_Authors_and_Tutors WHERE personal_name =  "琪琪"	e_learning
qid311	SELECT address_line_1 FROM Course_Authors_and_Tutors WHERE personal_name =  "琪琪"	e_learning
qid312	SELECT address_line_1 FROM Course_Authors_and_Tutors	e_learning
qid313	SELECT address_line_1 FROM Course_Authors_and_Tutors	e_learning
qid314	SELECT login_name ,  family_name FROM Course_Authors_and_Tutors	e_learning
qid315	SELECT login_name ,  family_name FROM Course_Authors_and_Tutors	e_learning
qid316	SELECT date_of_enrolment ,  date_of_completion FROM Student_Course_Enrolment	e_learning
qid317	SELECT date_of_enrolment ,  date_of_completion FROM Student_Course_Enrolment	e_learning
qid318	SELECT count(DISTINCT student_id) FROM Student_Course_Enrolment	e_learning
qid319	SELECT count(DISTINCT student_id) FROM Student_Course_Enrolment	e_learning
qid320	SELECT count(course_id) FROM Student_Course_Enrolment	e_learning
qid321	SELECT count(course_id) FROM Student_Course_Enrolment	e_learning
qid322	SELECT date_test_taken FROM Student_Tests_Taken WHERE test_result  =  "通过"	e_learning
qid323	SELECT date_test_taken FROM Student_Tests_Taken WHERE test_result  =  "通过"	e_learning
qid324	SELECT count(*) FROM Student_Tests_Taken WHERE test_result  =  "失败"	e_learning
qid325	SELECT count(*) FROM Student_Tests_Taken WHERE test_result  =  "失败"	e_learning
qid326	SELECT login_name FROM Students WHERE family_name  =  "睿"	e_learning
qid327	SELECT login_name FROM Students WHERE family_name  =  "睿"	e_learning
qid328	SELECT date_of_latest_logon FROM Students WHERE family_name  =  "龚" OR family_name  =  "铭"	e_learning
qid329	SELECT date_of_latest_logon FROM Students WHERE family_name  =  "龚" OR family_name  =  "铭"	e_learning
qid330	SELECT COUNT(*) FROM Students WHERE personal_name LIKE "孙"	e_learning
qid331	SELECT COUNT(*) FROM Students WHERE personal_name LIKE "孙"	e_learning
qid332	SELECT subject_name FROM SUBJECTS	e_learning
qid333	SELECT subject_name FROM SUBJECTS	e_learning
qid334	SELECT * FROM Course_Authors_and_Tutors ORDER BY personal_name	e_learning
qid335	SELECT * FROM Course_Authors_and_Tutors ORDER BY personal_name	e_learning
qid336	SELECT personal_name ,  family_name FROM Students ORDER BY family_name	e_learning
qid337	SELECT personal_name ,  family_name FROM Students ORDER BY family_name	e_learning
qid338	SELECT test_result ,  COUNT(*) FROM Student_Tests_Taken GROUP BY test_result ORDER BY COUNT(*) DESC	e_learning
qid339	SELECT test_result ,  COUNT(*) FROM Student_Tests_Taken GROUP BY test_result ORDER BY COUNT(*) DESC	e_learning
qid340	SELECT T1.login_name FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id WHERE T2.course_name  =  "高级数据库"	e_learning
qid341	SELECT T1.login_name FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id WHERE T2.course_name  =  "高级数据库"	e_learning
qid342	SELECT T1.address_line_1 FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id WHERE T2.course_name  =  "操作系统" OR T2.course_name  =  "数据结构"	e_learning
qid343	SELECT T1.address_line_1 FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id WHERE T2.course_name  =  "操作系统" OR T2.course_name  =  "数据结构"	e_learning
qid344	SELECT T1.personal_name ,  T1.family_name ,  T2.author_id FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id ORDER BY COUNT(*) DESC LIMIT 1	e_learning
qid345	SELECT T1.personal_name ,  T1.family_name ,  T2.author_id FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id ORDER BY COUNT(*) DESC LIMIT 1	e_learning
qid346	SELECT T1.address_line_1 ,  T2.author_id FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id HAVING Count(*)  >=  2	e_learning
qid347	SELECT T1.address_line_1 ,  T2.author_id FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id HAVING Count(*)  >=  2	e_learning
qid348	SELECT T2.course_name FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id WHERE T1.personal_name  =  "志华"	e_learning
qid349	SELECT T2.course_name FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id WHERE T1.personal_name  =  "志华"	e_learning
qid350	SELECT T1.course_name ,  T1.course_description FROM Courses AS T1 JOIN Subjects AS T2 ON T1.subject_id  =  T2.subject_id WHERE T2.subject_name  =  "计算机科学"	e_learning
qid351	SELECT T1.course_name ,  T1.course_description FROM Courses AS T1 JOIN Subjects AS T2 ON T1.subject_id  =  T2.subject_id WHERE T2.subject_name  =  "计算机科学"	e_learning
qid352	SELECT T1.subject_id ,  T2.subject_name ,  COUNT(*) FROM Courses AS T1 JOIN Subjects AS T2 ON T1.subject_id  =  T2.subject_id GROUP BY T1.subject_id	e_learning
qid353	SELECT T1.subject_id ,  T2.subject_name ,  COUNT(*) FROM Courses AS T1 JOIN Subjects AS T2 ON T1.subject_id  =  T2.subject_id GROUP BY T1.subject_id	e_learning
qid354	SELECT T1.subject_id ,  T2.subject_name ,  COUNT(*) FROM Courses AS T1 JOIN Subjects AS T2 ON T1.subject_id  =  T2.subject_id GROUP BY T1.subject_id ORDER BY COUNT(*) ASC	e_learning
qid355	SELECT T1.subject_id ,  T2.subject_name ,  COUNT(*) FROM Courses AS T1 JOIN Subjects AS T2 ON T1.subject_id  =  T2.subject_id GROUP BY T1.subject_id ORDER BY COUNT(*) ASC	e_learning
qid356	SELECT T2.date_of_enrolment FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id WHERE T1.course_name  =  "西班牙语"	e_learning
qid357	SELECT T2.date_of_enrolment FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id WHERE T1.course_name  =  "西班牙语"	e_learning
qid358	SELECT T1.course_name FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_name ORDER BY COUNT(*) DESC LIMIT 1	e_learning
qid359	SELECT T1.course_name FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_name ORDER BY COUNT(*) DESC LIMIT 1	e_learning
qid360	SELECT T1.course_name FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_name HAVING COUNT(*)  =  1	e_learning
qid361	SELECT T1.course_name FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_name HAVING COUNT(*)  =  1	e_learning
qid362	SELECT T1.course_description ,  T1.course_name FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_name HAVING COUNT(*)  >  2	e_learning
qid363	SELECT T1.course_description ,  T1.course_name FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_name HAVING COUNT(*)  >  2	e_learning
qid364	SELECT T1.course_name ,  COUNT(*) FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_name	e_learning
qid365	SELECT T1.course_name ,  COUNT(*) FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_name	e_learning
qid366	SELECT T1.date_of_enrolment FROM Student_Course_Enrolment AS T1 JOIN Student_Tests_Taken AS T2 ON T1.registration_id  =  T2.registration_id WHERE T2.test_result  =  "通过"	e_learning
qid367	SELECT T1.date_of_enrolment FROM Student_Course_Enrolment AS T1 JOIN Student_Tests_Taken AS T2 ON T1.registration_id  =  T2.registration_id WHERE T2.test_result  =  "通过"	e_learning
qid368	SELECT T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Student_Tests_Taken AS T2 ON T1.registration_id  =  T2.registration_id WHERE T2.test_result  =  "失败"	e_learning
qid369	SELECT T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Student_Tests_Taken AS T2 ON T1.registration_id  =  T2.registration_id WHERE T2.test_result  =  "失败"	e_learning
qid370	SELECT T1.date_of_enrolment ,  T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.personal_name  =  "小天"	e_learning
qid371	SELECT T1.date_of_enrolment ,  T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.personal_name  =  "小天"	e_learning
qid372	SELECT T1.date_of_enrolment ,  T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.family_name  =  "韩" AND T2.personal_name  =  "佳明"	e_learning
qid373	SELECT T1.date_of_enrolment ,  T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.family_name  =  "韩" AND T2.personal_name  =  "佳明"	e_learning
qid374	SELECT T1.student_id ,  T2.login_name FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1	e_learning
qid375	SELECT T1.student_id ,  T2.login_name FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1	e_learning
qid376	SELECT T1.student_id ,  T2.personal_name FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING COUNT(*)  >=  2	e_learning
qid377	SELECT T1.student_id ,  T2.personal_name FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING COUNT(*)  >=  2	e_learning
qid378	SELECT T1.student_id ,  T2.middle_name FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING COUNT(*)  <=  2	e_learning
qid379	SELECT T1.student_id ,  T2.middle_name FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING COUNT(*)  <=  2	e_learning
qid380	SELECT personal_name FROM Students EXCEPT SELECT T1.personal_name FROM Students AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.student_id  =  T2.student_id	e_learning
qid381	SELECT personal_name FROM Students EXCEPT SELECT T1.personal_name FROM Students AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.student_id  =  T2.student_id	e_learning
qid382	SELECT count(*) FROM Students WHERE student_id NOT IN (SELECT student_id FROM Student_Course_Enrolment)	e_learning
qid383	SELECT count(*) FROM Students WHERE student_id NOT IN (SELECT student_id FROM Student_Course_Enrolment)	e_learning
qid384	SELECT login_name FROM Course_Authors_and_Tutors INTERSECT SELECT login_name FROM Students	e_learning
qid385	SELECT login_name FROM Course_Authors_and_Tutors INTERSECT SELECT login_name FROM Students	e_learning
qid386	SELECT personal_name FROM Course_Authors_and_Tutors INTERSECT SELECT personal_name FROM Students	e_learning
qid387	SELECT personal_name FROM Course_Authors_and_Tutors INTERSECT SELECT personal_name FROM Students	e_learning
qid388	SELECT count(*) FROM farm	farm
qid389	SELECT count(*) FROM farm	farm
qid390	SELECT Total_Horses FROM farm ORDER BY Total_Horses ASC	farm
qid391	SELECT Total_Horses FROM farm ORDER BY Total_Horses ASC	farm
qid392	SELECT Hosts FROM farm_competition WHERE Theme !=  '外星人'	farm
qid393	SELECT Hosts FROM farm_competition WHERE Theme !=  '外星人'	farm
qid394	SELECT Theme FROM farm_competition ORDER BY YEAR ASC	farm
qid395	SELECT Theme FROM farm_competition ORDER BY YEAR ASC	farm
qid396	SELECT avg(Working_Horses) FROM farm WHERE Total_Horses  >  5000	farm
qid397	SELECT avg(Working_Horses) FROM farm WHERE Total_Horses  >  5000	farm
qid398	SELECT max(Cows) ,  min(Cows) FROM farm	farm
qid399	SELECT max(Cows) ,  min(Cows) FROM farm	farm
qid400	SELECT count(DISTINCT Status) FROM city	farm
qid401	SELECT count(DISTINCT Status) FROM city	farm
qid402	SELECT Official_Name FROM city ORDER BY Population DESC	farm
qid403	SELECT Official_Name FROM city ORDER BY Population DESC	farm
qid404	SELECT Official_Name ,  Status FROM city ORDER BY Population DESC LIMIT 1	farm
qid405	SELECT Official_Name ,  Status FROM city ORDER BY Population DESC LIMIT 1	farm
qid406	SELECT T2.Year ,  T1.Official_Name FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID	farm
qid407	SELECT T2.Year ,  T1.Official_Name FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID	farm
qid408	SELECT T1.Official_Name FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID GROUP BY T2.Host_city_ID HAVING COUNT(*)  >  1	farm
qid409	SELECT T1.Official_Name FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID GROUP BY T2.Host_city_ID HAVING COUNT(*)  >  1	farm
qid410	SELECT T1.Status FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID GROUP BY T2.Host_city_ID ORDER BY COUNT(*) DESC LIMIT 1	farm
qid411	SELECT T1.Status FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID GROUP BY T2.Host_city_ID ORDER BY COUNT(*) DESC LIMIT 1	farm
qid412	SELECT T2.Theme FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID WHERE T1.Population  >  1000	farm
qid413	SELECT T2.Theme FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID WHERE T1.Population  >  1000	farm
qid414	SELECT Status ,  avg(Population) FROM city GROUP BY Status	farm
qid415	SELECT Status ,  avg(Population) FROM city GROUP BY Status	farm
qid416	SELECT Status FROM city GROUP BY Status ORDER BY COUNT(*) ASC	farm
qid417	SELECT Status FROM city GROUP BY Status ORDER BY COUNT(*) ASC	farm
qid418	SELECT Status FROM city GROUP BY Status ORDER BY COUNT(*) DESC LIMIT 1	farm
qid419	SELECT Status FROM city GROUP BY Status ORDER BY COUNT(*) DESC LIMIT 1	farm
qid420	SELECT Official_Name FROM city WHERE City_ID NOT IN (SELECT Host_city_ID FROM farm_competition)	farm
qid421	SELECT Official_Name FROM city WHERE City_ID NOT IN (SELECT Host_city_ID FROM farm_competition)	farm
qid422	SELECT Status FROM city WHERE Population  >  1500 INTERSECT SELECT Status FROM city WHERE Population  <  500	farm
qid423	SELECT Status FROM city WHERE Population  >  1500 INTERSECT SELECT Status FROM city WHERE Population  <  500	farm
qid424	SELECT Official_Name FROM city WHERE Population  >  1500 OR Population  <  500	farm
qid425	SELECT Official_Name FROM city WHERE Population  >  1500 OR Population  <  500	farm
qid426	SELECT Census_Ranking FROM city WHERE Status !=  "乡村"	farm
qid427	SELECT Census_Ranking FROM city WHERE Status !=  "乡村"	farm
qid428	SELECT count(*) FROM flight WHERE velocity  >  200	flight_company
qid429	SELECT vehicle_flight_number ,  date ,  pilot FROM flight ORDER BY altitude ASC	flight_company
qid430	SELECT id ,  country ,  city ,  name FROM airport ORDER BY name	flight_company
qid431	SELECT max(group_equity_shareholding) FROM operate_company	flight_company
qid432	SELECT avg(velocity) FROM flight WHERE pilot  =  "刘明"	flight_company
qid433	SELECT T1.name ,  T1.type FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id	flight_company
qid434	SELECT name FROM airport WHERE country != "冰岛"	flight_company
qid435	SELECT DISTINCT T1.type FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id WHERE T2.velocity  <  200	flight_company
qid436	SELECT T1.id ,  T1.name FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id GROUP BY T1.id HAVING count(*)  >  1	flight_company
qid437	SELECT T1.id ,  T1.name ,  T1.IATA FROM airport AS T1 JOIN flight AS T2 ON T1.id  =  T2.airport_id GROUP BY T2.id ORDER BY count(*) DESC LIMIT 1	flight_company
qid438	SELECT DISTINCT T2.pilot FROM airport AS T1 JOIN flight AS T2 ON T1.id  =  T2.airport_id WHERE T1.country  =  "中国" OR T1.name  =  "宝安机场"	flight_company
qid439	SELECT TYPE ,  count(*) FROM operate_company GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1	flight_company
qid440	SELECT count(*) FROM airport WHERE id NOT IN ( SELECT airport_id FROM flight WHERE pilot  =  "杨雄" );	flight_company
qid441	SELECT T2.pilot FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id WHERE T1.principal_activities  =  "货物" INTERSECT SELECT T2.pilot FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id WHERE T1.principal_activities  =  "餐饮服务"	flight_company
qid442	SELECT name FROM airport WHERE name LIKE "%国际%"	flight_company
qid443	SELECT T3.id ,  count(*) FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id JOIN airport AS T3 ON T2.airport_id  =  T3.id GROUP BY T3.id	flight_company
qid444	SELECT count(*) ,  country FROM airport GROUP BY country	flight_company
qid445	SELECT country FROM airport GROUP BY country HAVING count(*)  >  2	flight_company
qid446	SELECT pilot FROM flight GROUP BY pilot ORDER BY count(*) DESC LIMIT 1	flight_company
qid447	SELECT sum(num_of_component) FROM furniture	manufacturer
qid448	SELECT name ,  furniture_id FROM furniture ORDER BY market_rate DESC LIMIT 1	manufacturer
qid449	SELECT sum(market_rate) FROM furniture ORDER BY market_rate DESC LIMIT 2	manufacturer
qid450	SELECT Num_of_Component ,  name FROM furniture WHERE Num_of_Component  >  10	manufacturer
qid451	SELECT name ,  Num_of_Component FROM furniture ORDER BY market_rate LIMIT 1	manufacturer
qid452	SELECT t1.name FROM furniture AS t1 JOIN furniture_manufacte AS t2 ON t1.Furniture_ID  =  t2.Furniture_ID WHERE t2.Price_in_Dollar  <  (SELECT max(Price_in_Dollar) FROM furniture_manufacte)	manufacturer
qid453	SELECT open_year ,  name FROM manufacturer ORDER BY num_of_shops DESC LIMIT 1	manufacturer
qid454	SELECT avg(Num_of_Factories) FROM manufacturer WHERE num_of_shops  >  20	manufacturer
qid455	SELECT name ,  manufacturer_id FROM manufacturer ORDER BY open_year	manufacturer
qid456	SELECT name ,  open_year FROM manufacturer WHERE num_of_shops  >  10 OR Num_of_Factories  <  10	manufacturer
qid457	SELECT max(num_of_shops) ,  avg(Num_of_Factories) FROM manufacturer WHERE open_year  <  1990	manufacturer
qid458	SELECT t1.manufacturer_id ,  t1.num_of_shops FROM manufacturer AS t1 JOIN furniture_manufacte AS t2 ON t1.manufacturer_id  =  t2.manufacturer_id ORDER BY t2.Price_in_Dollar DESC LIMIT 1	manufacturer
qid459	SELECT count(*) ,  t1.name FROM manufacturer AS t1 JOIN furniture_manufacte AS t2 ON t1.manufacturer_id  =  t2.manufacturer_id GROUP BY t1.manufacturer_id	manufacturer
qid460	SELECT t1.name ,  t2.price_in_dollar FROM furniture AS t1 JOIN furniture_manufacte AS t2 ON t1.Furniture_ID  =  t2.Furniture_ID	manufacturer
qid461	SELECT Market_Rate ,  name FROM furniture WHERE Furniture_ID NOT IN (SELECT Furniture_ID FROM furniture_manufacte)	manufacturer
qid462	SELECT t3.name FROM furniture AS t1 JOIN furniture_manufacte AS t2 ON t1.Furniture_ID  =  t2.Furniture_ID JOIN manufacturer AS t3 ON t2.manufacturer_id  =  t3.manufacturer_id WHERE t1.num_of_component  <  6 INTERSECT SELECT t3.name FROM furniture AS t1 JOIN furniture_manufacte AS t2 ON t1.Furniture_ID  =  t2.Furniture_ID JOIN manufacturer AS t3 ON t2.manufacturer_id  =  t3.manufacturer_id WHERE t1.num_of_component  >  10	manufacturer
qid463	SELECT count(*) FROM visitor WHERE age  <  30	museum_visit
qid464	SELECT name FROM visitor WHERE Level_of_membership  >  4 ORDER BY Level_of_membership DESC	museum_visit
qid465	SELECT avg(age) FROM visitor WHERE Level_of_membership  <=  4	museum_visit
qid466	SELECT name ,  Level_of_membership FROM visitor WHERE Level_of_membership  >  4 ORDER BY age DESC	museum_visit
qid467	SELECT museum_id ,  name FROM museum ORDER BY num_of_staff DESC LIMIT 1	museum_visit
qid468	SELECT avg(num_of_staff) FROM museum WHERE open_year  <  2009	museum_visit
qid469	SELECT Num_of_Staff ,  Open_Year FROM museum WHERE name  =  '国家艺术馆'	museum_visit
qid470	SELECT name FROM museum WHERE num_of_staff  >  (SELECT min(num_of_staff) FROM museum WHERE open_year  >  2010)	museum_visit
qid471	SELECT t1.id ,  t1.name ,  t1.age FROM visitor AS t1 JOIN visit AS t2 ON t1.id  =  t2.visitor_id GROUP BY t1.id HAVING count(*)  >  1	museum_visit
qid472	SELECT t2.visitor_id ,  t1.name ,  t1.Level_of_membership FROM visitor AS t1 JOIN visit AS t2 ON t1.id  =  t2.visitor_id GROUP BY t2.visitor_id ORDER BY sum(t2.Total_spent) DESC LIMIT 1	museum_visit
qid473	SELECT t2.Museum_ID ,  t1.name FROM museum AS t1 JOIN visit AS t2 ON t1.Museum_ID  =  t2.Museum_ID GROUP BY t2.Museum_ID ORDER BY count(*) DESC LIMIT 1	museum_visit
qid474	SELECT name FROM museum WHERE Museum_ID NOT IN (SELECT museum_id FROM visit)	museum_visit
qid475	SELECT t1.name ,  t1.age FROM visitor AS t1 JOIN visit AS t2 ON t1.id  =  t2.visitor_id ORDER BY t2.num_of_ticket DESC LIMIT 1	museum_visit
qid476	SELECT avg(num_of_ticket) ,  max(num_of_ticket) FROM visit	museum_visit
qid477	SELECT sum(t2.Total_spent) FROM visitor AS t1 JOIN visit AS t2 ON t1.id  =  t2.visitor_id WHERE t1.Level_of_membership  =  1	museum_visit
qid478	SELECT t1.name FROM visitor AS t1 JOIN visit AS t2 ON t1.id  =  t2.visitor_id JOIN museum AS t3 ON t3.Museum_ID  =  t2.Museum_ID WHERE t3.open_year  <  2009 INTERSECT SELECT t1.name FROM visitor AS t1 JOIN visit AS t2 ON t1.id  =  t2.visitor_id JOIN museum AS t3 ON t3.Museum_ID  =  t2.Museum_ID WHERE t3.open_year  >  2011	museum_visit
qid479	SELECT count(*) FROM visitor WHERE id NOT IN (SELECT t2.visitor_id FROM museum AS t1 JOIN visit AS t2 ON t1.Museum_ID  =  t2.Museum_ID WHERE t1.open_year  >  2010)	museum_visit
qid480	SELECT count(*) FROM museum WHERE open_year  >  2013 OR open_year  <  2008	museum_visit
qid481	SELECT count(*) FROM Highschooler	network_1
qid482	SELECT count(*) FROM Highschooler	network_1
qid483	SELECT name ,  grade FROM Highschooler	network_1
qid484	SELECT name ,  grade FROM Highschooler	network_1
qid485	SELECT grade FROM Highschooler	network_1
qid486	SELECT grade FROM Highschooler	network_1
qid487	SELECT grade FROM Highschooler WHERE name  =  "小军"	network_1
qid488	SELECT grade FROM Highschooler WHERE name  =  "小军"	network_1
qid489	SELECT name FROM Highschooler WHERE grade  =  10	network_1
qid490	SELECT name FROM Highschooler WHERE grade  =  10	network_1
qid491	SELECT ID FROM Highschooler WHERE name  =  "小军"	network_1
qid492	SELECT ID FROM Highschooler WHERE name  =  "小军"	network_1
qid493	SELECT count(*) FROM Highschooler WHERE grade  =  9 OR grade  =  10	network_1
qid494	SELECT count(*) FROM Highschooler WHERE grade  =  9 OR grade  =  10	network_1
qid495	SELECT grade ,  count(*) FROM Highschooler GROUP BY grade	network_1
qid496	SELECT grade ,  count(*) FROM Highschooler GROUP BY grade	network_1
qid497	SELECT grade FROM Highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1	network_1
qid498	SELECT grade FROM Highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1	network_1
qid499	SELECT grade FROM Highschooler GROUP BY grade HAVING count(*)  >=  4	network_1
qid500	SELECT grade FROM Highschooler GROUP BY grade HAVING count(*)  >=  4	network_1
qid501	SELECT student_id ,  count(*) FROM Friend GROUP BY student_id	network_1
qid502	SELECT student_id ,  count(*) FROM Friend GROUP BY student_id	network_1
qid503	SELECT T2.name ,  count(*) FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id	network_1
qid504	SELECT T2.name ,  count(*) FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id	network_1
qid505	SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	network_1
qid506	SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	network_1
qid507	SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id HAVING count(*)  >=  3	network_1
qid508	SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id HAVING count(*)  >=  3	network_1
qid509	SELECT T3.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id JOIN Highschooler AS T3 ON T1.friend_id  =  T3.id WHERE T2.name  =  "小军"	network_1
qid510	SELECT T3.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id JOIN Highschooler AS T3 ON T1.friend_id  =  T3.id WHERE T2.name  =  "小军"	network_1
qid511	SELECT count(*) FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.name  =  "小军"	network_1
qid512	SELECT count(*) FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.name  =  "小军"	network_1
qid513	SELECT id FROM Highschooler EXCEPT SELECT student_id FROM Friend	network_1
qid514	SELECT id FROM Highschooler EXCEPT SELECT student_id FROM Friend	network_1
qid515	SELECT name FROM Highschooler EXCEPT SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id	network_1
qid516	SELECT name FROM Highschooler EXCEPT SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id	network_1
qid517	SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes	network_1
qid518	SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes	network_1
qid519	SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id INTERSECT SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id  =  T2.id	network_1
qid520	SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id INTERSECT SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id  =  T2.id	network_1
qid521	SELECT student_id ,  count(*) FROM Likes GROUP BY student_id	network_1
qid522	SELECT student_id ,  count(*) FROM Likes GROUP BY student_id	network_1
qid523	SELECT T2.name ,  count(*) FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id	network_1
qid524	SELECT T2.name ,  count(*) FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id	network_1
qid525	SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	network_1
qid526	SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	network_1
qid527	SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id HAVING count(*)  >=  2	network_1
qid528	SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id HAVING count(*)  >=  2	network_1
qid529	SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.grade  >  5 GROUP BY T1.student_id HAVING count(*)  >=  2	network_1
qid530	SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.grade  >  5 GROUP BY T1.student_id HAVING count(*)  >=  2	network_1
qid531	SELECT count(*) FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.name  =  "小军"	network_1
qid532	SELECT count(*) FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.name  =  "小军"	network_1
qid533	SELECT avg(grade) FROM Highschooler WHERE id IN (SELECT T1.student_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id)	network_1
qid534	SELECT avg(grade) FROM Highschooler WHERE id IN (SELECT T1.student_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id)	network_1
qid535	SELECT min(grade) FROM Highschooler WHERE id NOT IN (SELECT T1.student_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id)	network_1
qid536	SELECT min(grade) FROM Highschooler WHERE id NOT IN (SELECT T1.student_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id)	network_1
qid537	SELECT count(*) FROM party	party_host
qid538	SELECT count(*) FROM party	party_host
qid539	SELECT Party_Theme FROM party ORDER BY Number_of_hosts ASC	party_host
qid540	SELECT Party_Theme FROM party ORDER BY Number_of_hosts ASC	party_host
qid541	SELECT Party_Theme ,  LOCATION FROM party	party_host
qid542	SELECT Party_Theme ,  LOCATION FROM party	party_host
qid543	SELECT First_year ,  Last_year FROM party WHERE Party_Theme  =  "春季" OR Party_Theme  =  "科技"	party_host
qid544	SELECT First_year ,  Last_year FROM party WHERE Party_Theme  =  "春季" OR Party_Theme  =  "科技"	party_host
qid545	SELECT avg(Number_of_hosts) FROM party	party_host
qid546	SELECT avg(Number_of_hosts) FROM party	party_host
qid547	SELECT LOCATION FROM party ORDER BY Number_of_hosts DESC LIMIT 1	party_host
qid548	SELECT LOCATION FROM party ORDER BY Number_of_hosts DESC LIMIT 1	party_host
qid549	SELECT Nationality ,  COUNT(*) FROM HOST GROUP BY Nationality	party_host
qid550	SELECT Nationality ,  COUNT(*) FROM HOST GROUP BY Nationality	party_host
qid551	SELECT Nationality FROM HOST GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	party_host
qid552	SELECT Nationality FROM HOST GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	party_host
qid553	SELECT Nationality FROM HOST WHERE Age  >  45 INTERSECT SELECT Nationality FROM HOST WHERE Age  <  35	party_host
qid554	SELECT Nationality FROM HOST WHERE Age  >  45 INTERSECT SELECT Nationality FROM HOST WHERE Age  <  35	party_host
qid555	SELECT T3.Party_Theme ,  T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID	party_host
qid556	SELECT T3.Party_Theme ,  T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID	party_host
qid557	SELECT T3.Location ,  T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID ORDER BY T2.Age	party_host
qid558	SELECT T3.Location ,  T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID ORDER BY T2.Age	party_host
qid559	SELECT T3.Location FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID WHERE T2.Age  >  50	party_host
qid560	SELECT T3.Location FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID WHERE T2.Age  >  50	party_host
qid561	SELECT T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID WHERE T3.Number_of_hosts  >  20	party_host
qid562	SELECT T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID WHERE T3.Number_of_hosts  >  20	party_host
qid563	SELECT Name ,  Nationality FROM HOST ORDER BY Age DESC LIMIT 1	party_host
qid564	SELECT Name ,  Nationality FROM HOST ORDER BY Age DESC LIMIT 1	party_host
qid565	SELECT Name FROM HOST WHERE Host_ID NOT IN (SELECT Host_ID FROM party_host)	party_host
qid566	SELECT Name FROM HOST WHERE Host_ID NOT IN (SELECT Host_ID FROM party_host)	party_host
qid567	SELECT count(*) FROM phone	phone_market
qid568	SELECT Name FROM phone ORDER BY Price ASC	phone_market
qid569	SELECT Memory_in_G ,  Carrier FROM phone	phone_market
qid570	SELECT DISTINCT Carrier FROM phone WHERE Memory_in_G  >  32	phone_market
qid571	SELECT Name FROM phone WHERE Carrier  =  "中国联通" OR Carrier  =  "中国移动"	phone_market
qid572	SELECT Carrier FROM phone ORDER BY Price DESC LIMIT 1	phone_market
qid573	SELECT Carrier ,  COUNT(*) FROM phone GROUP BY Carrier	phone_market
qid574	SELECT Carrier FROM phone GROUP BY Carrier ORDER BY COUNT(*) DESC LIMIT 1	phone_market
qid575	SELECT Carrier FROM phone WHERE Memory_in_G  <  32 INTERSECT SELECT Carrier FROM phone WHERE Memory_in_G  >  64	phone_market
qid576	SELECT T3.Name ,  T2.District FROM phone_market AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID JOIN phone AS T3 ON T1.Phone_ID  =  T3.Phone_ID	phone_market
qid577	SELECT T3.Name ,  T2.District FROM phone_market AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID JOIN phone AS T3 ON T1.Phone_ID  =  T3.Phone_ID ORDER BY T2.Ranking	phone_market
qid578	SELECT T3.Name FROM phone_market AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID JOIN phone AS T3 ON T1.Phone_ID  =  T3.Phone_ID WHERE T2.Num_of_shops  >  50	phone_market
qid579	SELECT T2.Name ,  sum(T1.Num_of_stock) FROM phone_market AS T1 JOIN phone AS T2 ON T1.Phone_ID  =  T2.Phone_ID GROUP BY T2.Name	phone_market
qid580	SELECT T2.Name FROM phone_market AS T1 JOIN phone AS T2 ON T1.Phone_ID  =  T2.Phone_ID GROUP BY T2.Name HAVING sum(T1.Num_of_stock)  >=  2000 ORDER BY sum(T1.Num_of_stock) DESC	phone_market
qid581	SELECT Name FROM phone WHERE Phone_id NOT IN (SELECT Phone_ID FROM phone_market)	phone_market
qid582	SELECT distinct(catalog_entry_name) FROM catalog_contents	product_catalog
qid583	SELECT distinct(catalog_entry_name) FROM catalog_contents	product_catalog
qid584	SELECT attribute_data_type FROM Attribute_Definitions GROUP BY attribute_data_type HAVING count(*)  >  3	product_catalog
qid585	SELECT attribute_data_type FROM Attribute_Definitions GROUP BY attribute_data_type HAVING count(*)  >  3	product_catalog
qid586	SELECT attribute_data_type FROM Attribute_Definitions WHERE attribute_name  =  "绿色"	product_catalog
qid587	SELECT attribute_data_type FROM Attribute_Definitions WHERE attribute_name  =  "绿色"	product_catalog
qid588	SELECT catalog_level_name ,  catalog_level_number FROM Catalog_Structure WHERE catalog_level_number BETWEEN 5 AND 10	product_catalog
qid589	SELECT catalog_level_name ,  catalog_level_number FROM Catalog_Structure WHERE catalog_level_number BETWEEN 5 AND 10	product_catalog
qid590	SELECT distinct(catalog_publisher) FROM catalogs WHERE catalog_publisher LIKE "小刚"	product_catalog
qid591	SELECT distinct(catalog_publisher) FROM catalogs WHERE catalog_publisher LIKE "小刚"	product_catalog
qid592	SELECT catalog_publisher FROM catalogs GROUP BY catalog_publisher ORDER BY count(*) DESC LIMIT 1	product_catalog
qid593	SELECT catalog_publisher FROM catalogs GROUP BY catalog_publisher ORDER BY count(*) DESC LIMIT 1	product_catalog
qid594	SELECT t1.catalog_name ,  t1.date_of_publication FROM catalogs AS t1 JOIN catalog_structure AS t2 ON t1.catalog_id  =  t2.catalog_id WHERE catalog_level_number  >  5	product_catalog
qid595	SELECT t1.catalog_name ,  t1.date_of_publication FROM catalogs AS t1 JOIN catalog_structure AS t2 ON t1.catalog_id  =  t2.catalog_id WHERE catalog_level_number  >  5	product_catalog
qid596	SELECT t1.catalog_entry_name FROM Catalog_Contents AS t1 JOIN Catalog_Contents_Additional_Attributes AS t2 ON t1.catalog_entry_id  =  t2.catalog_entry_id WHERE t2.attribute_value  =  (SELECT attribute_value FROM Catalog_Contents_Additional_Attributes GROUP BY attribute_value ORDER BY count(*) DESC LIMIT 1)	product_catalog
qid597	SELECT t1.catalog_entry_name FROM Catalog_Contents AS t1 JOIN Catalog_Contents_Additional_Attributes AS t2 ON t1.catalog_entry_id  =  t2.catalog_entry_id WHERE t2.attribute_value  =  (SELECT attribute_value FROM Catalog_Contents_Additional_Attributes GROUP BY attribute_value ORDER BY count(*) DESC LIMIT 1)	product_catalog
qid598	SELECT catalog_entry_name FROM catalog_contents ORDER BY price_in_dollars DESC LIMIT 1	product_catalog
qid599	SELECT catalog_entry_name FROM catalog_contents ORDER BY price_in_dollars DESC LIMIT 1	product_catalog
qid600	SELECT t2.catalog_level_name FROM catalog_contents AS t1 JOIN catalog_structure AS t2 ON t1.catalog_level_number  =  t2.catalog_level_number ORDER BY t1.price_in_dollars LIMIT 1	product_catalog
qid601	SELECT t2.catalog_level_name FROM catalog_contents AS t1 JOIN catalog_structure AS t2 ON t1.catalog_level_number  =  t2.catalog_level_number ORDER BY t1.price_in_dollars LIMIT 1	product_catalog
qid602	SELECT avg(price_in_euros) ,  min(price_in_euros) FROM catalog_contents	product_catalog
qid603	SELECT avg(price_in_euros) ,  min(price_in_euros) FROM catalog_contents	product_catalog
qid604	SELECT catalog_entry_name FROM catalog_contents ORDER BY height DESC LIMIT 1	product_catalog
qid605	SELECT catalog_entry_name FROM catalog_contents ORDER BY height DESC LIMIT 1	product_catalog
qid606	SELECT catalog_entry_name FROM catalog_contents ORDER BY capacity ASC LIMIT 1	product_catalog
qid607	SELECT catalog_entry_name FROM catalog_contents ORDER BY capacity ASC LIMIT 1	product_catalog
qid608	SELECT catalog_entry_name FROM catalog_contents WHERE product_stock_number LIKE "2"	product_catalog
qid609	SELECT catalog_entry_name FROM catalog_contents WHERE product_stock_number LIKE "2"	product_catalog
qid610	SELECT t1.catalog_entry_name FROM Catalog_Contents AS t1 JOIN Catalog_Contents_Additional_Attributes AS t2 ON t1.catalog_entry_id  =  t2.catalog_entry_id WHERE t2.catalog_level_number  =  "8"	product_catalog
qid611	SELECT t1.catalog_entry_name FROM Catalog_Contents AS t1 JOIN Catalog_Contents_Additional_Attributes AS t2 ON t1.catalog_entry_id  =  t2.catalog_entry_id WHERE t2.catalog_level_number  =  "8"	product_catalog
qid612	SELECT catalog_entry_name FROM catalog_contents WHERE LENGTH  <  3 OR width  >  5	product_catalog
qid613	SELECT catalog_entry_name FROM catalog_contents WHERE LENGTH  <  3 OR width  >  5	product_catalog
qid614	SELECT t1.attribute_name ,  t1.attribute_id FROM Attribute_Definitions AS t1 JOIN Catalog_Contents_Additional_Attributes AS t2 ON t1.attribute_id  =  t2.attribute_id WHERE t2.attribute_value  =  0	product_catalog
qid615	SELECT t1.attribute_name ,  t1.attribute_id FROM Attribute_Definitions AS t1 JOIN Catalog_Contents_Additional_Attributes AS t2 ON t1.attribute_id  =  t2.attribute_id WHERE t2.attribute_value  =  0	product_catalog
qid616	SELECT catalog_entry_name ,  capacity FROM Catalog_Contents WHERE price_in_dollars  >  700	product_catalog
qid617	SELECT catalog_entry_name ,  capacity FROM Catalog_Contents WHERE price_in_dollars  >  700	product_catalog
qid618	SELECT date_of_latest_revision FROM Catalogs GROUP BY date_of_latest_revision HAVING count(*)  >  1	product_catalog
qid619	SELECT date_of_latest_revision FROM Catalogs GROUP BY date_of_latest_revision HAVING count(*)  >  1	product_catalog
qid620	SELECT count(*) FROM catalog_contents	product_catalog
qid621	SELECT count(*) FROM catalog_contents	product_catalog
qid622	SELECT catalog_entry_name FROM catalog_contents WHERE next_entry_id  >  8	product_catalog
qid623	SELECT catalog_entry_name FROM catalog_contents WHERE next_entry_id  >  8	product_catalog
qid624	SELECT count(*) FROM scientists	scientist_1
qid625	SELECT count(*) FROM scientists	scientist_1
qid626	SELECT sum(hours) FROM projects	scientist_1
qid627	SELECT sum(hours) FROM projects	scientist_1
qid628	SELECT count(DISTINCT scientist) FROM assignedto	scientist_1
qid629	SELECT count(DISTINCT scientist) FROM assignedto	scientist_1
qid630	SELECT count(DISTINCT name) FROM projects	scientist_1
qid631	SELECT count(DISTINCT name) FROM projects	scientist_1
qid632	SELECT avg(hours) FROM projects	scientist_1
qid633	SELECT avg(hours) FROM projects	scientist_1
qid634	SELECT name FROM projects ORDER BY hours DESC LIMIT 1	scientist_1
qid635	SELECT name FROM projects ORDER BY hours DESC LIMIT 1	scientist_1
qid636	SELECT name FROM projects WHERE hours  >  (SELECT avg(hours) FROM projects)	scientist_1
qid637	SELECT name FROM projects WHERE hours  >  (SELECT avg(hours) FROM projects)	scientist_1
qid638	SELECT T1.name ,  T1.hours FROM projects AS T1 JOIN assignedto AS T2 ON T1.code  =  T2.project GROUP BY T2.project ORDER BY count(*) DESC LIMIT 1	scientist_1
qid639	SELECT T1.name ,  T1.hours FROM projects AS T1 JOIN assignedto AS T2 ON T1.code  =  T2.project GROUP BY T2.project ORDER BY count(*) DESC LIMIT 1	scientist_1
qid640	SELECT T2.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T3.name LIKE "%曹%"	scientist_1
qid641	SELECT T2.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T3.name LIKE "%曹%"	scientist_1
qid642	SELECT sum(T2.hours) FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T3.name  =  "李文军" OR T3.name  =  "张智名"	scientist_1
qid643	SELECT sum(T2.hours) FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T3.name  =  "李文军" OR T3.name  =  "张智名"	scientist_1
qid644	SELECT name FROM projects WHERE hours BETWEEN 100 AND 300	scientist_1
qid645	SELECT name FROM projects WHERE hours BETWEEN 100 AND 300	scientist_1
qid646	SELECT T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.name  =  "东电西输" INTERSECT SELECT T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.name  =  "南水北调"	scientist_1
qid647	SELECT T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.name  =  "东电西输" INTERSECT SELECT T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.name  =  "南水北调"	scientist_1
qid648	SELECT name FROM scientists ORDER BY name	scientist_1
qid649	SELECT name FROM scientists ORDER BY name	scientist_1
qid650	SELECT count(*) ,  T1.name FROM projects AS T1 JOIN assignedto AS T2 ON T1.code  =  T2.project GROUP BY T1.name	scientist_1
qid651	SELECT count(*) ,  T1.name FROM projects AS T1 JOIN assignedto AS T2 ON T1.code  =  T2.project GROUP BY T1.name	scientist_1
qid652	SELECT count(*) ,  T1.name FROM projects AS T1 JOIN assignedto AS T2 ON T1.code  =  T2.project WHERE T1.hours  >  300 GROUP BY T1.name	scientist_1
qid653	SELECT count(*) ,  T1.name FROM projects AS T1 JOIN assignedto AS T2 ON T1.code  =  T2.project WHERE T1.hours  >  300 GROUP BY T1.name	scientist_1
qid654	SELECT count(*) ,  T1.name FROM scientists AS T1 JOIN assignedto AS T2 ON T1.ssn  =  T2.scientist GROUP BY T1.name	scientist_1
qid655	SELECT count(*) ,  T1.name FROM scientists AS T1 JOIN assignedto AS T2 ON T1.ssn  =  T2.scientist GROUP BY T1.name	scientist_1
qid656	SELECT T3.ssn ,  T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.hours  =  (SELECT max(hours) FROM projects)	scientist_1
qid657	SELECT T3.ssn ,  T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.hours  =  (SELECT max(hours) FROM projects)	scientist_1
qid658	SELECT T2.name FROM assignedto AS T1 JOIN scientists AS T2 ON T1.scientist  =  T2.ssn	scientist_1
qid659	SELECT T2.name FROM assignedto AS T1 JOIN scientists AS T2 ON T1.scientist  =  T2.ssn	scientist_1
qid660	SELECT Name FROM Projects WHERE Code NOT IN (SELECT Project FROM AssignedTo)	scientist_1
qid661	SELECT Name FROM Projects WHERE Code NOT IN (SELECT Project FROM AssignedTo)	scientist_1
qid662	SELECT Name FROM scientists WHERE ssn NOT IN (SELECT scientist FROM AssignedTo)	scientist_1
qid663	SELECT Name FROM scientists WHERE ssn NOT IN (SELECT scientist FROM AssignedTo)	scientist_1
qid664	SELECT count(*) FROM scientists WHERE ssn NOT IN (SELECT scientist FROM AssignedTo)	scientist_1
qid665	SELECT count(*) FROM scientists WHERE ssn NOT IN (SELECT scientist FROM AssignedTo)	scientist_1
qid666	SELECT name FROM scientists EXCEPT SELECT T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.hours  =  (SELECT max(hours) FROM projects)	scientist_1
qid667	SELECT name FROM scientists EXCEPT SELECT T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.hours  =  (SELECT max(hours) FROM projects)	scientist_1
qid668	SELECT T1.Name ,  T3.Name ,  T3.Hours FROM Scientists AS T1 JOIN AssignedTo AS T2 ON T1.SSN = T2.Scientist JOIN Projects AS T3 ON T2.Project = T3.Code ORDER BY T3.Name ,  T1.Name	scientist_1
qid669	SELECT T1.Name ,  T3.Name ,  T3.Hours FROM Scientists AS T1 JOIN AssignedTo AS T2 ON T1.SSN = T2.Scientist JOIN Projects AS T3 ON T2.Project = T3.Code ORDER BY T3.Name ,  T1.Name	scientist_1
qid670	SELECT T2.name ,  T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.hours  =  (SELECT min(hours) FROM projects)	scientist_1
qid671	SELECT T2.name ,  T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.hours  =  (SELECT min(hours) FROM projects)	scientist_1
qid672	SELECT count(*) FROM ship	ship_mission
qid673	SELECT count(*) FROM ship	ship_mission
qid674	SELECT Name FROM ship ORDER BY Tonnage ASC	ship_mission
qid675	SELECT Name FROM ship ORDER BY Tonnage ASC	ship_mission
qid676	SELECT TYPE ,  Nationality FROM ship	ship_mission
qid677	SELECT TYPE ,  Nationality FROM ship	ship_mission
qid678	SELECT Name FROM ship WHERE Nationality != "美国"	ship_mission
qid679	SELECT Name FROM ship WHERE Nationality != "美国"	ship_mission
qid680	SELECT Name FROM ship WHERE Nationality  =  "美国" OR Nationality  =  "英国"	ship_mission
qid681	SELECT Name FROM ship WHERE Nationality  =  "美国" OR Nationality  =  "英国"	ship_mission
qid682	SELECT Name FROM ship ORDER BY Tonnage DESC LIMIT 1	ship_mission
qid683	SELECT Name FROM ship ORDER BY Tonnage DESC LIMIT 1	ship_mission
qid684	SELECT TYPE ,  COUNT(*) FROM ship GROUP BY TYPE	ship_mission
qid685	SELECT TYPE ,  COUNT(*) FROM ship GROUP BY TYPE	ship_mission
qid686	SELECT TYPE FROM ship GROUP BY TYPE ORDER BY COUNT(*) DESC LIMIT 1	ship_mission
qid687	SELECT TYPE FROM ship GROUP BY TYPE ORDER BY COUNT(*) DESC LIMIT 1	ship_mission
qid688	SELECT Nationality FROM ship GROUP BY Nationality HAVING COUNT(*)  >  2	ship_mission
qid689	SELECT Nationality FROM ship GROUP BY Nationality HAVING COUNT(*)  >  2	ship_mission
qid690	SELECT TYPE ,  avg(Tonnage) FROM ship GROUP BY TYPE	ship_mission
qid691	SELECT TYPE ,  avg(Tonnage) FROM ship GROUP BY TYPE	ship_mission
qid692	SELECT T1.Code ,  T1.Fate ,  T2.Name FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID	ship_mission
qid693	SELECT T1.Code ,  T1.Fate ,  T2.Name FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID	ship_mission
qid694	SELECT T2.Name FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID WHERE T1.Launched_Year  >  1928	ship_mission
qid695	SELECT T2.Name FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID WHERE T1.Launched_Year  >  1928	ship_mission
qid696	SELECT DISTINCT T1.Fate FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID WHERE T2.Nationality  =  "美国"	ship_mission
qid697	SELECT DISTINCT T1.Fate FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID WHERE T2.Nationality  =  "美国"	ship_mission
qid698	SELECT Name FROM ship WHERE Ship_ID NOT IN (SELECT Ship_ID FROM mission)	ship_mission
qid699	SELECT Name FROM ship WHERE Ship_ID NOT IN (SELECT Ship_ID FROM mission)	ship_mission
qid700	SELECT TYPE FROM ship WHERE Tonnage  >  6000 INTERSECT SELECT TYPE FROM ship WHERE Tonnage  <  4000	ship_mission
qid701	SELECT TYPE FROM ship WHERE Tonnage  >  6000 INTERSECT SELECT TYPE FROM ship WHERE Tonnage  <  4000	ship_mission
qid702	SELECT count(*) FROM singer	singer
qid703	SELECT count(*) FROM singer	singer
qid704	SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC	singer
qid705	SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC	singer
qid706	SELECT Birth_Year ,  Citizenship FROM singer	singer
qid707	SELECT Birth_Year ,  Citizenship FROM singer	singer
qid708	SELECT Name FROM singer WHERE Citizenship != "巴黎"	singer
qid709	SELECT Name FROM singer WHERE Citizenship != "法国"	singer
qid710	SELECT Name FROM singer WHERE Birth_Year  =  1948 OR Birth_Year  =  1949	singer
qid711	SELECT Name FROM singer WHERE Birth_Year  =  1948 OR Birth_Year  =  1949	singer
qid712	SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
qid713	SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
qid714	SELECT Citizenship ,  COUNT(*) FROM singer GROUP BY Citizenship	singer
qid715	SELECT Citizenship ,  COUNT(*) FROM singer GROUP BY Citizenship	singer
qid716	SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1	singer
qid717	SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1	singer
qid718	SELECT Citizenship ,  max(Net_Worth_Millions) FROM singer GROUP BY Citizenship	singer
qid719	SELECT Citizenship ,  max(Net_Worth_Millions) FROM singer GROUP BY Citizenship	singer
qid720	SELECT T2.Title ,  T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID	singer
qid721	SELECT T2.Title ,  T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID	singer
qid722	SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID WHERE T2.Sales  >  300000	singer
qid723	SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID WHERE T2.Sales  >  300000	singer
qid724	SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Name HAVING COUNT(*)  >  1	singer
qid725	SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Name HAVING COUNT(*)  >  1	singer
qid726	SELECT T1.Name ,  sum(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Name	singer
qid727	SELECT T1.Name ,  sum(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Name	singer
qid728	SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
qid729	SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
qid730	SELECT Citizenship FROM singer WHERE Birth_Year  <  1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year  >  1955	singer
qid731	SELECT Citizenship FROM singer WHERE Birth_Year  <  1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year  >  1955	singer
qid732	SELECT count(*) FROM club	sports_competition
qid733	SELECT count(*) FROM club	sports_competition
qid734	SELECT DISTINCT Region FROM club ORDER BY Region ASC	sports_competition
qid735	SELECT DISTINCT Region FROM club ORDER BY Region ASC	sports_competition
qid736	SELECT avg(Gold) FROM club_rank	sports_competition
qid737	SELECT avg(Gold) FROM club_rank	sports_competition
qid738	SELECT Competition_type ,  Country FROM competition	sports_competition
qid739	SELECT Competition_type ,  Country FROM competition	sports_competition
qid740	SELECT DISTINCT YEAR FROM competition WHERE Competition_type != "锦标赛"	sports_competition
qid741	SELECT DISTINCT YEAR FROM competition WHERE Competition_type != "锦标赛"	sports_competition
qid742	SELECT max(Silver) ,  min(Silver) FROM club_rank	sports_competition
qid743	SELECT max(Silver) ,  min(Silver) FROM club_rank	sports_competition
qid744	SELECT count(*) FROM club_rank WHERE Total  <  10	sports_competition
qid745	SELECT count(*) FROM club_rank WHERE Total  <  10	sports_competition
qid746	SELECT name FROM club ORDER BY Start_year ASC	sports_competition
qid747	SELECT name FROM club ORDER BY Start_year ASC	sports_competition
qid748	SELECT name FROM club ORDER BY name DESC	sports_competition
qid749	SELECT name FROM club ORDER BY name DESC	sports_competition
qid750	SELECT T1.name ,  T2.Player_id FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	sports_competition
qid751	SELECT T1.name ,  T2.Player_id FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	sports_competition
qid752	SELECT T1.name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Position  =  "右前锋"	sports_competition
qid753	SELECT T1.name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Position  =  "右前锋"	sports_competition
qid754	SELECT avg(T2.Points) FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.name  =  "国安"	sports_competition
qid755	SELECT avg(T2.Points) FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.name  =  "国安"	sports_competition
qid756	SELECT POSITION ,  avg(Points) FROM player GROUP BY POSITION	sports_competition
qid757	SELECT POSITION ,  avg(Points) FROM player GROUP BY POSITION	sports_competition
qid758	SELECT POSITION FROM player GROUP BY name HAVING avg(Points)  >=  20	sports_competition
qid759	SELECT POSITION FROM player GROUP BY name HAVING avg(Points)  >=  20	sports_competition
qid760	SELECT Competition_type ,  COUNT(*) FROM competition GROUP BY Competition_type	sports_competition
qid761	SELECT Competition_type ,  COUNT(*) FROM competition GROUP BY Competition_type	sports_competition
qid762	SELECT Competition_type FROM competition GROUP BY Competition_type ORDER BY COUNT(*) DESC LIMIT 1	sports_competition
qid763	SELECT Competition_type FROM competition GROUP BY Competition_type ORDER BY COUNT(*) DESC LIMIT 1	sports_competition
qid764	SELECT Competition_type FROM competition GROUP BY Competition_type HAVING COUNT(*)  <=  5	sports_competition
qid765	SELECT Competition_type FROM competition GROUP BY Competition_type HAVING COUNT(*)  <=  5	sports_competition
qid766	SELECT name FROM CLub WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	sports_competition
qid767	SELECT name FROM CLub WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	sports_competition
qid768	SELECT POSITION FROM player WHERE Points  >  20 INTERSECT SELECT POSITION FROM player WHERE Points  <  10	sports_competition
qid769	SELECT POSITION FROM player WHERE Points  >  20 INTERSECT SELECT POSITION FROM player WHERE Points  <  10	sports_competition
qid770	SELECT sum(Points) FROM player	sports_competition
qid771	SELECT sum(Points) FROM player	sports_competition
qid772	SELECT count(DISTINCT POSITION) FROM player	sports_competition
qid773	SELECT count(DISTINCT POSITION) FROM player	sports_competition
qid774	SELECT name FROM player WHERE points  >  (SELECT avg(points) FROM player)	sports_competition
qid775	SELECT name FROM player WHERE points  >  (SELECT avg(points) FROM player)	sports_competition
qid776	SELECT count(*) ,  POSITION FROM player WHERE points  <  30 GROUP BY POSITION	sports_competition
qid777	SELECT count(*) ,  POSITION FROM player WHERE points  <  30 GROUP BY POSITION	sports_competition
qid778	SELECT country FROM competition WHERE competition_type  =  '锦标赛' GROUP BY country ORDER BY count(*) DESC LIMIT 1	sports_competition
qid779	SELECT country FROM competition WHERE competition_type  =  '锦标赛' GROUP BY country ORDER BY count(*) DESC LIMIT 1	sports_competition
qid780	SELECT country FROM competition WHERE competition_type  =  '友谊型' INTERSECT SELECT country FROM competition WHERE competition_type  =  '锦标赛'	sports_competition
qid781	SELECT country FROM competition WHERE competition_type  =  '友谊型' INTERSECT SELECT country FROM competition WHERE competition_type  =  '锦标赛'	sports_competition
qid782	SELECT country FROM competition EXCEPT SELECT country FROM competition WHERE competition_type  =  '友谊型'	sports_competition
qid783	SELECT country FROM competition EXCEPT SELECT country FROM competition WHERE competition_type  =  '友谊型'	sports_competition
qid784	SELECT count(*) FROM event	swimming
qid785	SELECT name FROM event ORDER BY YEAR DESC	swimming
qid786	SELECT name FROM event ORDER BY YEAR DESC LIMIT 1	swimming
qid787	SELECT count(*) FROM stadium	swimming
qid788	SELECT name FROM stadium ORDER BY capacity DESC LIMIT 1	swimming
qid789	SELECT name FROM stadium WHERE capacity  <  (SELECT avg(capacity) FROM stadium)	swimming
qid790	SELECT country FROM stadium GROUP BY country ORDER BY count(*) DESC LIMIT 1	swimming
qid791	SELECT country FROM stadium GROUP BY country HAVING count(*)  <=  3	swimming
qid792	SELECT country FROM stadium WHERE capacity  >  60000 INTERSECT SELECT country FROM stadium WHERE capacity  <  50000	swimming
qid793	SELECT count(DISTINCT city) FROM stadium WHERE opening_year  <  2006	swimming
qid794	SELECT country ,  count(*) FROM stadium GROUP BY country	swimming
qid795	SELECT country FROM stadium EXCEPT SELECT country FROM stadium WHERE opening_year  >  2006	swimming
qid796	SELECT count(*) FROM stadium WHERE country != '俄罗斯'	swimming
qid797	SELECT name FROM swimmer ORDER BY meter_100	swimming
qid798	SELECT count(DISTINCT nationality) FROM swimmer	swimming
qid799	SELECT nationality ,  count(*) FROM swimmer GROUP BY nationality HAVING count(*)  >  1	swimming
qid800	SELECT meter_200 ,  meter_300 FROM swimmer WHERE nationality  =  '澳大利亚'	swimming
qid801	SELECT t1.name FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id WHERE RESULT  =  '胜利'	swimming
qid802	SELECT t1.name FROM stadium AS t1 JOIN event AS t2 ON t1.id  =  t2.stadium_id GROUP BY t2.stadium_id ORDER BY count(*) DESC LIMIT 1	swimming
qid803	SELECT t1.name ,  t1.capacity FROM stadium AS t1 JOIN event AS t2 ON t1.id  =  t2.stadium_id WHERE t2.name  =  '世界杯'	swimming
qid804	SELECT name FROM stadium WHERE id NOT IN (SELECT stadium_id FROM event)	swimming
qid805	SELECT t1.name FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id GROUP BY t2.swimmer_id ORDER BY count(*) DESC LIMIT 1	swimming
qid806	SELECT t1.name FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id GROUP BY t2.swimmer_id HAVING count(*)  >=  2	swimming
qid807	SELECT t1.name ,  t1.nationality FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id WHERE RESULT  =  '胜利' GROUP BY t2.swimmer_id HAVING count(*)  >  1	swimming
qid808	SELECT name FROM swimmer WHERE id NOT IN (SELECT swimmer_id FROM record)	swimming
qid809	SELECT t1.name FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id WHERE RESULT  =  '胜利' INTERSECT SELECT t1.name FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id WHERE RESULT  =  '输'	swimming
qid810	SELECT t4.name FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id JOIN event AS t3 ON t2.event_id  =  t3.id JOIN stadium AS t4 ON t4.id  =  t3.stadium_id WHERE t1.nationality  =  '澳大利亚'	swimming
qid811	SELECT t3.name FROM record AS t1 JOIN event AS t2 ON t1.event_id  =  t2.id JOIN stadium AS t3 ON t3.id  =  t2.stadium_id GROUP BY t2.stadium_id ORDER BY count(*) DESC LIMIT 1	swimming
qid812	SELECT * FROM swimmer	swimming
qid813	SELECT avg(capacity) FROM stadium WHERE opening_year  =  2005	swimming
qid814	SELECT count(*) FROM INVESTORS	tracking_share_transactions
qid815	SELECT Investor_details FROM INVESTORS	tracking_share_transactions
qid816	SELECT DISTINCT lot_details FROM LOTS	tracking_share_transactions
qid817	SELECT max(amount_of_transaction) FROM TRANSACTIONS	tracking_share_transactions
qid818	SELECT date_of_transaction ,  share_count FROM TRANSACTIONS	tracking_share_transactions
qid819	SELECT sum(share_count) FROM TRANSACTIONS	tracking_share_transactions
qid820	SELECT transaction_id FROM TRANSACTIONS WHERE transaction_type_code  =  "PUR"	tracking_share_transactions
qid821	SELECT date_of_transaction FROM TRANSACTIONS WHERE transaction_type_code  =  "销售中"	tracking_share_transactions
qid822	SELECT avg(amount_of_transaction) FROM TRANSACTIONS WHERE transaction_type_code  =  "销售中"	tracking_share_transactions
qid823	SELECT transaction_type_description FROM Ref_Transaction_Types WHERE transaction_type_code  =  "PUR"	tracking_share_transactions
qid824	SELECT min(amount_of_transaction) FROM TRANSACTIONS WHERE transaction_type_code  =  "PUR" AND share_count  >  50	tracking_share_transactions
qid825	SELECT max(share_count) FROM TRANSACTIONS WHERE amount_of_transaction  <  10000	tracking_share_transactions
qid826	SELECT date_of_transaction FROM TRANSACTIONS WHERE share_count  >  100 OR amount_of_transaction  >  1000	tracking_share_transactions
qid827	SELECT T1.transaction_type_description ,  T2.date_of_transaction FROM Ref_Transaction_Types AS T1 JOIN TRANSACTIONS AS T2 ON T1.transaction_type_code  =  T2.transaction_type_code WHERE T2.share_count  <  10	tracking_share_transactions
qid828	SELECT T1.Investor_details FROM  INVESTORS AS T1 JOIN TRANSACTIONS AS T2 ON T1.investor_id  =  T2.investor_id WHERE T2.share_count  >  100	tracking_share_transactions
qid829	SELECT COUNT(DISTINCT transaction_type_code) FROM TRANSACTIONS	tracking_share_transactions
qid830	SELECT lot_details ,  investor_id FROM LOTS	tracking_share_transactions
qid831	SELECT T2.lot_details FROM INVESTORS AS T1 JOIN LOTS AS T2 ON  T1.investor_id  =  T2.investor_id WHERE T1.Investor_details  =  "l"	tracking_share_transactions
qid832	SELECT T1.purchase_details FROM PURCHASES AS T1 JOIN TRANSACTIONS AS T2 ON T1.purchase_transaction_id  =  T2.transaction_id WHERE T2.amount_of_transaction  >  10000	tracking_share_transactions
qid833	SELECT T1.sales_details ,  T2.date_of_transaction FROM SALES AS T1 JOIN TRANSACTIONS AS T2 ON T1.sales_transaction_id  =  T2.transaction_id WHERE T2.amount_of_transaction  <  3000	tracking_share_transactions
qid834	SELECT T1.lot_details FROM LOTS AS T1 JOIN TRANSACTIONS_LOTS AS T2 ON T1.lot_id  =  T2.transaction_id JOIN TRANSACTIONS AS T3 ON T2.transaction_id  =  T3.transaction_id WHERE T3.share_count  <  50	tracking_share_transactions
qid835	SELECT T1.lot_details FROM LOTS AS T1 JOIN TRANSACTIONS_LOTS AS T2 ON  T1.lot_id  =  T2.transaction_id JOIN TRANSACTIONS AS T3 ON T2.transaction_id  =  T3.transaction_id WHERE T3.share_count  >  100 AND T3.transaction_type_code  =  "PUR"	tracking_share_transactions
qid836	SELECT transaction_type_code ,  avg(amount_of_transaction) FROM TRANSACTIONS GROUP BY transaction_type_code	tracking_share_transactions
qid837	SELECT transaction_type_code ,  max(share_count) ,  min(share_count) FROM TRANSACTIONS GROUP BY transaction_type_code	tracking_share_transactions
qid838	SELECT investor_id ,  avg(share_count) FROM TRANSACTIONS GROUP BY investor_id	tracking_share_transactions
qid839	SELECT investor_id ,  avg(share_count) FROM TRANSACTIONS GROUP BY investor_id ORDER BY avg(share_count)	tracking_share_transactions
qid840	SELECT investor_id ,  avg(amount_of_transaction) FROM TRANSACTIONS GROUP BY investor_id	tracking_share_transactions
qid841	SELECT T2.lot_id ,  avg(amount_of_transaction) FROM TRANSACTIONS AS T1 JOIN Transactions_Lots AS T2 ON T1.transaction_id  =  T2.transaction_id GROUP BY T2.lot_id	tracking_share_transactions
qid842	SELECT T2.lot_id ,  avg(amount_of_transaction) FROM TRANSACTIONS AS T1 JOIN Transactions_Lots AS T2 ON T1.transaction_id  =  T2.transaction_id GROUP BY T2.lot_id ORDER BY avg(amount_of_transaction)	tracking_share_transactions
qid843	SELECT investor_id ,  COUNT(*) FROM TRANSACTIONS WHERE transaction_type_code  =  "销售中" GROUP BY investor_id	tracking_share_transactions
qid844	SELECT investor_id ,  COUNT(*) FROM TRANSACTIONS GROUP BY investor_id	tracking_share_transactions
qid845	SELECT transaction_type_code FROM TRANSACTIONS GROUP BY transaction_type_code ORDER BY COUNT(*) ASC LIMIT 1	tracking_share_transactions
qid846	SELECT transaction_type_code FROM TRANSACTIONS GROUP BY transaction_type_code ORDER BY COUNT(*) DESC LIMIT 1	tracking_share_transactions
qid847	SELECT T1.transaction_type_description FROM Ref_Transaction_Types AS T1 JOIN TRANSACTIONS AS T2 ON T1.transaction_type_code  =  T2.transaction_type_code GROUP BY T1.transaction_type_code ORDER BY COUNT(*) DESC LIMIT 1	tracking_share_transactions
qid848	SELECT T2.investor_id ,  T1.Investor_details FROM INVESTORS AS T1 JOIN TRANSACTIONS AS T2 ON T1.investor_id  =  T2.investor_id GROUP BY T2.investor_id ORDER BY COUNT(*) DESC LIMIT 1	tracking_share_transactions
qid849	SELECT T2.investor_id ,  T1.Investor_details FROM INVESTORS AS T1 JOIN TRANSACTIONS AS T2 ON T1.investor_id  =  T2.investor_id GROUP BY T2.investor_id ORDER BY COUNT(*) DESC LIMIT 3	tracking_share_transactions
qid850	SELECT T2.investor_id FROM INVESTORS AS T1 JOIN TRANSACTIONS AS T2 ON T1.investor_id  =  T2.investor_id GROUP BY T2.investor_id HAVING COUNT(*)  >=  2	tracking_share_transactions
qid851	SELECT T2.investor_id ,  T1.Investor_details FROM INVESTORS AS T1 JOIN TRANSACTIONS AS T2 ON T1.investor_id  =  T2.investor_id WHERE T2.transaction_type_code  =  "销售中" GROUP BY T2.investor_id HAVING COUNT(*)  >=  2	tracking_share_transactions
qid852	SELECT date_of_transaction FROM TRANSACTIONS WHERE share_count  >=  100 OR amount_of_transaction  >=  100	tracking_share_transactions
qid853	SELECT sales_details FROM sales UNION SELECT purchase_details FROM purchases	tracking_share_transactions
qid854	SELECT lot_details FROM Lots EXCEPT SELECT T1.lot_details FROM Lots AS T1 JOIN transactions_lots AS T2 ON T1.lot_id  =  T2.lot_id	tracking_share_transactions
qid855	SELECT count(*) FROM station	train_station
qid856	SELECT name ,  LOCATION ,  number_of_platforms FROM station	train_station
qid857	SELECT DISTINCT LOCATION FROM station	train_station
qid858	SELECT name ,  total_passengers FROM station WHERE LOCATION != "广州"	train_station
qid859	SELECT name ,  main_services FROM station ORDER BY total_passengers DESC LIMIT 3	train_station
qid860	SELECT avg(total_passengers) ,  max(total_passengers) FROM station WHERE LOCATION  =  "广州" OR LOCATION  =  "深圳"	train_station
qid861	SELECT LOCATION ,  sum(number_of_platforms) ,  sum(total_passengers) FROM station GROUP BY LOCATION	train_station
qid862	SELECT DISTINCT LOCATION FROM station WHERE number_of_platforms  >=  15 AND total_passengers  >  25	train_station
qid863	SELECT LOCATION FROM station EXCEPT SELECT LOCATION FROM station WHERE number_of_platforms  >=  15	train_station
qid864	SELECT LOCATION FROM station GROUP BY LOCATION ORDER BY count(*) DESC LIMIT 1	train_station
qid865	SELECT name ,  TIME ,  service FROM train	train_station
qid866	SELECT count(*) FROM train	train_station
qid867	SELECT name ,  service FROM train ORDER BY TIME	train_station
qid868	SELECT T2.name ,  count(*) FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id GROUP BY T1.station_id	train_station
qid869	SELECT T2.name ,  T3.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id JOIN train AS T3 ON T3.train_id  =  T1.train_id	train_station
qid870	SELECT T3.name ,  T3.time FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id JOIN train AS T3 ON T3.train_id  =  T1.train_id WHERE T2.location  =  "广州" ORDER BY T3.time DESC	train_station
qid871	SELECT T2.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id GROUP BY T1.station_id ORDER BY count(*) DESC LIMIT 1	train_station
qid872	SELECT T2.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id GROUP BY T1.station_id HAVING count(*)  >=  2	train_station
qid873	SELECT LOCATION FROM station GROUP BY LOCATION HAVING count(*)  =  1	train_station
qid874	SELECT name FROM station WHERE station_id NOT IN (SELECT station_id FROM train_station)	train_station
qid875	SELECT T2.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id JOIN train AS T3 ON T3.train_id  =  T1.train_id WHERE T3.Name  =  "和谐号" INTERSECT SELECT T2.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id JOIN train AS T3 ON T3.train_id  =  T1.train_id WHERE T3.Name  =  "复兴号"	train_station
qid876	SELECT T2.name FROM train_station AS T1 JOIN train AS T2 ON T1.train_id  =  T2.train_id WHERE T1.station_id NOT IN (SELECT T4.station_id FROM train_station AS T3 JOIN station AS T4 ON T3.station_id  =  T4.station_id WHERE t4.location  =  "广州")	train_station
qid877	SELECT name ,  LOCATION FROM station ORDER BY Annual_entry_exit ,  Annual_interchanges	train_station
qid878	SELECT count(*) FROM area_code_state	voter_1
qid879	SELECT contestant_number ,  contestant_name FROM contestants ORDER BY contestant_name DESC	voter_1
qid880	SELECT vote_id ,  phone_number ,  state FROM votes	voter_1
qid881	SELECT max(area_code) ,  min(area_code) FROM area_code_state	voter_1
qid882	SELECT max(created) FROM votes WHERE state  =  "浙江"	voter_1
qid883	SELECT contestant_name FROM contestants WHERE contestant_name != "李红"	voter_1
qid884	SELECT DISTINCT state ,  created FROM votes	voter_1
qid885	SELECT T1.contestant_number , T1.contestant_name FROM contestants AS T1 JOIN votes AS T2 ON T1.contestant_number  =  T2.contestant_number GROUP BY T1.contestant_number HAVING count(*)  >=  2	voter_1
qid886	SELECT T1.contestant_number , T1.contestant_name FROM contestants AS T1 JOIN votes AS T2 ON T1.contestant_number  =  T2.contestant_number GROUP BY T1.contestant_number ORDER BY count(*) ASC LIMIT 1	voter_1
qid887	SELECT count(*) FROM votes WHERE state  =  "江苏" OR state  =  "浙江"	voter_1
qid888	SELECT count(*) FROM contestants WHERE contestant_number NOT IN ( SELECT contestant_number FROM votes )	voter_1
qid889	SELECT T1.area_code FROM area_code_state AS T1 JOIN votes AS T2 ON T1.state  =  T2.state GROUP BY T1.area_code ORDER BY count(*) DESC LIMIT 1	voter_1
qid890	SELECT T2.created ,  T2.state ,  T2.phone_number FROM contestants AS T1 JOIN votes AS T2 ON T1.contestant_number  =  T2.contestant_number WHERE T1.contestant_name  =  "王伟"	voter_1
qid891	SELECT T3.area_code FROM contestants AS T1 JOIN votes AS T2 ON T1.contestant_number  =  T2.contestant_number JOIN area_code_state AS T3 ON T2.state  =  T3.state WHERE T1.contestant_name  =  "王伟" INTERSECT SELECT T3.area_code FROM contestants AS T1 JOIN votes AS T2 ON T1.contestant_number  =  T2.contestant_number JOIN area_code_state AS T3 ON T2.state  =  T3.state WHERE T1.contestant_name  =  "王芳"	voter_1
qid892	SELECT contestant_name FROM contestants WHERE contestant_name LIKE "%勇%"	voter_1
qid893	SELECT count(*) FROM players	wta_1
qid894	SELECT count(*) FROM players	wta_1
qid895	SELECT count(*) FROM matches	wta_1
qid896	SELECT count(*) FROM matches	wta_1
qid897	SELECT first_name ,  birth_date FROM players WHERE country_code  =  '中国'	wta_1
qid898	SELECT first_name ,  birth_date FROM players WHERE country_code  =  '中国'	wta_1
qid899	SELECT avg(loser_age) ,  avg(winner_age) FROM matches	wta_1
qid900	SELECT avg(loser_age) ,  avg(winner_age) FROM matches	wta_1
qid901	SELECT avg(winner_rank) FROM matches	wta_1
qid902	SELECT avg(winner_rank) FROM matches	wta_1
qid903	SELECT min(loser_rank) FROM matches	wta_1
qid904	SELECT min(loser_rank) FROM matches	wta_1
qid905	SELECT count(DISTINCT country_code) FROM players	wta_1
qid906	SELECT count(DISTINCT country_code) FROM players	wta_1
qid907	SELECT count(DISTINCT loser_name) FROM matches	wta_1
qid908	SELECT count(DISTINCT loser_name) FROM matches	wta_1
qid909	SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*)  >  10	wta_1
qid910	SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*)  >  10	wta_1
qid911	SELECT winner_name FROM matches WHERE YEAR  =  2013 INTERSECT SELECT winner_name FROM matches WHERE YEAR  =  2016	wta_1
qid912	SELECT winner_name FROM matches WHERE YEAR  =  2013 INTERSECT SELECT winner_name FROM matches WHERE YEAR  =  2016	wta_1
qid913	SELECT count(*) FROM matches WHERE YEAR  =  2013 OR YEAR  =  2016	wta_1
qid914	SELECT count(*) FROM matches WHERE YEAR  =  2013 OR YEAR  =  2016	wta_1
qid915	SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'WTA 锦标赛' INTERSECT SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  '澳网'	wta_1
qid916	SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'WTA 锦标赛' INTERSECT SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  '澳网'	wta_1
qid917	SELECT first_name ,  country_code FROM players ORDER BY birth_date LIMIT 1	wta_1
qid918	SELECT first_name ,  country_code FROM players ORDER BY birth_date LIMIT 1	wta_1
qid919	SELECT first_name ,  last_name FROM players ORDER BY birth_date	wta_1
qid920	SELECT first_name ,  last_name FROM players ORDER BY birth_date	wta_1
qid921	SELECT first_name ,  last_name FROM players WHERE hand  =  '左' ORDER BY birth_date	wta_1
qid922	SELECT first_name ,  last_name FROM players WHERE hand  =  '左' ORDER BY birth_date	wta_1
qid923	SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id ORDER BY T2.tours DESC LIMIT 1	wta_1
qid924	SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id ORDER BY T2.tours DESC LIMIT 1	wta_1
qid925	SELECT YEAR FROM matches GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	wta_1
qid926	SELECT YEAR FROM matches GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	wta_1
qid927	SELECT winner_name ,  winner_rank_points FROM matches GROUP BY winner_name ORDER BY count(*) DESC LIMIT 1	wta_1
qid928	SELECT winner_name ,  winner_rank_points FROM matches GROUP BY winner_name ORDER BY count(*) DESC LIMIT 1	wta_1
qid929	SELECT winner_name FROM matches WHERE tourney_name  =  '澳网' ORDER BY winner_rank_points DESC LIMIT 1	wta_1
qid930	SELECT winner_name FROM matches WHERE tourney_name  =  '澳网' ORDER BY winner_rank_points DESC LIMIT 1	wta_1
qid931	SELECT winner_name ,  loser_name FROM matches ORDER BY minutes DESC LIMIT 1	wta_1
qid932	SELECT winner_name ,  loser_name FROM matches ORDER BY minutes DESC LIMIT 1	wta_1
qid933	SELECT avg(ranking) ,  T1.first_name FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.first_name	wta_1
qid934	SELECT avg(ranking) ,  T1.first_name FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.first_name	wta_1
qid935	SELECT sum(ranking_points) ,  T1.first_name FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.first_name	wta_1
qid936	SELECT sum(ranking_points) ,  T1.first_name FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.first_name	wta_1
qid937	SELECT count(*) ,  country_code FROM players GROUP BY country_code	wta_1
qid938	SELECT count(*) ,  country_code FROM players GROUP BY country_code	wta_1
qid939	SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1	wta_1
qid940	SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1	wta_1
qid941	SELECT country_code FROM players GROUP BY country_code HAVING count(*)  >  50	wta_1
qid942	SELECT country_code FROM players GROUP BY country_code HAVING count(*)  >  50	wta_1
qid943	SELECT sum(tours) ,  ranking_date FROM rankings GROUP BY ranking_date	wta_1
qid944	SELECT sum(tours) ,  ranking_date FROM rankings GROUP BY ranking_date	wta_1
qid945	SELECT count(*) ,  YEAR FROM matches GROUP BY YEAR	wta_1
qid946	SELECT count(*) ,  YEAR FROM matches GROUP BY YEAR	wta_1
qid947	SELECT DISTINCT winner_name ,  winner_rank FROM matches ORDER BY winner_age LIMIT 3	wta_1
qid948	SELECT DISTINCT winner_name ,  winner_rank FROM matches ORDER BY winner_age LIMIT 3	wta_1
qid949	SELECT count(DISTINCT winner_name) FROM matches WHERE tourney_name  =  'WTA 锦标赛' AND winner_hand  =  '左'	wta_1
qid950	SELECT count(DISTINCT winner_name) FROM matches WHERE tourney_name  =  'WTA 锦标赛' AND winner_hand  =  '左'	wta_1
qid951	SELECT T1.first_name ,  T1.country_code ,  T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id ORDER BY T2.winner_rank_points DESC LIMIT 1	wta_1
qid952	SELECT T1.first_name ,  T1.country_code ,  T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id ORDER BY T2.winner_rank_points DESC LIMIT 1	wta_1
qid953	SELECT count(*) ,  hand FROM players GROUP BY hand	wta_1
qid954	SELECT count(*) ,  hand FROM players GROUP BY hand	wta_1
