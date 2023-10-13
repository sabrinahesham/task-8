CREATE TABLE `user`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` BIGINT NOT NULL
);
CREATE TABLE `user_phone`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `phone` BIGINT NOT NULL
);
ALTER TABLE
    `user_phone` ADD PRIMARY KEY(`user_id`);
CREATE TABLE `booking`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` BIGINT NOT NULL,
    `time` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `major_id` BIGINT NOT NULL
);
ALTER TABLE
    `booking` ADD PRIMARY KEY(`user_id`);
ALTER TABLE
    `booking` ADD PRIMARY KEY(`major_id`);
CREATE TABLE `doctor`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `major_id` BIGINT NOT NULL
);
ALTER TABLE
    `doctor` ADD PRIMARY KEY(`major_id`);
CREATE TABLE `major`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `doctor_qualification`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `doctor_id` BIGINT NOT NULL,
    `qualification` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `doctor_qualification` ADD PRIMARY KEY(`doctor_id`);
CREATE TABLE `contact`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `contact_info` VARCHAR(255) NOT NULL,
    `message` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `contact` ADD PRIMARY KEY(`user_id`);
ALTER TABLE
    `booking` ADD CONSTRAINT `booking_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `booking` ADD CONSTRAINT `booking_major_id_foreign` FOREIGN KEY(`major_id`) REFERENCES `major`(`id`);
ALTER TABLE
    `doctor` ADD CONSTRAINT `doctor_major_id_foreign` FOREIGN KEY(`major_id`) REFERENCES `major`(`id`);
ALTER TABLE
    `doctor_qualification` ADD CONSTRAINT `doctor_qualification_doctor_id_foreign` FOREIGN KEY(`doctor_id`) REFERENCES `doctor`(`id`);
ALTER TABLE
    `user_phone` ADD CONSTRAINT `user_phone_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `contact` ADD CONSTRAINT `contact_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);