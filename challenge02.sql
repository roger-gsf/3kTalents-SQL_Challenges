-- Disable safe updates
SET SQL_SAFE_UPDATES = 0;

USE challenge02;

CREATE TABLE IF NOT EXISTS cars_rental (
    id_cars_rental INT AUTO_INCREMENT UNIQUE;
    car_brand VARCHAR(80) NOT NULL,
    car_model VARCHAR(100) NOT NULL,
    car_color VARCHAR(40) NOT NULL,
    car_fuel DECIMAL(4,2) NOT NULL,
    car_year SMALLINT(4) NOT NULL,
    car_price DECIMAL(8,2) NOT NULL
);

INSERT INTO cars_rental (car_brand, car_model, car_color, car_fuel, car_year, car_price) VALUES
('Toyota', 'Corolla', 'Red', 7.5, 2020, 30000.00),
('Honda', 'Civic', 'Blue', 8.0, 2019, 28000.00),
('Ford', 'Mustang', 'Black', 12.0, 2018, 45000.00),
('Chevrolet', 'Camaro', 'Yellow', 10.5, 2021, 50000.00),
('Tesla', 'Model S', 'White', 0.0, 2022, 80000.00),
('BMW', '3 Series', 'Gray', 9.5, 2020, 40000.00),
('Audi', 'A4', 'Silver', 8.7, 2019, 42000.00),
('Mercedes-Benz', 'C-Class', 'Black', 9.0, 2021, 55000.00),
('Nissan', 'Altima', 'Blue', 7.8, 2020, 27000.00),
('Hyundai', 'Elantra', 'Red', 7.6, 2018, 22000.00);

CREATE TABLE IF NOT EXISTS costumers (
    id_costumer INT AUTO_INCREMENT UNIQUE,
    costumer_name VARCHAR(255) NOT NULL,
    costumer_age TINYINT,
    costumer_gender CHAR(1),
    costumer_birth DATE,
    costumer_phone VARCHAR(14),
);

