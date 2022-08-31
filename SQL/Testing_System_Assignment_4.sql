#Câu 1
SELECT A.FullName, D.DepartmentName
FROM `Account` A
JOIN Department D ON A.DepartmentID = D.DepartmentID;

#câu 2
SELECT *
FROM `Account`
WHERE CreateDate >'2010-12-20';

#Câu 3
SELECT A.FullName, P.PositionName
FROM `Account` A
JOIN `Position` P ON A.PositionID = P.PositionID
WHERE PositionName = 'Dev';

#Câu 4
SELECT D.DepartmentName, COUNT(A.DepartmentID)
FROM `Department` D
JOIN `Account` A ON D.DepartmentID = A.DepartmentID
GROUP BY A.DepartmentID
HAVING COUNT(A.DepartmentID) >2;

#Câu 5
WITH CountQuesTable AS(
	SELECT Q.QuestionID, Q.Content, COUNT(EQ.QuestionID) AS SL
    FROM ExamQuestion EQ
    JOIN Question Q ON Q.QuestionID = EQ.QuestionID
    GROUP BY EQ.QuestionID)
SELECT * FROM CountQuesTable
WHERE SL = (SELECT MAX(SL) FROM	CountQuesTable);

#Câu 6
SELECT Q.CategoryID, CQ.CategoryName, COUNT(CQ.CategoryID) AS SLSD
FROM CategoryQuestion CQ
JOIN Question Q ON Q.CategoryID = CQ.CategoryID
GROUP BY CQ.CategoryID;

#Câu 7
SELECT Q.content, Q.CategoryID, E.Title, COUNT(E.CategoryID) AS SLSD
FROM Question Q
JOIN Exam E ON Q.CategoryID = E.CategoryID
GROUP BY Q.CategoryID;

#Câu 8
WITH CountQuesQTable AS(
	SELECT Q.content, Q.QuestionID, COUNT(A.QuestionID) AS SLQ
    FROM Answer A
    JOIN Question Q ON Q.QuestionID = A.QuestionID
    GROUP BY A.QuestionID)
SELECT * FROM CountQuesQTable
WHERE SLQ = (SELECT MAX(SLQ) FROM CountQuesQTable);

#Câu 9
SELECT G.GroupID, G.GroupName, COUNT(GA.GroupID) AS SLA
FROM GroupAccount GA
JOIN `Group` G ON G.GroupID = GA.GroupID
GROUP BY GA.GroupID;

#Câu 10
WITH CountQuesPTable AS(
SELECT P.PositionID, P.PositionName, COUNT(A.PositionID) SLP
FROM `Account` A
JOIN `Position` P ON P.PositionID = A.PositionID
GROUP BY A.PositionID)
SELECT * FROM CountQuesPTable 
WHERE SLP = (SELECT Min(SLP) FROM CountQuesPTable); 

#Câu 11
SELECT D.DepartmentName, P.PositionID, P.PositionName, A.DepartmentID, COUNT(A.PositionID) SLP
FROM `Account` A
JOIN `Position` P ON P.PositionID = A.PositionID
JOIN `Department` D ON D.DepartmentID = A.DepartmentID
GROUP BY A.PositionID;

#Câu 12
SELECT T.TypeName, A.FullName, AN.Content, Q.QuestionID
FROM Question Q
JOIN TypeQuestion T ON T.TypeID = Q.TypeID
JOIN `Account` A ON A.AccountID = Q.CreatorID
JOIN Answer AN ON AN.QuestionID = Q.QuestionID
GROUP BY Q.QuestionID;


#Câu 13
SELECT T.TypeName, COUNT(Q.TypeID) AS SLCH
FROM TypeQuestion T
JOIN Question Q ON T.TypeID = Q.TypeID
GROUP BY Q.TypeID;

#Câu 14