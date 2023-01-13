BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Client] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_Client_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_Client_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [name] NVARCHAR(max) NOT NULL,
    [email] VARCHAR(255) NOT NULL,
    [contactName] NVARCHAR(max) NOT NULL,
    [number] NVARCHAR(max),
    [notes] NVARCHAR(max),
    CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Client_email_key] UNIQUE NONCLUSTERED ([email])
);

-- CreateTable
CREATE TABLE [dbo].[Notes] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_Notes_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_Notes_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [title] NVARCHAR(max) NOT NULL,
    [note] NVARCHAR(max) NOT NULL,
    [userId] INT NOT NULL,
    CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Ticket] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_Ticket_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_Ticket_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [name] NVARCHAR(max) NOT NULL,
    [title] NVARCHAR(max) NOT NULL,
    [detail] NVARCHAR(max),
    [isComplete] BIT NOT NULL CONSTRAINT [DF_Ticket_isComplete] DEFAULT 0,
    [priority] NVARCHAR(max) NOT NULL,
    [clientId] INT NOT NULL,
    [userId] INT NOT NULL,
    [email] NVARCHAR(1000) NOT NULL,
    [note] NVARCHAR(1000),
    CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[TicketFile] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_TicketFile_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [filename] NVARCHAR(1000) NOT NULL,
    [path] NVARCHAR(1000) NOT NULL,
    [ticketId] INT NOT NULL,
    CONSTRAINT [PK_TicketFile] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Todos] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_Todos_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_Todos_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [text] NVARCHAR(max) NOT NULL,
    [done] BIT NOT NULL CONSTRAINT [DF_Todos_done] DEFAULT 0,
    [userId] INT NOT NULL,
    CONSTRAINT [PK_Todos] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[User] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_User_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME NOT NULL CONSTRAINT [DF_User_updatedAt] DEFAULT CURRENT_TIMESTAMP,
    [name] NVARCHAR(max) NOT NULL,
    [password] NVARCHAR(max) NOT NULL,
    [email] VARCHAR(255) NOT NULL,
    [isAdmin] BIT NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [User_email_key] UNIQUE NONCLUSTERED ([email])
);

-- CreateTable
CREATE TABLE [dbo].[UserFile] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME NOT NULL CONSTRAINT [DF_UserFile_createdAt] DEFAULT CURRENT_TIMESTAMP,
    [filename] NVARCHAR(max) NOT NULL,
    [path] NVARCHAR(max) NOT NULL,
    [userId] INT NOT NULL,
    CONSTRAINT [PK_UserFile] PRIMARY KEY CLUSTERED ([id])
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
