CREATE TABLE Xodimlar (
                          id INTEGER PRIMARY KEY AUTO_INCREMENT,
                          ism VARCHAR(50) NOT NULL,
                          familiya VARCHAR(50) NOT NULL,
                          yoshi INTEGER NOT NULL
);
INSERT INTO Xodimlar (ism, familiya, yoshi) VALUES
                                                ('Ali', 'Valiyev', 30),
                                                ('Sara', 'Toshbekova', 25),
                                                ('Diyor', 'Xolov', 28),
                                                ('Lola', 'Salimova', 35),
                                                ('Rustam', 'Rahimov', 40);

ALTER TABLE Xodimlar
    ADD COLUMN telefon VARCHAR(15);

CREATE TABLE Bolimlar (
                          id INTEGER PRIMARY KEY AUTO_INCREMENT,
                          nomi VARCHAR(100) NOT NULL
);

ALTER TABLE Xodimlar
    ADD COLUMN bolim_id INTEGER,
    ADD FOREIGN KEY (bolim_id) REFERENCES Bolimlar(id);

INSERT INTO Bolimlar (nomi) VALUES
                                ('Moliyaviy bolim'),
                                ('Marketing bolimi'),
                                ('IT bolimi');

INSERT INTO Xodimlar (ism, familiya, yoshi, telefon, bolim_id) VALUES
                                                                   ('Ali', 'Valiyev', 30, '998901234567', 1),
                                                                   ('Sara', 'Toshbekova', 25, '998901234568', 2),
                                                                   ('Diyor', 'Xolov', 28, '998901234569', 3);

SELECT ism, familiya, yoshi FROM Xodimlar;

CREATE TABLE Loyihalar (
                           id INTEGER PRIMARY KEY AUTO_INCREMENT,
                           nomi VARCHAR(100) NOT NULL,
                           boshlanish_sana DATE NOT NULL,
                           tugash_sana DATE NOT NULL
);

ALTER TABLE Xodimlar
    ADD COLUMN loyiha_id INTEGER,
    ADD FOREIGN KEY (loyiha_id) REFERENCES Loyihalar(id);

INSERT INTO Loyihalar (nomi, boshlanish_sana, tugash_sana) VALUES
                                                               ('Loyiha A', '2024-01-01', '2024-06-01'),
                                                               ('Loyiha B', '2024-02-15', '2024-07-15'),
                                                               ('Loyiha C', '2024-03-10', '2024-08-10');

INSERT INTO Xodimlar (ism, familiya, yoshi, telefon, bolim_id, loyiha_id) VALUES
                                                                              ('Ali', 'Valiyev', 30, '998901234567', 1, 1),
                                                                              ('Sara', 'Toshbekova', 25, '998901234568', 2, 2),
                                                                              ('Diyor', 'Xolov', 28, '998901234569', 3, 3);

SELECT
    X.ism,
    X.familiya,
    L.nomi AS loyiha_nomi
FROM
    Xodimlar X,
    Loyihalar L
WHERE
    X.loyiha_id = L.id;

SELECT ism, familiya, telefon
FROM Xodimlar
WHERE telefon IS NOT NULL;

SELECT X.ism, X.familiya, X.yoshi
FROM Xodimlar X
         JOIN Bolimlar B ON X.bolim_id = B.id
WHERE B.nomi = 'Marketing';

SELECT X.ism, X.familiya, L.nomi AS loyiha_nomi
FROM Xodimlar X
         JOIN Loyihalar L ON X.loyiha_id = L.id
WHERE L.tugash_sana < DATE('now');

SELECT X.ism, X.familiya, X.yoshi, L.nomi AS loyiha_nomi
FROM Xodimlar X
         JOIN Loyihalar L ON X.loyiha_id = L.id
WHERE L.boshlanish_sana > DATE('now');

SELECT ism, familiya, yoshi, bolim_id
FROM Xodimlar
WHERE yoshi > 30;
