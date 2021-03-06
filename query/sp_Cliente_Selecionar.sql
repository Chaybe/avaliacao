USE [master]
GO
/****** Object:  StoredProcedure [dbo].[sp_Cliente_Selecionar]    Script Date: 10/09/2021 16:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[sp_Cliente_Selecionar]
	@nomeCliente varchar(50)
AS

IF(@nomeCliente IS NOT NULL)
BEGIN
	SELECT	Cliente.*
	FROM	Cliente(NOLOCK)
	WHERE	Cliente.nomeCliente		LIKE '%'+@nomeCliente+'%'
END
ELSE
BEGIN
	SELECT	Cliente.*
	FROM	Cliente(NOLOCK)
END
