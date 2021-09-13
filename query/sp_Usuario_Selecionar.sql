use master;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  sp_Usuario_Selecionar
	@idUsuario int,
	@nome varchar(50),
	@username varchar(20)
AS
BEGIN
	IF(@idUsuario IS NOT NULL)
	BEGIN
		SELECT		Usuario.*
		FROM		Usuario(NOLOCK)
		WHERE		Usuario.idUsuario		= @idUsuario
	END
	ELSE
	IF(@nome IS NOT NULL)
	BEGIN
		SELECT		Usuario.*
		FROM		Usuario(NOLOCK)
		WHERE		Usuario.nome			LIKE @nome
	END
	ELSE
	IF(@username IS NOT NULL)
	BEGIN
		SELECT		Usuario.*
		FROM		Usuario(NOLOCK)
		WHERE		Usuario.username		LIKE @username
	END
	ELSE
	BEGIN
		SELECT		Usuario.*
		FROM		Usuario(NOLOCK)
	END
END
GO
