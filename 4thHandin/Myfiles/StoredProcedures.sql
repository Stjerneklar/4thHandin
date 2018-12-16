USE [MovieDBList]
GO
/****** Object:  StoredProcedure [dbo].[MovieDeleteCommand]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MovieDeleteCommand]
(
	@Original_ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [MovieDBList] WHERE (([ID] = @Original_ID))
GO
/****** Object:  StoredProcedure [dbo].[MovieIdQuery]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MovieIdQuery]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT        ID, Title, Genre, Year, Viewcount, PosterPath
FROM            MovieDBList
WHERE        (ID = @id)
GO
/****** Object:  StoredProcedure [dbo].[MovieIdQuery2Test]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MovieIdQuery2Test]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT        ID, Title, Genre, Year, Viewcount, PosterPath
FROM            MovieDBList
WHERE        (ID = @id)
GO
/****** Object:  StoredProcedure [dbo].[MovieInsertCommand]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MovieInsertCommand]
(
	@Title nvarchar(50),
	@Genre nvarchar(50),
	@Year int,
	@Viewcount int,
	@PosterPath nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [MovieDBList] ([Title], [Genre], [Year], [Viewcount], [PosterPath]) VALUES (@Title, @Genre, @Year, @Viewcount, @PosterPath);
	
SELECT ID, Title, Genre, Year, Viewcount, PosterPath FROM MovieDBList WHERE (ID = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[MovieSearchTitle]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MovieSearchTitle]
(
    @a nvarchar(50)
)
AS
    SET NOCOUNT ON;
    SELECT        ID, Title, Genre, Year, ViewCount, PosterPath
FROM            MovieDBList
WHERE        (CHARINDEX(@a, Title) > 0)
GO
/****** Object:  StoredProcedure [dbo].[MovieSelectCommand]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MovieSelectCommand]
AS
	SET NOCOUNT ON;
SELECT MovieDBList.*
FROM MovieDBList
GO
/****** Object:  StoredProcedure [dbo].[MovieSelectTop10Query]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MovieSelectTop10Query]
AS
	SET NOCOUNT ON;
SELECT TOP (10) * FROM MovieDBList ORDER BY ViewCount DESC, Year DESC
GO
/****** Object:  StoredProcedure [dbo].[MovieUpdateCommand]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MovieUpdateCommand]
(
	@Title nvarchar(50),
	@Genre nvarchar(50),
	@Year int,
	@Viewcount int,
	@PosterPath nvarchar(MAX),
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [MovieDBList] SET [Title] = @Title, [Genre] = @Genre, [Year] = @Year, [Viewcount] = @Viewcount, [PosterPath] = @PosterPath WHERE (([ID] = @Original_ID));
	
SELECT ID, Title, Genre, Year, Viewcount, PosterPath FROM MovieDBList WHERE (ID = @ID)
GO
/****** Object:  StoredProcedure [dbo].[SelectByGenreQuery]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByGenreQuery]
(
	@Genre nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT        ID, Title, Genre, Year, Viewcount, PosterPath
FROM            MovieDBList
WHERE        (Genre = @Genre)
GO
/****** Object:  StoredProcedure [dbo].[SelectByTitleQuery]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByTitleQuery]
(
	@title nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT        ID, Title, Genre, Year, Viewcount, PosterPath
FROM            MovieDBList
WHERE        (Title = @title)
GO
/****** Object:  StoredProcedure [dbo].[SelectPosterlessQuery]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPosterlessQuery]
AS
	SET NOCOUNT ON;
SELECT        ID, Title, Genre, Year, Viewcount, PosterPath
FROM            MovieDBList
WHERE        (PosterPath IS NULL) OR
                         (PosterPath = N'N/A') OR
                         (PosterPath = N'FAIL')
GO
/****** Object:  StoredProcedure [dbo].[SelectSingleQuery]    Script Date: 15-12-2018 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectSingleQuery]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT        ID, Title, Genre, Year, Viewcount, PosterPath
FROM            MovieDBList
WHERE        (ID = @id)
GO
