create table Usuario (
	 idUsuario int identity primary key,
	 nome varchar(50),
	 username varchar(20) not null, 
	 senha varchar(20) not null,
	 ativo bit,
);

create table Cliente (
	idCliente int identity primary key,
	nomeCliente varchar(50),
	dataNascimento datetime,
	telefoneCelular varchar(14),
	email varchar(50),
	nomeLogradouro varchar(30),
	numeroEndereco varchar(40),
	nomeComplemento varchar(40),
	nomeBairro varchar(20),
	nomeLocalidade varchar(30),
	nomeUF varchar(2),
	numeroCep varchar(25),
	numeroCPFCNPJ varchar(20)
);

create table Produto (
	idProduto int identity primary key,
	nomeProduto varchar(40),
	valorProduto money
);

create table Venda (
	idVenda int identity primary key,
	numeroQuantidade int,
	valorDesconto money,

	idUsuario int,
	idCliente int,
	--idProduto int,
	FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario)
	,FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
	--,FOREIGN KEY(idProduto) REFERENCES Produto(idProduto)
);

create table VendaParcela (
	numeroParcela int,
	dataVencimento datetime,
	valorParcela money,
	valorDesconto money,
	dataPagamento datetime,
	valorPagamento money,

	idVenda int,
	FOREIGN KEY(idVenda) REFERENCES Venda(idVenda)
);

create table VendaProduto (
	idVenda int,
	idProduto int
)

INSERT INTO Usuario (nome, username, senha, ativo) VALUES ('CHAYBE LUCAS', 'CHAYBE', '123', 1)

--SELECT * FROM Usuario


/*
drop table VendaParcela
drop table Venda
drop table Produto
drop table Cliente
drop table Usuario 
*/