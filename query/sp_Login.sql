USE [master]
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 10/09/2021 13:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[sp_Login]
	@username varchar(20),
	@senha varchar(20)
AS
BEGIN
	SELECT	idUsuario, nome, username, ativo
	FROM	Usuario(NOLOCK)
	WHERE	Usuario.username		LIKE	@username
	AND		Usuario.senha			LIKE	@senha 
END
