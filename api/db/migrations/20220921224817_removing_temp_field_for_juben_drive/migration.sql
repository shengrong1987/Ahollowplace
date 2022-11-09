/*
  Warnings:

  - You are about to drop the column `a` on the `JubenDrive` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_JubenDrive" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" DATETIME NOT NULL,
    "male" INTEGER NOT NULL,
    "female" INTEGER NOT NULL,
    "total" INTEGER NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Carpooling',
    "jubenId" INTEGER NOT NULL,
    "timeSlotId" INTEGER NOT NULL,
    CONSTRAINT "JubenDrive_jubenId_fkey" FOREIGN KEY ("jubenId") REFERENCES "Juben" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "JubenDrive_timeSlotId_fkey" FOREIGN KEY ("timeSlotId") REFERENCES "TimeSlot" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_JubenDrive" ("date", "female", "id", "jubenId", "male", "status", "timeSlotId", "total") SELECT "date", "female", "id", "jubenId", "male", "status", "timeSlotId", "total" FROM "JubenDrive";
DROP TABLE "JubenDrive";
ALTER TABLE "new_JubenDrive" RENAME TO "JubenDrive";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
