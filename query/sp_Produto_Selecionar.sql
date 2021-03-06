USE [master]
GO
/****** Object:  StoredProcedure [dbo].[sp_Produto_Selecionar]    Script Date: 10/09/2021 14:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_Produto_Selecionar]
	@idProduto int,
	@nomeProduto varchar(40)
AS
BEGIN
	IF(@idProduto IS NOT NULL) 
	BEGIN
		SELECT		Produto.*
		FROM		Produto(NOLOCK)
		WHERE		Produto.idProduto		= @idProduto
		ORDER BY	Produto.nomeProduto
	END
	ELSE
	IF(@nomeProduto IS NOT NULL) 
	BEGIN
		SELECT		Produto.*
		FROM		Produto(NOLOCK)
		WHERE		Produto.nomeProduto		LIKE '%' + @nomeProduto + '%'
		ORDER BY	Produto.nomeProduto
	END
	ELSE
	BEGIN
		SELECT		Produto.*
		FROM		Produto(NOLOCK)
		ORDER BY	Produto.nomeProduto
	END
END
