-- Momentum-Resume Database Schema
-- Version: 0.1.0
-- Author: Mahmoud S. Khedr
-- Date: 18-12-2024

-- Database: Momentum-Resume
-- Description: This script creates the "Momentum-Resume" database and the required tables.

-- Create the "Momentum-Resume" database
CREATE DATABASE "Momentum-Resume";
USE "Momentum-Resume";

-- Create the "Users" table #to be refactored and make account table
CREATE TABLE "Users"(
    "UserID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserFirstName" VARCHAR(50) NOT NULL,
    "UserLastName" VARCHAR(50) NOT NULL,
    "UserMiddleName" VARCHAR(50),
    "UserEmail" VARCHAR(150) NOT NULL,
    "UserMainPhone" VARCHAR(20) NOT NULL,
    "UserPasswordHash" VARCHAR(255) NOT NULL,
    "AccountType" INT NOT NULL DEFAULT 0 -- 0: FreeUser, 1: PremiumUser , 2: Admin
);

CREATE INDEX "UsersIndexEmail" ON "Users" ("UserEmail");
CREATE INDEX "UsersIndexPhone" ON "Users" ("UserMainPhone");

-- Create the "UserAddress" table
CREATE TABLE "UserAddress"(
    "AddressID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "AddressLine1" VARCHAR(100) NOT NULL,
    "AddressLine2" VARCHAR(100),
    "City" VARCHAR(50) NOT NULL,
    "State" VARCHAR(50) NOT NULL,
    "Country" VARCHAR(50) NOT NULL,
    "PostalCode" VARCHAR(10) NOT NULL,
    "AddressType" INT NOT NULL DEFAULT 0, -- 0: AnyAddress, 1: DefaultAddress
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);

CREATE INDEX "UserAddressIndex" ON "Users" ("UserID");

-- Create the "UserEducation" table
CREATE TABLE "UserEducation"(
    "EducationID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "SchoolName" VARCHAR(120) NOT NULL,
    "SchoolCountry" VARCHAR(50) NOT NULL,
    "SchoolCity" VARCHAR(50) NOT NULL,
    "Degree" VARCHAR(50) NOT NULL,
    "FieldOfStudy" VARCHAR(70) NOT NULL,
    "StartDate" DATE NOT NULL,
    "EndDate" DATE,
    "ResultType" INT NOT NULL DEFAULT 0, -- 0: gpa, 1: percentage
    "Result" FLOAT NOT NULL,
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);
CREATE INDEX "UserEducationIndex" ON "Users" ("UserID");

CREATE TABLE "UserEducationCourses"(
    "CourseID" INT PRIMARY KEY AUTO_INCREMENT,
    "EducationID" INT NOT NULL,
    "CourseName" VARCHAR(120) NOT NULL,
    "CourseDate" DATE NOT NULL,
    FOREIGN KEY ("EducationID") REFERENCES "UserEducation"("EducationID")
);

CREATE INDEX "UserEducationCoursesIndex" ON "UserEducation" ("EducationID");

CREATE TABLE "UserEducationAccomplishments"(
    "AccomplishmentID" INT PRIMARY KEY AUTO_INCREMENT,
    "EducationID" INT NOT NULL,
    "AccomplishmentDescription" VARCHAR(300) NOT NULL,
    FOREIGN KEY ("EducationID") REFERENCES "UserEducation"("EducationID")
);

CREATE INDEX "UserEducationAccomplishmentsIndex" ON "UserEducation" ("EducationID");

-- Create the "UserExperience" table
CREATE TABLE "UserExperience" (
    "ExperienceID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "CompanyName" VARCHAR(120) NOT NULL,
    "Position" VARCHAR(70) NOT NULL,
    "StartDate" DATE NOT NULL,
    "EndDate" DATE,
    "Description" TEXT,
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);

CREATE INDEX "UserExperienceIndex" ON "Users" ("UserID");

