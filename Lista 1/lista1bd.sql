-- Q1.)--------------------------------
CREATE TABLE Curso(
	id SERIAL PRIMARY KEY,
	codigo INT NOT NULL,
	nome TEXT NOT NULL,
	instituicao TEXT NOT NULL,
	duracao INT DEFAULT 0 --(Em anos)
);

-- Q2.)--------------------------------------------------------------------------------------
INSERT INTO Curso(codigo, nome, instituicao, duracao) VALUES (1, 'TADS', 'UFRN', 3);
INSERT INTO Curso(codigo, nome, instituicao, duracao) VALUES (2, 'Direito', 'UFRN', 4);
INSERT INTO Curso(codigo, nome, instituicao, duracao) VALUES (3, 'Direito', 'UNINASSAU', 4);
INSERT INTO Curso(codigo, nome, instituicao, duracao) VALUES (4, 'Agronomia', 'UFRJ', 3);
INSERT INTO Curso(codigo, nome, instituicao) VALUES (5, 'Matemática', 'UNP');


-- Q3.)-----------------------
CREATE TABLE Aluno(
	id SERIAL PRIMARY KEY,
	nome TEXT,
	sobrenome TEXT,
	data_de_nascimento DATE,
	endereco TEXT
);


-- Q4.)---------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Aluno(nome, sobrenome, data_de_nascimento, endereco) VALUES ('André Lucas', 'Maia Germano', '2005-08-08', 'Alameda dos codigos, 0101');
INSERT INTO Aluno(nome, sobrenome, data_de_nascimento, endereco) VALUES ('Sara', 'Maia Germano', '2003-02-24', 'Rua setesetesete, 183');
INSERT INTO Aluno(nome, sobrenome, data_de_nascimento) VALUES ('Pedro', 'Alexandre', '2004-05-14');
INSERT INTO Aluno(nome, sobrenome, endereco) VALUES ('Paolla', 'Bezerra', 'Nova Parnamirim');
INSERT INTO Aluno(sobrenome, data_de_nascimento, endereco) VALUES ('Pereira', '1990-07-01', 'Rua de São Nunca');


-- Q5.)------------------------------------------
ALTER TABLE Aluno 
ADD id_curso INT, 
ADD FOREIGN KEY (id_curso) REFERENCES Curso(id);


-- Q6.)--------------------------------------------------------------------------------------------------
INSERT INTO Aluno(nome, sobrenome, id_curso) VALUES ('Vitinho', 'best-man', 1);
INSERT INTO Aluno(nome, sobrenome, id_curso) VALUES ('João', 'Vitor', 1);
INSERT INTO Aluno(nome, sobrenome, endereco, id_curso) VALUES ('Paulo', 'Abrantes','Bom Sucesso' , 4);
INSERT INTO Aluno(nome, endereco, id_curso) VALUES ('Gilneide', 'Pajuçara', 1);
INSERT INTO Aluno(nome, id_curso) VALUES ('Sara', 3);


-- Q7.)------
SELECT nome
FROM Curso


-- Q8.)----------------
SELECT DISTINCT nome
FROM Curso


-- Q9.)--------------
SELECT *
FROM Curso
WHERE (duracao*2)>6


-- Q10.)----------------
SELECT nome, sobrenome
FROM Aluno


-- Q11.)----------------------------------
SELECT a.nome, sobrenome
FROM Aluno a, Curso c
WHERE a.id_curso=c.id AND c.nome='Direito'


-- EXTRA)---------------------------------
UPDATE Aluno SET id_curso=1 WHERE id=1


-- Q12------------------------------------
SELECT a.nome, sobrenome
FROM Aluno a, Curso c
WHERE a.id_curso=c.id AND c.nome='TADS'