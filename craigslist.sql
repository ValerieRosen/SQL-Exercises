CREATE TABLE Regions (
    id PRIMARY KEY,
    Name TEXT,
);

CREATE TABLE Posts (
    id PRIMARY KEY,
    Title,
    Text,
    Location
    User_id FOREIGN KEY
    Region_id FOREIGN KEY
    Category_id FOREIGN KEY
);

CREATE TABLE Users (
    id PRIMARY KEY,
    Username,
    Encrypted_password
    Preferred_region_id FOREIGN KEY,
);

CREATE TABLE Categories (
    id PRIMARY KEY,
    Name,
);