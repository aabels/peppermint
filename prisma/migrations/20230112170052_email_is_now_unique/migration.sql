/*
  Warnings:

  - You are about to alter the column `email` on the `Client` table. The data in that column could be lost. The data in that column will be cast from `NVarChar(Max)` to `VarChar(255)`.
  - A unique constraint covering the columns `[email]` on the table `Client` will be added. If there are existing duplicate values, this will fail.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[Client] ALTER COLUMN [email] VARCHAR(255) NOT NULL;

-- CreateIndex
ALTER TABLE [dbo].[Client] ADD CONSTRAINT [Client_email_key] UNIQUE NONCLUSTERED ([email]);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
