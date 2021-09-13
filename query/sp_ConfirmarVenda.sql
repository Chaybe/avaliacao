USE master
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE sp_ConfirmarVenda
	@numeroQuantidade int, @valorDesconto money, @idUsuario int, @idCliente int, @idProduto int
	--@numeroParcela int, @dataVencimento datetime, @valorParcela money, @dataPagamento datetime, @valorPagamento money

AS
BEGIN
	INSERT INTO Venda(numeroQuantidade, valorDesconto, idUsuario, idCliente, idProduto)
	VALUES(@numeroQuantidade, @valorDesconto, @idUsuario, @idCliente, @idProduto)
END
GO
