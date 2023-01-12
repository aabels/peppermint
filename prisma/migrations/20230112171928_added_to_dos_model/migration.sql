BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Todos] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_Todos_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_Todos_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [text] NVARCHAR(max) NOT NULL,
    [done] BIT NOT NULL CONSTRAINT [DF_Todos_done] DEFAULT 0,
    [createdBy] INT NOT NULL,
    [userId] INT NOT NULL,
    CONSTRAINT [Todos_pkey] PRIMARY KEY CLUSTERED ([id])
);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
