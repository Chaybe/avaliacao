USE [master]
GO
/****** Object:  StoredProcedure [dbo].[sp_VendaParcela_Selecionar]    Script Date: 11/09/2021 12:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_VendaParcela_Selecionar]
	@idVenda int
AS
BEGIN
	IF(@idVenda IS NOT NULL)
	BEGIN
		SELECT		VendaParcela.*
		FROM		VendaParcela(NOLOCK)
		WHERE		VendaParcela.idVenda		= @idVenda
	END
END
