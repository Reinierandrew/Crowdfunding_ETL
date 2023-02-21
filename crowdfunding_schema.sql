-- CREATE TABLES FOR CROWD FUNDING ETL
-- as per ERD created

-- DEPARTMENTS
DROP TABLE IF EXISTS contacts CASCADE;
create table public.contacts
(
    contact_id integer     not null PRIMARY KEY,
    first_name varchar(30),
    last_name  varchar(30),
    email      varchar(50) not null
);

-- CATEGORY
DROP TABLE IF EXISTS category CASCADE;
CREATE TABLE category
(
    category_id VARCHAR(5)  NOT NULL PRIMARY KEY,
    category    VARCHAR(20) NOT NULL
);

-- SUB CATEGORY
DROP TABLE IF EXISTS sub_category CASCADE;
CREATE TABLE sub_category
(
    subcategory_id     VARCHAR(8)         NOT NULL PRIMARY KEY,
    sub_category  VARCHAR(20)  NOT NULL
);

-- SUB CATEGORY
DROP TABLE IF EXISTS campaign CASCADE;
CREATE TABLE campaign
(
	cf_id integer  NOT NULL PRIMARY KEY,	
	contact_id integer  NOT NULL,	
	company_name VARCHAR(40) NOT NULL,	
	description	VARCHAR(100) NOT NULL,
	goal FLOAT NOT NULL,	
	pledged FLOAT NOT NULL,	
	outcome VARCHAR(100) NOT NULL,	
	backers_count INTEGER NOT NULL,	
	country	VARCHAR(2) NOT NULL,
	currency VARCHAR(3) NOT NULL,	
	launch_date	DATE NOT NULL,
	end_date DATE NOT NULL,		
	category_id	VARCHAR(5) NOT NULL,
	subcategory_id VARCHAR(8) NOT NULL,
	FOREIGN KEY (category_id) REFERENCES category (category_id),
	FOREIGN KEY (subcategory_id) REFERENCES sub_category (subcategory_id),
	FOREIGN KEY (contact_id) REFERENCES contacts (contact_id)
);
