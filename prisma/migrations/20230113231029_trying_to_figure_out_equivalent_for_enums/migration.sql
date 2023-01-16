BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Webhooks] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_Webhooks_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_Webhooks_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [name] NVARCHAR(max) NOT NULL,
    [url] NVARCHAR(max) NOT NULL,
    [type] NVARCHAR(1000),
    [active] BIT NOT NULL,
    [secret] NVARCHAR(max),
    [createdBy] NVARCHAR(max) NOT NULL,
    CONSTRAINT [PK_Webhooks] PRIMARY KEY CLUSTERED ([id])
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