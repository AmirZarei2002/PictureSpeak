-- DropForeignKey
ALTER TABLE "Favorite" DROP CONSTRAINT IF EXISTS "Favorite_userId_fkey";

-- DropForeignKey
ALTER TABLE "Favorite" DROP CONSTRAINT IF EXISTS "Favorite_itemId_fkey";

-- DropTable
DROP TABLE IF EXISTS "Favorite";
