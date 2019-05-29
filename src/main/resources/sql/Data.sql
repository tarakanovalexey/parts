USE test;

DROP TABLE IF EXISTS part;
CREATE TABLE part(
                     id INT(11) NOT NULL AUTO_INCREMENT,
                     part_name VARCHAR(255) NOT NULL,
                     quantity INT(11) NOT NULL,
                     is_required bit NOT NULL,
                     PRIMARY KEY (id)
);

INSERT INTO part(part_name, quantity, is_required) VALUES ('CPU', 5, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('HDD', 10, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('SSD', 7, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('monitor', 5, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('keyboard', 20, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('mouse', 24, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('mousepad', 19, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('GPU', 9, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('CPUcooler', 33, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('backlights', 20, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('computercase', 20, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('RAM', 22, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('nvmeSSD', 1, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('m2SSD', 2, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('casecooler', 17, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('powersupply', 13, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('printer', 20, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('scanner', 20, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('webcam', 20, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('antiviruslicense', 20, false);
INSERT INTO part(part_name, quantity, is_required) VALUES ('OSlicense', 20, true);
INSERT INTO part(part_name, quantity, is_required) VALUES ('CDrom', 5, false);