1.
Create database PeopleAndPicture;
Use PeopleAndPicture;
Create table Pic_Table(
Picture varchar(255),
Name varchar(255),
Location int,
ddate date
)
Select * From Pic_Table;
Intsert into Pic_Table values('001','Sphinx.jpg','1','2/3/23');
Intsert into Pic_Table values('002','Great Pyramids.jpg','3','1/6/23');
Intsert into Pic_Table values('003','Eiffel Tower.jpg','4','9/5/23');
Intsert into Pic_Table values('004','Louvre.jpg','5','8/4/23');
Intsert into Pic_Table values('005','Big Ben.jpg','2','6/9/23');
Select * From Pic_Table;
drop table Pic_Table;

Create table People_Table(
    PictureNo varchar(255),
    Person varchar(255),
)
Select * From People_Table;
Intsert into Pic_Table values('001','Brandi');
Intsert into Pic_Table values('002','James');
Intsert into Pic_Table values('003','James');
Intsert into Pic_Table values('004','Brandi');
Intsert into Pic_Table values('005','James');
Intsert into Pic_Table values('005','Carol');
Select * From People_Table;
drop table People_Table;

Create table Location_Table(
    Location varchar(255),
    City varchar(255),
    Country varchar(255)
);
Select * From Location_Table;
Intsert into Location_Table values('1','Cairo','Egypt');
Intsert into Location_Table values('2','Paris','France');
Intsert into Location_Table values('3','London','England');
Select * From Location_Table;
drop table Location_Table;

2.
UPDATE Pic_Table
SET Location = 5, ddate = '2024-03-15'
WHERE Picture = '005';
Select * From Pic_Table;

3.
SELECT PictureNo, Person
FROM People_Table
WHERE Person IN ('Brandi', 'James')
AND PictureNo IN (
    SELECT Picture
    FROM Pic_Table
    WHERE Name IN ('Eiffel Tower.jpg', 'Great Pyramids.jpg')
);

4.
SELECT Location_Table.Location,Pic_Table.Name AS FileName,Pic_Table.ddate AS Date, Location_Table.City,Location_Table.Country
FROM Location_Table
INNER JOIN Pic_Table ON Location_Table.Location = Pic_Table.Location
WHERE Location_Table.City IN ('Cairo', 'London');

5.
SELECT *
FROM People_Table
ORDER BY Person DESC;