BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Client] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_Client_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_Client_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [name] NVARCHAR(max) NOT NULL,
    [email] NVARCHAR(max) NOT NULL,
    [contactName] NVARCHAR(max) NOT NULL,
    [number] NVARCHAR(max) NOT NULL,
    [notes] NVARCHAR(max) NOT NULL,
    CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Ticket] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_Ticket_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_Ticket_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [name] NVARCHAR(max) NOT NULL,
    [title] NVARCHAR(max) NOT NULL,
    [detail] NVARCHAR(max) NOT NULL,
    [isComplete] BIT NOT NULL CONSTRAINT [DF_Ticket_isComplete] DEFAULT 0,
    [priority] NVARCHAR(max) NOT NULL,
    [clientId] INT NOT NULL,
    [userId] INT NOT NULL,
    CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[User] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_User_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_User_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [name] NVARCHAR(max),
    [password] NVARCHAR(50),
    [email] NVARCHAR(50),
    [isAdmin] BIT,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Webhooks] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_Webhooks_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_Webhooks_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [name] NVARCHAR(max) NOT NULL,
    [url] NVARCHAR(max) NOT NULL,
    [type] NVARCHAR(max) NOT NULL,
    [active] BIT NOT NULL CONSTRAINT [DF_Webhooks_active] DEFAULT 0,
    [secret] NVARCHAR(max),
    [createdBy] NVARCHAR(max) NOT NULL,
    CONSTRAINT [PK_Webhooks] PRIMARY KEY CLUSTERED ([ID])
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
