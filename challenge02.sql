-- Disable safe updates
SET SQL_SAFE_UPDATES = 0;

USE challenge02;

-- Create cars table
CREATE TABLE IF NOT EXISTS cars (
    id_car INT AUTO_INCREMENT PRIMARY KEY,
    car_brand VARCHAR(50) NOT NULL,
    car_model VARCHAR(100) NOT NULL,
    car_color VARCHAR(50) NOT NULL,
    car_fuel VARCHAR(50) NOT NULL,
    car_year YEAR NOT NULL,
    car_price DECIMAL(8,2) NOT NULL
);

-- Insert data into cars
INSERT INTO cars (car_brand, car_model, car_color, car_fuel, car_year, car_price) VALUES
('Toyota', 'Corolla', 'Red', 'Gasoline', 2020, 30000.00),
('Honda', 'Civic', 'Blue', 'Disel', 2019, 28000.00),
('Ford', 'Mustang', 'Black', 'Electric', 2018, 45000.00),
('Chevrolet', 'Camaro', 'Yellow', 'Hybrid', 2021, 50000.00),
('Tesla', 'Model S', 'White', 'Ethanol', 2022, 80000.00),
('BMW', '3 Series', 'Gray', 'Biodiesel', 2020, 40000.00),
('Audi', 'A4', 'Silver', 'Electric', 2019, 42000.00),
('Mercedes-Benz', 'C-Class', 'Black', 'Gasoline', 2021, 55000.00),
('Nissan', 'Altima', 'Blue', 'Hybrid', 2020, 27000.00),
('Hyundai', 'Elantra', 'Red', 'Diesel', 2018, 22000.00);

-- Create costumers table
CREATE TABLE IF NOT EXISTS costumers (
    id_costumer INT AUTO_INCREMENT PRIMARY KEY,
    costumer_name VARCHAR(255) NOT NULL,
    costumer_age TINYINT,
    costumer_gender CHAR(1),
    costumer_birth DATE,
    costumer_phone VARCHAR(14)
);

-- Insert data into costumers
INSERT INTO costumers (costumer_name, costumer_age, costumer_gender, costumer_birth, costumer_phone) VALUES
('John Doe', 35, 'M', '1989-04-23', '123-456-7890'),
('Jane Smith', 28, 'F', '1995-07-19', '123-456-7891'),
('Alice Johnson', 42, 'F', '1981-02-10', '123-456-7892'),
('Bob Brown', 50, 'M', '1974-11-05', '123-456-7893'),
('Charlie Davis', 31, 'M', '1992-09-12', '123-456-7894');

-- Create rentals table
CREATE TABLE IF NOT EXISTS rentals (
    id_rental INT AUTO_INCREMENT PRIMARY KEY,
    id_car INT NOT NULL,
    id_costumer INT NOT NULL,
    rental_start DATE NOT NULL,
    rental_end DATE NOT NULL,
    rental_value DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (id_car) REFERENCES cars(id_car),
    FOREIGN KEY (id_costumer) REFERENCES costumers(id_costumer)
);

-- Insert rental records
INSERT INTO rentals (id_car, id_costumer, rental_start, rental_end, rental_value) VALUES
(1, 1, '2024-01-01', '2024-01-07', 300.00),
(2, 1, '2024-01-10', '2024-01-15', 280.00),
(3, 1, '2024-01-20', '2024-01-25', 450.00),
(4, 1, '2024-02-01', '2024-02-05', 500.00),
(5, 1, '2024-02-10', '2024-02-15', 800.00),
(6, 1, '2024-02-20', '2024-02-25', 400.00),

(1, 2, '2024-03-01', '2024-03-07', 300.00),
(2, 2, '2024-03-10', '2024-03-15', 280.00),
(3, 2, '2024-03-20', '2024-03-25', 450.00),
(4, 2, '2024-04-01', '2024-04-05', 500.00),
(5, 2, '2024-04-10', '2024-04-15', 800.00),
(6, 2, '2024-04-20', '2024-04-25', 400.00),

(1, 3, '2024-05-01', '2024-05-07', 300.00),
(2, 3, '2024-05-10', '2024-05-15', 280.00),
(3, 3, '2024-05-20', '2024-05-25', 450.00),
(4, 3, '2024-06-01', '2024-06-05', 500.00),

(1, 4, '2024-06-10', '2024-06-15', 300.00),
(2, 4, '2024-06-20', '2024-06-25', 280.00),
(3, 4, '2024-07-01', '2024-07-07', 450.00),
(4, 4, '2024-07-10', '2024-07-15', 500.00),

(1, 5, '2024-07-20', '2024-07-25', 300.00),
(2, 5, '2024-08-01', '2024-08-07', 280.00),
(3, 5, '2024-08-10', '2024-08-15', 450.00),
(4, 5, '2024-08-20', '2024-08-25', 500.00),

(5, 3, '2024-09-01', '2024-09-07', 800.00),
(6, 3, '2024-09-10', '2024-09-15', 400.00),
(7, 3, '2024-09-20', '2024-09-25', 420.00),
(8, 3, '2024-10-01', '2024-10-05', 550.00),

(2, 4, '2024-03-18', '2024-02-05', 650.00),
(3, 4, '2024-01-15', '2024-08-15', 300.00);

SELECT costumers.costumer_name, SUM(rentals.rental_value) FROM costumers 
INNER JOIN rentals ON costumers.id_costumer = rentals.id_costumer
GROUP BY costumers.costumer_name;

SELECT cars.id_car, cars.car_brand, cars.car_model, COUNT(*) FROM cars
INNER JOIN rentals ON cars.id_car = rentals.id_car
GROUP BY cars.car_model, cars.id_car;
