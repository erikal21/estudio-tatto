
Tabela de usuario

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(15),
    endereco TEXT,
    imagemPerfil VARCHAR(255),
    tipo_usuario ENUM('admin', 'tatuador', 'usuario') NOT NULL
);

adicionando a tabela usuario o usuario admin para testes

INSERT INTO usuario (nome, email, senha, telefone, endereco, tipo_usuario)
VALUES
('Admin', 'admin@admin', '123', '11111111111', 'Rua Admin, 1', 'admin'),
('Carlos Tattoo', 'carlos@tattoo.com', '111', '11977777777', 'Av. Artística, 789', 'tatuador'),
('João Silva', 'joao@usuario.com', '222', '11966666666', 'Rua Usuário, 321', 'usuario');

CREATE TABLE perfil_tatuador (
    id_usuario INT PRIMARY KEY,
    texto_perfil TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);


CREATE TABLE estilo_arte (
    id_estilo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE usuario_estilo (
    id_usuario INT,
    id_estilo INT,
    PRIMARY KEY (id_usuario, id_estilo),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_estilo) REFERENCES estilo_arte(id_estilo) ON DELETE CASCADE
);

INSERT INTO estilo_arte (nome) VALUES
('Blackwork'),
('Oldschool'),
('Tribal'),
('Watercolor'),
('NewSchool'),
('Realismo');


INSERT INTO perfil_tatuador (id_usuario, texto_perfil) VALUES
(2, 'Tatuagens modernas com estilo próprio.'),
(4, 'Apaixonada por traços finos e arte tradicional.'),
(5, 'Especialista em realismo e sombreamento.'),
(6, 'Aquarelas e cores vibrantes são minha paixão.');

-- Carlos Tattoo (id_usuario = 2): Tribal e Blackwork
INSERT INTO usuario_estilo (id_usuario, id_estilo) VALUES
(2, 1),
(2, 3);

-- Ana Costa (id_usuario = 4): Blackwork e Oldschool
INSERT INTO usuario_estilo (id_usuario, id_estilo) VALUES
(4, 1),
(4, 2);

-- Bruno Silva (id_usuario = 5): Realismo e Tribal
INSERT INTO usuario_estilo (id_usuario, id_estilo) VALUES
(5, 6),
(5, 3);

-- Clara Souza (id_usuario = 6): Watercolor e NewSchool
INSERT INTO usuario_estilo (id_usuario, id_estilo) VALUES
(6, 4),
(6, 5);

CREATE TABLE portfolio_imagem (
    id_imagem INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    caminho_imagem VARCHAR(255) NOT NULL,
    legenda TEXT,
    data_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);