CREATE TABLE "UserExperienceAccomplishments" (
    "AccomplishmentID" INT PRIMARY KEY AUTO_INCREMENT,
    "ExperienceID" INT NOT NULL,
    "AccomplishmentDescription" VARCHAR(300) NOT NULL,
    FOREIGN KEY ("ExperienceID") REFERENCES "UserExperience"("ExperienceID")
);

CREATE INDEX "UserExperienceAccomplishmentsIndex" ON "UserExperience" ("ExperienceID");

-- Create the "UserSkills" table

CREATE TABLE "UserSkills" (
    "SkillID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "SkillName" VARCHAR(50) NOT NULL,
    "SkillLevel" INT NOT NULL,
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);

CREATE INDEX "UserSkillsIndex" ON "Users" ("UserID");

-- Create the "UserProjects" table
CREATE TABLE "UserProjects" (
    "ProjectID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "ProjectName" VARCHAR(120) NOT NULL,
    "ProjectStartDate" DATE NOT NULL,
    "ProjectEndDate" DATE,
    "ProjectLink" VARCHAR(255),
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);

CREATE INDEX "UserProjectsIndex" ON "Users" ("UserID");

CREATE TABLE "UserProjectsAccomplishments" (
    "AccomplishmentID" INT PRIMARY KEY AUTO_INCREMENT,
    "ProjectID" INT NOT NULL,
    "AccomplishmentDescription" VARCHAR(300) NOT NULL,
    FOREIGN KEY ("ProjectID") REFERENCES "UserProjects"("ProjectID")
);

CREATE INDEX "UserProjectsAccomplishmentsIndex" ON "UserProjects" ("ProjectID");

-- Create the "UserReferences" table
CREATE TABLE "UserReferences" (
    "ReferenceID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "ReferenceName" VARCHAR(50) NOT NULL,
    "ReferenceEmail" VARCHAR(150) NOT NULL,
    "ReferencePhone" VARCHAR(20) NOT NULL,
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);

CREATE INDEX "UserReferencesIndex" ON "Users" ("UserID");

-- Create the "UserCertificates" table
CREATE TABLE "UserCertificates" (
    "CertificateID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "CertificateName" VARCHAR(120) NOT NULL,
    "CertificateDate" DATE NOT NULL,
    "CertificateLink" VARCHAR(255),
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);

CREATE INDEX "UserCertificatesIndex" ON "Users" ("UserID");

-- Create the "UserAwards" table
CREATE TABLE "UserAwards" (
    "AwardID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "AwardName" VARCHAR(120) NOT NULL,
    "AwardDate" DATE NOT NULL,
    "AwardLink" VARCHAR(255),
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);

CREATE INDEX "UserAwardsIndex" ON "Users" ("UserID");

-- Create the "UserCourses" table
CREATE TABLE "UserCourses" (
    "CourseID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "CourseName" VARCHAR(120) NOT NULL,
    "CourseDate" DATE NOT NULL,
    "CourseLink" VARCHAR(255),
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);

CREATE INDEX "UserCoursesIndex" ON "Users" ("UserID");

CREATE TABLE "UserCoursesAccomplishments" (
    "AccomplishmentID" INT PRIMARY KEY AUTO_INCREMENT,
    "CourseID" INT NOT NULL,
    "AccomplishmentDescription" VARCHAR(300) NOT NULL,
    FOREIGN KEY ("CourseID") REFERENCES "UserCourses"("CourseID")
);

CREATE INDEX "UserCoursesAccomplishmentsIndex" ON "UserCourses" ("CourseID");

-- Create the "UserInterests" table
CREATE TABLE "UserInterests" (
    "InterestID" INT PRIMARY KEY AUTO_INCREMENT,
    "UserID" INT NOT NULL,
    "InterestName" VARCHAR(50) NOT NULL,
    FOREIGN KEY ("UserID") REFERENCES "Users"("UserID")
);

CREATE INDEX "UserInterestsIndex" ON "Users" ("UserID");
