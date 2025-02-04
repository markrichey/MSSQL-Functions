CREATE FUNCTION dbo.fn_String_GetInitialsAndSurname (
  @Name varchar(1000)
) RETURNS varchar(100) AS BEGIN DECLARE @Pos AS INT DECLARE @inits AS VARCHAR(100) = '' DECLARE @InitCount INT = LEN(@Name)- LEN(
  REPLACE(@Name, ' ', '')
) DECLARE @Loop AS INT = 1 IF @InitCount >= 1 BEGIN WHILE @Loop <= @InitCount BEGIN 
SET 
  @Pos = CHARINDEX(' ', @Name, 0) IF @Pos > 0 BEGIN 
SET 
  @inits = @inits + LEFT(
    LEFT(@Name, @Pos), 
    1
  ) 
SET 
  @Name = RIGHT(
    @Name, 
    LEN(@Name)- @Pos
  ) END 
SET 
  @Loop += 1 END END 
SET 
  @inits = @inits + ' ' + @Name RETURN @inits END GO
