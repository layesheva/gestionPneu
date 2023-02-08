-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "phone" TEXT NOT NULL,
    "name" TEXT,
    "password" TEXT NOT NULL,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_User" ("createdAt", "id", "name", "password", "phone", "updatedAt") SELECT "createdAt", "id", "name", "password", "phone", "updatedAt" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_phone_key" ON "User"("phone");
CREATE TABLE "new_Chauffeur" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nom" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "adresse" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Chauffeur" ("adresse", "contact", "createdAt", "id", "nom", "prenom", "statut", "updatedAt") SELECT "adresse", "contact", "createdAt", "id", "nom", "prenom", "statut", "updatedAt" FROM "Chauffeur";
DROP TABLE "Chauffeur";
ALTER TABLE "new_Chauffeur" RENAME TO "Chauffeur";
CREATE TABLE "new_Engin" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "immatriculation" TEXT NOT NULL,
    "marque" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Engin" ("createdAt", "id", "immatriculation", "marque", "model", "statut", "updatedAt") SELECT "createdAt", "id", "immatriculation", "marque", "model", "statut", "updatedAt" FROM "Engin";
DROP TABLE "Engin";
ALTER TABLE "new_Engin" RENAME TO "Engin";
CREATE TABLE "new_Position" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "designation" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Position" ("createdAt", "designation", "id", "statut", "updatedAt") SELECT "createdAt", "designation", "id", "statut", "updatedAt" FROM "Position";
DROP TABLE "Position";
ALTER TABLE "new_Position" RENAME TO "Position";
CREATE TABLE "new_Sortie" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "pneuId" INTEGER,
    "chauffeurId" INTEGER,
    "kilometre" INTEGER NOT NULL,
    "motif" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Sortie_pneuId_fkey" FOREIGN KEY ("pneuId") REFERENCES "Pneu" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Sortie_chauffeurId_fkey" FOREIGN KEY ("chauffeurId") REFERENCES "Chauffeur" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Sortie" ("chauffeurId", "createdAt", "date", "id", "kilometre", "motif", "pneuId", "statut", "updatedAt") SELECT "chauffeurId", "createdAt", "date", "id", "kilometre", "motif", "pneuId", "statut", "updatedAt" FROM "Sortie";
DROP TABLE "Sortie";
ALTER TABLE "new_Sortie" RENAME TO "Sortie";
CREATE TABLE "new_Pneu" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "numero_serie" TEXT NOT NULL,
    "enginId" INTEGER,
    "designation" TEXT NOT NULL,
    "positionId" INTEGER,
    "date_debut" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "etat" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Pneu_enginId_fkey" FOREIGN KEY ("enginId") REFERENCES "Engin" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Pneu_positionId_fkey" FOREIGN KEY ("positionId") REFERENCES "Position" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Pneu" ("createdAt", "date_debut", "designation", "enginId", "etat", "id", "numero_serie", "positionId", "statut", "updatedAt") SELECT "createdAt", "date_debut", "designation", "enginId", "etat", "id", "numero_serie", "positionId", "statut", "updatedAt" FROM "Pneu";
DROP TABLE "Pneu";
ALTER TABLE "new_Pneu" RENAME TO "Pneu";
CREATE UNIQUE INDEX "Pneu_numero_serie_key" ON "Pneu"("numero_serie");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
