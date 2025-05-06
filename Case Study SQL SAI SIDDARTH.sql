-- Creation of VirtualArtGallery -- 
-- Drop the database fully -- 
drop database VirtualArtGallery;

-- Creation of database -- 
create database VirtualArtGallery;
use VirtualArtGallery;

-- Creation of table starts here --
-- 1. Artist Table
create table Artist
(
ArtistID int primary key auto_increment,
Name varchar(50) not null,
Biography text,
BirthDate date,
Nationality varchar(20),
Website varchar(150),
Contact_Information varchar(50)
);
-- 2. Artwork Table
create table Artwork
(
ArtworkID int primary key auto_increment,
Title varchar(100) not null,
Description text,
CreationDate date,
Medium varchar(50),
ImageURL varchar(200),
ArtistID int,
foreign key (ArtistID) references Artist(ArtistID)
);
-- 3. User Table
create table User
(
UserID int primary key auto_increment,
Username varchar(50) not null,
Password varchar(25) not null,
Email varchar(100) not null,
FirstName varchar(50),
LastName varchar(50),
DateofBirth date,
ProfilePicture varchar(250)
);
-- 4. Gallery Table
create table Gallery
(
GalleryID int primary key auto_increment,
Name varchar(100) not null,
Description text,
Location varchar(100),
Curator int,
Opening_Hours varchar(10),
foreign key (curator) references Artist(ArtistID)
);
-- 5. Artwork_Gallery (Many-to-Many)
create table Artwork_Gallery
(
ArtworkID int,
GalleryID int,
primary key(ArtworkID,GalleryID),
foreign key (ArtworkID)references Artwork(ArtworkID),
foreign key(GalleryID)references Gallery(GalleryID)
);
-- 6. User_Favorite_Artwork (Many-to-Many)
create table User_Favorite_Artwork
(
UserID int,
ArtworkID int,
primary key(UserID,ArtworkID),
foreign key (UserID) references User(UserID),
foreign key (ArtworkID) references Artwork(ArtworkID)
);
