CREATE TABLE [User] (
  Id             uniqueidentifier NOT NULL, 
  Name           nvarchar(50) NOT NULL, 
  Password       varchar(255) NOT NULL, 
  Email          varchar(50) NOT NULL UNIQUE, 
  StartMonthDate int NULL, 
  PRIMARY KEY (Id));
CREATE TABLE CategoryType (
  Id   int IDENTITY(1, 1) NOT NULL, 
  Type varchar(10) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE CategoryStatistic (
  UserId     uniqueidentifier NOT NULL, 
  CategoryId int NOT NULL, 
  StartDate  date NOT NULL, 
  EndDate    date NOT NULL, 
  Amount     decimal(19, 0) NOT NULL, 
  PRIMARY KEY (UserId, 
  CategoryId));
CREATE TABLE FinanceItem (
  Id         uniqueidentifier NOT NULL, 
  UserId     uniqueidentifier NOT NULL, 
  CategoryId int NOT NULL, 
  Name       nvarchar(20) NOT NULL, 
  Type       varchar(15) NULL, 
  Limit      decimal(19, 0) NULL, 
  PRIMARY KEY (Id));
CREATE TABLE ItemStatistic (
  ItemId    uniqueidentifier NOT NULL, 
  StartDate date NOT NULL, 
  EndDate   date NOT NULL, 
  Amount    decimal(19, 0) NOT NULL, 
  PRIMARY KEY (ItemId));
CREATE TABLE Statement (
  Id     uniqueidentifier NOT NULL, 
  ItemId uniqueidentifier NOT NULL, 
  [Date] date NOT NULL, 
  Amount decimal(19, 0) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE ActivityType (
  Id         int IDENTITY(1, 1) NOT NULL, 
  CategoryId int NOT NULL, 
  Name       varchar(10) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Activity (
  Id          uniqueidentifier NOT NULL, 
  [Date]      date NOT NULL, 
  ItemId      uniqueidentifier NOT NULL, 
  TypeId      int NOT NULL, 
  Form        varchar(15) NOT NULL, 
  Amount      decimal(19, 0) NOT NULL, 
  Description nvarchar(50) NULL, 
  PRIMARY KEY (Id));
CREATE TABLE CashType (
  Id    int IDENTITY(1, 1) NOT NULL, 
  Value int NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE CashStatistic (
  Id     uniqueidentifier NOT NULL, 
  ItemId uniqueidentifier NOT NULL, 
  CashId int NOT NULL, 
  Amount int NOT NULL, 
  PRIMARY KEY (Id));
ALTER TABLE CategoryStatistic ADD CONSTRAINT FKCategorySt176505 FOREIGN KEY (UserId) REFERENCES [User] (Id);
ALTER TABLE CategoryStatistic ADD CONSTRAINT FKCategorySt295152 FOREIGN KEY (CategoryId) REFERENCES CategoryType (Id);
ALTER TABLE FinanceItem ADD CONSTRAINT FKFinanceIte749775 FOREIGN KEY (UserId) REFERENCES [User] (Id);
ALTER TABLE FinanceItem ADD CONSTRAINT FKFinanceIte368871 FOREIGN KEY (CategoryId) REFERENCES CategoryType (Id);
ALTER TABLE ItemStatistic ADD CONSTRAINT FKItemStatis194636 FOREIGN KEY (ItemId) REFERENCES FinanceItem (Id);
ALTER TABLE Statement ADD CONSTRAINT FKStatement207630 FOREIGN KEY (ItemId) REFERENCES FinanceItem (Id);
ALTER TABLE ActivityType ADD CONSTRAINT FKActivityTy744823 FOREIGN KEY (CategoryId) REFERENCES CategoryType (Id);
ALTER TABLE Activity ADD CONSTRAINT FKActivity351636 FOREIGN KEY (ItemId) REFERENCES FinanceItem (Id);
ALTER TABLE Activity ADD CONSTRAINT FKActivity117085 FOREIGN KEY (TypeId) REFERENCES ActivityType (Id);
ALTER TABLE CashStatistic ADD CONSTRAINT FKCashStatis94195 FOREIGN KEY (ItemId) REFERENCES FinanceItem (Id);
ALTER TABLE CashStatistic ADD CONSTRAINT FKCashStatis842653 FOREIGN KEY (CashId) REFERENCES CashType (Id);
