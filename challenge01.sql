-- Disable safe updates
SET SQL_SAFE_UPDATES = 0;

USE challenge01;

-- Create the table
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    product_price DECIMAL(10, 2),
    product_desc TEXT,
    product_manufacturer VARCHAR(50),
    product_manufactureDate DATE,
    product_expiryDate DATE,
    product_outOfStock BOOLEAN DEFAULT FALSE
);

-- Insert 10 records
INSERT INTO products (product_name, product_category, product_price, product_desc, product_manufacturer, product_manufactureDate, product_expiryDate) VALUES
('Product 1', 'Category A', 19.99, 'Description of Product 1', 'Manufacturer X', '2023-01-01', '2025-01-01'),
('Product 2', 'Category B', 29.99, 'Description of Product 2', 'Manufacturer Y', '2023-02-01', '2025-02-01'),
('Product 3', 'Category C', 39.99, 'Description of Product 3', 'Manufacturer Z', '2023-03-01', '2025-03-01'),
('Product 4', 'Category A', 49.99, 'Description of Product 4', 'Manufacturer X', '2023-04-01', '2025-04-01'),
('Product 5', 'Category B', 59.99, 'Description of Product 5', 'Manufacturer Y', '2023-05-01', '2025-05-01'),
('Product 6', 'Category C', 69.99, 'Description of Product 6', 'Manufacturer Z', '2023-06-01', '2025-06-01'),
('Product 7', 'Category A', 79.99, 'Description of Product 7', 'Manufacturer X', '2023-07-01', '2025-07-01'),
('Product 8', 'Category B', 89.99, 'Description of Product 8', 'Manufacturer Y', '2023-08-01', '2025-08-01'),
('Product 9', 'Category C', 99.99, 'Description of Product 9', 'Manufacturer Z', '2023-09-01', '2025-09-01'),
('Product 10', 'Category A', 109.99, 'Description of Product 10', 'Manufacturer X', '2023-10-01', '2025-10-01');

-- Delete the 4th and 7th records
DELETE FROM products WHERE product_id = 4;
DELETE FROM products WHERE product_id = 7;

-- ALTER TABLE Products ADD COLUMN product_outOfStock BOOLEAN DEFAULT FALSE;

-- Update records to identify as out of stock, except for ID 2
UPDATE products SET product_outOfStock = TRUE WHERE product_id != 2;

-- Report of the first 5 records
SELECT * FROM products ORDER BY product_id LIMIT 5;