CREATE TABLE IF NOT EXISTS users (
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(45) NOT NULL,
    password VARCHAR(24) NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ads (
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INTEGER UNSIGNED NOT NULL,
    title VARCHAR(50),
    description VARCHAR(255),
    p_date date NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS categories (
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR (20),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ad_category (
    ad_id INTEGER UNSIGNED NOT NULL,
    category_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- ============= POPULATING TABLES



INSERT INTO categories (category)
VALUES
('antiques'),
('appliances'),
('arts+crafts'),
('atv/utv/sno'),
('auto parts'),
('aviation'),
('baby+kid'),
('barter'),
('beauty+hlth'),
('bike parts'),
('bikes'),
('boat parts'),
('boats'),
('books'),
('business'),
('cars+trucks'),
('cds/dvd/vhs'),
('cell phones'),
('clothes+acc'),
('collectibles'),
('computer parts'),
('computers'),
('electronics'),
('farm+garden'),
('free'),
('furniture'),
('garage sale'),
('general'),
('heavy equip'),
('household'),
('jewelry'),
('materials'),
('motorcycle parts'),
('motorcycles'),
('music instr'),
('photo+video'),
('rvs+camp'),
('sporting'),
('tickets'),
('tools'),
('toys+games'),
('trailers'),
('video gaming'),
('wanted'),
('wheels+tires');

insert into users (email, password, first_name, last_name) values
('tj@gmail.com', 'codeup', 'TJ', 'English'),
('graham@yahoo.com', 'codeup', 'Graham', 'Davis'),
('mykel@aol.com', 'codeup', 'Mykel', 'Kovar'),
('testuser@gmail.com', 'codeup', 'Test', 'User');

INSERT INTO ads(user_id, title, description, p_date)
VALUES
  (1, 'Post Title Test1', 'Post Description 1', '2018-08-11'),
  (2, 'Post Title Test2', 'Post Description 2', '2018-08-10'),
  (3, 'Post Title Test3', 'Post Description 3', '2018-08-09'),
  (3, 'Post Title Test4', 'Post Description 4', '2018-08-10'),
  (1, 'Post Title Test5', 'Post Description 5', '2018-08-11');

INSERT INTO ad_category(ad_id, category_id) values
(6,5),
(6,7),
(7,2),
(8,9),
(9,2),
(9,3);


-- ============= 'SELECT' QUERIES

select * from users;
select * from ads;
select * from categories;

-- For a given ad, what is the email address of the user that created it?
SELECT a.title as Ad, u.email as 'Posted By'
FROM ads as a
JOIN users as u
  on u.id = a.user_id
order by a.p_date;

-- For a given ad, what category, or categories, does it belong to?
select a.title as Ad, c.category as Category
from ads as a
join ad_category as ac
  on ac.ad_id = a.id
join categories as c
  on c.id = ac.category_id;

-- For a given category, show all the ads that are in that category.
select c.category as Category, a.title as Ad
from ads as a
right join ad_category as ac
  on ac.ad_id = a.id
right join categories as c
  on c.id = ac.category_id;

-- For a given user, show all the ads they have posted.
select concat(u.first_name, ' ', u.last_name) as Name, u.email as Email, a.title as Ad
from users as u
join ads as a
  on a.user_id = u.id
order by Name;

CREATE TABLE movies (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    time_in_minutes INT NOT NULL,
    description TEXT NOT NULL
);