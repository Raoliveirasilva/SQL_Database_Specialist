CREATE TABLE [Ordem_Serviço] (
	id_ordem integer NOT NULL,
	Nome_Cliente varchar(45) NOT NULL,
	Nome_Mecanico varchar(45) NOT NULL,
	Numero_Ordem_Servico integer NOT NULL,
	Tipo_Servico integer NOT NULL,
	Valor_Servico integer NOT NULL,
	Status_Servico varchar(15) NOT NULL,
	Data_Entrega integer NOT NULL,
  CONSTRAINT [PK_ORDEM_SERVIÇO] PRIMARY KEY CLUSTERED
  (
  [id_ordem] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Equipe_Mecanicos] (
	id_mecanico integer NOT NULL,
	Nome varchar(45) NOT NULL,
	Numero_Identificacao integer NOT NULL,
	Valor_mao_de_Obra integer NOT NULL,
	Especificação varchar(30) NOT NULL,
  CONSTRAINT [PK_EQUIPE_MECANICOS] PRIMARY KEY CLUSTERED
  (
  [id_mecanico] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Cliente] (
	id_cliente integer NOT NULL,
	Nome varchar(45) NOT NULL,
	CPF integer NOT NULL,
	Endereco varchar(50) NOT NULL,
	Descricao_Problema_Veiculo varchar(100) NOT NULL,
  CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED
  (
  [id_cliente] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Valor_Serviço] (
	id_valor integer NOT NULL,
	Manutencao integer NOT NULL,
	Revisao integer NOT NULL,
	Troca_Oleo integer NOT NULL,
	Injecao integer NOT NULL,
	Eletrica integer NOT NULL,
	Mao_de_Obra integer NOT NULL,
  CONSTRAINT [PK_VALOR_SERVIÇO] PRIMARY KEY CLUSTERED
  (
  [id_valor] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Ordem_Serviço] WITH CHECK ADD CONSTRAINT [Ordem_Serviço_fk0] FOREIGN KEY ([Nome_Cliente]) REFERENCES [Cliente]([id_cliente])
ON UPDATE CASCADE
GO
ALTER TABLE [Ordem_Serviço] CHECK CONSTRAINT [Ordem_Serviço_fk0]
GO
ALTER TABLE [Ordem_Serviço] WITH CHECK ADD CONSTRAINT [Ordem_Serviço_fk1] FOREIGN KEY ([Nome_Mecanico]) REFERENCES [Equipe_Mecanicos]([id_mecanico])
ON UPDATE CASCADE
GO
ALTER TABLE [Ordem_Serviço] CHECK CONSTRAINT [Ordem_Serviço_fk1]
GO

ALTER TABLE [Equipe_Mecanicos] WITH CHECK ADD CONSTRAINT [Equipe_Mecanicos_fk0] FOREIGN KEY ([Nome]) REFERENCES [Valor_Serviço]([id_valor])
ON UPDATE CASCADE
GO
ALTER TABLE [Equipe_Mecanicos] CHECK CONSTRAINT [Equipe_Mecanicos_fk0]
GO

ALTER TABLE [Cliente] WITH CHECK ADD CONSTRAINT [Cliente_fk0] FOREIGN KEY ([Descricao_Problema_Veiculo]) REFERENCES [Valor_Serviço]([id_valor])
ON UPDATE CASCADE
GO
ALTER TABLE [Cliente] CHECK CONSTRAINT [Cliente_fk0]
GO


