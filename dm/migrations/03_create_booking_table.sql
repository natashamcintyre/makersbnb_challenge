CREATE TABLE bookings(
id SERIAL PRIMARY KEY,
space_id INT NOT NULL,
booked_date date NOT NULL,
CONSTRAINT fk_space
        FOREIGN KEY(space_id) 
        REFERENCES spaces(id)
);