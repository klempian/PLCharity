# SET ROLES AND FIRST ADMIN USER #

INSERT INTO role (name) VALUES ('ROLE_ADMIN'), ('ROLE_USER');
INSERT INTO user (enabled, first_name, last_name, password, username) VALUES (1, 'admnin', 'admin', '$2a$10$wGyxChdSLy9LPrwk3/c2B.qDm1EGTNRSG2u5Nyg/dgrZKcDrov89e', 'admin@admin.com');
INSERT INTO user_role (user_id, role_id) VALUES (1,1);

# SAMPLE DATA FOR DEMO PURPOSES
INSERT INTO user (enabled, first_name, last_name, password, username) VALUES (1, 'Jan', 'Kowalski', '$2a$10$xA2t4CyYBtbN/mkdzf3eKOF6MgSY/QCOhrY3fjIo9x4QqP4jSFUO6', 'user@user.com');
INSERT INTO user_role (user_id, role_id) VALUES (2,2);

INSERT INTO institutions (name, description) VALUES ('Fundacja "Dbam o Zdrowie"', 'Cel i misja: Pomoc dzieciom z ubogich rodzin.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "A kogo"', 'Cel i misja: Pomoc wybudzaniu dzieci ze śpiączki.');
INSERT INTO institutions (name, description) VALUES ('Fundacja “Dla dzieci"', 'Cel i misja: Pomoc osobom znajdującym się w trudnej sytuacji życiowej.');
INSERT INTO institutions (name, description) VALUES ('Fundacja “Bez domu”', 'Cel i misja: Pomoc dla osób nie posiadających miejsca zamieszkania.');

INSERT INTO categories (name) VALUES ('ubrania, które nadają się do ponownego użycia'), ('ubrania, do wyrzucenia'), ('zabawki'), ('książki'), ('inne');