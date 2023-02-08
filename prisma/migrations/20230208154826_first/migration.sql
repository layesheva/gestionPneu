-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "phone" TEXT NOT NULL,
    "name" TEXT,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Engin" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "immatriculation" TEXT NOT NULL,
    "marque" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Chauffeur" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nom" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "adresse" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Position" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "designation" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Pneu" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "numero_serie" TEXT NOT NULL,
    "enginId" INTEGER,
    "designation" TEXT NOT NULL,
    "positionId" INTEGER,
    "date_debut" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "etat" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Pneu_enginId_fkey" FOREIGN KEY ("enginId") REFERENCES "Engin" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Pneu_positionId_fkey" FOREIGN KEY ("positionId") REFERENCES "Position" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Sortie" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "pneuId" INTEGER,
    "chauffeurId" INTEGER,
    "kilometre" INTEGER NOT NULL,
    "motif" TEXT NOT NULL,
    "statut" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Sortie_pneuId_fkey" FOREIGN KEY ("pneuId") REFERENCES "Pneu" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Sortie_chauffeurId_fkey" FOREIGN KEY ("chauffeurId") REFERENCES "Chauffeur" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_key" ON "User"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Pneu_numero_serie_key" ON "Pneu"("numero_serie");
