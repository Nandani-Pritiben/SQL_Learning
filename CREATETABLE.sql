CREATE TABLE persons (
id INT NOT NULL,
person_names VARCHAR(50) NOT NULL,
birth_date VARCHAR(50),
phone VARCHAR(15) NOT NULL,
CONSTRAINT pK_persons PRIMARY KEY (id)
)