USE [master]
GO
/****** Object:  StoredProcedure [dbo].[sp_UltimoRegistro_Selecionar]    Script Date: 11/09/2021 12:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_UltimoRegistro_Selecionar]

AS
BEGIN
	SELECT		TOP 1 Venda.idVenda AS idVendaRegistro
	FROM		Venda(NOLOCK) 
	ORDER BY	idVenda DESC

END
