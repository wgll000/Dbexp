-- 创建一个表，其中所有的表都以"T_"开头。

-- 第一个表为采购表，其中需包括（出版社，编号，书号，书名，作者，单价，数量，总金额，采购员，联系电话）

-- 第二个表为购书单，其中需包括（编号，购书者姓名，会员号，地址，电话，书号。书名。出版社，作者，单价，数量，总金额，订购日期，送书日期，订单负责人，购书者签字）

-- 合理添加外键与主键，注意不要多创建表

CREATE TABLE
    T_Procurement (
        Procurement_ID INT PRIMARY KEY,
        Publisher VARCHAR(50),
        Sequence_Number INT,
        Book_Number VARCHAR(50),
        Book_Name VARCHAR(100),
        Author VARCHAR(50),
        Price DECIMAL(10, 2),
        Quantity INT,
        Total_Amount DECIMAL(10, 2),
        Procurement_Person VARCHAR(50),
        Phone_Number VARCHAR(20)
    );

CREATE TABLE
    T_Order (
        Order_ID INT PRIMARY KEY,
        Buyer_Name VARCHAR(50),
        Membership_Number VARCHAR(20),
        Address VARCHAR(100),
        Phone_Number VARCHAR(20),
        Book_Number VARCHAR(50),
        Book_Name VARCHAR(100),
        Publisher VARCHAR(50),
        Author VARCHAR(50),
        Price DECIMAL(10, 2),
        Quantity INT,
        Total_Amount DECIMAL(10, 2),
        Order_Date DATE,
        Delivery_Date DATE,
        Order_Person VARCHAR(50),
        Buyer_Signature VARCHAR(100)
    );