BEGIN TRANSACTION;

-- TABELA CLIENTE
Create table cliente(
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT(15)
);

-- TABELA PET
Create table Pet(
    id_pet INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT (30),
    especie TEXT(30),
    idade INTEGER,
    id_cliente INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- TABELA VETERIANRIO
Create table veterinario(
    id_veterinario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT (100) NOT NULL,
    crmv TEXT(20) NOT NULL
);

-- TABELA CONSULTA
Create table consulta(
    id_consulta INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT NOT NULL,
    especie TEXT (30),
    idade TEXT,
    tipo_servico TEXT(100),
    id_pet INTEGER,
    id_veterinario INTEGER,
    FOREIGN KEY (id_pet) REFERENCES Pet(id_pet),
    FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario)
);

-- TABELA MEDICAMENTO
Create table medicamento(
    id_medicamento INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    quantidade INTEGER,
    validade_medicamento TEXT,
    tipo_servico TEXT(100),
    id_consulta INTEGER,
    data TEXT,
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);

-- TABELA MEDICAMENTO APLICADO
Create table medicamento_aplicado(
    id_consulta INTEGER,
    id_medicamento INTEGER,
    dose_aplicada TEXT,
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),
    FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento)
);

-- Inserts
INSERT INTO cliente (nome, telefone)
VALUES
('HANNAH WYLKEMBERG','1199999-999'),
('WALLACY WYLDEMBERG','1119999-456'),
('MARIA DO CARMO','1199999-453');

INSERT INTO Pet(nome,especie, idade, id_cliente)
VALUES
('SNOW','CACHORRO',5,1),
('BARTOBY','GATO',3,2),
('NEMO','PEIXE',2,3);

INSERT INTO veterinario(nome, crmv)
VALUES
('DRA.MARISA TESTE ','SP12345'),
('DRA.WADSSA WACEMBERG ','SP8954'),
('DRA.MARISA TESTE ','SP12345'),
('DR.JOAO TESTE ','SP9876');

INSERT INTO consulta(data, tipo_servico, id_pet, id_veterinario)
VALUES
('2025-05-10','VACINA',1, 1),
('2025-07-10','VERMIFUNGO',2, 2),
('2025-05-10','CIRUGIA',3, 3);

INSERT INTO medicamento(nome, quantidade, validade_medicamento, tipo_servico, data, id_consulta)
VALUES
('RAIVA', 1,'2030-11-03','VACINA', '2025-05-10',1),
('VERMIT' , 2,'2030-05-30','VERMIFUNGO','2025-07-10', 2),
('CIRUGIA', 1,'2030-04-20','CIRUGIA', '2025-05-10',3);

INSERT INTO medicamento_aplicado(id_consulta, id_medicamento, dose_aplicada)
VALUES
(1,1, 'DOSE UNICA'),
(1,2, 'APLICAR 2 GOTAS NA PELO'),
(3, 2,'1 COMPRIMIDO POR DIA');
