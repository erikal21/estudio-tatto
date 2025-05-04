
Tabela de usuario
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(15),
    endereco TEXT,
    tipo_usuario ENUM('admin', 'tatuador', 'usuario') NOT NULL
);

adicionando a tabela usuario o usuario admin para testes

INSERT INTO usuario (nome, email, senha, telefone, endereco, tipo_usuario)
VALUES
('Admin', 'admin@admin', '123', '11111111111', 'Rua Admin, 1', 'admin'),
('Carlos Tattoo', 'carlos@tattoo.com', '111', '11977777777', 'Av. Artística, 789', 'tatuador'),
('João Silva', 'joao@usuario.com', '222', '11966666666', 'Rua Usuário, 321', 'usuario');


