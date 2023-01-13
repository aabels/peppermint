/*
  Warnings:

  - Added the required column `email` to the `Ticket` table without a default value. This is not possible if the table is not empty.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[Ticket] ALTER COLUMN [detail] NVARCHAR(max) NULL;
ALTER TABLE [dbo].[Ticket] ADD [email] NVARCHAR(1000) NOT NULL,
[note] NVARCHAR(1000);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
