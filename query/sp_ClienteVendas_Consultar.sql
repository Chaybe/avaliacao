USE [master]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_ClienteVendas_Consultar]
	@idCliente int,
	@nomeCliente varchar(50)
AS
BEGIN
	IF(@idCliente IS NOT NULL)
	BEGIN
		SELECT		Cliente.nomeCliente, Produto.nomeProduto, Produto.valorProduto
		FROM		Cliente(NOLOCK), Venda(NOLOCK), VendaProduto(NOLOCK), Produto(NOLOCK)
		WHERE		Cliente.idCliente			= @idCliente
		AND			Cliente.idCliente			= Venda.idCliente
		AND			Venda.idVenda				= VendaProduto.idVenda
		AND			VendaProduto.idProduto		= Produto.idProduto
	END
	ELSE IF(@nomeCliente IS NOT NULL)
	BEGIN
		SELECT		Cliente.nomeCliente, Produto.nomeProduto, Produto.valorProduto
		FROM		Cliente(NOLOCK), Venda(NOLOCK), VendaProduto(NOLOCK), Produto(NOLOCK)
		WHERE		Cliente.nomeCliente			LIKE '%' + @nomeCliente + '%'
		AND			Cliente.idCliente			= Venda.idCliente
		AND			Venda.idVenda				= VendaProduto.idVenda
		AND			VendaProduto.idProduto		= Produto.idProduto
	END
	ELSE
	BEGIN
		SELECT		Cliente.nomeCliente, Produto.nomeProduto, Produto.valorProduto
		FROM		Cliente(NOLOCK), Venda(NOLOCK), VendaProduto(NOLOCK), Produto(NOLOCK)
		WHERE		Cliente.idCliente			= Venda.idCliente
		AND			Venda.idVenda				= VendaProduto.idVenda
		AND			VendaProduto.idProduto		= Produto.idProduto
	END
END
