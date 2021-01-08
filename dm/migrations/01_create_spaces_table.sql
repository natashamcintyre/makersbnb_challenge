CREATE TABLE spaces(
id SERIAL PRIMARY KEY,
name VARCHAR(40) NOT NULL,
owner_id INT,
FOREIGN KEY(owner_id)
REFERENCES owners(id)
);
