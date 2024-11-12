-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(30) NOT NULL,
    `name` VARCHAR(20) NULL,
    `gender` VARCHAR(10) NULL,
    `age` INTEGER NULL,
    `address` VARCHAR(40) NULL,
    `address2` VARCHAR(40) NULL,
    `stat` VARCHAR(15) NULL,
    `inactive_date` DATETIME(6) NULL,
    `social_type` VARCHAR(10) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    `email` VARCHAR(50) NULL,
    `point` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Region` (
    `id` VARCHAR(30) NOT NULL,
    `name` VARCHAR(20) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Store` (
    `id` VARCHAR(30) NOT NULL,
    `region_id` VARCHAR(30) NULL,
    `name` VARCHAR(50) NULL,
    `address` VARCHAR(50) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Mission` (
    `id` VARCHAR(30) NOT NULL,
    `store_id` VARCHAR(30) NULL,
    `reward` INTEGER NULL,
    `deadline` DATETIME(3) NULL,
    `mission_text` VARCHAR(191) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MemberMission` (
    `id` VARCHAR(30) NOT NULL,
    `member_id` VARCHAR(30) NULL,
    `mission_id` VARCHAR(30) NULL,
    `status` VARCHAR(15) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Terms` (
    `id` VARCHAR(30) NOT NULL,
    `title` VARCHAR(20) NULL,
    `body` VARCHAR(191) NULL,
    `optional` BOOLEAN NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MemberAgree` (
    `id` VARCHAR(30) NOT NULL,
    `member_id` VARCHAR(30) NULL,
    `terms_id` VARCHAR(30) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FoodCategory` (
    `id` VARCHAR(30) NOT NULL,
    `name` VARCHAR(15) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MemberPrefer` (
    `id` VARCHAR(30) NOT NULL,
    `member_id` VARCHAR(30) NULL,
    `category_id` VARCHAR(30) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Review` (
    `id` VARCHAR(30) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `store_id` VARCHAR(30) NULL,
    `text` VARCHAR(191) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Store` ADD CONSTRAINT `Store_region_id_fkey` FOREIGN KEY (`region_id`) REFERENCES `Region`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Mission` ADD CONSTRAINT `Mission_store_id_fkey` FOREIGN KEY (`store_id`) REFERENCES `Store`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MemberMission` ADD CONSTRAINT `MemberMission_member_id_fkey` FOREIGN KEY (`member_id`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MemberMission` ADD CONSTRAINT `MemberMission_mission_id_fkey` FOREIGN KEY (`mission_id`) REFERENCES `Mission`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MemberAgree` ADD CONSTRAINT `MemberAgree_member_id_fkey` FOREIGN KEY (`member_id`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MemberAgree` ADD CONSTRAINT `MemberAgree_terms_id_fkey` FOREIGN KEY (`terms_id`) REFERENCES `Terms`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MemberPrefer` ADD CONSTRAINT `MemberPrefer_member_id_fkey` FOREIGN KEY (`member_id`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MemberPrefer` ADD CONSTRAINT `MemberPrefer_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `FoodCategory`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Review` ADD CONSTRAINT `Review_store_id_fkey` FOREIGN KEY (`store_id`) REFERENCES `Store`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
