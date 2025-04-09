-- BANCO DE DADOS: FUNCIONÁRIOS E PROJETOS
-- ======================================================

-- Ativa a verificação de chave estrangeira (para SQLite)
PRAGMA foreign_keys = ON;

-- =====================================
-- 1) Criação da tabela de funcionários
-- =====================================
CREATE TABLE IF NOT EXISTS funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    departamento VARCHAR(100),
    salario FLOAT
);

-- =====================================
-- Inserção de registros na tabela funcionarios
-- =====================================
INSERT INTO funcionarios (id, nome, departamento, salario)
VALUES   
    (1, 'Heitor Vieira', 'Financeiro', 4959.22),
    (2, 'Daniel Campos', 'Vendas', 3884.44),
    (3, 'Luiza Dias', 'TI', 8205.78),
    (4, 'Davi Lucas Moraes', 'Financeiro', 8437.02),
    (5, 'Pietro Cavalcanti', 'TI', 4946.88),
    (6, 'Evelyn da Mata', 'Vendas', 5278.88),
    (7, 'Isabella Rocha', 'Marketing', 4006.03),
    (8, 'Sra. Manuela Azevedo', 'Vendas', 6101.88),
    (9, 'Brenda Cardoso', 'TI', 8853.34),
    (10,'Danilo Souza', 'TI', 8242.14);

-- =====================================
-- 2) Seleciona todos os registros da tabela
-- =====================================
SELECT * FROM funcionarios;

-- =====================================
-- 3) Seleciona nomes dos funcionários do departamento de Vendas
-- =====================================
SELECT nome, departamento
FROM funcionarios
WHERE departamento = 'Vendas'
ORDER BY nome ASC;

-- =====================================
-- 4) Seleciona funcionários com salário > 5000
-- =====================================
SELECT * FROM funcionarios
WHERE salario > 5000
ORDER BY salario DESC;

-- =====================================
-- 5) Seleciona departamentos distintos
-- =====================================
SELECT DISTINCT departamento
FROM funcionarios
ORDER BY departamento ASC;

-- =====================================
-- 6) Atualiza salário dos funcionários do departamento de TI para 7500
-- =====================================
UPDATE funcionarios
SET salario = 7500
WHERE departamento = 'TI';

-- Verifica os salários atualizados
SELECT departamento, salario
FROM funcionarios
WHERE departamento = 'TI';

-- =====================================
-- 7) Deleta funcionários com salário < 4000
-- =====================================
DELETE FROM funcionarios
WHERE salario < 4000;

-- Verifica os salários restantes
SELECT salario
FROM funcionarios;

-- =====================================
-- 8) Funcionários do departamento de Vendas com salário >= 6000
-- =====================================
SELECT nome, salario
FROM funcionarios
WHERE departamento = 'Vendas' AND salario >= 6000;

-- =====================================
-- 9) Criação da tabela projetos com FK para funcionarios
-- =====================================
CREATE TABLE IF NOT EXISTS projetos (
    id_projeto INT PRIMARY KEY,
    nome_projeto VARCHAR(100),
    id_gerente INT,
    FOREIGN KEY (id_gerente) REFERENCES funcionarios(id)
);

-- Inserção de projetos
PRAGMA foreign_keys = OFF;
INSERT INTO projetos (id_projeto, nome_projeto, id_gerente)
VALUES
    (1, 'Veritas', 1),
    (2, 'Xique-Xique', 2),
    (3, 'Baby', 3);
PRAGMA foreign_keys = ON;

-- Consulta projetos com gerente ID = 2
SELECT * FROM projetos WHERE id_gerente = 2;

-- =====================================
-- 10) Drop da tabela funcionarios
-- =====================================
PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS funcionarios;
PRAGMA foreign_keys = ON;
