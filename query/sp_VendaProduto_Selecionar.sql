USE master
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE sp_VendaProduto_Selecionar
	@idVenda	INT, 
	@idProduto	INT
AS
BEGIN
	IF(@idVenda IS NOT NULL)
	BEGIN
		SELECT		Venda.idVenda, Produto.idProduto, Produto.nomeProduto, Produto.valorProduto
		FROM		Venda(NOLOCK), Produto(NOLOCK)
		WHERE		Venda.idVenda		= @idVenda
	END
	ELSE IF(@idProduto IS NOT NULL)
	BEGIN
		SELECT		Venda.idVenda, Produto.idProduto, Produto.nomeProduto, Produto.valorProduto
		FROM		Venda(NOLOCK), Produto(NOLOCK)
		WHERE		Produto.idProduto		= @idProduto
	END
	ELSE
	BEGIN
		SELECT		Venda.idVenda, Produto.idProduto, Produto.nomeProduto, Produto.valorProduto
		FROM		Venda(NOLOCK), Produto(NOLOCK)
	END
END
GO
