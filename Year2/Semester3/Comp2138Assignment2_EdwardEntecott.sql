--1
CREATE OR REPLACE PROCEDURE insert_category
(  category_id IN NUMBER
,  category_name IN VARCHAR2
) AS
BEGIN
  NULL;
END insert_category;



--2
--CREATE FUNCTION discount_price
CREATE OR REPLACE FUNCTION discount_price
  (ItemID INT)
  RETURN INT
  BEGIN
    RETURN (SELECT (ItemPrice - DiscountAmount) AS DiscountPrice
    FROM OrderItems
    WHERE ItemID = ItemID);
  END;
  /
  BEGIN
  DBMS_OUTPUT.putline 'Discount price: $' + CONVERT(varchar, dbo.fnDiscountPrice(2),1);

--3
USE mgs;

DROP TRIGGER IF EXISTS products_before_update;

CREATE TRIGGER products_before_update
  BEFORE UPDATE ON Products
  FOR EACH ROW
BEGIN
IF NEW.discount_percent > 100 THEN
SIGNAL SQLSTATE 'HY000'
    set message_text = 
        'the discount percent cannot be greater than 100';
ELSEIF new.discount_percent < 0 THEN
SIGNAL SQLSTATE 'HY000'
    set message_text = 
        'the discount percent cannot be less than 0';
ELSEIF NEW.discount_percent < 1 THEN
SET NEW.discount_percent = (NEW.discount_percent * 100);
END IF;

END//

DELIMITER ;

UPDATE Products
SET discount_percent = .4
WHERE product_id = 3;


--4
 CREATE TRIGGER Products_INSERT
        ON Products
        AFTER INSERT
    AS
        UPDATE Products
        SET DateAdded = GETDATE()
        WHERE DateAdded IS NULL OR
              DateAdded IN (SELECT DateAdded FROM inserted);

INSERT INTO Products
  (   CategoryID,
      ProductCode,
      ProductName,
      Description,
      ListPrice,
      DiscountPercent,
      DateAdded
   )   
    VALUES (4, 'EE-2500', 'Keyboard MK5300',
    'This is the added keyboard. ',
    452.99, 25.00, NULL)