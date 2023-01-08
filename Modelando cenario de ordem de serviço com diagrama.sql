CREATE DATABASE Ordem_Servico;

USE Ordem_Servico;

CREATE TABLE Cliente(
idCliente int primary key identity(1,1),
Nome VARCHAR(45) NOT NULL,
Contato VARCHAR(45) NOT NULL
);

CREATE TABLE Pedido(
idPedido int primary key identity(1,1),
idCliente int NOT NULL,
Servico VARCHAR(45) NOT NULL,
Descricao VARCHAR(45) NOT NULL,
Data_Solicitacao DATE NOT NULL,
CONSTRAINT fk_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente),
Liberado TINYINT NOT NULL
);

CREATE TABLE Responsavel(
idResponsavel int primary key identity(1,1),
Nivel_HelpDesck int NOT NULL,
Nome VARCHAR(45) NOT NULL,
Departamento VARCHAR(45) NOT NULL
);

CREATE TABLE Servico_Ordem(
idOrdem int primary key identity(1,1),
idPedido int,
idCliente int,
Status_Servico VARCHAR(45) NOT NULL,
CONSTRAINT fk_pedido FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido),
CONSTRAINT fk_Clientes FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
);

CREATE TABLE Analise_Pedido(
idResponsavel int,
idPedido int,
CONSTRAINT fk_responsavel FOREIGN KEY (idResponsavel) REFERENCES Responsavel (idResponsavel),
CONSTRAINT fk_pedidos FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido)
);

