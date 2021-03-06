USE [master]
GO
/****** Object:  StoredProcedure [dbo].[sp_Venda_Selecionar]    Script Date: 10/09/2021 18:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_Venda_Selecionar]
	@idVenda int,
	@username varchar(20),
	@nomeCliente varchar(50),
	@nomeProduto varchar(40)
AS
BEGIN
	IF(@idVenda IS NOT NULL)
	BEGIN
		SELECT		Venda.*, Cliente.nomeCliente, Produto.nomeProduto, Usuario.username
		FROM		Venda(NOLOCK), Cliente(NOLOCK), Produto(NOLOCK), Usuario(NOLOCK)
		WHERE		Venda.idVenda		= @idVenda
		ORDER BY	Cliente.nomeCliente
	END
	ELSE
	IF(@username IS NOT NULL)
	BEGIN
		SELECT		Venda.*, Cliente.nomeCliente, Produto.nomeProduto, Usuario.username
		FROM		Venda(NOLOCK), Cliente(NOLOCK), Produto(NOLOCK), Usuario(NOLOCK)
		WHERE		Usuario.username		LIKE '%'+@username+'%'
		ORDER BY	Usuario.username
	END
	ELSE
	IF(@nomeCliente IS NOT NULL)
	BEGIN
		SELECT		Venda.*, Cliente.nomeCliente, Produto.nomeProduto, Usuario.username
		FROM		Venda(NOLOCK), Cliente(NOLOCK), Produto(NOLOCK), Usuario(NOLOCK)
		WHERE		Cliente.nomeCliente		LIKE '%'+@nomeCliente+'%'
		ORDER BY	Cliente.nomeCliente
	END
	ELSE
	IF(@nomeProduto IS NOT NULL)
	BEGIN
		SELECT		Venda.*, Cliente.nomeCliente, Produto.nomeProduto, Usuario.username
		FROM		Venda(NOLOCK), Cliente(NOLOCK), Produto(NOLOCK), Usuario(NOLOCK)
		WHERE		Produto.nomeProduto		LIKE '%'+@nomeProduto+'%'
		ORDER BY	Produto.nomeProduto
	END
	ELSE
	BEGIN
		SELECT		Venda.*, Cliente.nomeCliente, Produto.nomeProduto, Usuario.username
		FROM		Venda(NOLOCK), Cliente(NOLOCK), Produto(NOLOCK), Usuario(NOLOCK)
		ORDER BY	Cliente.nomeCliente
	END
END
