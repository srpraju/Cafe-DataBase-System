create table user(
  id int primary key AUTO_INCREMENT,
  name varchar(250),
  contactNumber varchar(20),
  email varchar(50),
  password varchar(250),
  status varchar(20),
  role varchar(20),
  UNIQUE (email) 
);

insert into user(name,contactNumber,email,password,status,role) values('Admin','8904201554','admin@gmail.com','admin','true','admin');


create table category(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  primary key(id)
);


create table product(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(200) NOT NULL,
  categoryId integer NOT NULL,
  description varchar(255),
  price integer CHECK (price >= 0),
  status varchar(20),
  primary key(id)
);

create table bill(
  id int NOT NULL AUTO_INCREMENT,
  uuid varchar(200) NOT NULL,
  name varchar(255),
  email varchar(255),
  contactNumber varchar(20) NOT NULL,
  paymentMethod varchar(50) NOT NULL,
  total int NOT NULL,
  productDetails JSON DEFAULT NULL,
  createdBy varchar(255) NOT NULL,
  primary key(id)
);



 CREATE TRIGGER before_insert_update_product
    -> BEFORE INSERT ON product
    -> FOR EACH ROW
    -> BEGIN
    ->   IF NEW.price IS NULL THEN
    ->     SET NEW.price = 0;
    ->   END IF;
    -> END;



CREATE VIEW category_view AS
SELECT * FROM category
ORDER BY name;
SELECT * FROM category_view;

-- SELECT * FROM category_view;


CREATE VIEW product_category_view AS
SELECT p.id, p.name, p.description, p.price, p.status, c.id AS categoryId, c.name AS categoryName
FROM product AS p
INNER JOIN category AS c ON p.categoryId = c.id;

-- SELECT * FROM product_category_view;

-- Assertion check
-- insert into product(name,categoryId,description,price) values('dscd',1,'hd','-1');