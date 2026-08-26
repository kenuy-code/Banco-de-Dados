-- Active: 1787269576728@@127.0.0.1@5432@bd_aula@public
DROP TABLE aluno;
DROP TABLE curso;

CREATE TABLE curso(
    id_curso INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE aluno(
    id_aluno INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    id_curso INTEGER NOT NULL REFERENCES curso(id_curso)
);

SELECT * FROM curso;

SELECT * FROM aluno;

INSERT INTO curso (nome) VALUES
('Sistemas de Informacao'),
('Administracao'),
('Direito'),
('Ciencia da Computacao');

INSERT INTO aluno (nome, id_curso) VALUES
('Ana Beatriz Souza', 1),
('Carlos Henrique Lima', 1),
('Daniela Martins', 2),
('Luiz Eduardo', 3),
('Maria Eduarda Amaral', 4);

SELECT
    id_aluno AS id,
    nome AS alunos,
    id_curso
FROM
    aluno a
ORDER BY
    nome ASC; //ASC E DESC

SELECT
    id_curso AS id,
    nome AS cursos
FROM 
    curso
ORDER BY    
    nome ASC;

SELECT
    nome,
    id_curso
FROM
    aluno
WHERE
    id_curso = 4;

SELECT
    c.nome AS curso,
    c.id_curso
FROM
    curso c
WHERE
    c.nome = 'Sistemas de Informacao';
--=Alunos e os cursos
SELECT
    a.nome AS alunos,
    c.nome AS cursos
FROM
    aluno a
    JOIN
        curso c
    ON
        c.id_curso = a.id_curso;
ORDER BY
    c.nome; -- ORDERNA POR CURSO


--QUANTIDADE DE ALUNOS POR CURSO
SELECT
    c.nome AS cursos,
    COUNT (a.id_curso) AS qtd_alunos
FROM
    curso c
    JOIN    
        aluno a
    ON
        a.id_curso = c.id_curso
GROUP BY
    c.nome
ORDER BY
    c.nome DESC;
