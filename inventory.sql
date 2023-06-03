/*
 Navicat Premium Data Transfer

 Source Server         : mysql_local
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : inventory

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 30/04/2023 21:16:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for batches
-- ----------------------------
DROP TABLE IF EXISTS `batches`;
CREATE TABLE `batches`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` bigint UNSIGNED NOT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `batches_item_id_foreign`(`item_id` ASC) USING BTREE,
  CONSTRAINT `batches_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of batches
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categories_parent_id_foreign`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, NULL, 'أجهزة كهربائية', 'فثقسلب', 1, '2023-04-30 06:15:21', '2023-04-30 08:03:32');
INSERT INTO `categories` VALUES (2, 1, 'حاساب', 'رليب', 1, '2023-04-30 06:15:53', '2023-04-30 06:15:53');

-- ----------------------------
-- Table structure for daeras
-- ----------------------------
DROP TABLE IF EXISTS `daeras`;
CREATE TABLE `daeras`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1451 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of daeras
-- ----------------------------
INSERT INTO `daeras` VALUES (950, 'دائرة المدارس الشرعية', 949, NULL, NULL);
INSERT INTO `daeras` VALUES (952, 'مديرية أوقاف محافظة غزة', 947, NULL, NULL);
INSERT INTO `daeras` VALUES (956, 'مديرية أوقاف محافظة الوسطي', 947, NULL, NULL);
INSERT INTO `daeras` VALUES (961, 'مديرية أوقاف محافظة خانيونس', 947, NULL, NULL);
INSERT INTO `daeras` VALUES (962, 'دائرة الحسابات', 955, NULL, NULL);
INSERT INTO `daeras` VALUES (968, 'دائرة الهندسة والانشاءات', 967, NULL, NULL);
INSERT INTO `daeras` VALUES (970, 'دائرة الاعلام ', 948, NULL, NULL);
INSERT INTO `daeras` VALUES (975, 'دائرة شؤون الموظفين', 1172, NULL, NULL);
INSERT INTO `daeras` VALUES (978, 'دائرة أنظمة وتطبيقات الانترنت', 972, NULL, NULL);
INSERT INTO `daeras` VALUES (980, 'مديرية أوقاف محافظة الشمال', 947, NULL, NULL);
INSERT INTO `daeras` VALUES (985, 'دائرة الصيانة', 1172, NULL, NULL);
INSERT INTO `daeras` VALUES (987, 'مديرية أوقاف محافظة رفح', 947, NULL, NULL);
INSERT INTO `daeras` VALUES (1004, 'دائرة الشبكات والدعم الفني', 972, NULL, NULL);
INSERT INTO `daeras` VALUES (1025, 'كلية الدعوة الإسلامية - المقر الرئيسي', 949, NULL, NULL);
INSERT INTO `daeras` VALUES (1026, 'دائرة الاذاعة والقناة الالكترونية', 948, NULL, NULL);
INSERT INTO `daeras` VALUES (1029, 'دائرة الموازنة والتدقيق', 1182, NULL, NULL);
INSERT INTO `daeras` VALUES (1031, 'دائرة العلاقة العامة', 948, NULL, NULL);
INSERT INTO `daeras` VALUES (1036, 'دائرة الدعوة المجتمعية والالكترونية', 1035, NULL, NULL);
INSERT INTO `daeras` VALUES (1038, 'دائرة المخازن', 1182, NULL, NULL);
INSERT INTO `daeras` VALUES (1041, 'مكتب الوكيل', 1300, NULL, NULL);
INSERT INTO `daeras` VALUES (1042, 'دائرة الحسابات والايرادات', 1182, NULL, NULL);
INSERT INTO `daeras` VALUES (1048, 'دائرة البحث الاجتماعي ', 955, NULL, NULL);
INSERT INTO `daeras` VALUES (1062, 'كلية الدعوة الإسلامية - مقر الشمال', 949, NULL, NULL);
INSERT INTO `daeras` VALUES (1065, 'دائرة المقابر', 967, NULL, NULL);
INSERT INTO `daeras` VALUES (1069, 'دائرة الدعوة المسجدية', 1035, NULL, NULL);
INSERT INTO `daeras` VALUES (1075, 'دائرة الدعوة والإرشاد -اناث', 1035, NULL, NULL);
INSERT INTO `daeras` VALUES (1084, 'الدائرة العلمية', 949, NULL, NULL);
INSERT INTO `daeras` VALUES (1088, 'دائرة السياسات والتخطيط', 966, NULL, NULL);
INSERT INTO `daeras` VALUES (1091, 'دائرة الرقابة الدينية والفنية', 1072, NULL, NULL);
INSERT INTO `daeras` VALUES (1097, 'دائرة الخدمات والمواصلات', 1172, NULL, NULL);
INSERT INTO `daeras` VALUES (1101, 'دائرة الحج والعمرة وتأهيل الشركات', 1100, NULL, NULL);
INSERT INTO `daeras` VALUES (1104, 'دائرة مشاريع الوقف', 977, NULL, NULL);
INSERT INTO `daeras` VALUES (1105, 'دائرة التراث الاسلامي', 947, NULL, NULL);
INSERT INTO `daeras` VALUES (1108, 'دائرة تطوير الأداء المؤسسي', 966, NULL, NULL);
INSERT INTO `daeras` VALUES (1110, 'دائرة القراءات القرآنية', 974, NULL, NULL);
INSERT INTO `daeras` VALUES (1117, 'دائرة الأملاك', 967, NULL, NULL);
INSERT INTO `daeras` VALUES (1121, 'دائرة القرآن الكريم -إناث', 974, NULL, NULL);
INSERT INTO `daeras` VALUES (1131, 'دائرة البرمجيات وإدارة قواعد البيانات', 972, NULL, NULL);
INSERT INTO `daeras` VALUES (1146, 'دائرة المشتريات', 1182, NULL, NULL);
INSERT INTO `daeras` VALUES (1152, 'دائرة الاستثمار', 977, NULL, NULL);
INSERT INTO `daeras` VALUES (1165, 'دائرة المتابعة', 1100, NULL, NULL);
INSERT INTO `daeras` VALUES (1177, 'دائرة التحفيظ -ذكور', 974, NULL, NULL);
INSERT INTO `daeras` VALUES (1181, 'مكتب الوزير', 1301, NULL, NULL);
INSERT INTO `daeras` VALUES (1191, 'دائرة الحاسوب وتكنولوجيا المعلومات', 972, NULL, NULL);
INSERT INTO `daeras` VALUES (1210, 'دائرة الرقابة المالية', 1072, NULL, NULL);
INSERT INTO `daeras` VALUES (1214, 'دائرة مالية الحج والعمرة', 1100, NULL, NULL);
INSERT INTO `daeras` VALUES (1219, 'دائرة ديوان الحفاظ', 974, NULL, NULL);
INSERT INTO `daeras` VALUES (1222, 'دائرة صندوق الزكاة', 955, NULL, NULL);
INSERT INTO `daeras` VALUES (1368, 'قسم التنسيق والمتابعة', 947, NULL, NULL);
INSERT INTO `daeras` VALUES (1435, 'دائرة الانشطة والفعاليات', 1423, NULL, NULL);
INSERT INTO `daeras` VALUES (1442, 'دائرة التوثيق والاصدارات', 1423, NULL, NULL);
INSERT INTO `daeras` VALUES (1450, 'دائرة متابعة المساجد', 947, NULL, NULL);

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (945, 'قسم القضايا', 944, NULL, NULL);
INSERT INTO `departments` VALUES (951, 'المدرسة الشرعية للبنات - خانيونس', 950, NULL, NULL);
INSERT INTO `departments` VALUES (957, 'قسم الخدمات المساندة الوسطى', 956, NULL, NULL);
INSERT INTO `departments` VALUES (969, 'قسم نظم المعلومات الجغرافية والمساحة', 968, NULL, NULL);
INSERT INTO `departments` VALUES (971, 'قسم المونتاج', 970, NULL, NULL);
INSERT INTO `departments` VALUES (976, 'قسم العمل المؤقت', 975, NULL, NULL);
INSERT INTO `departments` VALUES (979, 'قسم خدمات الويب وتكامل البيانات', 978, NULL, NULL);
INSERT INTO `departments` VALUES (981, 'قسم العمل النسائي', 980, NULL, NULL);
INSERT INTO `departments` VALUES (983, 'قسم العمل النسائي غزة', 952, NULL, NULL);
INSERT INTO `departments` VALUES (986, 'قسم الصيانة العامة', 985, NULL, NULL);
INSERT INTO `departments` VALUES (988, 'قسم العمل النسائي', 987, NULL, NULL);
INSERT INTO `departments` VALUES (990, 'قسم القرآن الكريم -ذكور الوسطى', 956, NULL, NULL);
INSERT INTO `departments` VALUES (993, 'قسم العمل النسائي الوسطى', 956, NULL, NULL);
INSERT INTO `departments` VALUES (996, 'قسم متابعة المساجد الوسطى', 956, NULL, NULL);
INSERT INTO `departments` VALUES (1000, 'قسم متابعة المساجد', 987, NULL, NULL);
INSERT INTO `departments` VALUES (1001, 'قسم متابعة المساجد', 952, NULL, NULL);
INSERT INTO `departments` VALUES (1005, 'قسم إدارة أنظمة التشغيل', 1004, NULL, NULL);
INSERT INTO `departments` VALUES (1008, 'قسم متابعة المساجد', 961, NULL, NULL);
INSERT INTO `departments` VALUES (1009, 'قسم متابعة المساجد', 980, NULL, NULL);
INSERT INTO `departments` VALUES (1010, 'قسم القرآن الكريم -ذكور', 987, NULL, NULL);
INSERT INTO `departments` VALUES (1011, 'قسم الخدمات المساندة غزة', 952, NULL, NULL);
INSERT INTO `departments` VALUES (1015, 'قسم الصيانة والدعم الفني وإدارة الشبكات', 1004, NULL, NULL);
INSERT INTO `departments` VALUES (1017, 'قسم القرآن الكريم -ذكور', 980, NULL, NULL);
INSERT INTO `departments` VALUES (1027, 'قسم البرامج', 1026, NULL, NULL);
INSERT INTO `departments` VALUES (1030, 'قسم متابعة المديريات', 1029, NULL, NULL);
INSERT INTO `departments` VALUES (1032, 'قسم الاصدارات والمطبوعات', 1031, NULL, NULL);
INSERT INTO `departments` VALUES (1037, 'قسم الدعوة الالكترونية', 1036, NULL, NULL);
INSERT INTO `departments` VALUES (1039, 'قسم العهد', 1038, NULL, NULL);
INSERT INTO `departments` VALUES (1043, 'قسم الخزينة', 1042, NULL, NULL);
INSERT INTO `departments` VALUES (1046, 'قسم العمل النسائي', 961, NULL, NULL);
INSERT INTO `departments` VALUES (1049, 'قسم الكفالات', 1048, NULL, NULL);
INSERT INTO `departments` VALUES (1050, 'قسم هندسة الصوت', 1026, NULL, NULL);
INSERT INTO `departments` VALUES (1052, 'المدرسة الشرعية للبنين - غزة', 950, NULL, NULL);
INSERT INTO `departments` VALUES (1053, 'قسم القرآن الكريم -ذكور غزة', 952, NULL, NULL);
INSERT INTO `departments` VALUES (1063, 'الأقسام الأكاديمية', 1399, NULL, NULL);
INSERT INTO `departments` VALUES (1066, 'قسم الدوام والاجازات', 975, NULL, NULL);
INSERT INTO `departments` VALUES (1068, 'قسم المخازن الرئيسية والفرعية', 1038, NULL, NULL);
INSERT INTO `departments` VALUES (1070, 'قسم الأئمة', 1069, NULL, NULL);
INSERT INTO `departments` VALUES (1074, 'قسم الرقابة الفنية', 1091, NULL, NULL);
INSERT INTO `departments` VALUES (1076, 'قسم القرآن الكريم -ذكور', 961, NULL, NULL);
INSERT INTO `departments` VALUES (1080, 'قسم القناة الالكترونية', 1026, NULL, NULL);
INSERT INTO `departments` VALUES (1081, 'قسم الأملاك', 961, NULL, NULL);
INSERT INTO `departments` VALUES (1082, 'قسم الخدمات المساندة', 961, NULL, NULL);
INSERT INTO `departments` VALUES (1085, 'قسم البرامج والمناهج', 1084, NULL, NULL);
INSERT INTO `departments` VALUES (1086, 'قسم الخدمات المساندة', 980, NULL, NULL);
INSERT INTO `departments` VALUES (1089, 'قسم التخطيط والبرامج', 1088, NULL, NULL);
INSERT INTO `departments` VALUES (1096, 'الأقسام الأكاديمية', 1414, NULL, NULL);
INSERT INTO `departments` VALUES (1099, 'قسم الأملاك', 980, NULL, NULL);
INSERT INTO `departments` VALUES (1102, 'قسم معلومات الحج والعمرة', 1101, NULL, NULL);
INSERT INTO `departments` VALUES (1103, 'قسم المتابعة والتفتيش', 968, NULL, NULL);
INSERT INTO `departments` VALUES (1106, 'قسم الاحصاء والمعلومات', 1088, NULL, NULL);
INSERT INTO `departments` VALUES (1107, 'قسم شؤون الموظفين', 1415, NULL, NULL);
INSERT INTO `departments` VALUES (1109, 'قسم التنسيق والمتابعة', 1026, NULL, NULL);
INSERT INTO `departments` VALUES (1111, 'قسم الدورات والقراءة والإقراء', 1110, NULL, NULL);
INSERT INTO `departments` VALUES (1113, 'قسم الخدمات المساندة', 987, NULL, NULL);
INSERT INTO `departments` VALUES (1115, 'قسم المخطوطات', 1105, NULL, NULL);
INSERT INTO `departments` VALUES (1118, 'قسم متابعة الأملاك', 1117, NULL, NULL);
INSERT INTO `departments` VALUES (1123, 'قسم شؤون الطلبة', 1399, NULL, NULL);
INSERT INTO `departments` VALUES (1127, 'قسم الأملاك غزة', 952, NULL, NULL);
INSERT INTO `departments` VALUES (1128, 'قسم السكرتاريا والأرشيف مكتب الوزير', 1181, NULL, NULL);
INSERT INTO `departments` VALUES (1129, 'قسم قواعد بيانات الوقف', 1117, NULL, NULL);
INSERT INTO `departments` VALUES (1132, 'قسم أمن خوادم الويب والبيانات', 1131, NULL, NULL);
INSERT INTO `departments` VALUES (1134, 'قسم الورش', 985, NULL, NULL);
INSERT INTO `departments` VALUES (1135, 'قسم الخدمات الادارية', 1097, NULL, NULL);
INSERT INTO `departments` VALUES (1137, 'قسم الاشراف الهندسي', 968, NULL, NULL);
INSERT INTO `departments` VALUES (1141, 'قسم المحاسبة', 1042, NULL, NULL);
INSERT INTO `departments` VALUES (1144, 'قسم تحليل وتصميم النظم وإدارة قواعد البيانات', 1131, NULL, NULL);
INSERT INTO `departments` VALUES (1147, 'قسم المشتريات', 1146, NULL, NULL);
INSERT INTO `departments` VALUES (1148, 'قسم النقل والمواصلات', 1097, NULL, NULL);
INSERT INTO `departments` VALUES (1149, 'قسم الرقابة الادارية', 1091, NULL, NULL);
INSERT INTO `departments` VALUES (1153, 'قسم الاستثمار المالي', 1152, NULL, NULL);
INSERT INTO `departments` VALUES (1154, 'قسم الأملاك الوسطى', 956, NULL, NULL);

-- ----------------------------
-- Table structure for edaras
-- ----------------------------
DROP TABLE IF EXISTS `edaras`;
CREATE TABLE `edaras`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1424 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edaras
-- ----------------------------
INSERT INTO `edaras` VALUES (944, 'وحدة الشؤون القانونية', 1301, NULL, NULL);
INSERT INTO `edaras` VALUES (947, 'الادارة العامة للمساجد والمديريات', 1300, NULL, NULL);
INSERT INTO `edaras` VALUES (948, 'وحدة العلاقات العامة والإعلام', 1301, NULL, NULL);
INSERT INTO `edaras` VALUES (949, 'وحدة التعليم الشرعي', 1300, NULL, NULL);
INSERT INTO `edaras` VALUES (955, 'وحدة الزكاة والاغاثة', 1300, NULL, NULL);
INSERT INTO `edaras` VALUES (966, 'وحدة التخطيط وتطوير الأداء المؤسسي', 1301, NULL, NULL);
INSERT INTO `edaras` VALUES (967, 'الإدارة العامة للأملاك الوقفية', 1300, NULL, NULL);
INSERT INTO `edaras` VALUES (972, 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 1301, NULL, NULL);
INSERT INTO `edaras` VALUES (974, 'الادارة العامة للقرآن الكريم', 1300, NULL, NULL);
INSERT INTO `edaras` VALUES (977, 'وحدة تنمية أموال الوقف', 1301, NULL, NULL);
INSERT INTO `edaras` VALUES (1035, 'الادارة العامة للدعوة والارشاد', 1300, NULL, NULL);
INSERT INTO `edaras` VALUES (1072, 'وحدة الرقابة الداخلية', 1301, NULL, NULL);
INSERT INTO `edaras` VALUES (1100, 'الادارة العامة للحج والعمرة', 1300, NULL, NULL);
INSERT INTO `edaras` VALUES (1172, 'الإدارة العامة للشئون الإدارية', 1300, NULL, NULL);
INSERT INTO `edaras` VALUES (1182, 'الإدارة العامة للشئون المالية', 1300, NULL, NULL);
INSERT INTO `edaras` VALUES (1206, 'وحدة المشاريع والتعاون الدولي', 1301, NULL, NULL);
INSERT INTO `edaras` VALUES (1300, 'الوكيل', 939, NULL, NULL);
INSERT INTO `edaras` VALUES (1301, 'الوزير', 939, NULL, NULL);
INSERT INTO `edaras` VALUES (1423, 'وحدة شؤون القدس', 1301, NULL, NULL);

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edara` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `daera` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edara_id` bigint NULL DEFAULT NULL,
  `daera_id` bigint NULL DEFAULT NULL,
  `department_id` bigint NULL DEFAULT NULL,
  `section_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8149 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (1, 'مازن اعبيد مسلم النجار', 'الإدارة العامة للأملاك الوقفية', NULL, NULL, NULL, 967, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2, 'مي يوسف أحمد ابو شاويش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (3, 'عصمت محمد حسن حسان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4, 'أحمد ديب مصطفى ضميده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (5, 'اشرف عوض رمضان الترك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (6, 'ابراهيم خضر سعيد ابو منديل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (7, 'صابر محمد حماد ابو قشلان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (8, 'رائد خليل حسين الواوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة الخدمات', 947, 956, 957, 1336, NULL, NULL);
INSERT INTO `employees` VALUES (9, 'ناصر جبر مراحيل غرقود', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (10, 'محمد حسن محمد الجديلي', 'الإدارة العامة للشئون المالية', NULL, NULL, NULL, 1182, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (11, 'عبد الله حسين عبد الله اليازجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (12, 'عزيز رمضان عناب قويدر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (13, 'حازم زكي سالم عيسى', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (14, 'ياسر ابراهيم مصلح السطري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (15, 'ساهر نعيم أحمد الناجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (16, 'يوسف عبد القادر موسى الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (17, 'رامي فوزي صبحي الطويل', 'وحدة العلاقات العامة والإعلام', 'دائرة العلاقة العامة', 'قسم العلاقات العامة والإعلام', NULL, 948, 1031, 1218, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (18, 'مي جاسر حسين شهوان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (19, 'عبدالله أحمد محمد احمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (20, 'عبد الهادي سعيد دياب الاغا', 'الوكيل', 'مكتب الوكيل', NULL, NULL, 1300, 1041, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (21, 'سهيل رمضان خالد المبحوح', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (22, 'سميه زكي عبد العزيز قاسم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (23, 'محمد خليل راجح نصر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (24, 'الهام عبد الحميد محمد كلوب', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (25, 'مصطفى خليل يوسف العنابي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (26, 'صالح حمدان سليم ابو سماحه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (27, 'وليد حسن محمد قويدر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (28, 'عبير محمد محمد الدرفيل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 980, 981, 1167, NULL, NULL);
INSERT INTO `employees` VALUES (29, 'سلوى محمد علي رضوان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (30, 'رائد أحمد ايوب عطا الله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (31, 'حامد محمد هاشم محمد خلف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (32, 'وفاء محمد حسن الغلبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (33, 'منير مروان اسماعيل حمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (34, 'بكر محمد ابراهيم أبو حدايد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (35, 'توفيق عبد المجيد توفيق حماد', 'الادارة العامة للقرآن الكريم', 'دائرة التحفيظ -ذكور', 'قسم المراكز', NULL, 974, 1177, 1178, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (36, 'بهاء عز الدين صالح شابط', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (37, 'عبد العزيز خليل عبد الرحمن الهباش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (38, 'عماد عبد الباري سعيد ابو وردة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (39, 'عنان عادل عبد الرازق المصري', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (40, 'عمر ديب عبدالله المبحوح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', NULL, 947, 956, 957, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (41, 'أحمد عبيد سلمان ابو محيسن', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (42, 'موسى سليمان محمد النباهين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (43, 'علاء سعدي محمد عيسى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (44, 'محمد أحمد عبدالله عدوان', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (45, 'ليندا محمد عبدالله الهجين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (46, 'أحمد رفيق صابر أبو الخير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (47, 'وائل عطا حسين رضوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (48, 'يحيى توفيق عبد المعطي النمس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (49, 'رمزي علي اسماعيل زعرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (50, 'عمر محمد خليل عابدين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (51, 'ايمن عبد الحميد عبد الفتاح ابو العنين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (52, 'نسرين جهاد فوزي صالح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (53, 'ابراهيم أحمد سلامه ابو عصعوص', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (54, 'سهيل شحادة أحمد عواد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (55, 'بسام صالح جبر حسونة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (56, 'اياد خليل حسن ابو طعيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (57, 'هاني جمال خليل ابو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (58, 'محمد اسماعيل محمد ابو عنزه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (59, 'يوسف دياب خليل ابو نجيله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (60, 'طارق خضر جمعة عليان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (61, 'اشرف يوسف عطيه ابو سمهدانه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (62, 'علاءالدين هشام سالم زهره', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (63, 'علاء جبر مصطفى السيقلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (64, 'تامر سعيد سلمان جودة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (65, 'نهاد محمد محمد ابو ديه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', NULL, 947, 952, 1011, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (66, 'بكر ربيع حسن التتري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (67, 'علاء عوض محمود ابو دغيم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (68, 'سماح عيسى محمود حمدان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (69, 'وائل يوسف مصطفى الخطيب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (70, 'محمد سعيد حسن صادق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (71, 'عماد عبد الرحيم أحمد مقاط', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (72, 'عمر سعيد محمد عصفور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (73, 'محمد يوسف محمد شلح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (74, 'مازن علي شكري الجماصي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (75, 'سلامه محمد خليل العطار', 'الإدارة العامة للشئون المالية', 'دائرة الموازنة والتدقيق', 'قسم التدقيق', NULL, 1182, 1029, 1364, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (76, 'حسن يوسف محمد حماد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', 'شعبة الصيانة', 947, 961, 1082, 1174, NULL, NULL);
INSERT INTO `employees` VALUES (77, 'عبد العزيز عبد الرحمن علي بشير', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (78, 'عهود عوني حسن فروانة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (79, 'أحمد ابراهيم عيسى البحطيطي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (80, 'حاتم عبد العزيز عبد القادر البلبيسي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (81, 'حسن دخيل أحمد سعدالله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (82, 'منذر اسماعيل محمد العمودي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (83, 'خالد علي عبد الله حجازي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (84, 'عمر أحمد محمد عقيلان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (85, 'زياد سلمان عياد الدباري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (86, 'رأفت يحيى نايف القططي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (87, 'سومه جمال اسماعيل الشلح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 987, 988, 1016, NULL, NULL);
INSERT INTO `employees` VALUES (88, 'الاء احمد هشام مصباح عيسى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (89, 'عبدالله أحمد عبدالله التلباني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (90, 'جابر عطوه سالم خطاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', 'شعبة مراكز التحفيظ -ذكور', 947, 956, 990, 1071, NULL, NULL);
INSERT INTO `employees` VALUES (91, 'اشرف عايش منصور ابو نصر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (92, 'عماد الدين عبد اللطيف محمود سيد احمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (93, 'أحمد محمد موسى الكحلوت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (94, 'إيمان علي محمد ابو حسان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (95, 'يونس محمد شامخ الدبس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (96, 'أيمن محمد خالد اليازجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (97, 'نشأت موسى فرج عوض الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (98, 'محمد عمر محمد ابو ديه', 'مكتب الوكيل', 'مكتب الوكيل', 'قسم السكرتاريا والأرشيف مكتب الوزير', NULL, 1041, 1041, 1128, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (99, 'اياس صباح عطيه ثابت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (100, 'سامي عبد الرحيم ابراهيم احمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (101, 'عمر محمد سلامه الشاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (102, 'محمد حسين أحمد ابوعامر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (103, 'يوسف محمد أحمد ابواسماعيل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (104, 'ايهاب خالد محمد الشرفا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (105, 'رامي سليم روبين سكيك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (106, 'مأمون محمد أحمد سليمان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (107, 'محمد خليل ماضي أبووردة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (108, 'غسان عبد الغني محمد قديح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (109, 'صابر عبد القادر سليمان فياض', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (110, 'نداء سالم سعيد الدايه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (111, 'مصطفى كمال مصطفى الملاحي', 'وحدة الزكاة والاغاثة', 'دائرة البحث الاجتماعي ', NULL, NULL, 955, 1048, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (112, 'محمد ابراهيم جبر ابو عوده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (113, 'نعيم هدهود حسين موسى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (114, 'ابراهيم عيسى ابراهيم صيدم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', NULL, NULL, 947, 987, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (115, 'زهير عمر طالب الزطمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (116, 'باسم عبد القادر صالح الصالحي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (117, 'عزيز حمدان محمد ابو عريبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (118, 'أيمن اسماعيل مسلم ابو بطيحان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (119, 'محمود أحمد خليل صوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (120, 'هاني اكرم حمدي اخزيق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (121, 'هاني أحمد علي علوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (122, 'سناء عبد الوهاب محمود ابو القرع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 980, 981, 982, NULL, NULL);
INSERT INTO `employees` VALUES (123, 'هشام صالح كامل عبدو', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', NULL, NULL, 948, 1026, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (124, 'مصطفى شعبان رضوان مشتهى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (125, 'يوسف عبد الله أحمد ابو عمرة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (126, 'عادل عبدالله سليمان التعبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (127, 'لؤي العبد محمد عواد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (128, 'محمود خضر أحمد خضير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (129, 'حسام محمد حسن علي حسين', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (130, 'عاهد عوني محمد أبو شعبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (131, 'مرفت عودة ابراهيم عبد الهادي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (132, 'اياد عيسى العبد المطوق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (133, 'دعاء قاسم علي الأسطل', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة أنظمة وتطبيقات الانترنت', 'قسم خدمات الويب وتكامل البيانات', NULL, 972, 978, 979, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (134, 'محمد محمد العبد مغوار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (135, 'حسام خالد رباح اليازجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (136, 'بشير يوسف سليمان ابو سريه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (137, 'حياة محمد سميح حسن ساكن', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (138, 'محمد خليل محمد ابو زرقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (139, 'زاهر فتحي ابراهيم عوض الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (140, 'محمد موسى محمد الزعنون', 'الإدارة العامة للشئون المالية', 'دائرة المشتريات', 'قسم المشتريات', NULL, 1182, 1146, 1147, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (141, 'محمد عايش سعيد رجب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (142, 'رأفت هاني مرعي الجايح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (143, 'جمال حسين عميره العمور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (144, 'محمد غسان أحمد ابو دقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (145, 'رائد ناصر عبد الرحمن ابو عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (146, 'علاء علي حسن كتوع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (147, 'محمد محمد مصطفى الزيان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (148, 'مها محمد أحمد الشوبكي', 'الادارة العامة للقرآن الكريم', 'دائرة القرآن الكريم -إناث', NULL, NULL, 974, 1121, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (149, 'اشرف زياد اسماعيل ريان', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (150, 'اياد حرب طالب النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (151, 'سالم عبد الرؤوف سالم الكفارنه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (152, 'ياسر محمد خليل شقوره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (153, 'جواد سليمان ابراهيم القايض', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (154, 'كواكب محمد مصلح السلطان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 980, 981, 1167, NULL, NULL);
INSERT INTO `employees` VALUES (155, 'فوزي عمر صالح القدوة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (156, 'أحمد محمود جميل دردونه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (157, 'عبدالله ممدوح عبدالله ابو عبيد', 'الادارة العامة للحج والعمرة', 'دائرة المتابعة', 'قسم الخدمات', NULL, 1100, 1165, 1166, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (158, 'انور أحمد حسني ابو شاويش', 'وحدة العلاقات العامة والإعلام', NULL, NULL, NULL, 948, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (159, 'سالم محمد سالم النحال', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (160, 'مشهور عطيه حسين حلحول', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (161, 'تحسين سميح ابراهيم المصري', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (162, 'أحمد قدوره حسن حموده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (163, 'طاهر حسن يحيى الزوم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (164, 'محمد كمال سالم سالم ديب', 'الادارة العامة للقرآن الكريم', NULL, NULL, NULL, 974, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (165, 'اسماعيل محمد خليل الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (166, 'محمود عماد يوسف بكير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (167, 'ابتسام شكري ديب الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (168, 'محمود محمد سالم الزماره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (169, 'ناديه حسين عبد الفتاح الغول', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة والإرشاد -اناث', NULL, NULL, 1035, 1075, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (170, 'نادي محمد سليمان ابو زر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (171, 'منير محمود عبد الرؤوف عبد الغفور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (172, 'هود موسى محمد مقاط', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (173, 'أكرم خليل محمد النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (174, 'محمد محمود سعيد اليازجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (175, 'رائد طلال عبد القادر شعت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (176, 'غسان سمير سعيد العكلوك', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (177, 'عبدالله زكريا طه شحادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (178, 'حسين اسعد أحمد الأسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (179, 'عزمي ابراهيم علي ابو طير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (180, 'علي محمد علي الشاوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد', NULL, 947, 956, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (181, 'سفيان علي محمد اليازوري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (182, 'محمد عبد اللطيف صالح صيام', 'وحدة الزكاة والاغاثة', 'دائرة البحث الاجتماعي ', 'قسم البحث الاجتماعي', NULL, 955, 1048, 1164, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (183, 'سميح كامل أحمد حجاج', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (184, 'وائل طلال ابراهيم سكيك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (185, 'نور الدين زهير حسين الشريف', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (186, 'اسماعيل عدلي بهجت سكيك', 'وحدة التعليم الشرعي', 'الدائرة العلمية', 'قسم الدراسات والبحوث الشرعية', NULL, 949, 1084, 1396, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (187, 'محمد يحيى محمد ابو نعمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (188, 'محمود محمد جمعه الطبش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (189, 'فؤاد فلاح عيد ياسين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الحسابات', 947, 952, 1011, 1163, NULL, NULL);
INSERT INTO `employees` VALUES (190, 'امجد زهير محمود عكاشه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (191, 'خالد محمد شعبان عبدالله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (192, 'عبد المنعم محمد عطا رجب الدبور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (193, 'ياسر حسن ابراهيم العفيفي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (194, 'محمود محمد رمضان السكني', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (195, 'أحمد محمد محمد زقوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (196, 'اميره زيدان ابراهيم خزيق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (197, 'محمد حازم محمد عبد المجيد حمدقه', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة أنظمة وتطبيقات الانترنت', 'قسم تطوير وتصميم الخدمات الالكترونية وتطبيقات الهواتف الذكية', NULL, 972, 978, 1162, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (198, 'اسامه عبد الهادي أحمد صيام', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (199, 'أنس رائد محمد الشرافي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (200, 'ابراهيم عطيه حسين فرج الله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (201, 'محمد نعيم بسيوني حسان', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم نظم المعلومات الجغرافية والمساحة', NULL, 967, 968, 969, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (202, 'يوسف محمد عبد العظيم عسليه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (203, 'طارق أحمد علي العمارين', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (204, 'ابراهيم محمد عبدالله النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (205, 'عبد الرزاق محمد عوض سليم صبره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد', NULL, 947, 952, 1373, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (206, 'عبد العال محمد عبد العال الاسطل', 'وحدة التعليم الشرعي', 'الدائرة العلمية', 'قسم التاهيل الشرعي والتطوير', NULL, 949, 1084, 1395, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (207, 'ناجي عامر فؤاد الجعفراوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (208, 'عيسى حرب أحمد شلوف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (209, 'سعيد مازن سعيد الدحبور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (210, 'حسام هشام عبد المجيد بدوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (211, 'عايد اسامه محمد ابو حسنين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (212, 'محمود رياض عبد المعطي رمضان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (213, 'مراد معين محمد ابو شرخ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور', NULL, 947, 956, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (214, 'محمد عادل يوسف الصرفندي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (215, 'شكران سعيد يحيى النجدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (216, 'طه محمود علي خلف الله', 'الادارة العامة للمساجد والمديريات', NULL, NULL, NULL, 947, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (217, 'بشرى محمد عبد الله صباح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (218, 'عدي صالح محمد معروف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (219, 'علا زياد يوسف الاسمر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (220, 'محمود محمد سميح حسن الرمادي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (221, 'علي أشرف خليل حمودة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (222, 'دعاء أحمد خليل مهدي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم التحفيظ', 'شعبة مراكز التحفيظ -اناث', 947, 956, 1358, 994, NULL, NULL);
INSERT INTO `employees` VALUES (223, 'عمر خالد محمود ابو عويلي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (224, 'علي عثمان حامد النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (225, 'انس اسماعيل سعيد رضوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (226, 'محمود عبد الكريم مصطفى جودة', 'وحدة التعليم الشرعي', 'الدائرة العلمية', 'قسم الدراسات والبحوث الشرعية', NULL, 949, 1084, 1396, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (227, 'زكريا غسان محمد ابو كميل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (228, 'عبد الرحمن عز الدين عبد الرحمن قفة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (229, 'عثمان فايق أحمد سليمان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (230, 'محمد شريف هاشم العشي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', 'شعبة الحسابات', 947, 980, 1086, 1380, NULL, NULL);
INSERT INTO `employees` VALUES (231, 'اسلام يونس موسى ابو مصطفى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, 'شعبة مراكز التحفيظ -اناث', 947, 961, NULL, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (232, 'محمد يونس أحمد العرجه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (233, 'عمر امين ابراهيم ابو عبيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (234, 'فداء أحمد صالح ابو موسى', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (235, 'وفاء رياض حمد طافش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', NULL, 947, 952, 983, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (236, 'خالد خليل ربيع دردونه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (237, 'موسى يزيد موسى زعرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (238, 'مفيد عبد اللطيف جبريل ابوعيطة', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (239, 'ايمان سمير عبد الرحمن ابو طعيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (240, 'عمر عدنان موسى  يوسف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (241, 'خليل طلال محمد خلف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (242, 'شعبان ناهض شعبان صبيح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (243, 'نجاح محمد سليمان الافرنجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الدعوة والارشاد الوسطى', 'شعبة الدعوة المسجدية', 947, 956, 1342, 1343, NULL, NULL);
INSERT INTO `employees` VALUES (244, 'احمد نبيل عوده الشكري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (245, 'هاني زياد عبد الفتاح منصور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الدعوة والارشاد', NULL, 947, 980, 1378, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (246, 'حسن محمد حسن ظاهر', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'قسم التعليم المستمر وخدمة المجتمع', NULL, 949, 1062, 1407, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (247, 'نور فايز ربيع سويدان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', NULL, 947, 980, 981, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (248, 'أحمد عبد الله سليمان أبو جزر', 'الإدارة العامة للشئون المالية', 'دائرة الموازنة والتدقيق', NULL, NULL, 1182, 1029, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (249, 'خليل زياد محمد المسحال', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (250, 'بثينه علي عوده الله العرجا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (251, 'اسلام محمد محمود الفقعاوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (252, 'أحمد يونس يوسف البهنساوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (253, 'نادر توفيق سعيد رضوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (254, 'الاء روحي زهدي دويدار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي', NULL, 947, 956, 981, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (255, 'حازم نادر عبد القادر الكرد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الدعوة والارشاد الوسطى', NULL, 947, 956, 1342, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (256, 'موسى محمد موسى ضهير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (257, 'صالح يوسف محمد البيوك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (258, 'حسن نافذ فضل نصار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (259, 'أحمد عدنان عبد العزيز عابدين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (260, 'جهاد عطا محمود الهرباوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (261, 'أحمد بشير محمد عدوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (262, 'بلال يوسف محمد اللحام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (263, 'عبد الكريم محمود فايق أبو شعبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (264, 'فوزيه فريد فرج زياره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (265, 'طارق قاسم سليمان ابو خضير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الدعوة والارشاد الوسطى', NULL, 947, 956, 1342, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (266, 'محمود عوض رزق الشافعي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (267, 'محمد كامل محمود ابو مصطفى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (268, 'أحمد فؤاد حسن ياسين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', NULL, 947, 956, 990, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (269, 'محمود جبرين صياح ابو العيش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (270, 'انعام عبد الخالق عبد العزيز عبيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', NULL, 947, 987, 988, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (271, 'محمد عزمي كامل ابو الشعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة القراءات القرآنية', 947, 952, 1053, 1058, NULL, NULL);
INSERT INTO `employees` VALUES (272, 'خالد حسني عبد الرحمن ابو شاويش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (273, 'صفاء حسن حسين المشهراوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (274, 'محمود سليمان محمد ابو غياض', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (275, 'بسام ابراهيم زكي ابو بركه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (276, 'أحمد خليل ابراهيم سالم', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'قسم الخدمات العامة', NULL, 949, 1062, 1409, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (277, 'عبدالله توفيق خليل الكولك', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم ديوان الوزارة', NULL, 1172, 975, 1226, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (278, 'محمود محمود سعيد رزق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (279, 'اسماء عمر علي دحلان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (280, 'نسيبه عبد القادر خليل الجدي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة الدعوة المسجدية', 947, 956, 993, 1133, NULL, NULL);
INSERT INTO `employees` VALUES (281, 'يحيى عبد المجيد عبدالله ابو مهادي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (282, 'انسام حسين حسني ابو رزق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (283, 'سهام جمعه خليل برهوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (284, 'عبد المجيد قاسم محمد الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (285, 'محمد فتحي عبدالله ناجي', 'وحدة العلاقات العامة والإعلام', 'دائرة العلاقة العامة', 'قسم الشكاوى', NULL, 948, 1031, 1159, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (286, 'طارق فؤاد عبد الله ابوعويمر', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (287, 'أحمد طلال محمد جبر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (288, 'انس رياض سعيد ابو شرخ', 'وحدة تنمية أموال الوقف', 'دائرة مشاريع الوقف', 'قسم دراسات الجدوى', NULL, 977, 1104, 1316, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (289, 'أحمد سليم سليمان ابو عنزه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (290, 'محمد سليم سليمان ابو عنزه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (291, 'أحمد حموده محمد ابو طه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (292, 'عبد الله سليمان طه عبدالغفور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (293, 'اسراء محمد عبد الفتاح سلامة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (294, 'روضة محمد محسن الشاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (295, 'محمود عبد الجواد أحمد الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (296, 'عبد الله امين حسين المغير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 987, 1010, 1158, NULL, NULL);
INSERT INTO `employees` VALUES (297, 'ياسمين حمدي صبري حمدان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (298, 'يوسف غانم يوسف ابو معيلق', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة المجتمعية والالكترونية', NULL, NULL, 1035, 1036, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (299, 'رفعت عصمت محمود حسنين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (300, 'وائل عمر علي بشير', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (301, 'رائد خالد علي اللوح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (302, 'عمر محمود خليل ابو دف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (303, 'باسم فتحي محمود حجازي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', NULL, 947, 961, 1373, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (304, 'ساميه محمد سالم الشيخ عيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', NULL, 947, 987, 988, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (305, 'أحمد نعيم حامد ابو شرخ', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (306, 'عادل عايش نايف حسنين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (307, 'منتصر عبد الباري محمد الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', NULL, 947, 961, 1076, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (308, 'محمد رزق عبد الكريم كلاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (309, 'انس رياض مصباح لبد', 'وحدة التخطيط وتطوير الأداء المؤسسي', NULL, NULL, NULL, 966, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (310, 'عمر أحمد دياب شويدح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (311, 'ميساء أحمد حسين الاغا', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (312, 'هناء عصام محمد البرش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (313, 'ايهاب محمد حسن حمدان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (314, 'محمد نبيل عطيه زقوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (315, 'امل سمير عبد الرازق صلاح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (316, 'عبد الرحمن زياد محمد المسحال', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (317, 'ماجد ابراهيم محمد الزحوق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (318, 'ابراهيم سليمان سماره المصري', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم نظم المعلومات الجغرافية والمساحة', NULL, 967, 968, 969, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (319, 'يوسف عادل أحمد ابوجاموس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (320, 'مصعب موسى مسلم الحشاش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (321, 'عبدالله اسامه يوسف الجزار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (322, 'اسراء ملاذ شعبان عجور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', NULL, 947, 952, 983, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (323, 'اماني عبد الله محمد اسليم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي', NULL, 947, 952, 981, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (324, 'حنان وائل اسماعيل حجي', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة والإرشاد -اناث', 'قسم الدعوة المجتمعية', NULL, 1035, 1075, 1370, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (325, 'اسماعيل خالد محمد الشاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (326, 'سيف الله خالد محمود السمري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (327, 'علاء طلال موسى الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', 'شعبة شؤون الموظفين والعاملين', 947, 961, 1082, 1156, NULL, NULL);
INSERT INTO `employees` VALUES (328, 'انور اسعد عبد ربه الغوطي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (329, 'محمد توفيق شريف الزين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (330, 'محمد معمر عبد المعطي الشرفا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (331, 'علاء محمد علي عسليه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (332, 'عبد الرحيم أحمد حسين عابد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (333, 'محمد زكي شحادة حمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (334, 'البراء أحمد عبد الخالق خلة', 'الادارة العامة للقرآن الكريم', NULL, NULL, NULL, 974, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (335, 'ابراهيم أحمد محمد حموده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (336, 'محمد نجيب الله يوسف سعيد المصري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (337, 'محمد أحمد عودة أبو خوصة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد', NULL, 947, 956, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (338, 'عبد الله نظمي صالح ابو جلاله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (339, 'محمد أحمد رمضان كلاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (340, 'صهيب عبد اللطيف حسن سالم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (341, 'مصطفى عبد الرحمن محمد جرغون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (342, 'علي عبد الناصر محمد شعبان عيد', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (343, 'جهاد رياض داود ابوعيادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (344, 'محمد سفيان اسماعيل رضوان', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (345, 'محمد يحيى صالح معروف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (346, 'عبدالله وليد حماده النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', NULL, 947, 961, 1373, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (347, 'محمد فايز حسين الغول', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (348, 'بلال محمد سليمان ابو طير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (349, 'عمر عودة خليل الهندي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (350, 'هاني عبد الحميد صالح الخضري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (351, 'اسماعيل أحمد خليل الكحلوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (352, 'ايمان بسام عبد العزيز ابوسعدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (353, 'ماهر اسماعيل رفيق الفرا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (354, 'جمال محمد سيد العقاد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (355, 'محمد عصام علي الخطيب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (356, 'عمار عدنان سالم ابو خشم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (357, 'احسان ماجد خليل ابو درابي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (358, 'جهاد أحمد اسماعيل قزاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (359, 'أحمد سعيد محمد فتوح', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم القناة الالكترونية', NULL, 948, 1026, 1080, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (360, 'محمد طلال محمد القريناوي', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (361, 'محمد حسن عبدالرحمن القاضي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (362, 'أيمن سليم عبد الفتاح حماد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (363, 'ضياء مصباح محمد زقوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (364, 'جلال عادل جلال ابو صايمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (365, 'علي عبد الله علي لبد', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', NULL, NULL, NULL, 972, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (366, 'اسلام رائد محمود معمر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (367, 'محمود عطفت شعبان ابوالعمرين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (368, 'أحمد نعيم حسني ثلجي', 'الادارة العامة للمساجد والمديريات', 'دائرة متابعة المساجد', NULL, NULL, 947, 1450, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (369, 'عبد الكريم عبد الله عبد طباسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 987, 1387, 1155, NULL, NULL);
INSERT INTO `employees` VALUES (370, 'محمد رمضان يوسف اليازوري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (371, 'محمد يحيى سلامه ابوصيام', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (372, 'عبد الفتاح فتحي عبد الفتاح البغدادي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الأملاك الوسطى', NULL, 947, 956, 1154, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (373, 'ابراهيم فتحي سلمان ابو جامع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (374, 'غسان تيسير ابراهيم قويدر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (375, 'عواد عايش عواد عواد', 'وحدة التخطيط وتطوير الأداء المؤسسي', NULL, NULL, NULL, 966, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (376, 'عبد الله أحمد عبدالله النجار', 'وحدة تنمية أموال الوقف', 'دائرة الاستثمار', 'قسم الاستثمار المالي', NULL, 977, 1152, 1153, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (377, 'ريهام حسام محمد البياع', 'الادارة العامة للقرآن الكريم', NULL, NULL, NULL, 974, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (378, 'محمد حسين منسي الترتوري', 'وحدة التخطيط وتطوير الأداء المؤسسي', 'دائرة تطوير الأداء المؤسسي', 'قسم تنمية الموارد البشرية', NULL, 966, 1108, 1273, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (379, 'أحمد سهيل محمود مشتهى', 'الادارة العامة للحج والعمرة', 'دائرة الحج والعمرة وتأهيل الشركات', 'قسم التفتيش والتقويم', NULL, 1100, 1101, 1199, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (380, 'ابراهيم نزار شفيق المغاري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (381, 'بلال محمود مسلم الشاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (382, 'انس عبد عبد السلام دهليز', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', 'شعبة شؤون الموظفين والعاملين', 947, 987, 1113, 1151, NULL, NULL);
INSERT INTO `employees` VALUES (383, 'محمود جهاد حسن مدوخ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (384, 'بلال سعيد مصطفى دبابش', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (385, 'خالد وليد هاشم العجل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (386, 'محمد يونس أحمد ماضي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (387, 'طلال محمد ابراهيم خلف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (388, 'عبد الرحمن حلمي محمد صالح عايش', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (389, 'طارق علي محمود ابو عريبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', NULL, 947, 956, 990, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (390, 'صالح علي محمد النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (391, 'محمد شوقي فايز فسيفس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (392, 'أحمد محمود نايف زعرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (393, 'فراس فؤاد رواي الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (394, 'شادي محمود حلمي عابد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة شؤون الموظفين والعاملين', 947, 952, 1011, 1150, NULL, NULL);
INSERT INTO `employees` VALUES (395, 'محمد زكريا حسن حويله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', 'شعبة شؤون الموظفين والعاملين', 947, 980, 1086, 1087, NULL, NULL);
INSERT INTO `employees` VALUES (396, 'بلال صبري محمود ابو طاقيه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', NULL, 947, 952, 1011, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (397, 'اسلام عبدالله لطفي الهمص', 'الادارة العامة للمساجد والمديريات', NULL, NULL, NULL, 947, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (398, 'عبد الله نافذ مديرس ابوعوكل', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (399, 'هنيه سهيل سليمان ابو شحمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (400, 'خالد محمد خليل ابو كميل', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (401, 'اسامه عصام محمد ابووردة', 'الادارة العامة للقرآن الكريم', 'دائرة القراءات القرآنية', 'قسم الدورات والقراءة والإقراء', 'شعبة القراءة والاقراء', 974, 1110, 1111, 1112, NULL, NULL);
INSERT INTO `employees` VALUES (402, 'محمد محي الدين عثمان ابو زايده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', 'شعبة شؤون الموظفين والعاملين', 947, 980, 1086, 1087, NULL, NULL);
INSERT INTO `employees` VALUES (403, 'أحمد عوني أحمد الكريري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (404, 'ابراهيم حرب عودة الشلالفه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (405, 'جهاد أحمد سالم براك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة الخدمات', 947, 956, 957, 1336, NULL, NULL);
INSERT INTO `employees` VALUES (406, 'محمد رياض شكري العجل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (407, 'محمد سليم علي ابو حجر', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (408, 'اسيا عبد العزيز علي حمدان', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (409, 'محمد مجدي هاشم العجل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (410, 'سراج شعيب حسين البحابصه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (411, 'اسيل عبد الفتاح أحمد النجار', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (412, 'محمد حسن ياسين سكيك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (413, 'محمد محمد عبد العزيز ابو حصيره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (414, 'ياسمين يونس دياب العجله', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة البرمجيات وإدارة قواعد البيانات', 'قسم تحليل وتصميم النظم وإدارة قواعد البيانات', NULL, 972, 1131, 1144, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (415, 'مرزوق أحمد مرزوق جرغون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', NULL, 947, 961, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (416, 'جمال محمد عبد الرحمن العبادله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (417, 'أحمد علي عبدالله السميري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (418, 'أيمن عبدالله أحمد زيدان', 'وحدة الرقابة الداخلية', NULL, 'قسم الرقابة الادارية', NULL, 1072, NULL, 1149, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (419, 'عمر احسان عوني عاشور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (420, 'صلاح عامر صلاح المبيض', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (421, 'صلاح طارق يوسف الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (422, 'خالد خليل محمد عبيد', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (423, 'محمد هشام عبد الحميد حمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (424, 'محمود نايف محمود المقوسي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (425, 'عوض جبر عوض شلح', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (426, 'طارق محمد جبر شعبان الصفدي', 'وحدة التعليم الشرعي', 'الدائرة العلمية', 'قسم الدراسات والبحوث الشرعية', NULL, 949, 1084, 1396, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (427, 'سامي خالد السيد ابو هاشم', 'الإدارة العامة للأملاك الوقفية', NULL, NULL, NULL, 967, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (428, 'ابراهيم عبد الرحمن سلمان دويمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (429, 'ابراهيم عبد الله شحده ابو الحسنى', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (430, 'عبدالله محمد رشاد الشرفا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (431, 'أحمد محمد محمد شرف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (432, 'محمود فراس محمد الأسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (433, 'مصعب عادل محمد خضير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (434, 'صلاح باسم عودة عجور', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم الاشراف الهندسي', NULL, 967, 968, 1137, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (435, 'عبدالله سلمان نصر الدايه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (436, 'ابراهيم خالد خميس ابو ربيع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (437, 'عبد الكريم زياد محمد الخطيب', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة المجتمعية والالكترونية', 'قسم الدعوة الالكترونية', NULL, 1035, 1036, 1037, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (438, 'محمد عمر محمود العزامي', 'الادارة العامة للقرآن الكريم', 'دائرة القراءات القرآنية', 'قسم الدورات والقراءة والإقراء', NULL, 974, 1110, 1111, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (439, 'محمد فؤاد محمود العجل', 'الإدارة العامة للشئون المالية', 'دائرة المشتريات', 'قسم المشتريات', NULL, 1182, 1146, 1147, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (440, 'أحمد سليمان عبد ابو عرام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (441, 'موسى محمود موسى زعرب', 'وحدة الرقابة الداخلية', NULL, 'قسم الرقابة الفنية', NULL, 1072, NULL, 1074, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (442, 'ايمان يوسف ابراهيم السكني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 980, 981, 982, NULL, NULL);
INSERT INTO `employees` VALUES (443, 'أحمد سليمان عبدالله ابويوسف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (444, 'مصعب اشرف عبد السلام طباسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (445, 'محمد زياد محمد الناجى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (446, 'طارق زياد خليل النجار', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (447, 'أحمد محمد عبدالله ابو راس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة القراءات القرآنية', 947, 952, 1053, 1058, NULL, NULL);
INSERT INTO `employees` VALUES (448, 'ايمان جميل سليمان ادغيش', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (449, 'عبد اللطيف محمد عواد الرياطي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (450, 'علي توفيق محمد العبادله', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (451, 'لؤي محمود محمد الشوربجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (452, 'محمد محمود محمد عياد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', NULL, 947, 956, 957, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (453, 'محمد نصري سالم الناعوق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', NULL, 947, 956, 990, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (454, 'هدى زاهر اسماعيل احمد', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (455, 'أحمد ماهر محمد غزال عجور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (456, 'محمد عاطف حسن شاهين', 'الإدارة العامة للشئون المالية', 'دائرة الحسابات والايرادات', 'قسم المحاسبة', NULL, 1182, 1042, 1141, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (457, 'عبد الرحمن زكي شحادة حمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (458, 'ماهر حسني أحمد منصور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (459, 'رائد حمد محمود اضهير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (460, 'ولاء حسونه محمد السيقلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (461, 'جهاد هشام حسن رضوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (462, 'محمد عوني وصفي الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (463, 'جهاد محمد اسحاق شراب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (464, 'محمد زياده مصطفى صيام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (465, 'أحمد محمود أحمد العامودي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (466, 'عبدالله محمد زكي أبو هلال', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (467, 'خالد سليمان ابراهيم الزاملي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (468, 'ناصر كمال محمد المصري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (469, 'دعاء محمود عبدالله الغمري', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (470, 'نسرين كمال كامل مقداد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 987, 988, 989, NULL, NULL);
INSERT INTO `employees` VALUES (471, 'اسماء رجب سالم ابو صالح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (472, 'سليمان نصر الله سليمان البريم', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (473, 'عبد الله انور روبين زينو', 'الإدارة العامة للشئون المالية', 'دائرة المخازن', 'قسم المخازن الرئيسية والفرعية', NULL, 1182, 1038, 1068, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (474, 'هيثم خليل جمعة اللوح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', NULL, 947, 956, 957, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (475, 'كامله عطا الله علي ابو نصير', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (476, 'فايز محمود سلام ابو منديل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (477, 'عزام ناصر عودة قديح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (478, 'احمد طارق حسني رشيد ابو شباك', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (479, 'بلال صبحي أحمد الصادي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (480, 'صقر ماجد عبدالله ابو حجر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (481, 'حسام سامي عبد القادر السمنه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (482, 'كفاح حسام رجب عكيلة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (483, 'ناديه حسين حامد اشبير', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (484, 'أحمد اعبيد مسلم النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', NULL, 947, 961, 1373, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (485, 'فاطمه مصطفى محمود ابو موسى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي', NULL, 947, 956, 981, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (486, 'محمد حمدي عبدالرحمن الكحلوت', 'وحدة الزكاة والاغاثة', 'دائرة البحث الاجتماعي ', 'قسم البحث الاجتماعي', NULL, 955, 1048, 1164, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (487, 'محمد زهير محمد الهسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (488, 'محمد حسين ابراهيم الكرش', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', NULL, NULL, NULL, 972, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (489, 'عبد الرحمن جهاد عبد الرحمن البيوك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (490, 'محمد رسمي سالم شنينو النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (491, 'خالد رمضان محمد ابو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (492, 'ابراهيم حنضل أحمد الشاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (493, 'ثائر فارس عطا الهباش', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', NULL, 'قسم تطوير وتصميم الخدمات الالكترونية وتطبيقات الهواتف الذكية', NULL, 972, NULL, 1162, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (494, 'محمد محمد صالح العجله', 'الوكيل', 'مكتب الوكيل', NULL, NULL, 1300, 1041, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (495, 'اسماء وفيق محمد ابو مطر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (496, 'حسن محمود حسن الضابوس', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'قسم الاشراف والانشطة', NULL, 949, 950, 1393, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (497, 'عبد الرحمن عون عبد عاشور', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (498, 'هدى توفيق خليل الحصيني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (499, 'طارق رياض جودت سكيك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (500, 'منتصر اياد خلوصي خيال', 'وحدة الرقابة الداخلية', 'دائرة الرقابة المالية', 'قسم الرقابة علي النفقات', NULL, 1072, 1210, 1311, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (501, 'محمد علي مطاوع الدايه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (502, 'بلال محمد محمود زقوت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (503, 'باجس فتحي حسين ناصر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (504, 'علي خالد علي هاشم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', 'شعبة الصيانة', 947, 980, 1086, 1173, NULL, NULL);
INSERT INTO `employees` VALUES (505, 'ابراهيم ماهر صبري المطوق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (506, 'اديب محمد عبد المجيد عفانة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (507, 'محمد حمدان عبد الله الصوفي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (508, 'معتز سلامه محمود ضهير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (509, 'فاطمه يوسف محمد ابو مسامح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (510, 'عمرو خالد عبد الفتاح حماد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (511, 'دعاء فخري ابراهيم البحيصي', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (512, 'زاهر أحمد مرزوق جرغون', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (513, 'ابراهيم علي محمد اصليح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', NULL, 947, 961, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (514, 'محمود محمد مسلم ابو خشان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', NULL, 947, 961, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (515, 'هاني يوسف عبد الرحمن أبو الخير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (516, 'عطوه محمد عطوه القريناوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (517, 'علاء سليم فرحان النباهين', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم الاشراف الهندسي', NULL, 967, 968, 1137, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (518, 'فرج جمال صالح الفيومي', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم هندسة الصوت', NULL, 948, 1026, 1050, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (519, 'جميل كمال جميل السلطان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (520, 'محمد يوسف عيسى شملخ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (521, 'محمود بشير يوسف الايوبي', 'وحدة العلاقات العامة والإعلام', 'دائرة الاعلام ', 'قسم المونتاج', NULL, 948, 970, 971, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (522, 'زكريا ابراهيم زهدي الشوبكي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (523, 'جهاد محمد رمضان الحناوي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (524, 'محمود خليل محمد مطر', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة أنظمة وتطبيقات الانترنت', NULL, NULL, 972, 978, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (525, 'خالد خليل ابراهيم ابو السعود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (526, 'أحمد عماد محمد الزعنون', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', NULL, NULL, 967, 968, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (527, 'يوسف أحمد محمد الديري', 'الادارة العامة للمساجد والمديريات', 'دائرة التراث الاسلامي', 'قسم المكتبات', NULL, 947, 1105, 1366, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (528, 'حمدان اسماعيل سلمان طباسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', NULL, 947, 961, 1373, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (529, 'عمار رفيق ابراهيم حبيب', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (530, 'هدى عوض الله سويلم ابو فسيفس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (531, 'ريهام يونس أحمد ابو دوابه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة القراءات القرآنية', 947, 956, 993, 1028, NULL, NULL);
INSERT INTO `employees` VALUES (532, 'ابراهيم محمد محمد  الهسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (533, 'أحمد يعقوب موسى الأسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (534, 'مؤمن محمد سليمان الحاج', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الورش', NULL, 1172, 985, 1134, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (535, 'محمد رفيق سالم مصبح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (536, 'صباح روحي حسين صالحه', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (537, 'اسامه نعيم يونس السوسي', 'وحدة الشؤون القانونية', NULL, 'قسم القضايا', NULL, 944, NULL, 945, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (538, 'هالة رمضان ديب العصار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة الدعوة المسجدية', 947, 956, 993, 1133, NULL, NULL);
INSERT INTO `employees` VALUES (539, 'بكر سليمان ابراهيم الزاملي', 'الادارة العامة للمساجد والمديريات', 'دائرة التراث الاسلامي', 'قسم المكتبات', NULL, 947, 1105, 1366, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (540, 'نور رياض عبد الفتاح عيد', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (541, 'محمد حسن أحمد الغزالي', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة البرمجيات وإدارة قواعد البيانات', 'قسم أمن خوادم الويب والبيانات', NULL, 972, 1131, 1132, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (542, 'نهيل سعدي محمد الواديه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (543, 'جهاد ابراهيم عطوه ابوعواد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (544, 'اسلام ديب بكر قنيطه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (545, 'عبد الرحمن سلمان نصر الدايه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (546, 'أحمد اكرم العبد علوان', 'الإدارة العامة للأملاك الوقفية', 'دائرة الأملاك', 'قسم قواعد بيانات الوقف', NULL, 967, 1117, 1129, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (547, 'محمود فضل محمود عياد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (548, 'عماد محمد صبحي بهار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (549, 'محمد كمال محمد السوسي', 'مكتب الوكيل', 'مكتب الوكيل', 'قسم السكرتاريا والأرشيف مكتب الوزير', NULL, 1041, 1041, 1128, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (550, 'محمود غازي محمد الخروبي', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (551, 'طارق أحمد خميس أبو يونس', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', NULL, NULL, 1172, 975, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (552, 'عبد الرحمن عمر رباح قويدر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (553, 'وجدان محمد كايد النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (554, 'محمد عبد الباري محمد خله', 'وحدة التعليم الشرعي', 'الدائرة العلمية', 'قسم الدراسات والبحوث الشرعية', NULL, 949, 1084, 1396, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (555, 'حمدي أيمن سليمان وادي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', NULL, 947, 961, 1076, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (556, 'محمود امين محمود ابو عميرة', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (557, 'أحمد فتحي أحمد ابو قمر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', NULL, 947, 980, 1017, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (558, 'اسامه سلامه يوسف حسين علي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (559, 'محمد أحمد عياده سالم داود', 'وحدة المشاريع والتعاون الدولي', NULL, NULL, NULL, 1206, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (560, 'رمزي عامر اسماعيل حمو', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (561, 'محمد يوسف عاشور نصار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (562, 'كامل يوسف سلمان بركة', 'وحدة تنمية أموال الوقف', NULL, NULL, NULL, 977, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (563, 'دعاس جلال سعيد قدوم', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (564, 'عبد الله عطيه محمد جودة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (565, 'محمد صهيب سليمان سلام الرومي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (566, 'سلمى جميل محمد يونس', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (567, 'حسام توفيق محمد النفار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة القراءات القرآنية', 947, 952, 1053, 1058, NULL, NULL);
INSERT INTO `employees` VALUES (568, 'اسراء جهاد فوزي صالح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (569, 'حازم محمود السبع ابو حليمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (570, 'هبه حسين اسماعيل زعرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة ديوان الحفاظ', 947, 987, 988, 1126, NULL, NULL);
INSERT INTO `employees` VALUES (571, 'رنا أحمد محمد العدلوني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (572, 'صبحي رمضان محمد الحداد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (573, 'أحمد ابراهيم سليمان الزاملي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (574, 'محمد سمير خليل الحتو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (575, 'ايمان محمود محمد الفرا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (576, 'حمزه زكريا ابراهيم ابو وطفه', 'وحدة شؤون القدس', NULL, NULL, NULL, 1423, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (577, 'محمد ناصر عبد القادر مصطفى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (578, 'محمد شمس الدين محمد ديب قوصه', 'وحدة العلاقات العامة والإعلام', 'دائرة العلاقة العامة', NULL, NULL, 948, 1031, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (579, 'الاء محمد حسن الزيناتي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (580, 'محمد زياد صالح ابو عصر', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (581, 'محمد جمال عطيه بنات', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (582, 'عماد الدين نبيل عطيه الزقوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (583, 'ابراهيم محمد محمود عبده', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'قسم شؤون الطلبة', NULL, 949, 1062, 1123, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (584, 'سليمان تيسير عبدالله عزيز', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (585, 'حاتم عماد محمد  الهسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (586, 'أحمد محمد عبد اللطيف المزين', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (587, 'لمياء خضر خليل ابو شماله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (588, 'محمد نبيل أحمد مسلم', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم نظم المعلومات الجغرافية والمساحة', NULL, 967, 968, 969, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (589, 'ريم صالح اشتيوي ابو عمرة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', NULL, 947, 987, 988, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (590, 'علا عبد سليم ابو سكر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة مراكز التحفيظ -اناث', 947, 956, 993, 994, NULL, NULL);
INSERT INTO `employees` VALUES (591, 'ياسر محمود حسن عبد الرحمن', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد', NULL, 947, 956, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (592, 'محمد محمد عقيل شعبان لولو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (593, 'تغريد صلاح خميس ابو جلاله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (594, 'حسين أحمد حسين حمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (595, 'منى سلامه حسن شلدان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (596, 'محمد اسماعيل أحمد سويدان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (597, 'محمد حسين محمود الغلبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (598, 'أحمد محمد حسن الجبور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', NULL, 947, 987, 1113, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (599, 'عبد الله حيدر محمد غباين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (600, 'محمد فريد صابر نصير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (601, 'عمر وليد سلامه الحداد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (602, 'عماد فتحي عوض اللخاوي', 'الوكيل', 'مكتب الوكيل', NULL, NULL, 1300, 1041, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (603, 'صلاح نور الدين ابراهيم نور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (604, 'ايات محمود عبدالله ابومعمر', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (605, 'اسامه زكي محمد ابو رحمه', 'الإدارة العامة للأملاك الوقفية', 'دائرة الأملاك', 'قسم متابعة الأملاك', NULL, 967, 1117, 1118, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (606, 'محمد يوسف محارب ابو مخده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (607, 'اسماعيل يوسف سليمان درويش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة الخدمات', 947, 956, 957, 1336, NULL, NULL);
INSERT INTO `employees` VALUES (608, 'مجاهد جمال حسين الشاويش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (609, 'دعاء محمد سميح حسن ناصر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (610, 'ابراهيم جمال محمد النحال', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة المسجدية', 'قسم الأئمة', NULL, 1035, 1069, 1070, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (611, 'محمد تيسير عبد اللطيف الغوطي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (612, 'عبدالله فؤاد محمد خلف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (613, 'عائد رمزي ابراهيم أبو غليون', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (614, 'رمضان جميل رمضان النيرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (615, 'سلمان حسان سلمان الملاحي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (616, 'حمدي زياد حمدان المدهون', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم هندسة الصوت', NULL, 948, 1026, 1050, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (617, 'انس أحمد محمد الشواف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (618, 'محمد معين نايف العقاد', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (619, 'مصعب يوسف محمد درويش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (620, 'صلاح الدين زياد عمر الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (621, 'حسام يوسف حسن النجار', 'وحدة التخطيط وتطوير الأداء المؤسسي', 'دائرة تطوير الأداء المؤسسي', 'قسم تنمية الموارد البشرية', NULL, 966, 1108, 1273, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (622, 'مصطفى نصر محمود المقوسي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (623, 'محمود جمعه ابراهيم الباشا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (624, 'أحمد علي محمد أبو شريعه', 'الادارة العامة للمساجد والمديريات', 'دائرة التراث الاسلامي', 'قسم المخطوطات', NULL, 947, 1105, 1115, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (625, 'اسماء حسن علي نجم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (626, 'ياسر عبد الغفار حسين اسعد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة الخدمات', 947, 956, 957, 1336, NULL, NULL);
INSERT INTO `employees` VALUES (627, 'همام جمال محمد ابو حصيره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (628, 'ياسين حسن ياسين ابو حبل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (629, 'غسان محمود محمد الشوربجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (630, 'محمد محمد حلمي عيسى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (631, 'محمود حسن علي علوش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (632, 'طارق رائد جميل الصعيدي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (633, 'أحمد علي موسى رزقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الأملاك', NULL, 947, 980, 1099, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (634, 'محمد عبد الفتاح سميح ابو غالي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', NULL, 947, 987, 1113, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (635, 'سميره علي عليان ابو رحمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (636, 'محمد توفيق محمد سماره', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'قسم مركز الحاسوب', NULL, 949, 1025, 1422, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (637, 'عبد الله رمضان حافظ النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (638, 'محمد عبد العزيز محمد النجار', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم البرامج', NULL, 948, 1026, 1027, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (639, 'محمود ابراهيم خليل دبور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (640, 'محمد راتب شحده ابو زرقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (641, 'يوسف خضر عرفات عرفات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (642, 'ايهاب محمد محمود ابو رحمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (643, 'محمد سالم ديب عبد الحليم', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (644, 'فاطمه خليل محمود بركه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (645, 'أحمد محمد أحمد بشير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (646, 'أحمد خضر حسين ابو حمدان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (647, 'منار سعيد رشاد العسلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (648, 'دعاء نزار حسن دوله', 'الادارة العامة للقرآن الكريم', 'دائرة القراءات القرآنية', NULL, NULL, 974, 1110, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (649, 'نرمين سيد عاشور الحواجري', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (650, 'خولة علي محمود حراره', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'نائب العميد للشؤون الادارية والمالية', NULL, 949, 1025, 1415, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (651, 'محمد صالح عطيه الغلبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (652, 'عبد الرحمن بسام أحمد عسقول', 'الادارة العامة للقرآن الكريم', 'دائرة القراءات القرآنية', 'قسم الدورات والقراءة والإقراء', 'شعبة القراءة والاقراء', 974, 1110, 1111, 1112, NULL, NULL);
INSERT INTO `employees` VALUES (653, 'حمزه عبد الكريم صقر الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (654, 'أحمد عاطف جمال مشتهى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (655, 'علاء برهم علي ابو دراز', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (656, 'محمد يوسف جمعه سلامة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (657, 'همام علي حسن شريم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (658, 'أحمد حامد محمد ابو وطفه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (659, 'أحمد عبد الباسط سيد ضهير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (660, 'ابراهيم سلمان رزق الجعفري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (661, 'جمال عقيلان محمد سيد احمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (662, 'محمود زهير سعيد الكردي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (663, 'اسراء عدنان فهمي ابو عاصي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (664, 'محمد صلاح صالح القريناوي', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (665, 'صخر عطا عبدالله الرضيع', 'وحدة التخطيط وتطوير الأداء المؤسسي', 'دائرة السياسات والتخطيط', 'قسم الاحصاء والمعلومات', NULL, 966, 1088, 1106, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (666, 'عبد الكريم رضوان أحمد الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (667, 'عبد الفتاح فتحي عبد الفتاح حموده', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (668, 'عبد اللطيف فايز عبد اللطيف الشلفوح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (669, 'مؤمن ابراهيم عبد العزيز ابو شريعه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (670, 'أيمن أحمد اسماعيل عياد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', NULL, 947, 952, 1053, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (671, 'محمد نبيل أحمد خطاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (672, 'وسيم سليمان داود طالب', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم التنسيق والمتابعة', NULL, 948, 1026, 1109, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (673, 'ايات حسن حسين عاشور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (674, 'علاءالدين رمضان رزق الزهارنه', 'الإدارة العامة للأملاك الوقفية', 'دائرة المقابر', NULL, NULL, 967, 1065, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (675, 'محمد حسن محمود لافي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (676, 'فيصل سهيل مطر مزيد', 'وحدة شؤون القدس', 'دائرة الانشطة والفعاليات', 'قسم التنسيق مع المؤسسات', NULL, 1423, 1435, 1446, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (677, 'اسامه فوزي سليمان الناقه', 'الإدارة العامة للشئون المالية', 'دائرة الحسابات والايرادات', 'قسم الخزينة', NULL, 1182, 1042, 1043, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (678, 'بسمه محمد أحمد فياض', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'قسم شؤون الموظفين', NULL, 949, 1025, 1107, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (679, 'دارين سالم عوض محيسن', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (680, 'سليمان محمد علي بشير', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (681, 'أحمد محمد عبدالرحمن الفراني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (682, 'حسام نصر محمد البحيصي', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (683, 'ايمان سليمان فرج ابوجاموس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 987, 988, 1078, NULL, NULL);
INSERT INTO `employees` VALUES (684, 'امجد بشير زكي ابو حميده', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم الدوام والاجازات', NULL, 1172, 975, 1066, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (685, 'بشار صيام يوسف حمد', 'وحدة التخطيط وتطوير الأداء المؤسسي', 'دائرة السياسات والتخطيط', 'قسم الاحصاء والمعلومات', NULL, 966, 1088, 1106, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (686, 'محمود نمر محمد النفار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (687, 'ابراهيم عبد الرؤوف حسين صلاح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (688, 'لؤي سعد الدين محمد ابو سويرح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (689, 'محمد مصطفى حسن ابو ندا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (690, 'أيمن اسماعيل أحمد ابو دقه', 'وحدة تنمية أموال الوقف', 'دائرة مشاريع الوقف', NULL, NULL, 977, 1104, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (691, 'مهند نمر علي المطلان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (692, 'أحمد عبد الرؤوف ابراهيم مهدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (693, 'محمد سخري حسن ابو عجلان', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم المتابعة والتفتيش', NULL, 967, 968, 1103, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (694, 'عبد الله يوسف حسين ابو عليان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (695, 'داليا عبد الله محمد لبد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', NULL, 947, 980, 981, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (696, 'نجلاء فايز أحمد ابوعبدو', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (697, 'معين محمد حسونه نافع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (698, 'اكرامي سالم صالح المدلل', 'وحدة العلاقات العامة والإعلام', 'دائرة الاعلام ', NULL, NULL, 948, 970, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (699, 'عز الدين سليم أحمد نبهان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'نائب العميد للشؤون الاكاديمية', 'قسم التعليم المستمر وخدمة المجتمع', 949, 1025, 1414, 1283, NULL, NULL);
INSERT INTO `employees` VALUES (700, 'وفاء يوسف علي الكحلوت', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (701, 'أحمد ضرغام محمد ابوهربيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (702, 'محمد سليمان محمد زنون', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (703, 'ابراهيم حسن عبد الدايم العويسي', 'الإدارة العامة للشئون الإدارية', NULL, NULL, NULL, 1172, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (704, 'محمد نافذ عبد الحميد سليم', 'الادارة العامة للحج والعمرة', 'دائرة الحج والعمرة وتأهيل الشركات', 'قسم معلومات الحج والعمرة', NULL, 1100, 1101, 1102, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (705, 'سهام محمد أحمد علي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (706, 'فادي محمد محمود ابو هندي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (707, 'محمد عبد العزيز عبد الفتاح المدهون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (708, 'محمد سعيد يونس قنيطه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (709, 'هناء ابراهيم محمود سرحان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (710, 'بشير كاظم بشير شنشير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', NULL, 947, 952, 1053, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (711, 'محمد علي ماهر فرحات السرحي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (712, 'وداد رياض اسماعيل الحواجري', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (713, 'ياسمين ياسين محمد جودة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (714, 'خالد سمير محمد موسى', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (715, 'رائد محمد ابراهيم ثاري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الأملاك', NULL, 947, 980, 1099, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (716, 'فيصل طلال محمد العبادله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (717, 'أحمد فايز محمد برهوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (718, 'علا منير حمدي الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (719, 'عبد السلام أحمد عبد السلام عبيد', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', NULL, NULL, 1172, 1097, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (720, 'محمد محمود محمد ابوعامر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', NULL, NULL, 947, 987, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (721, 'عبد الله عمر رمضان ضهير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (722, 'عادل ابراهيم محمد احمد', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (723, 'تامر محمد ابراهيم الفسيس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (724, 'أيمن عبد القادر المنسي المبحوح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (725, 'امين حمد شريقي السلطان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (726, 'تيسير عبد الفتاح محمد عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (727, 'توفيق شريف محمد علي الزين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (728, 'سماح جمال أحمد ابو سلمان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 980, 981, 982, NULL, NULL);
INSERT INTO `employees` VALUES (729, 'عبد الحميد عبد الحميد أحمد عباس', 'وحدة التخطيط وتطوير الأداء المؤسسي', 'دائرة السياسات والتخطيط', 'قسم التخطيط والبرامج', NULL, 966, 1088, 1089, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (730, 'سعد فضل مصطفى نبهان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', 'شعبة شؤون الموظفين والعاملين', 947, 980, 1086, 1087, NULL, NULL);
INSERT INTO `employees` VALUES (731, 'محمود جمعة شعبان يونس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (732, 'عبد الله هشام حمدان عبدو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (733, 'أحمد باسم سعدي ابو دلال', 'وحدة التعليم الشرعي', 'الدائرة العلمية', NULL, NULL, 949, 1084, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (734, 'نمر رشاد نمر ابو راس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (735, 'سليمان فرحان سليمان ابو دقه', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم صيانة الأجهزة الكهربائية', NULL, 1172, 985, 1194, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (736, 'رأفت اسامه محمد شعبان عيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (737, 'محمد امين محمد شملخ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (738, 'فادي محمد عبد الكريم ابو عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (739, 'جابر خالد موسى الزوارعه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (740, 'عبد الكريم رشدي عبد الكريم حمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (741, 'جلال ماجد صبحي العطار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (742, 'وائل زياد موسى الشوربجى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (743, 'نضال كمال سليم ابو عجوه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (744, 'فادي أحمد محمود ابو دوابه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', 'شعبة مراكز التحفيظ -ذكور', 947, 956, 990, 1071, NULL, NULL);
INSERT INTO `employees` VALUES (745, 'محمود أحمد كامل ابو العطا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (746, 'طه يوسف اسماعيل سليمان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', NULL, 947, 980, 1017, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (747, 'محمد عبد المجيد يوسف الزطمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (748, 'سماهر ناصر سليمان الغزالي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (749, 'معاذ سعيد عبدالله الندر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (750, 'أحمد محمد اسماعيل ابو مصطفى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (751, 'بلال يوسف محمد الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', 'شعبة الخدمات', 947, 961, 1082, 1083, NULL, NULL);
INSERT INTO `employees` VALUES (752, 'عبدالله خيري خميس العرابيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (753, 'يوسف محمود يوسف الشوبكي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (754, 'راغد لبيب انيس مكي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (755, 'ابراهيم حمزه درويش جنيد', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (756, 'موسى اسماعيل موسى ثابت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (757, 'أحمد عبد الحميد عبد الرحمن سلامة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (758, 'محمد عبدالله رمضان كلاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (759, 'محمد محمود مصطفى الخطيب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (760, 'بكر يحيى سليمان القاضي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (761, 'مصعب فوزي سليمان قديح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الأملاك', NULL, 947, 961, 1081, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (762, 'أحمد سعد المختار أحمد الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (763, 'اسماء أحمد عبد الرحمن الملفوح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (764, 'مريم العبد رمضان الحداد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (765, 'مؤمن طلعت أحمد سلمي', 'وحدة الزكاة والاغاثة', 'دائرة الحسابات', 'قسم تسجيل الحسابات', NULL, 955, 962, 1327, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (766, 'سليم نمر محمد المقوسي', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم القناة الالكترونية', NULL, 948, 1026, 1080, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (767, 'خولة صبحي علي احمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (768, 'سامح شحده محمود الصيفي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (769, 'ضياء كامل عبد الرحيم ابو طعيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (770, 'محمود زكريا سليمان العقاد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (771, 'محمد عبد الشفوق عبد الشكور الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (772, 'اروى محمد سليمان الزاملي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (773, 'هبه صلاح يوسف اليعقوبي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 987, 988, 989, NULL, NULL);
INSERT INTO `employees` VALUES (774, 'خالد سمير عبد القادر صباح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (775, 'عامر محمد نمر جندية', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (776, 'بلال عبد الرؤوف سعيد بربخ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (777, 'محمد أحمد صالح ابو شمعون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (778, 'اسماء شكري محمد زيدان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة مراكز التحفيظ -اناث', 947, 956, 993, 994, NULL, NULL);
INSERT INTO `employees` VALUES (779, 'طارق يوسف اسماعيل سليمان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (780, 'نهاد اديب يوسف شملخ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (781, 'سلام محمد اسعد الاغا', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الشبكات والدعم الفني', 'قسم إدارة أنظمة التشغيل', NULL, 972, 1004, 1005, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (782, 'مصطفى محمود مصطفى الخطيب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (783, 'أحمد فؤاد أحمد النواجحه', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الشبكات والدعم الفني', 'قسم إدارة أنظمة التشغيل', NULL, 972, 1004, 1005, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (784, 'محمد ابراهيم يعقوب احلاسه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (785, 'صلاح نعيم عبد صالح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (786, 'بسمه كامل العربي ابو غنيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (787, 'حسام عوني خضر قحمان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (788, 'اسماعيل وائل اسماعيل حجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (789, 'شهاب الدين عبد الكريم سالم ابو حمام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (790, 'محمد كامل حمدان ابو عربس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (791, 'عبير سليمان محسن السوسي', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة والإرشاد -اناث', 'قسم الدعوة الالكترونية', NULL, 1035, 1075, 1369, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (792, 'أحمد عبد القادر عبد الفتاح ابو عطا', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (793, 'أحمد فوزي أحمد الصفدي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (794, 'ادهم ناهض جميل النمنم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (795, 'رمضان مروان ابراهيم النواجحه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (796, 'ايمان مصطفى حرب ريان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (797, 'محمد يوسف حماد حمادة', 'وحدة الرقابة الداخلية', NULL, 'قسم الرقابة الفنية', NULL, 1072, NULL, 1074, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (798, 'حسن عبدالله يوسف ابو حلبيه', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (799, 'محمد محمد زهر السعودي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (800, 'محمد عبد الرحمن محمد جرغون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (801, 'نسرين محمد حسان ابوسيف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة مراكز التحفيظ -اناث', 947, 956, 993, 994, NULL, NULL);
INSERT INTO `employees` VALUES (802, 'محمود محمد عبدالله نصار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', 'شعبة مراكز التحفيظ -ذكور', 947, 956, 990, 1071, NULL, NULL);
INSERT INTO `employees` VALUES (803, 'جبر عمر جبر ضهير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (804, 'نضال عبد السلام حميده المغربي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (805, 'صلاح محروس سعيد عطوه زعرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (806, 'مرسي جمال دياب سلمان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (807, 'أحمد عمر أحمد ابو رياله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (808, 'محمود سعيد ديب الصوراني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (809, 'محمد ابراهيم محمد السلقاوي', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة المسجدية', NULL, NULL, 1035, 1069, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (810, 'محمد سعد محمد الحلو', 'وحدة الشؤون القانونية', NULL, 'قسم القضايا', NULL, 944, NULL, 945, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (811, 'نور ديب أحمد معمر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 987, 988, 1016, NULL, NULL);
INSERT INTO `employees` VALUES (812, 'رمزي أحمد ابراهيم ابو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (813, 'ادهم جمال شوقي زرعي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (814, 'نور الدين سليمان سلمي عراده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (815, 'محمد رياض عبد العزيز فياض', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (816, 'سعيد خليل سعيد عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (817, 'محمود نافذ محمود حماد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (818, 'ادهم حمدان عبد المجيد حمدقه', 'الإدارة العامة للأملاك الوقفية', 'دائرة المقابر', 'قسم الاشراف علي المقابر', NULL, 967, 1065, 1350, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (819, 'أحمد ديب محمد الاشقر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الدعوة والارشاد الوسطى', 'شعبة الدعوة الميدانية والالكترونية', 947, 956, 1342, 1344, NULL, NULL);
INSERT INTO `employees` VALUES (820, 'عماد زياد صادق النبيه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (821, 'حسان أحمد عبدالله النجار', 'وحدة التعليم الشرعي', 'الدائرة العلمية', 'قسم المراكز العلمية والجمعيات الشرعية', NULL, 949, 1084, 1394, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (822, 'محمد بادي عيسى العف', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (823, 'نور الدين أحمد عطيه وشاح', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم ديوان الوزارة', NULL, 1172, 975, 1226, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (824, 'راني أحمد صالح العدلوني', 'الادارة العامة للمساجد والمديريات', 'دائرة متابعة المساجد', NULL, NULL, 947, 1450, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (825, 'محمد كمال جميل الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة القراءات القرآنية', 947, 961, 1076, 1228, NULL, NULL);
INSERT INTO `employees` VALUES (826, 'محمد سلامه محمود ضهير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (827, 'عايشة محمد رمضان حلاوين حلوين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (828, 'اسلام محمد العبد نبهان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (829, 'كفايه فهمي محمود شريتح', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (830, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (831, 'محمود صلاح محمد نصار', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة أنظمة وتطبيقات الانترنت', NULL, NULL, 972, 978, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (833, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (834, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (836, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (837, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (838, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (839, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (840, 'زهير ابراهيم حسن البنا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (841, 'سعيد محمود مصطفى الصوص', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (842, 'موسى مرزوق أحمد علوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (843, 'فاتنه عاشور أحمد الغليظ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 980, 981, 982, NULL, NULL);
INSERT INTO `employees` VALUES (844, 'سعيد يحيى سعيد الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (845, 'بسام رسمي سليمان النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (846, 'حسن مصطفى محسن عطا الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (847, 'نهى اسماعيل ابراهيم ابو جلهوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (848, 'عبد ربه جبر خليل غبن', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (849, 'زياد محمد حسن جابر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (850, 'زيدان محمد غالي فرح عسليه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (851, 'رائد أحمد عبد الساتر البرعي', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (852, 'محمد أحمد عيد ابو عابد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (853, 'محمد أحمد عبد الرؤوف عبد الغفور', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (854, 'عامر مصطفى خليل قاسم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد', NULL, 947, 956, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (855, 'عصام محمد ابراهيم عابد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (856, 'جميل محمد عجاج ابو معيلق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (857, 'أحمد محمد حسن مقاط', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (858, 'عمر خميس مصطفى جابر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (859, 'وليد اكرم حمدي اخزيق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (860, 'عبد الدايم سلامه سليمان القريناوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (861, 'روند عزات محمد حناوي زقوت', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (862, 'حمدي سعيد حامد مدوخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (863, 'مجديه رمضان ابراهيم عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 980, 981, 1167, NULL, NULL);
INSERT INTO `employees` VALUES (864, 'محمد يونس عبدالله جودة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (865, 'جمعه عبدالله رباح ورش اغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (866, 'كمال عبد الحميد ابراهيم الصوري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (867, 'أحمد عبد الحميد ابراهيم الصوري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (868, 'مسلم توفيق العوضي مهاني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (869, 'هاني راشد حسين اسليم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (870, 'عصام سعيد عارف عليوة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (871, 'عبد المنعم مصطفى خلف دلول', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (872, 'رشيد محمود ابراهيم صقر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (873, 'محمود ابراهيم رشيد صقر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (874, 'سامح فتحي سلامه دلول', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (875, 'عبدالله اسماعيل علي ابو جربوع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (876, 'محمد صبحي محمد الجخبير', 'الادارة العامة للمساجد والمديريات', 'دائرة متابعة المساجد', NULL, NULL, 947, 1450, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (877, 'وليد محمد سعيد ابو طاحون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', 'شعبة مراكز التحفيظ -ذكور', 947, 956, 990, 1071, NULL, NULL);
INSERT INTO `employees` VALUES (878, 'زايد سلامه يوسف ابو شوشه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (879, 'امنه علي سلمان ابو مصطفى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (880, 'يونس سليمان عواد الشامي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (881, 'انتصار عطوه حسن الفرا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (882, 'سمير عبد القادر محمد المبحوح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (883, 'اسامه محمد خالد الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (884, 'علي عودة علي المصدر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (885, 'حسن محمد بركات غنيم', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (886, 'أحمد زيدان سليمان الحواجري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (887, 'وائل حمدان عبد الرحمن التوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (888, 'محمود علي محمود اللوح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (889, 'محمود عودة عبدالله سعيد', 'وحدة التخطيط وتطوير الأداء المؤسسي', 'دائرة السياسات والتخطيط', NULL, NULL, 966, 1088, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (890, 'سحر سعدي عبد المطلب ابو عبسه', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (891, 'فرج محمد علي عسليه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (892, 'فوزي محمد عبد العزيز عياد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (893, 'عبدالله محمد عبدالله ابو روميه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (894, 'نافذ زكي اسماعيل ابو طعيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (895, 'نجاة قاسم حمدان ابوعيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (896, 'نبيه محمد نبيه خلف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (897, 'مجدي عوض عوض الله ابو شاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (898, 'نفينه يوسف ايوب خلة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 980, 981, 982, NULL, NULL);
INSERT INTO `employees` VALUES (899, 'عصام فايز أحمد ابو فسيفس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (900, 'يحيى نبيه عطا النونو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (901, 'اسامه حمد محمد طباسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (902, 'جودت عبد طه المظلوم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (903, 'وليد خالد العايدي حلس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (904, 'بثينه محمود أحمد النمله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (905, 'فيصل عمر علي البابلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (906, 'رجاء راتب مصطفى سعدالله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (907, 'عبد القادر محمد عبد القادر ابوعبدو', 'وحدة الزكاة والاغاثة', 'دائرة البحث الاجتماعي ', NULL, NULL, 955, 1048, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (908, 'منذر محمد عبد الهادي الحنفي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (909, 'اشجان محمد زهير محمد ابو جلاله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة مراكز التحفيظ -اناث', 947, 956, 993, 994, NULL, NULL);
INSERT INTO `employees` VALUES (910, 'نعيم اسبيتان محمد العصار', 'وحدة الرقابة الداخلية', NULL, 'قسم الرقابة الفنية', NULL, 1072, NULL, 1074, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (911, 'فضل عبد حسين ابو غالي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (912, 'خالد سليمان عبدالله زقوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (913, 'رمضان محمد خليل الدغمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة الخدمات', 947, 956, 957, 1336, NULL, NULL);
INSERT INTO `employees` VALUES (914, 'امين مصطفى طباسي الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (915, 'محمد اسماعيل ابراهيم العتال', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (916, 'محمد أحمد سالم زملط', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (917, 'ماجد محمود مرجان صبيح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (918, 'محمد ابراهيم محمد الشيخ خليل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (919, 'محمد ابراهيم مصطفى النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (920, 'امجد وفيق محمد ابو مطر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (921, 'صبحي رشيد حسن اليازجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (922, 'سعيد أحمد محمد سعيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (923, 'صدقي حسين مطير مطير', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (924, 'سليم سلامه سليم الحشاش', NULL, 'دائرة الموازنة والتدقيق', 'قسم متابعة المديريات', NULL, NULL, 1029, 1030, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (925, 'نبيه كامل محمد جودة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (926, 'عبد اللطيف شاكر فريد الحشاش', 'وحدة شؤون القدس', 'دائرة الانشطة والفعاليات', NULL, NULL, 1423, 1435, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (927, 'منصور سليمان منصور جاد الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (928, 'بسام محمد حسن حسان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (929, 'هشام محمد حسن حسان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (930, 'رزق محمد عبد الله جبريل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (931, 'شيرين عيسى ابراهيم صالح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (932, 'زكي محمد عبد الرحمن ابو زيدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (933, 'طلال محمد خليل ابو مشايخ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (934, 'علي عيسى حسين عبد الغني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (935, 'جهاد محمود حسين العامودي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (936, 'عبد النور غانم محمد ابو سعيد', 'الإدارة العامة للشئون المالية', 'دائرة الحسابات والايرادات', 'قسم المحاسبة', NULL, 1182, 1042, 1141, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (937, 'ابراهيم غانم محمد ابو سعيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (938, 'يوسف داود يوسف ابو دياب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (939, 'محمد أحمد عبد الغني المناعمه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (940, 'هشام خليل حمد ابو جامع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (941, 'أحمد شحده أحمد درويش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (942, 'اسماء فرحات محمد فرحات', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', NULL, 947, 987, 988, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (943, 'ابراهيم علي محمد الشاعر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (944, 'غانم فارس امين مشتهى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (945, 'محمد حسن عبد الوهاب زيدان', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (946, 'قنديل سلامه محمد ابو مزيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (947, 'محمد خليل أحمد مهدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (948, 'شكران عبد العزيز محمد ابو الروس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (949, 'عبد الباسط محمد نعمات الاسطل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (950, 'عبد الخالق محمد نعمات الاسطل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (951, 'حلمي عبدالله عليان التلباني', 'الإدارة العامة للشئون الإدارية', NULL, NULL, NULL, 1172, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (952, 'زياد عليان مضعان ابو مساعد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (953, 'خالد حسين احميدان كوارع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (954, 'اخلاص خالد مريزيق ابو طير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 981, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (955, 'عثمان محمود محمد المصري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (956, 'غسان حسن محمد ابو شاويش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (957, 'مصطفى محمد عليان التلباني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (958, 'علي حسين حسن عبد الحي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (959, 'خالد محمود محمد ابو مصطفى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (960, 'انتصار علي عبدالله الفرا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (961, 'خضر عبد ربه موسى زعرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (962, 'لطيفه خليل عايش ابو حطب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (963, 'خليل حسن خليل شاهين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (964, 'جابر خليل سليمان شاهين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (965, 'حماده سمير محمد العمودي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (966, 'انور أحمد حسين الطلاع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (967, 'عيد أحمد محمد المصري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (968, 'اشرف حسين دياب الغرباوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (969, 'عماد عبدالله محمد وشاح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (970, 'منير وديع حنا السلفيتي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (971, 'سحر محمد فهمي كرديه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (972, 'وائل انور شعبان الترك', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (973, 'رأفت جميل علي أبو شعبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (974, 'عامر سليمان محمد داود', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (975, 'فوزي أحمد محمد راضي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (976, 'محمد عزات صالح جحا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة القراءات القرآنية', 947, 952, 1053, 1058, NULL, NULL);
INSERT INTO `employees` VALUES (977, 'خميس أحمد محمد سماره', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (978, 'نادره اسماعيل عبد الهادي صيدم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (979, 'جميل خليل عبد الفتاح منصور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', NULL, 947, 956, 990, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (980, 'انتصار محمد حسن العويسي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (981, 'ابراهيم اسماعيل عبد الرحيم ابو عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', NULL, 947, 987, 1113, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (982, 'احميد حمدان محمد الصوفي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (983, 'محمود موسى محمد رزقه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (984, 'سعديه يوسف خليل نوفل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (985, 'حسن عرفات حسن الغازي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (986, 'عمران أحمد درويش مقاط', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (987, 'محمد تيسير محمد البيك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (988, 'نصر العبد خليل منصور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (989, 'عدنان سليم العطافي ابو الهطل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (990, 'زياد محمود امين النديم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (991, 'أحمد محمد أحمد الكرنز', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (992, 'علاءالدين محمد حرب عقيلان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (993, 'خضر اسماعيل محمد القصاص', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (994, 'نافذ مصطفى محمد شهوان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (995, 'يوسف اسويعد محيسن السعايده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (996, 'ماجد عطيوه حماد سلطان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (997, 'هاني ابراهيم عودة ابو منديل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (998, 'غانم مصطفى سليمان ابو مصطفى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (999, 'عصام رسمي عبد العزيز بدر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1000, 'سليم عبد الفتاح محمد حماد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1001, 'جابر عبد الحميد سعودي عاشور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1002, 'معين أحمد سالم عيسى', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1003, 'سليمان نصرالله محمد الفرا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1004, 'وليد محمد حماد ابوعامر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1005, 'عبدالله سليمان علي شراب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1006, 'فؤاد شوقي عبد القادر عبد الرحمن', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1007, 'عبد الخالق عايش عبد الخالق يونس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1008, 'عطيه خليل مطاوع شعت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1009, 'محمود أحمد رشيد ابو الخير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1010, 'روحي شعبان أحمد بكير', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1011, 'كمال عبد المجيد محمد كلوب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1012, 'خالد محمد فهاد التربان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1013, 'عزمي كامل عبد الرحمن القطراوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1014, 'سميه جبر سلامه دويدار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', NULL, 947, 956, 993, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1015, 'نصر علي ابراهيم المدهون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1016, 'عصر مونس سليمان ابو خليل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1017, 'محمد موسى حموق ابو لبده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1018, 'مفيد مسعود يوسف الشوربجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1019, 'رياض ابراهيم سليم شعت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1020, 'هبه سعيد محمد المزين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (1021, 'امينه حسين سلامه ابو نجا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (1022, 'خالد عبدالله خالد خاطر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1023, 'كامل مسعود نصير ابو عمرة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد', NULL, 947, 956, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1024, 'كمال مسعود نصير ابو عمرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1025, 'اياد عبد المجيد محمد شحادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1026, 'سامي نافذ فهمي عجور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1027, 'عمر عارف خليل العف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1028, 'خديجه رجب جمعه العسلي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (1029, 'عدلي أحمد عطيه البرش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1030, 'حليمه ابراهيم مصطفى الباشا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1031, 'يوسف عوني صالح الرفاتي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1032, 'محمد محمود محمد شلدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1033, 'عامر فوزي يوسف عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1034, 'محمود مصباح محمود صباح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1035, 'سناء خليل رزق طرزي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1036, 'حاتم مصباح محمد فارس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1037, 'محمد عبدالله حسن اللحام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1038, 'محمد خليل سليم السقا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1039, 'يوسف محمد عبد الرحمن عرفه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1040, 'نجاح الحاج مصطفي خليل الأسطل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1041, 'كامل أحمد حماد ابو سته', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1042, 'حمزه بشير روبين زينو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (1043, 'محمد نظمي خليل حسين اللوقة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1044, 'فايز حسان سليمان ابو عمرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1045, 'جواد اسماعيل عبدالله الهشيم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1046, 'السيد عبد الرحمن عبد الحفيظ الهور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1047, 'رياض محمود حسين سمره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1048, 'ميسون عبدالله محمد خريس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (1049, 'ليلى عبدالله شاهين العقاد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1050, 'عبد الساتر عيد حمد ابو حشيش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1051, 'اشرف أحمد اسماعيل قزاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1052, 'ايمان محمود محمد ابو صبحه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1053, 'ميسر سلامه سليمان ابو عمرة', 'وحدة التعليم الشرعي', 'الدائرة العلمية', 'قسم الدراسات والبحوث الشرعية', NULL, 949, 1084, 1396, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1054, 'محمد سليمان العايدي حلس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1055, 'طلعت رضوان عبد الرحمن أبو الخير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1056, 'سلمان أحمد سلمان ابو عتيق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1057, 'ماهر محمد أحمد ابواسماعيل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1058, 'شكري محمود ابراهيم وشاح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1059, 'حسن عبدالله خليل ابو مشايخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1060, 'اكرم حسن ابراهيم نصار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', NULL, 947, 980, 1017, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1061, 'شفيق خليل سليمان بركة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1062, 'علي عيسى محمد مطر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1063, 'محمد سليمان عواد كوارع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1064, 'سعيد أحمد محمود ابراهيم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1065, 'باسل خالد عطا الله زنون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1066, 'عبد العال حسن عوض النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1067, 'سلمان أحمد سلمان ابو سته', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1068, 'صبري عبد المالك عطيه موسى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1069, 'حيدر سعيد سليمان عابدين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1070, 'ياسر مسعود فالح المصري', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1071, 'سليم شاهين سليم شاهين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1072, 'جميل عبدالله عبد ربه كساب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1073, 'محمود سليمان سالم المصدر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1074, 'سليمان حسن سليمان المصدر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1075, 'يحيى علي ابراهيم المصدر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1076, 'حسن محمد رجب ابووردة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1077, 'رامي تيسير نايف فارس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1078, 'عبد الرحمن سليم سالم شراب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1079, 'سليم أحمد ضيف الله عبد الغفور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1080, 'مها عبد الكريم ديب رجب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (1081, 'تيسير عوض درويش مسمار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1082, 'عدنان سليمان حماد القريناوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1083, 'خليل موسى حسين عرفات', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1084, 'كمال سلامه عطيه ابو يوسف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1085, 'ناصر اسماعيل يوسف الطويل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1086, 'جواد عبد الكريم عبدالله عواد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1087, 'محمد عبد الكريم محمد النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1088, 'عبدالله عبد الكريم عبدالله عواد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الأملاك', NULL, 947, 961, 1081, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1089, 'ناجي عنتر شاكر الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1090, 'عاطف محمد خالد اليازجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1091, 'خالد محمد نمر ابو شماله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1092, 'سلوى محمد خليل ابوعبدو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1093, 'محمد عايش محمد حميد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1094, 'عبد الرؤوف عارف حسن بارود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1095, 'يحيى سعيد أحمد صبح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الأملاك', NULL, 947, 987, 1266, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1096, 'سامي مصطفى عبد الهادي الدربي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1097, 'عبد السلام محمد محمود الهباش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1098, 'حلمي ابراهيم اسماعيل قديح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1099, 'عماد صالح ابراهيم عابد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1100, 'اشرف ابراهيم عبد الرحمن سرحان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1101, 'فتحي فايز يوسف ابو عيدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1102, 'عدنان حسن عبد الهادي حويله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1103, 'عبد الرحيم حسن عبد الهادي حويله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1104, 'انور شحاده حسين نصار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1105, 'وائل رباح العبد ابو بيض', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1106, 'نبيل حامد حسين عاشور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1107, 'يوسف دياب خليل الفليت', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1108, 'شكري علي عبد الرحمن الطويل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1109, 'محمد جمال محمد منصور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد', NULL, 947, 956, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1110, 'امنه ابراهيم عبد الرزاق الهرباوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة مراكز التحفيظ -اناث', 947, 956, 993, 994, NULL, NULL);
INSERT INTO `employees` VALUES (1111, 'يوسف ابراهيم سليمان فقعاوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1112, 'سامي شكري أحمد ابو سعادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1113, 'رياض عطوه سالم ابويوسف', 'وحدة الزكاة والاغاثة', 'دائرة الحسابات', NULL, NULL, 955, 962, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1114, 'جمال رويعي ايوب الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1115, 'امين سلمي سليمان القبطي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1116, 'ياسين صبري عثمان الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1117, 'سالم محمود عياد مسمح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1118, 'محمد حسين سليمان مسمح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1119, 'محمد رمضان سالم حرز الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1120, 'ايناس شعبان اسماعيل ابو دف', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1121, 'ابراهيم محمد عايش الفرا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1122, 'رامي محمد سليم شهوان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1123, 'حسين حامد حسين الأسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', 'شعبة الصيانة', 947, 961, 1082, 1174, NULL, NULL);
INSERT INTO `employees` VALUES (1124, 'عدنان عطوه سلمان الطلاع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1125, 'عودة يوسف عودة التلباني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1126, 'بشير يوسف صقر حبيب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1127, 'ماجده علي محمد العطار', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1128, 'محمود محمد ديب حميد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1129, 'حيدر مصلح سالم المصري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1130, 'أحمد موسى فرحان الحاطي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1131, 'محمد عثمان محمد حلس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1132, 'زايد فايز يونس الحسنات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1133, 'سامي يعقوب محمد الزيناتي', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1134, 'رائد عيد شراب اسليم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (1135, 'ساره شحادة سلمان ابو خريبه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, 'شعبة القراءات القرآنية', 947, 956, NULL, 1167, NULL, NULL);
INSERT INTO `employees` VALUES (1136, 'حسن عوده شتيوي ابو سنجر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1137, 'سلمان محمود سليمان زعرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1138, 'صلاح عبد الرؤوف محمد غراب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1139, 'عدنان ابراهيم حسين عابد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1140, 'صلاح عيد سويلم ابو ركن', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1141, 'خريس حسين عبد العزيز خريس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1142, 'مؤيد عبد الرحمن خميس الزبدة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (1143, 'حسني حسين عبد العزيز خريس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1144, 'خالد محمد حسين شحادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1145, 'رزق سليمان أحمد الفرا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1146, 'كريمه حسن محمد ابو شحمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (1147, 'مصطفى سليمان نصار ابو مصطفى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1148, 'علي محمود علي ابو عرفات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1149, 'محمد سالم سليمان ابو طير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1150, 'خليل ابراهيم محمد ابو فسيفس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1151, 'وليد محمود حسين ابو صقر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1152, 'حسن صالح حمدان الغلبان', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1153, 'أحمد عيسى أحمد قاعود', 'الادارة العامة للقرآن الكريم', NULL, NULL, NULL, 974, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1154, 'مازن رشاد عيسى الحلو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1155, 'ابراهيم حسان فضل العر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1156, 'عامر حسان فضل العر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1157, 'أيمن توفيق عبد الغفور القرا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1158, 'اديب عاشور محمد غريب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1159, 'مروان محمود محمد البردويل', 'وحدة التخطيط وتطوير الأداء المؤسسي', 'دائرة تطوير الأداء المؤسسي', 'قسم تنمية الموارد البشرية', NULL, 966, 1108, 1273, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1160, 'ياسر اسعيد حسين فوجو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1161, 'سعيد سالم عبدالله خطاب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1162, 'خليل محمود موسى ابو عنزه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1163, 'محمود محمد أحمد راضي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1164, 'نجلاء فتحي عبد العزيز مصلح', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1165, 'سامي اسماعيل خضر ابو دقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1166, 'خضر مصطفى حسن المجدلاوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1167, 'باسمه محمد عبد القادر العمصي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1168, 'حازم يعقوب امين المهتدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1169, 'نائل نايف حسن الزبيدي', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم المتابعة والتفتيش', NULL, 967, 968, 1103, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1170, 'زياد محمد سلمان أبو مطلق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1171, 'خالد محمد عبدالله الدعالسه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1172, 'ماجد عثمان خليل اشتيوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1173, 'محمود محمد سعيد النجار', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1174, 'عبد الفتاح يوسف العبد حجاج', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1175, 'سامح محمد اكرم أحمد ابو مرسه', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1176, 'تامر حافظ إسماعيل عبد الجواد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1177, 'رجب محمد سالم الحطاب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1178, 'محمد حسين سالم المغني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1179, 'نصر حسين سالم فرج', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1180, 'رائد حمدي محمود حميد', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم التنسيق والمتابعة', NULL, 948, 1026, 1109, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1181, 'نافذ محمد جابر شومان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1182, 'رائد أحمد عبد الجبار القططي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1183, 'عماد علي يحيى الدجني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1184, 'يحيى سعيد يحيى الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1185, 'حسن يوسف العبد حجاج', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1186, 'حيدر خالد مسمح مسمح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1187, 'صليبا سمير صليبا سابا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1188, 'عادل اشعيب مسمح مسمح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1189, 'نبيل حسن حسن البشيتي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1190, 'كامل عبد الكريم عبد القادر العجرمي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1191, 'مجدي محمد عواد ابو الحصين', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1192, 'جمعه محمد محمود ابو جويفل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1193, 'سليم قديح عبد السلام شحادة', 'الإدارة العامة للأملاك الوقفية', 'دائرة الأملاك', 'قسم قواعد بيانات الوقف', NULL, 967, 1117, 1129, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1194, 'محمود خليل حسين السلاخي', 'الادارة العامة للمساجد والمديريات', 'دائرة التراث الاسلامي', 'قسم المخطوطات', NULL, 947, 1105, 1115, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1195, 'عبد الحكيم محمد أحمد الطلاع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1196, 'أحمد اسماعيل محمد مسامح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1197, 'اشرف عبدالله عبد العزيز جودة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1198, 'عزت محمد عبدالله كيلاني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1199, 'دلال اسعد أحمد غانم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (1200, 'يحيى عودة محمد الشرافي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1201, 'عبد القادر صالح يوسف احمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1202, 'محمد سيد محمد العقاد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1203, 'مريم محمد عبد الحفيظ السدودي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة مراكز التحفيظ -اناث', 947, 956, 993, 994, NULL, NULL);
INSERT INTO `employees` VALUES (1204, 'سليمان حلمي حسن الفقعاوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1205, 'عصام توفيق سليمان القرا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1206, 'نظام خالد السيد النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1207, 'عبد الرحمن سليم اسماعيل ابو عايش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1208, 'رمضان سليم اسماعيل ابو عايش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1209, 'حسن بسام حسن اللحام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1210, 'اسماعيل علي سليمان عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1211, 'زهير انيس موسى السلول', 'الإدارة العامة للأملاك الوقفية', NULL, NULL, NULL, 967, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1212, 'رجائي محمود مصطفى العبادله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1213, 'صلاح اسماعيل حسن سمور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1214, 'نجاح مصطفى طه العلول', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (1215, 'فاطمه علي سالم الاخرس', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1216, 'محمود صدقي عبد الرحمن الهباش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1217, 'نوال محمد حسن موسى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1218, 'ساكب موسى عبد اللطيف الشريف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1219, 'زكريا ابراهيم عبدالله حسين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1220, 'محمد براك سالم سليمه', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1221, 'عبد الجابر رشيد أحمد النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1222, 'محمد محمود محمد العطار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1223, 'عماد كامل حافظ الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1224, 'منى علي محمد الشلح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 987, 988, 989, NULL, NULL);
INSERT INTO `employees` VALUES (1225, 'محمد حسن محمود ابوسعدة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1226, 'عمر محمد عمر ابوسمعان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1227, 'جبر جابر جبر ابو حويج', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1228, 'نضال عزمي عبد الرازق شنن', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (1229, 'نهايه علي عبدالله بارود', 'وحدة التعليم الشرعي', NULL, NULL, NULL, 949, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1230, 'حلمي أحمد حلمي جرادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (1231, 'عبد السلام يحيى ديب قوصه', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'قسم الاشراف والانشطة', NULL, 949, 950, 1393, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1232, 'ماهر هاشم سليم برغوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1233, 'خالد يحيى يوسف عسليه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1234, 'عبدالله خالد فلاح دلول', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1235, 'أحمد عبد الرحيم علي ريحان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 980, 1378, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (1236, 'محمد أحمد منصور ابو الحسنى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1237, 'فرج عبدالله حسن المصري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1238, 'جكي كارلو ابراهيم قطان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1239, 'وائل فهمي مصطفى أبو شعبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1240, 'ناهض شعبان عاشور صبيح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1241, 'عمر محمد أحمد ابو العطا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1242, 'انشراح محمد أحمد عفانه', 'الادارة العامة للقرآن الكريم', 'دائرة القرآن الكريم -إناث', 'قسم ديوان الحفاظ', NULL, 974, 1121, 1359, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1243, 'محمد عودة صباح سلطان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1244, 'عطيه ناصر حسن صباح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (1245, 'ناصر طياب بدوي نبهان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1246, 'مظفر سلمان أحمد النواتي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1247, 'باسم سامي نبيه مشتهى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (1248, 'طلال عبد الرازق أحمد ابو شكيان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1249, 'جواد نصري عبد الفتاح المدهون', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1250, 'احمد محمد احمد الاقرع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1251, 'رامز جادالله محمد العمصي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'قسم التعليم المستمر وخدمة المجتمع', NULL, 949, 1025, 1283, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1252, 'اياد موسى عوض العصار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1253, 'محمد عادل عبد الجواد الترامسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (1254, 'عيسى صدقي عبد الرحمن الهباش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1255, 'ناهد حسين محمد زعرب', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة والإرشاد -اناث', NULL, NULL, 1035, 1075, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1256, 'محمد أحمد حسين الغلبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (1257, 'حافظ تكريم حافظ البطه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1258, 'رشاد محمد عطيش ابو مهادي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1259, 'حمدان نايف محمد الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1260, 'فارس عبد الكريم محمد ابو نمر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1261, 'احميدان سالم حسين الاشقر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1262, 'صلاح محمد محمد المصري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1263, 'صلاح سليمان عودة ابو مور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1264, 'علي محمد علي ابو طه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', 'شعبة الخدمات', 947, 987, 1113, 1392, NULL, NULL);
INSERT INTO `employees` VALUES (1265, 'رياض محمد سليمان قديح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1266, 'عمر عبد الجليل خالد فريح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1267, 'عصام ابراهيم موسى ابو نار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', NULL, 947, 956, 957, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1268, 'اشرف عثمان ابراهيم ابو زايد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1269, 'سامي محمود عبد الهادي العزامي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1270, 'ابراهيم محمد حسين الخطيب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1271, 'فيصل عوض عبدالله المبحوح', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1272, 'عباس نمر عبدالله عليان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1273, 'موسى عبدالله موسى شاهين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1274, 'خالد يوسف سليمان ابو حسنين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1275, 'محمد مصطفى حمدي الناجي', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم هندسة الصوت', NULL, 948, 1026, 1050, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1276, 'محمود حمدان محمد الأسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1277, 'ابراهيم حسين ابراهيم درويش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1278, 'عادل عابد حمد الحسنات', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1279, 'ابراهيم فوزي شحادة الكرد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1280, 'انور عبد القادر هديوي الكرد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1281, 'زياد سليمان عودة صافي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1282, 'احسان ابراهيم محمود عاشور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1283, 'سليمان عبدالله محمود عاشور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1284, 'سعدي حسن سليمان بركة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الأملاك الوسطى', NULL, 947, 956, 1154, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1285, 'نمر مصطفى نمر خلف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1286, 'محمود يوسف محمد البيك', 'وحدة الزكاة والاغاثة', 'دائرة البحث الاجتماعي ', 'قسم الكفالات', NULL, 955, 1048, 1049, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1287, 'حسن بسام حسن شاهين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد', NULL, 947, 956, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1288, 'تحسين أحمد محمد احمد', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1289, 'محمود عمر محمود المدهون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1290, 'سليمان محمود صالح الرياطي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1291, 'جمال يوسف صالح ابو سمره', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1292, 'محمد مصطفى حسين ابو خطي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1293, 'سعيد فؤاد محمود عيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1294, 'أحمد عبد العال اسماعيل الزين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (1295, 'جلال علي عطيه حمدان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'قسم الجودة والنوعية', NULL, 949, 1062, 1397, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1296, 'فايز أحمد محمد الكفارنه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1297, 'كامل علي محمد ابويوسف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1298, 'ايات ابراهيم محمود الأسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (1299, 'نور الدين خليل سليمان ابو دقه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1300, 'فاتنه اسماعيل محمد الشوبكي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1301, 'ايمان صالح مصطفى عزام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (1302, 'عبد الحميد أحمد بكر العقاد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1303, 'فاطمه محمد حسين الهباش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1304, 'محمد عطيه خليل المصري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1305, 'عصام عبد محمود الديراوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1306, 'عبد الفتاح محمد حسين احمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1307, 'مشعل سليمان صالح ابو منديل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1308, 'جمال حامد حمد ابو جياب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1309, 'عمار بسام علي المصري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1310, 'جهاد ابراهيم صالح درويش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1311, 'حامد سليمان عميره العرجاني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1312, 'وفاء نظير عبد الكريم الفرا', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1313, 'حسين محمد حسين الغلبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1314, 'رشاد خميس عثمان النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1315, 'اسماعيل محمد خليل أبو مطلق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1316, 'نظام طلعت محمد هيكل', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1317, 'صلاح سالم قاسم سعيد الفرا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1318, 'جمال جمعه عبد الهادي سلامة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1319, 'يوسف جمعه عبد الهادي سلامة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1320, 'مريم مصباح رمضان زقوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 980, 981, 982, NULL, NULL);
INSERT INTO `employees` VALUES (1321, 'السيد كامل حماد عسليه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1322, 'برهم سليمان محمود الرقب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1323, 'خضر فهمي مصطفى أبو شعبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1324, 'خليل خليل مطر الاشقر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1325, 'عثمان خليل هاشم كساب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1326, 'رمزي عمر عبد القادر عبد القادر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1327, 'رفيق صابر عبد العال أبو الخير', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1328, 'ناجي سليمان يوسف ابو طير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', NULL, 947, 961, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1329, 'عدنان صالح عودة القطش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1330, 'توفيق حمد عبيد العماوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1331, 'ايمان حسن محمود سمور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1332, 'باسم حمدي يونس حراره', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1333, 'نعمان امين ربيع خضر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1334, 'محمد صبحي محمد عوض', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1335, 'خالد حسين عبد الرحيم حمدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1336, 'ايهاب حمدي عبدالله الغلاييني', 'الإدارة العامة للأملاك الوقفية', 'دائرة المقابر', 'قسم متابعة المقابر', NULL, 967, 1065, 1241, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1337, 'عون رضوان مصطفى ابو عجوه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (1338, 'عبدالله سعيد محمود الكردي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1339, 'سمير شحده حسين البياري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1340, 'محمد شحده حسين البياري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1341, 'جاسم محمد ابراهيم صيدم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1342, 'سلمان محمد أحمد المعني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1343, 'اشرف جمعة محمد الخالدي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1344, 'يحيى منير كامل الدريملي', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1345, 'خليل خالد عبد القادر الشحري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1346, 'جمال سعد الدين سلمان حمدقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1347, 'محمد رزق اسماعيل ابوظريفه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1348, 'منير كامل سعيد الدريملي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1349, 'محمد رفيق هاشم البنا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1350, 'لؤي فؤاد يوسف الميناوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1351, 'عبداللطيف أحمد مسلم ابوزعنونة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1352, 'ناصر مصلح أحمد الاسود', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1353, 'سعيد محمد ايوب خله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (1354, 'جمال عوض عطيه حجازي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1355, 'ناصر محمد محمد معروف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1356, 'أيمن العبد مسلم النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', NULL, 947, 961, 1373, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1357, 'حسن عوض حسين عبد الوهاب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1358, 'جمعة سبع أحمد  داود', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1359, 'موسى ابراهيم سالم ابو مصطفى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1360, 'وائل عون يوسف اليازجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1361, 'محمود موسى عبد اللطيف الشريف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1362, 'حماد محمد حماد بركه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1363, 'خليل عوض خليل الشوبكي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1364, 'عبدالله عطيه حسين فرج الله', 'الإدارة العامة للشئون المالية', 'دائرة الحسابات والايرادات', 'قسم الخزينة', NULL, 1182, 1042, 1043, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1365, 'جهاد موسى محمود الاشقر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1366, 'عبد الستار احميدان رشيد شعت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1367, 'عبد المنعم عبد الله اسماعيل افسيفس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1368, 'علي محمد عودة الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1369, 'سلمان حمد عياده ابو عمرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1370, 'منهل أحمد خالد الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1371, 'سمير شاهين حمدان عبد الجواد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1372, 'عبد الحميد أحمد عبد الحميد الشريف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1373, 'محسن حسن علي البوبلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1374, 'سمير طياب سعيد الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1375, 'خالد صلاح حامد ابو شباب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1376, 'حاتم فؤاد عبد الحميد زقوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1377, 'محمد اسماعيل محمد فارس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1378, 'عبد الرحمن خميس راغب السقا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1379, 'مصطفى عبد القادر عبد الرازق الزق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1380, 'سناء حمدان محمد السطرى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 961, 1046, 1200, NULL, NULL);
INSERT INTO `employees` VALUES (1381, 'غازي محمد عبد اللطيف الدسوقي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1382, 'علي حسن ايوب مطر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة الصيانة', 947, 956, 957, 1337, NULL, NULL);
INSERT INTO `employees` VALUES (1383, 'صالح حسين سليمان الرقب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1384, 'محمد جاسم سالم داود العصار', 'الإدارة العامة للأملاك الوقفية', 'دائرة الأملاك', NULL, NULL, 967, 1117, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1385, 'خالد شاكر عبد القادر صيام', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1386, 'اسعد ماجد اسعد مشتهى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1387, 'عصام يونس خليل سعيفان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1388, 'ياسر شحادة سالم ابو مغنم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1389, 'عماد أحمد سعيد الخوالده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1390, 'عدنان عبد الرحمن محمد ابو طعيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1391, 'زهير محمد مصطفى الزيان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1392, 'مروان سليمان يوسف ابو طير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1393, 'جلال عبد ربه سالم النعامي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1394, 'عوني فايز رمضان صوالي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1395, 'أيمن يوسف أحمد الغمري', 'وحدة الرقابة الداخلية', NULL, 'قسم الرقابة الادارية', NULL, 1072, NULL, 1149, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1396, 'ياسر العبد حسين سمور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1397, 'سلمان بسام سلمان عبد العال', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1398, 'عبد الرحمن نصر حمدي مصبح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة الحسابات', 947, 956, 957, 958, NULL, NULL);
INSERT INTO `employees` VALUES (1399, 'أحمد محمود محمد ابو سيدو', 'وحدة الشؤون القانونية', NULL, 'قسم القضايا', NULL, 944, NULL, 945, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1400, 'أيمن محمد عبد الرازق عواد', 'وحدة العلاقات العامة والإعلام', 'دائرة العلاقة العامة', 'قسم العلاقات المحلية', NULL, 948, 1031, 1197, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1401, 'هدى حسن حنفي زينو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1402, 'أحمد محمد حسين سرحان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1403, 'تيسير محمد محمود ابو سهمود', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة القراءات القرآنية', 947, 961, 1076, 1228, NULL, NULL);
INSERT INTO `employees` VALUES (1404, 'أحمد اكرم محمد السكافي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1405, 'حسن سليمان العايدي حلس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1406, 'وائل محي الدين سيد الزرد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1407, 'وائل أحمد رمضان الهمص', 'وحدة التعليم الشرعي', 'الدائرة العلمية', 'قسم البرامج والمناهج', NULL, 949, 1084, 1085, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1408, 'ايمان أحمد عطا ابو حمره', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1409, 'فادي عيسى عايش الدالي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1410, 'ابراهيم محمود إبراهيم فرج', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (1411, 'فادي فتحي شفيق بارود', 'وحدة تنمية أموال الوقف', 'دائرة الاستثمار', 'قسم الاستثمار المالي', NULL, 977, 1152, 1153, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1412, 'سامي أحمد محمد ابو لبده', 'وحدة الرقابة الداخلية', NULL, NULL, NULL, 1072, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1413, 'يوسف فتحي أحمد حمدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1414, 'ياسر محمد مرزوق المدني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1415, 'ابراهيم نمر محمد برهوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1416, 'باسل هشام ظافر مشتهى', 'الادارة العامة للحج والعمرة', 'دائرة المتابعة', 'قسم النقل والإسكان', NULL, 1100, 1165, 1295, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1417, 'مصطفى عمر أحمد دبابش', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الحاسوب وتكنولوجيا المعلومات', NULL, NULL, 972, 1191, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1418, 'محمود عبد الناصر رزق عيسى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1419, 'جمال جميل كامل السرحي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الصيانة', 947, 952, 1011, 1294, NULL, NULL);
INSERT INTO `employees` VALUES (1420, 'زهيره فؤاد فتحي الحسنات', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (1421, 'منى جبر عبد انطيز', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1422, 'علاءالدين يونس سالم خطاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1423, 'ختام سلمان عياد الدباري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 987, 988, 1078, NULL, NULL);
INSERT INTO `employees` VALUES (1424, 'ايهاب فيصل اسليم القاضي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1425, 'فادي ناصر محمد صافي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1426, 'سامي جبر عبد اشتيوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1427, 'سماح طه أحمد كلاب', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1428, 'هديل محمد عطيه يوسف ابو خاطر', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1429, 'علي عبد اللطيف عبدالله النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1430, 'عبدالله ربيع عبدالله جنيد', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1431, 'خليل محمد محمد البسيوني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1432, 'عاهد حاتم محمود المنسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1433, 'محمد صالح محمد الشاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (1434, 'منير جودت رجب الرضيع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1435, 'أحمد محمد حسين الديري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1436, 'حنان محمد علي عبد الحفيظ صادق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1437, 'زهير محمد سعد صالح غباين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1438, 'عبد الحكيم حسن محمد مطر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1439, 'رجاء عمر أحمد الحلبي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 961, 1046, 1047, NULL, NULL);
INSERT INTO `employees` VALUES (1440, 'فؤاد محمد عبد الطيبي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1441, 'جواد اسماعيل سلمان السقا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1442, 'سالم محمد محمد عبد العال', 'الإدارة العامة للشئون المالية', NULL, NULL, NULL, 1182, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1443, 'مازن محمود اسعد صالح', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', NULL, NULL, 1172, 985, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1444, 'محروس حسني السبع حسونة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1445, 'مازن كامل السبع حسونة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1446, 'عواطف سليم ضيا غزال', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (1447, 'خالد محمد هاشم عبد المعطي حمادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1448, 'جهاد اسعد خليل شملخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1449, 'عبد القادر حمدان عمران شملخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1450, 'عبدالله أحمد عودة شملخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1451, 'زهير صفوت زكي ابو عوض', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1452, 'فضل عبد الرحمن عبد الهادي زيدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1453, 'عيد صالح مبارك أبو عرار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1454, 'امنه نايف حسن ابو يونس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', NULL, NULL, 947, 987, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1455, 'امين محمود جمعه برهوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1456, 'ياسر عبد الشكور أحمد الاسطل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1457, 'مروان عبد الرحمن حسين ابو شماله', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'قسم التعليم المستمر وخدمة المجتمع', NULL, 949, 1025, 1283, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1458, 'محمد زكي علي أبو هلال', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1459, 'عبد الجواد محمد نعمات الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1460, 'محمد محمود حمدان ابو عابد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1461, 'أحمد صيام سليمان ابو حمد', 'وحدة الرقابة الداخلية', NULL, NULL, NULL, 1072, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1462, 'هنيه محمود محمد شيخ العيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 987, 988, 989, NULL, NULL);
INSERT INTO `employees` VALUES (1463, 'أيمن توفيق محمد ابو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', 'شعبة الصيانة', 947, 987, 1113, 1120, NULL, NULL);
INSERT INTO `employees` VALUES (1464, 'رسمي محمد محمود ابو دقه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1465, 'بلال صالح محي الدين العرقان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1466, 'خضر سمحان محمد القهوجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1467, 'عمر عبد حسين الطلالقه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1468, 'سليمان محمد محمود ابو يونس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1469, 'باسم محمود عبد وادي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1470, 'ناصر سلامه محمد بشير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1471, 'محمد رمضان خليل شاهين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1472, 'عادل محمود محمد بارود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1473, 'منى محمود ابراهيم ابو مصطفى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (1474, 'محمد أحمد حسن حمدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1475, 'عايده ابراهيم أحمد الغمري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة الدعوة المسجدية', 947, 956, 993, 1133, NULL, NULL);
INSERT INTO `employees` VALUES (1476, 'محمد رجا شحده البشيتي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1477, 'وصفي طاهر مطلق المغاري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1478, 'ابراهيم مصطفى حسني زكري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1479, 'نعيم حسن محمود ابو هاني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1480, 'مشرف موسى زايد ابو جزر', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1481, 'سلوى علي ابراهيم المصدر', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1482, 'اياد ابراهيم مصطفى ابو غزاله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1483, 'باسم زايد محمد ابو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1484, 'خالد محمود سالم ابو عويلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1485, 'جمال حماده عبد الله الدينه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1486, 'عبد اللطيف زكي عطيه ابو هاشم', 'الادارة العامة للمساجد والمديريات', 'دائرة التراث الاسلامي', NULL, NULL, 947, 1105, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1487, 'عيد عودة عايد المهموم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1488, 'يونس عياد حموده اللحام', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1489, 'محمد مصطفى موسى الزاملي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1490, 'شفاء عبد العزيز علي البغدادي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1491, 'اسامه محمود ابراهيم الخطيب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1492, 'عبد الرحمن محمد منصور جرغون', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1493, 'صبحي حموده محمود البنا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1494, 'عبد القادر خليل اسماعيل الشطلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1495, 'جبر سالم جابر الاشهب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1496, 'حسين حمدان جميعان الصوفي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1497, 'عبد الكريم عطيه عبد الرحمن القططي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1498, 'أحمد يوسف عبد الرؤوف القردحجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1499, 'حسن رزق سلمان عبدو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1500, 'عوني محمد علي العلوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1501, 'حسن محمود حسن عبيده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1502, 'سامي محمود حسن عبيده', 'الإدارة العامة للشئون المالية', NULL, NULL, NULL, 1182, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1503, 'ابراهيم سليم محمود اصليح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1504, 'علي قاسم علي عبد الله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1505, 'أحمد يوسف محمد الشوبكي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1506, 'عبد الناصر سليمان سلمان الاسطل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1507, 'اسماعيل أحمد العبد ابو نومر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1508, 'عدنان موسى عبد الرحمن  يوسف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 987, 1010, 1158, NULL, NULL);
INSERT INTO `employees` VALUES (1509, 'رمضان عدلي محمد ربيع حموده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1510, 'محمود موسى عوض بربخ', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة المجتمعية والالكترونية', 'قسم الدعوة الالكترونية', NULL, 1035, 1036, 1037, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1511, 'عمر رمضان محمد العكلوك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1512, 'خليل حسن اسماعيل ياسين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1513, 'ادريس محمد ابراهيم العمري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1514, 'وليد خالد محمد ابو عبدالله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1515, 'مصطفى حسن علي ابو توهه', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم القناة الالكترونية', NULL, 948, 1026, 1080, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1516, 'سليمان سالم سليمان ابو والي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1517, 'فارس حمدي محمود السموني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1518, 'عبد الرحيم محمد محمد عواد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1519, 'خالد محمد عطوه زعرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1520, 'سلامه ديب سلامه الفيومي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1521, 'محمد أحمد محمد مصلح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1522, 'شحادة سعيد ابراهيم السويركي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1523, 'رتيبه عبد الحميد مصطفى المصري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1524, 'عوض جميل شكري الشرباصي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1525, 'سالم عبدالله سليمان درويش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1526, 'انور عودة حسن الكرد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1527, 'جبريل رمضان حسين الحاج احمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1528, 'ايمان انور أحمد البورنو', 'وحدة شؤون القدس', 'دائرة الانشطة والفعاليات', 'قسم تسويق البرامج', NULL, 1423, 1435, 1444, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1529, 'هاني شاكر صبري جندية', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1530, 'علي زياد علي القصابغلي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1531, 'أحمد عبد العزيز أحمد سمرة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1532, 'سناء صلحي صالح الدحنون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (1533, 'امال محمود عبدالله نصرالله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (1534, 'اشرف زهدي حسني جنينه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1535, 'نصري أحمد عوض عاشور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1536, 'حسين عبد الجواد محمد قاسم ابو زريق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1537, 'وليد يوسف زايد الدقس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1538, 'ياسر سعيد نجم نجم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1539, 'حسين عبد الفتاح حسين ماضي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1540, 'أحمد عادل اسماعيل وهدان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1541, 'جمال أحمد محمد عقل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1542, 'بشير حسين محمد الأستاذ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1543, 'ابتسام فايز محمود العروقي', 'وحدة الرقابة الداخلية', 'دائرة الرقابة الدينية والفنية', NULL, NULL, 1072, 1091, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1544, 'عارف محمود عرفه ابوسيف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1545, 'أحمد محمد أحمد الاعرج', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1546, 'صالح محمد محمد معروف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1547, 'مفيد شعبان أحمد ابو حصيره', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1548, 'ايمان رفعت شفيق الطباع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (1549, 'فايز رمضان يوسف عرابي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1550, 'شفيق محمد رجب ظاهر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1551, 'اسماعيل مصلح محمد صالح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1552, 'اماني عبد اللطيف محمد جابر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1553, 'هاني نافذ حسن ابوهاني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1554, 'صهيب سمير عبدالله الكحلوت', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة المجتمعية والالكترونية', 'قسم الدعوة الالكترونية', NULL, 1035, 1036, 1037, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1555, 'بلال محمد حسين الغلبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1556, 'اسماء حماد عودة مبرد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 987, 988, 1078, NULL, NULL);
INSERT INTO `employees` VALUES (1557, 'الاء جهاد فوزي السوسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1558, 'حِسن محمد عبد حموده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (1559, 'جابر سليمان عودة القديم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الأملاك الوسطى', NULL, 947, 956, 1154, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1560, 'عبدالله داود عبدالله علوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1561, 'ابراهيم خليل يوسف رضوان', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1562, 'علي جمال علي  المنشاوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 987, 1010, 1158, NULL, NULL);
INSERT INTO `employees` VALUES (1563, 'حسن علي محمد الشلح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1564, 'محمود محمد حسين ابو نار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1565, 'ياسر فضل بسيوني حسان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1566, 'محمد خالد حسين حلوين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1567, 'محمد يوسف محمد الكحلوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1568, 'سعيد أحمد عبدالله ابوعيطة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1569, 'عبد الواحد محمد سالم ابو سنيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1570, 'علاء تيسير علي المشهراوي', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم هندسة الصوت', NULL, 948, 1026, 1050, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1571, 'عرفات أحمد عبدالله التلباني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1572, 'مازن عليان مطر البراوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (1573, 'صبره أحمد عيد ابو شماله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 980, 981, 982, NULL, NULL);
INSERT INTO `employees` VALUES (1574, 'محمد ابراهيم محمد عبدالله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1575, 'محمود عبد الحميد محمد كلاب', 'وحدة العلاقات العامة والإعلام', 'دائرة العلاقة العامة', 'قسم العلاقات المحلية', NULL, 948, 1031, 1197, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1576, 'فرح حمدان علي النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1577, 'محمود سعيد محمد الحلاق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1578, 'يحيى علي عبدالله السميري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1579, 'مدحت حسين عطوان عطوان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1580, 'عبد الهادي عيد محمد البطش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1581, 'بسام ظافر عبد مشتهى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1582, 'عادل عبد القادر اسماعيل الهور', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1583, 'رفيق مصطفى سعيد الجعفراوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1584, 'خالد عايش شعبان عليان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1585, 'أحمد ربيع أحمد سالم ديب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1586, 'محمود ربيع أحمد سالم ديب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1587, 'علاء حسن علي سعد', 'وحدة المشاريع والتعاون الدولي', NULL, NULL, NULL, 1206, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1588, 'امال اديب حسين ابو جلهوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (1589, 'محمد سعد درويش الغف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1590, 'رسمية محمد عبدالله سلامة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1591, 'جمال محمد عبدالله ابو حجاج', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1592, 'احسان عوني حسين عاشور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1593, 'اسامه محمد محمود الدبس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1594, 'عماد محمد شعبان عليان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1595, 'محمد فايز رضوان رضوان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1596, 'اسحق خالد محمد البدري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1597, 'محمد درويش مصطفى درويش الهليس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1598, 'فخري صبحي أحمد الصادي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1599, 'محمد زاهر درويش محمد السوسي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1600, 'محمود عبد الخالق محمد خلة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1601, 'يوسف محمود حسن شحادة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1602, 'محمد محمود محمد ابو سبله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1603, 'جمعه عبد القادر شاكر صالح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1604, 'تيسير عبدالله محمد العطعوط', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1605, 'سعود سعد الدين عمر العلمي', 'الإدارة العامة للأملاك الوقفية', NULL, NULL, NULL, 967, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1606, 'زياد أحمد محمد النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1607, 'محرم فؤاد محمود عيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1608, 'غاده حسن مصطفى حميده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة القراءات القرآنية', 947, 956, 993, 1028, NULL, NULL);
INSERT INTO `employees` VALUES (1609, 'حمزه شعبان جعفر أبو لبن', 'وحدة العلاقات العامة والإعلام', 'دائرة العلاقة العامة', 'قسم الاصدارات والمطبوعات', NULL, 948, 1031, 1032, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1610, 'محمد علي شحده النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1611, 'رمضان عبد الكريم علي عيسى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1612, 'خالد عبد الرحيم ابراهيم احمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1613, 'وجدي عبد محمد العبادله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1614, 'وجيه عبد الرحمن محمد العبادله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1615, 'عبد الله خالد ابراهيم عبد الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1616, 'رافع أحمد محمد السقا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1617, 'أحمد حسين عودة ابو غرقود', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', NULL, 947, 956, 990, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1618, 'جهاد محمد حسين رضوان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1619, 'يوسف محمود يوسف بارود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1620, 'ياسر حماد حسن ابوسته', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', 'شعبة الحسابات', 947, 987, 1113, 1391, NULL, NULL);
INSERT INTO `employees` VALUES (1621, 'بلال محمود ابراهيم شهاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1622, 'عطاف حسن حسين ابو اسد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة مراكز التحفيظ -اناث', 947, 956, 993, 994, NULL, NULL);
INSERT INTO `employees` VALUES (1623, 'عبد الناصر عودة سليمان ابو نادي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1624, 'محمد عبد الخالق محمد خلة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1625, 'شريفة محمد رشيد السمك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1626, 'يونس فايز يونس الحسنات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1627, 'خالد ابراهيم محمد منصور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (1628, 'عمر أحمد عبد الغني المناعمه', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1629, 'عاهد حسن رشيد رشيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1630, 'تيسير كامل اسماعيل ابراهيم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1631, 'رجائي أحمد عبد الله حسين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1632, 'محمد حويطي حمد النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1633, 'يسرى أحمد حامد الهمص', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1634, 'محمد محمود محمد سلامة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1635, 'أحمد محمد شاكر حرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1636, 'محمد شحته أحمد البراوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1637, 'اشرف عمر عارف العف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1638, 'صائب عبد الحفيظ حسن البراوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1639, 'أحمد محمد حسين ابو مصطفى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1640, 'حاتم محمد عبد المظلوم', 'الادارة العامة للقرآن الكريم', 'دائرة ديوان الحفاظ', 'قسم المسابقات', NULL, 974, 1219, 1272, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1641, 'محمد جمال حسن سيد ابو الهنود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1642, 'عبد الباسط محمد عيسى الهيصمي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1643, 'عمران دياب صالح محيسن', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1644, 'محمود ابراهيم محمود نور', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1645, 'خالد محمود مصطفى الصليبي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الزكاة الوسطى', NULL, 947, 956, 1335, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1646, 'سمير أحمد محمد صالحه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', NULL, 947, 956, 957, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1647, 'محمد علي محمد هاشم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1648, 'مازن موسى ابراهيم الحلبي', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1649, 'جبر احمد سليمان ابو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1650, 'اسامه محمد ابراهيم الناجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1651, 'كمال أحمد علي بدره', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1652, 'ابراهيم عبد الرؤوف ابراهيم الدمياطي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1653, 'صلاح عبد الرؤوف ابراهيم الدمياطي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1654, 'اكرم طلب فرج الحرازين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1655, 'محمد مبارك علي حسين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1656, 'حنان علي محمد صالح البنا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1657, 'خالد أحمد حماد ابو رضوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1658, 'علي محمد أحمد ابراهيم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1659, 'جهاد مصباح عيسى حسن', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1660, 'جودت سلامه عبد الرحمن النبريص', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1661, 'وجيه ابراهيم يوسف علي يونس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1662, 'تيسير محمد عبد المعطي ابو شبيكه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1663, 'ماهر أحمد رمضان عرمانه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1664, 'سمير عبد الرحمن عبدالله قفه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1665, 'طارق فريد ربيع الطيبي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1666, 'أحمد عبد العزيز عبد العاطي شراب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1667, 'نافذ حسين حسن البواب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1668, 'نعمان علي نعمان عمار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1669, 'أحمد ابراهيم سالم اسليم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1670, 'حكمت محمد محمود البسوس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1671, 'جاسر رزق براوي الغول', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1672, 'محمد عاشور علي الدلو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1673, 'محمد عبدالله سالم حلس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1674, 'محمد موسى سعد اللحام', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1675, 'هاني مصطفى محمد جحلش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1676, 'لينا عبد العزيز عبد العزيز ابو شاويش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة القراءات القرآنية', 947, 956, 993, 1028, NULL, NULL);
INSERT INTO `employees` VALUES (1677, 'شوقي مصباح حمتو النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1678, 'كمال طلب محمد صالح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1679, 'محمد عبيد محمد دلول', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1680, 'غازي عوني يونس مرتجى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1681, 'سمير اسماعيل خليل اسماعيل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1682, 'أيمن حسن محمود السيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1683, 'حسين خليل حسين الغلبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1684, 'تيسير محمد محمد يحيى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1685, 'نزار سليم نمر ابو المعزه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1686, 'عبد الله يوسف عبد الله حموده', 'وحدة الزكاة والاغاثة', NULL, NULL, NULL, 955, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1687, 'حسن سلامه حسن فرج', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1688, 'شاهر حموده عرفات المبييض', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1689, 'محمد رضوان ابراهيم رجب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1690, 'زياد عياد محمد بكرون', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1691, 'ماهر عطيه حمد ابو خريس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1692, 'نوفل علي سالم ابو عيده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1693, 'نعيم حسين ابراهيم ابو عيدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1694, 'مسامح عبد القادر سليمان ابو مسامح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1695, 'عبد الرحمن عبد الرؤوف محمد المبحوح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1696, 'محمد عبد الرحيم ابراهيم أحمد', 'الإدارة العامة للشئون الإدارية', NULL, NULL, NULL, 1172, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1697, 'عبد الرحيم ابراهيم عوض الله احمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1698, 'عبدالله نعيم صالح الاغا', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم البرامج', NULL, 948, 1026, 1027, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1699, 'محي الدين خليل حسن الرملاوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1700, 'محمود محمد أحمد ناجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1701, 'ماجد محمد مصطفى الزيان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1702, 'زكريا أحمد شعبان مقاط', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1703, 'فؤاد محمد محمد الفيري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1704, 'شفيق سليم محمد ضاهر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1705, 'رجب أحمد رجب ظاهر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1706, 'سامي خضر محمد النزلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1707, 'جدع سليم محمد ساره', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1708, 'مصطفى ذيب مصطفى ضميده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1709, 'نائلة نعمان ابراهيم قاسم', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1710, 'أحمد علي محمد قميله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1711, 'نصر الدين اسماعيل أحمد كحيل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1712, 'يوسف ابراهيم سالم خلة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1713, 'عوني رباح أحمد كحيل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1714, 'محمد ابراهيم محمود خضرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1715, 'عطاالله عبدالله عبد الرازق السحار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1716, 'خليل حلمي نمر جرادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1717, 'أحمد حلمي نمر جرادة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1718, 'جمال رضوان خليل عويضه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1719, 'جمال محمد رضوان عويضه', NULL, 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, NULL, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1720, 'منى حمدي فرحات الزهار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (1721, 'محمود هاشم محمود عنبر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1722, 'ناصر فتحي البراوي عويضه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1723, 'أحمد خليل ماضي ابو ورده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1724, 'عمر عبد محمد الشندغلي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1725, 'ماجد اسحق مصطفى الريفي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1726, 'ابراهيم حسن محمد الحلاق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (1727, 'رمضان علي رشيد الغلاييني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1728, 'مها محمد سالم أبو ربيع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 980, 981, 1167, NULL, NULL);
INSERT INTO `employees` VALUES (1729, 'عبد الكريم خميس ابراهيم العرابيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1730, 'سميحه عبد رباح الكرد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1731, 'عبد السلام محمود درويش البطنيجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1732, 'سهيل يوسف عبدالله حجازي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1733, 'نيسان اسماعيل خليل فرحات', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1734, 'عبد الرحمن خميس فهمي الزبدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1735, 'فؤاد شحده عيسى نصار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1736, 'محمد حسين محمد هنية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1737, 'محمد محمود محمد شتات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1738, 'سليمان محمد سليمان المشوخي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1739, 'سمير سلامه علي ابو سنجر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', NULL, 947, 987, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1740, 'يحيى سليمان فالوجي الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', 'شعبة الصيانة', 947, 961, 1082, 1174, NULL, NULL);
INSERT INTO `employees` VALUES (1741, 'سعيد حسين أحمد عابد', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1742, 'عمار سعد الدين حسن البسيوني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1743, 'ابراهيم محمد ابراهيم ماضي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1744, 'علي ابراهيم علي ابو الروس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1745, 'بسام رضوان شحادة عليان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1746, 'عبد الرؤوف جبر عبد الجبار القططي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1747, 'فايز ابراهيم سليمان الزاملي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1748, 'محمد فرج عبد الحميد مرزوق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1749, 'موسى أحمد موسى العبادله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1750, 'ابراهيم محمد يوسف عايش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1751, 'سمير محمد عبد الرحمن المقوسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1752, 'سهيل ابراهيم محمود خريس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1753, 'عدلي ابراهيم محمود خريس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1754, 'خالد محمد اسماعيل عياد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (1755, 'محمد صالح محمود الاطرش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1756, 'حسن حسن علي حمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1757, 'سهيلة عبد القادر محمد حمدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1758, 'عطاف عبد القادر محمد حمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1759, 'ناهض سالم حسين الماشى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1760, 'نظمي عباس خضر سعده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1761, 'محمد حسين عبد الفتاح حمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1762, 'اشرف موسى عيد حماده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة مراكز التحفيظ -ذكور', 947, 952, 1053, 1054, NULL, NULL);
INSERT INTO `employees` VALUES (1763, 'كريم شعبان عبد الله عدوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1764, 'محمد حسن محمد عواجه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1765, 'محمد خليل ابراهيم سلمان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1766, 'محمد عبد العزيز محمد النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الزكاة', NULL, 947, 961, 1246, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1767, 'مريم حسن خليل ابو نجا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (1768, 'عبد الجواد محمد يوسف حماد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1769, 'سعد عودة مصطفى الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1770, 'يحيى عامر عيد ابو منيع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1771, 'بسام محمد عبد العزيز زعرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1772, 'محمد عبدالله جبر عوض', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1773, 'ابراهيم عبد الله جبر عوض', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1774, 'فاطمه عبدالله سليمان شيخ العيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1775, 'اشرف محمد محمد سحويل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1776, 'عبدالله محمد خليل سلمان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1777, 'محمد ديب عرابي جنيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1778, 'ياسر زعل محمد ابو العيش', 'الإدارة العامة للأملاك الوقفية', 'دائرة الأملاك', 'قسم قواعد بيانات الوقف', NULL, 967, 1117, 1129, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1779, 'منال عبد الرحمن اسماعيل زهد', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة والإرشاد -اناث', NULL, NULL, 1035, 1075, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1780, 'كامل خليل رجب ابريكه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1781, 'محمد ابراهيم سلمان ابو شعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1782, 'اشرف عبد الفتاح سعيد ريان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1783, 'وليد ابراهيم أحمد مهدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1784, 'عماد جميل حسين مطر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1785, 'اياد صلاح خليل ابو طعيمه', 'الإدارة العامة للشئون المالية', 'دائرة الحسابات والايرادات', NULL, NULL, 1182, 1042, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1786, 'ناظم خليل حسين اللوقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1787, 'عبد الهادي سالم أحمد المقادمه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1788, 'علاء الدين عبد الهادي محمد لافي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1789, 'محمد محمد عبد الهادي لافي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1790, 'عمر عبد الفتاح ديب يونس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1791, 'عمر أحمد محمد سلامة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1792, 'محمود حسين عيد معمر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1793, 'محمود موسى محمد زعرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1794, 'نهاد حسن اسماعيل اسماعيل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1795, 'نبيل عبد الحميد محمد ابو دقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1796, 'محمد محمود محمد الحاج', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1797, 'محمد سليمان يوسف المصري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1798, 'يحيى غازي حسن فرج الله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (1799, 'عماد محمود سلمان قشطه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1800, 'عبد الخالق عبد ربه سليمان التعبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1801, 'محمد عبد الرازق ابراهيم عواد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1802, 'نعيم سعيد محمود حمدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1803, 'اسماعيل سليم اسماعيل الكحلوت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1804, 'علي يوسف علي الهمص', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1805, 'منير سليم سلامه ابو حطب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1806, 'وليد أحمد حسني عويضه', 'الإدارة العامة للشئون الإدارية', NULL, NULL, NULL, 1172, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1807, 'عبد الكريم عبد الرحمن خليل حموده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1808, 'شاهر ابراهيم ديب جندية', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1809, 'علي عبد الحميد علي مكاوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1810, 'أيمن رمضان عبدالله حلس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1811, 'محمد فايق محمد نافع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1812, 'محمد أحمد محمد الديري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1813, 'حماده محمد أحمد الددا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1814, 'عبد الرحمن عودة عطوه ابو عمرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1815, 'نبيل جبر يوسف القرعان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1816, 'رفعت يوسف أحمد عبد العال محرم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1817, 'صلاح مصباح حسن ابو حويله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1818, 'حسن جمعه حسن الطبش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1819, 'ابراهيم خليل علي دبور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1820, 'اسراء موسى محمد سليمان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 987, 988, 1016, NULL, NULL);
INSERT INTO `employees` VALUES (1821, 'مصطفى عودة شحادة سعدات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1822, 'محمود عبد القادر محمد سمور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1823, 'محمود سلامه سلمان الزايغ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1824, 'اسامه ياسين أحمد اسليم', 'وحدة الزكاة والاغاثة', NULL, NULL, NULL, 955, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1825, 'عاطف محمد عطا قويدر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1826, 'سناء محمد عطا حسونة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1827, 'خالد خليل سعيد أبو شعبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1828, 'فايز عبد اللطيف العبد الشلفوح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1829, 'عبد القادر خالد عبد القادر ابو علي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1830, 'عبدالله أحمد حسين الشامي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1831, 'حنان سليمان محمد ابو نجا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1832, 'عبد الحميد حسن حسين صباح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1833, 'أيمن هديان محمد الاخرس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1834, 'بهزاد عطا سليم ابو الهطل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1835, 'محمد حسن عطوه حمدونه', 'الادارة العامة للقرآن الكريم', 'دائرة القراءات القرآنية', 'قسم القراء', NULL, 974, 1110, 1357, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1836, 'عبد الرحمن فارس زهر نصر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1837, 'حسن ابراهيم محمد ظاهر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الزكاة', NULL, 947, 980, 1171, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1838, 'حمدي خليل حسن الوالي', 'الإدارة العامة للشئون الإدارية', NULL, NULL, NULL, 1172, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1839, 'امال محمد حامد النمروطي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1840, 'فرح شعبان عرفات دردونه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1841, 'محمد رمضان شعبان عرفات دردونه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1842, 'نواف محمود حسين عقيل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1843, 'محمد عبد الرحمن خليل الشطلي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1844, 'عبد الغني ايوب عبد الحميد عطا الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1845, 'ياسر عدنان محمد ابو عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1846, 'ناهض حسن محمد شعبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1847, 'محمد اسماعيل داود ابو ديه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1848, 'جمال يوسف محمد البطنيجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1849, 'صلاح محمود سلامه ابو عصعوص', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1850, 'رحمه علي عبد الله لبد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1851, 'غازي علي عبد الله لبد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1852, 'سامي محمود عبدالله الكحلوت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1853, 'زهير محمود عبدالله الكحلوت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1854, 'هيثم بشير محمد حماد', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الشبكات والدعم الفني', 'قسم الصيانة والدعم الفني وإدارة الشبكات', NULL, 972, 1004, 1015, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1855, 'معين خليل عبدو العوضي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1856, 'خميس عبد داود البنا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1857, 'أحمد عبد الرازق عبد القادر درويش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1858, 'محمد كمال عمر شحادة الغزالي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1859, 'ماجد شعبان محمد ابوجبل', 'الادارة العامة للمساجد والمديريات', NULL, NULL, NULL, 947, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1860, 'محمد ابراهيم سعيد بربخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1861, 'سعيد ابراهيم سعيد بربخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1862, 'عمر يوسف عبدالله زيدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1863, 'صالح محمد محمد علوش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1864, 'زياد حموده درويش دردونه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1865, 'باسم جباره يوسف اللحام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1866, 'علي محمد علي النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1867, 'عبد الحليم خليل سعيد حموده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1868, 'اسماعيل زكي رمضان جنيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (1869, 'طلال محمد العبد عوض', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1870, 'حسين محمود حسن الشاعر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1871, 'حسن غانم محمد ابو شقرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1872, 'عبدالكريم محمد علي السدودي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1873, 'بهيجه أحمد عبدالله محفوط', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (1874, 'باسم حسن علي دبابش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', NULL, 947, 961, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1875, 'سامي عايد سويلم ابو هداف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1876, 'باسم خليل سليمان ابو طير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1877, 'عبد العزيز علي أحمد ابو فسيفس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1878, 'ياسر محمود محمد الرقب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1879, 'نضال زكي سالم عيسى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1880, 'يوسف حسين اسماعيل ابو عليان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1881, 'يوسف علي محمود فرحات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1882, 'شحده سلامه علي مصلح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1883, 'علي محمد علي مصلح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1884, 'أحمد ابراهيم محمد النشوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1885, 'خليل ابراهيم محمد النشوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1886, 'رشيد توفيق رشيد مصلح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1887, 'ايمان مجدي صلاح عدس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (1888, 'سليمان أحمد سالم ابو رويضه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1889, 'زياد جمعه سالم حجاج', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (1890, 'محمد حسين سعيد بربخ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1891, 'عادل اسماعيل محمد الصوالحه', 'الادارة العامة للحج والعمرة', NULL, NULL, NULL, 1100, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1892, 'أيمن عبد الفتاح محمد ربيع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1893, 'عبد القادر ابراهيم عبد القادر سالم', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1894, 'محمد اسماعيل ابراهيم ابو عابده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1895, 'نعيم جواد سعيد الحتو', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1896, 'امير محمد علي ابوالعمرين', 'الادارة العامة للدعوة والارشاد', NULL, NULL, NULL, 1035, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1897, 'عبد الحكيم عبدالله محمد عصفور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1898, 'نبيل عمران دياب محيسن', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1899, 'عدنان عبد الهادي حسن حسان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1900, 'عصام رمضان عبد الرحمن الجعب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1901, 'خالد سليمان عيد الشيخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1902, 'عادل عبد القادر محمود الغرابلي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', 'شعبة الصيانة', 947, 987, 1113, 1120, NULL, NULL);
INSERT INTO `employees` VALUES (1903, 'سليمان عبد القادر عارف رشوان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1904, 'ايهاب عبد الرحمن سعيد البيومي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1905, 'صابر أحمد عبد المعطي الغليظي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1906, 'محمد عبدالله سليمان ابو زايد', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1907, 'علي محمد أحمد الشلح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1908, 'فؤاد رمضان عارف حسين', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1909, 'عطاف شريف اسماعيل العشي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1910, 'خليل أحمد خليل النيرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1911, 'عاطف أحمد محمد ابو ضباع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1912, 'عيسى نعيم محمد العمودي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1913, 'فوزي عبد ابراهيم ابو عوده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1914, 'محمد فايز محمد هنية', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة القراءات القرآنية', 947, 952, 1053, 1058, NULL, NULL);
INSERT INTO `employees` VALUES (1915, 'نعيم مصطفى داود قلجه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1916, 'بكر عبدالله علي حسان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1917, 'شوقي موسى مصطفى اللداوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1918, 'نصر حسن عارف عزام', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1919, 'محسن محمود خالد عبدالله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1920, 'سوزان حسني احمد الكويفي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (1921, 'حسن علي عبد اللطيف الايوبي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1922, 'امين سعيد مصطفى حسونة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1923, 'محمد فايق محمد عجور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1924, 'جمال ابراهيم يوسف الصواف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1925, 'نافذ ابراهيم رباح خالد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1926, 'عماد محمد حسين الاشقر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1927, 'هلاله ابراهيم محمد ابو اسد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة القراءات القرآنية', 947, 956, 993, 1028, NULL, NULL);
INSERT INTO `employees` VALUES (1928, 'أحمد أحمد حسن ابو سليمان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1929, 'معين وصفي أحمد مشتهى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1930, 'كامل اسبيرو كامل عياد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1931, 'حسين سليمان ابراهيم النقله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1932, 'محمود محمد عبدالله ابو حجاج', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1933, 'مفيد محمد يعقوب عيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1934, 'انور أحمد عبد النبي العجرمي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (1935, 'خالد فلاح محمد أبو قص', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1936, 'نائل اكرم محمد الدهشان', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', NULL, NULL, NULL, 972, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1937, 'عمر جمعه سليمان البسيوني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1938, 'فريال مصطفى عبد الرحمن الطويل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (1939, 'فايز رشيد حامد الدلو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1940, 'منذر خليل صالح الغماري', 'الادارة العامة للمساجد والمديريات', NULL, NULL, NULL, 947, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1941, 'نبيل مطاوع حسن صبح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1942, 'زكية سلامه محمد ابو يوسف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1943, 'حمدان بركه صالح عبيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1944, 'مصطفى يوسف محمد ابو غلوه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1945, 'فريد عبد الرحمن يونس النيرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1946, 'ختام محمود جبريل عدوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (1947, 'حاتم سليم محمد الوحيدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1948, 'حسن محمد حسن البلبيسي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1949, 'خالد محمد محمد ابو ربيع', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1950, 'مصطفى سالم أحمد ابو حلوب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1951, 'رفيق حسن حسين ابو كلوب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1952, 'عكرمه عليان أحمد مطر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1953, 'احمد ايوب محمد الحلو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1954, 'ابراهيم أحمد موسى ابو نجا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1955, 'صبحي محمد ابراهيم سماره', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1956, 'عيد مسعود مرضي قنبور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1957, 'ميخائيل ابراهيم نخله الجلده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1958, 'اكرم حمدي حمدان اخزيق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1959, 'عادل حمدي حمدان اخزيق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1960, 'حسن أحمد حسن مهنا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1961, 'اشرف مصطفى عودة سعدات', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1962, 'انعام عياده يوسف الشرافي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 980, 981, 1167, NULL, NULL);
INSERT INTO `employees` VALUES (1963, 'عمر حسن علي شاميه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1964, 'نصرالله عبد الكريم محمد الفيومي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1965, 'عزه طلب محمد سويرجو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1966, 'اسحق حسين محمد ابو سيدو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1967, 'سلامه عوني عبد المحسن حموده', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1968, 'فلاح عوني عبد المحسن حموده', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1969, 'لافي سليمان سليم الديري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1970, 'راويه محمد خليل ابو حشيش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 980, 981, 1167, NULL, NULL);
INSERT INTO `employees` VALUES (1971, 'ابراهيم عبد القادر عبد الهادي سالم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1972, 'مروان اسماعيل محمد مطر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1973, 'أحمد مصطفى محمد القانوع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1974, 'موسى حسين علي الدعمه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1975, 'مازن محمود محمد عزام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1976, 'سعيد اسماعيل حسين الهباش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1977, 'وفاء عبد العزيز معاذ غزال', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1978, 'حسين محمد حسن نصار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1979, 'فيصل حمدي مرجان عطاالله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1980, 'مريم امين عبد الحافظ ابوسعدة', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1981, 'عبد الرحمن مصطفى طاهر الجلب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1982, 'مصطفى عبد طاهر الجلب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1983, 'انور ابراهيم حسين الحداد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1984, 'محمود حسن أحمد ابو ديه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1985, 'زكي جميل خليل حبيب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1986, 'صلاح أحمد حسن ابو صقر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1987, 'أشرف اسماعيل محمد الشاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1988, 'انعام أحمد محمد ابو سلامه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 980, 981, 1167, NULL, NULL);
INSERT INTO `employees` VALUES (1989, 'جمال عيسى مصطفى البيك', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1990, 'رمزي محمود محمد ابو مطر', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم الاشراف الهندسي', NULL, 967, 968, 1137, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1991, 'كمال محمد حسين النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1992, 'فؤاد عيسى محمود ابو عبيدالله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1993, 'عبد اللطيف حسن عبد الغني سالم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1994, 'سلوى عبد الرحمن محمد خضر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (1995, 'محمود حمد محمد منون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1996, 'امال اسماعيل محمد ابو مذكور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1997, 'وائل عبد الكريم حسين الشافعي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (1998, 'نضال يونس حسن الشندي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (1999, 'فايز وجيه رشيد رشيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2000, 'محمد يوسف محمود صيام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (2001, 'موسى عاشور علي البطش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2002, 'محمد سعد محمد سكر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2003, 'رفيق اسعد محمد رضوان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2004, 'ماجد محمد مصطفى دغمش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2005, 'سامي رمضان محمود النيرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2006, 'جمال علي عبدالله مغاري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2007, 'اياد سالم داود ابوداود', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2008, 'أسامة عادل يوسف السلطان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2009, 'عبد الفتاح فؤاد علي بدوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2010, 'ناصر محمد مسلم صيام', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2011, 'وصفي احمد ابراهيم قديح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', NULL, 947, 961, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2012, 'فضل سالم زايد ابو شريعه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2013, 'ابراهيم مديرس محمد ابوعوكل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2014, 'حسن محمد حسين خريس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2015, 'عمر عبد القادر سليمان فياض', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2016, 'عبد الهادي فرج سالم السميري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2017, 'نادره هاشم عبد الفتاح ابو حامده', 'وحدة التعليم الشرعي', 'الدائرة العلمية', 'قسم التاهيل الشرعي والتطوير', NULL, 949, 1084, 1395, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2018, 'نزار ايوب عبد الباري عواد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2019, 'محمود عبد سليمان ابو عاذرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2020, 'سليم أحمد نصار العاروقي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2021, 'صبري عبدالله محمود ابو نحله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2022, 'خالد رجب أحمد العطار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2023, 'غاده محمد خليل عرابي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (2024, 'سمير اسماعيل عبد الهادي مسلم', 'وحدة شؤون القدس', NULL, NULL, NULL, 1423, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2025, 'محمد عبد العزيز محمد ابو الروس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2026, 'حمدان اهديان حمدان قديح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (2027, 'سليمان محمود خليل الشواف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2028, 'عدنان عابد محمد عابد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2029, 'حسن حسين يوسف دحلان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2030, 'عمر محمد عبد الهادي النمروطي', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2031, 'حسين سيد أحمد رالي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2032, 'محمد عبدالله ابراهيم ناجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2033, 'أحمد محمود نادي جرغون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة القراءات القرآنية', 947, 961, 1076, 1228, NULL, NULL);
INSERT INTO `employees` VALUES (2034, 'كفايه سويلم موسى ابو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 987, 988, 989, NULL, NULL);
INSERT INTO `employees` VALUES (2035, 'يحيى محمد راغب الغلبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (2036, 'خليل حسين أحمد الغلبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2037, 'سالم نايف محمود العروقي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة شؤون الموظفين والعاملين', 947, 956, 957, 1224, NULL, NULL);
INSERT INTO `employees` VALUES (2038, 'ادهم محمود حسن البلتاجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2039, 'اياد ابراهيم محمد عوده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2040, 'اياد عبد الرحيم راشد الدلو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2041, 'صائب أحمد محمد ابو مطر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2042, 'رامي محمد مصطفى ابو غالي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2043, 'موسى جدوع هديوي الكرد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2044, 'ناجح عبد العزيز ابراهيم الجزار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2045, 'كفاح محمد محمد الشريف', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'قسم شؤون الطلبة', NULL, 949, 1025, 1233, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2046, 'اسامه أحمد محمد ابو شعيره', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2047, 'نزار شفيق محمد المغاري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2048, 'جوده سليمان عمران شملخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2049, 'عبد السلام محمد عبد السلام هنيه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الأملاك الوسطى', NULL, 947, 956, 1154, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2050, 'اسماء جمال محمد بدر', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2051, 'عمر شاهر عمر  يوسف', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم التصميم الهندسي', NULL, 967, 968, 1187, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2052, 'محمد عرفات صالح خليل الغماري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2053, 'فايز سليمان محمد شلح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2054, 'بلال امين ربيع خضر', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الشبكات والدعم الفني', 'قسم الصيانة والدعم الفني وإدارة الشبكات', NULL, 972, 1004, 1015, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2055, 'أحمد محمود محمد عابد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2056, 'محمد عبد الكريم اسعد الصفدي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', NULL, 947, 952, 1053, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2057, 'اسماعيل سليمان فالوجي الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (2058, 'هاني محمد عبد الحميد المغربي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2059, 'منال سليمان سعيد العجل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (2060, 'ابراهيم محمد حسين درويش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2061, 'عبد الرحمن أحمد سليم غزال', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2062, 'شادي محمد عوض ابراهيم عوض الله', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم القناة الالكترونية', NULL, 948, 1026, 1080, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2063, 'طارق محمد فايق أبو شعبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2064, 'طلعت ممدوح احمد بارود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2065, 'عبد القادر محمد عبد القادر طومان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2066, 'شادي محمود حسن ابوعيطة', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2067, 'محمد مصطفى سليمان ابو مصطفى', 'وحدة التخطيط وتطوير الأداء المؤسسي', NULL, NULL, NULL, 966, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2068, 'بلال فضل محمد ابو دقه', 'الإدارة العامة للشئون المالية', 'دائرة المشتريات', NULL, NULL, 1182, 1146, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2069, 'محمد خليل سليمان رضوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (2070, 'حلمي عبد ربه محمد ابو عنزه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2071, 'انور خليل عبدالله بعلوشة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2072, 'محمد ابراهيم عبد الحليم طه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2073, 'فؤاد يوسف سليمان ابو سعيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2074, 'زياد صبحي حسنين الحاج احمد', 'الادارة العامة للقرآن الكريم', 'دائرة ديوان الحفاظ', NULL, NULL, 974, 1219, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2075, 'خالد محمود عوض الله عوضية', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2076, 'شادي محمد خليل دبور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2077, 'اشرف محمد حمد النحال', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2078, 'جمال حماد سالم صلاح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2079, 'سعيد سالم ابراهيم زعرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2080, 'محمد غازي حسن الغف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2081, 'اسماعيل خضر محمد خضر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2082, 'سمير محمد سعيد بارود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2083, 'زكي قنوع حسين نصر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2084, 'عبدالغني حسن عبدالغني السباح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2085, 'سمير اسعد سلمان ابو زور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2086, 'بسام محمود عبدالله ضاهر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2087, 'عبد المجيد احمد حسن عيسى الخالدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2088, 'يسري نصر درويش البلتاجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2089, 'خالد محمود حسين الدره', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2090, 'محمود ابراهيم محمود الشاويش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2091, 'ختام رزق عبدالله زيدية', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (2092, 'حبيب عبد العزيز عبد الكريم الوحيدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2093, 'عبد الوهاب حمدان زايد كشكو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2094, 'محمد محمد حسين السرحي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2095, 'اسامه محمد داود حمادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2096, 'يحيى عبد القادر موسى الاسطل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (2097, 'اميمه عبد الرحمن ابراهيم الشنطي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2098, 'نرمين عطوه احميد خليل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2099, 'ابراهيم رجب محمد حماد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2100, 'عبد الكريم حسن علي صافي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2101, 'تيسير محمد محمد الرقب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الأملاك', NULL, 947, 961, 1081, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2102, 'عمر عبدالله محمد شلح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2103, 'درويش أحمد درويش الترك', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2104, 'عمر محمد عبد الجواد فورة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2105, 'نعيم سليمان درويش الاطرش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2106, 'حسن كمال حسن الافغاني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2107, 'سعد محمد سعيد الطباطيبي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2108, 'محمد جوهر هاشم نجيب الجاروشه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2109, 'محمد عبد الحافظ عبد المجيد المجايده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2110, 'بهاء عبد القادر عبد الباري ابو شماله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 961, 1046, 1098, NULL, NULL);
INSERT INTO `employees` VALUES (2111, 'صالح حسن حمدان ابو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2112, 'طارق حسين فرحان العواوده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2113, 'ماجد يوسف خليل القرا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2114, 'امال محمد رمضان الخور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (2115, 'خليل محارب أحمد السويركي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2116, 'رأفت ناصر عبد الرحمن ابو عوده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (2117, 'سعد سليمان عطيه ابو شريعه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2118, 'ابراهيم عبد العزيز ابراهيم ابو شريعه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2119, 'محمد شحادة ابراهيم ابو شريعه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2120, 'باسل عمر مصطفى المجايده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2121, 'محمد عبد ربه محمد النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2122, 'اسماعيل عبدالله علي ابوزبيدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2123, 'أحمد موسى عيسى السيلاوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2124, 'مطيع موسى عيسى السيلاوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2125, 'جودت عادل محمد الرفاتي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2126, 'ماهر محمود أحمد فنقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2127, 'ماجد ابراهيم مصطفى حمدان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2128, 'مروان محمد حسين الشوا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2129, 'هالة محمد حنفي الشرفا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (2130, 'علي مطاوع علي الدايه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2131, 'عبد القادر عبد الكريم عبد الله ابوعوده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2132, 'سعيد محفوظ حمدان اخزيق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2133, 'صالح محفوظ حمدان اخزيق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2134, 'علا انور عيد الحايك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (2135, 'محمد خضر كامل العجله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2136, 'توفيق عثمان محمد نبهان', 'الإدارة العامة للشئون المالية', 'دائرة المشتريات', 'قسم العطاءات', NULL, 1182, 1146, 1363, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2137, 'محمود محمد محمود نصر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2138, 'اياس رمضان موسى ابوالعمرين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2139, 'أحمد محمود زكي شراب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة القراءات القرآنية', 947, 961, 1076, 1228, NULL, NULL);
INSERT INTO `employees` VALUES (2140, 'حيدر محمد اسماعيل البحيري', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم البرامج', NULL, 948, 1026, 1027, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2141, 'عبدالله يوسف علي النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (2142, 'أحمد رمضان سليمان المصري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد', NULL, 947, 956, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2143, 'عمر عطيه قنديل مزيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2144, 'كارم ايوب عواد ابو سمره', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم التنسيق والمتابعة', NULL, 948, 1026, 1109, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2145, 'معمر يحيى محمد المشهراوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2146, 'غدير علي محمد الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 961, 1046, 1200, NULL, NULL);
INSERT INTO `employees` VALUES (2147, 'مرفت عدنان حسن كلخ', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2148, 'مؤمن محمد جمعه ابو طعيمه', 'وحدة العلاقات العامة والإعلام', 'دائرة الاعلام ', 'قسم النشر الاعلامي', NULL, 948, 970, 1308, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2149, 'منال اسماعيل حلمي الدبس', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة والإرشاد -اناث', NULL, NULL, 1035, 1075, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2150, 'بسام خليل مصباح الصفدي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2151, 'ايهاب محمود ربيع سالم ديب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', 'شعبة شؤون الموظفين والعاملين', 947, 980, 1086, 1087, NULL, NULL);
INSERT INTO `employees` VALUES (2152, 'عامر أحمد موسى معروف', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2153, 'شعبان محمد احمد النيرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2154, 'سماح محمد يعقوب المدهون', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2155, 'محمد عبد محمد بلبل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة شؤون الموظفين والعاملين', 947, 952, 1011, 1150, NULL, NULL);
INSERT INTO `employees` VALUES (2156, 'حمد حسن علي النجار', 'الادارة العامة للقرآن الكريم', NULL, NULL, NULL, 974, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2157, 'هيثم حسين رجب عواد', 'الإدارة العامة للشئون الإدارية', NULL, NULL, NULL, 1172, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2158, 'عاهد بشير روبين زينو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم القرآن الكريم -ذكور غزة', 'شعبة القراءات القرآنية', 947, 952, 1053, 1058, NULL, NULL);
INSERT INTO `employees` VALUES (2159, 'امير أحمد محمد سلامة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2160, 'صالح محمود صالح الديري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2161, 'عارف عمر عارف العف', 'الإدارة العامة للشئون المالية', 'دائرة الحسابات والايرادات', NULL, NULL, 1182, 1042, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2162, 'محمد عمر سعيد الجدبه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2163, 'محمد عدنان بدر صيام', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2164, 'محمد حسن عبد الرحيم فضه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2165, 'بشير عبدالله محمد شلح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2166, 'محمد أحمد محمود عبيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2167, 'محمود عبد الرحمن محمد عبد الواحد', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم العمل المؤقت', NULL, 1172, 975, 976, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2168, 'محمد أحمد عيد فارس', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2169, 'ناهض محمد علي رزق انطيز', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2170, 'محمد حيدر خالد مسمح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الأملاك', NULL, 947, 961, 1081, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2171, 'زياد عمر مطيع حسونة', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم ديوان الوزارة', NULL, 1172, 975, 1226, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2172, 'عماد عبدالله اسماعيل قرموط', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (2173, 'اسلام علي محمد ابو سعيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2174, 'حنان حسن محمود سمور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (2175, 'طلال احمد اسماعيل الشنباري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2176, 'عبد الرحمن نصر محمد مراد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2177, 'عيسى محمد عطوه زعرب', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2178, 'علاء جميل سلامه التتر', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2179, 'ابراهيم يوسف عبدالله الجدبه', 'الادارة العامة للقرآن الكريم', 'دائرة ديوان الحفاظ', 'قسم الدراسات والبرامج القرآنية', NULL, 974, 1219, 1225, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2180, 'حماده سمير سالم ابو شربي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2181, 'سلامه مبارك سالم سلام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2182, 'محمد حسن محمد ابو شحمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة شؤون الموظفين والعاملين', 947, 956, 957, 1224, NULL, NULL);
INSERT INTO `employees` VALUES (2183, 'رامي سليم موسى أبومور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2184, 'شادي أحمد محمد البريم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (2185, 'نسرين صلاح خضر ابو جراد', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2186, 'محمد ابراهيم عبد القادر سالم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الأملاك', NULL, 947, 980, 1099, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2187, 'ثائر غيث سلامه ابو غيث', 'وحدة الشؤون القانونية', NULL, 'قسم القضايا', NULL, 944, NULL, 945, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2188, 'سميره ابراهيم حمدان اخزيق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (2189, 'صالح حسن رجب الجماصي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2190, 'أحمد عبد السلام محمود اعبيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2191, 'سمير محمد عبد الرحمن شاهين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2192, 'محمود محمد محمود عابد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2193, 'أشرف محمد يوسف أبو ديه', 'وحدة الزكاة والاغاثة', 'دائرة صندوق الزكاة', 'قسم لجان الزكاة', NULL, 955, 1222, 1223, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2194, 'عماد محمد فارس ابو كرش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2195, 'فلاح سعد عمر الدلو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2196, 'أحمد محمود مصطفى سالم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2197, 'ناصر العبد سليم المرنخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2198, 'وائل رزق محمود ابو القمبز', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الشبكات والدعم الفني', 'قسم إدارة أنظمة التشغيل', NULL, 972, 1004, 1005, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2199, 'رياض حسين حمدان السلاخي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2200, 'جمال كمال رجب الدهشان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2201, 'عبد الباري محمد محمد خله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2202, 'ممدوح خضر خليل العشي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2203, 'سلمان مرضي ظهر السعودي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2204, 'عماد منير نجيب الصايغ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2205, 'محمد عبد السلام محمد ابو منصور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2206, 'فايز عبد السلام محمد ابومنصور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2207, 'صالح محمود عبد الرحمن الشريف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2208, 'عبد الحي عبد المجيد محمد المبحوح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2209, 'أحلام يحيى عبد ربه مقداد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2210, 'محمد عبد المجيد محمد المبحوح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2211, 'بسام موسى مصباح النزلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2212, 'محمد غازي خميس سعد الغف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2213, 'زاهد سالم أحمد النواتي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2214, 'علي محمد سلمان ابو نجا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2215, 'كمال محمد حسين قشطه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2216, 'عايش محمود عبدالله ابوهربيد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2217, 'عطيه شحادة بيومي البقري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2218, 'رمضان محمد يوسف صافي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2219, 'امل جبر عبد اشتيوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (2220, 'ابراهيم خليل محمد حمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2221, 'اياد أحمد محمد برهومه', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2222, 'ايهاب حمدان يوسف ابو غنيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2223, 'رامي عيسى اسماعيل نصار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', 'شعبة القراءات القرآنية', 947, 956, 990, 1016, NULL, NULL);
INSERT INTO `employees` VALUES (2224, 'منير حمدي حسين الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2225, 'عيسى حسن ابراهيم ابو نار', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'نائب العميد للشؤون الاكاديمية', NULL, 949, 1025, 1414, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2226, 'اسماعيل عمر محمد حمادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2227, 'محمد رمضان محمود الحلو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2228, 'بلال محمد غازي رشدي الغرابلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2229, 'محمد عبد الحميد سعيد المغني', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2230, 'محمد محمد علي الكويفي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2231, 'احمد محمود سلامه شراب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (2232, 'زينب نوفل أحمد راضي', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2233, 'محمد عبد الهادي سعيد شبير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2234, 'عبير سليمان حسن شعت', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (2235, 'أحمد مجدي جمال مشتهى', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2236, 'ماهر فتحي موسى حسونة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2237, 'رمزي سامي سعيد النواجحه', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', NULL, NULL, 948, 1026, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2238, 'عدنان ياسين ابراهيم البلتاجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2239, 'ايهاب اكرم يوسف دغمش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2240, 'حسين محمد حسين الشرافي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', 'شعبة شؤون الموظفين والعاملين', 947, 980, 1086, 1087, NULL, NULL);
INSERT INTO `employees` VALUES (2241, 'ماهر اكرم محمود اليازجي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2242, 'هدى فرج مصطفى ابو دقه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2243, 'عمرو أحمد سعيد دويمه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2244, 'مفيد عبد الرحمن حسين صبح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2245, 'اكرم محمد سلامه صرصور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2246, 'محمد حسني عبد الله ثلجي', 'الادارة العامة للقرآن الكريم', 'دائرة ديوان الحفاظ', NULL, NULL, 974, 1219, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2247, 'رامي جميل زكي البنا', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم نظم المعلومات الجغرافية والمساحة', NULL, 967, 968, 969, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2248, 'محمود محمد عودة ابو شماله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2249, 'حسين اديب حسين ابو جلهوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (2250, 'ريم عرفات ابراهيم الميناوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة مراكز التحفيظ -اناث غزة', 947, 952, 983, 984, NULL, NULL);
INSERT INTO `employees` VALUES (2251, 'محمد عطيه قنديل مزيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2252, 'سامر ابراهيم شكري الوليد', 'الإدارة العامة للشئون المالية', 'دائرة المشتريات', 'قسم المشتريات', NULL, 1182, 1146, 1147, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2253, 'اسامه فوزي محمد برهوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2254, 'أيمن عبد اللطيف محمود كلاب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2255, 'سها مصباح محمد ابو سالم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', NULL, 947, 980, 981, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2256, 'عبد القادر عيد حسين ابو شماس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2257, 'ايناس درويش مصطفى رزق', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2258, 'ممدوح محمد عبد القادر موسى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2259, 'مؤمن محمد توفيق الدالي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة الميدانية والاكترونية', 947, 952, 1332, 1334, NULL, NULL);
INSERT INTO `employees` VALUES (2260, 'احمد كمال مجدي محمد علي عدوان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 1062, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2261, 'ايناس محمد حسن الصوص', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'قسم العلاقات العامة والإعلام', NULL, 949, 1025, 1218, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2262, 'هبه عزام معود علي يونس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', NULL, 947, 987, 988, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2263, 'عبد الهادي محمود خالد ابو مر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2264, 'محمود عبد الرؤوف قعدان قعدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2265, 'حسني أحمد محمد ابو نجا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2266, 'سلوى سليم صالح المصري', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2267, 'محمد رياض ابراهيم محمد ابو شاويش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', 'شعبة الخدمات', 947, 961, 1082, 1083, NULL, NULL);
INSERT INTO `employees` VALUES (2268, 'جمال صالح عودة القطش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', 'شعبة مراكز التحفيظ -ذكور', 947, 956, 990, 1071, NULL, NULL);
INSERT INTO `employees` VALUES (2269, 'سمير عبد القادر محمد محارب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2270, 'أيمن حسين علي جربوع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2271, 'فؤاد شحده علي الغوطي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', NULL, 947, 987, 1010, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2272, 'عصام حامد محمد ضهير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2273, 'ابراهيم حسن محمد عليان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2274, 'موسى اسماعيل علي ابو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2275, 'غسان خالد ربحي الجايح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2276, 'خليل علي خليل عفانة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2277, 'أحمد خميس أحمد الغول', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2278, 'فؤاد مصطفى عبد السلام الغول', 'الإدارة العامة للشئون المالية', NULL, NULL, NULL, 1182, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2279, 'سعد محمد صالح القيق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2280, 'ابراهيم مصطفى حرب عصفوره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', NULL, 947, 980, 1017, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2281, 'محمد عمر عبد المالك حبيب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2282, 'رمضان محمد حسين صالح', 'الادارة العامة للحج والعمرة', 'دائرة مالية الحج والعمرة', 'قسم تحصيل الرسوم', NULL, 1100, 1214, 1215, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2283, 'محمود عبدالله أحمد الصيفي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2284, 'محمد محمود محمد عوض', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2285, 'أحمد موسى عبد ابويوسف', 'وحدة شؤون القدس', 'دائرة التوثيق والاصدارات', 'قسم الاصدارات والمطبوعات', NULL, 1423, 1442, 1447, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2286, 'فريدة خليل سليمان ابو طير', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2287, 'محمد غازي محمد علوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2288, 'محمد سعيد محمد طافش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2289, 'محمد أحمد محمود الصفدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2290, 'يوسف جمال يوسف مطر', 'وحدة الرقابة الداخلية', 'دائرة الرقابة المالية', NULL, NULL, 1072, 1210, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2291, 'رائد نادي صالح العطار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2292, 'امجد يوسف محمد ابووردة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2293, 'عمار عزمي صالح الرفاتي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2294, 'محمد أحمد موسى الاشقر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2295, 'وفاء اسماعيل موسى ابو نجا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2296, 'خديجه حسن شعبان سليمان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2297, 'محمد يوسف محمد العيوطي', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة المسجدية', 'قسم الخطباء', NULL, 1035, 1069, 1372, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2298, 'نايف هشام نايف ابو شماله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (2299, 'زياد حمزه علي عبيد', 'الإدارة العامة للأملاك الوقفية', 'دائرة المقابر', NULL, NULL, 967, 1065, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2300, 'عماد محمد عبدالله عطا الله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2301, 'سوزان اكرم يوسف دغمش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة القراءات القرآنية غزة', 947, 952, 983, 1013, NULL, NULL);
INSERT INTO `employees` VALUES (2302, 'عبدالله أحمد يوسف السرساوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2303, 'هاني محمد أحمد رضوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2304, 'نعيم محمد سالم النجار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2305, 'كفاح عبد الرحمن أحمد الرنتيسي', 'وحدة التعليم الشرعي', NULL, NULL, NULL, 949, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2306, 'ابراهيم عبد الله دياب لافي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2307, 'غريب محمود أحمد لافي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2308, 'محمد صالح عودة قطش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', 'شعبة مراكز التحفيظ -ذكور', 947, 956, 990, 1071, NULL, NULL);
INSERT INTO `employees` VALUES (2309, 'حازم عبد الحكيم ابراهيم الشيخ خليل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2310, 'عبدالله نصار حسين الشاعر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2311, 'نضال سليمان عطيه قشطة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2312, 'أسامة صالح عبد الوهاب فنانه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (2313, 'هاني رشيد حسن ابو شرخ', 'الادارة العامة للمساجد والمديريات', 'دائرة التراث الاسلامي', 'قسم المخطوطات', NULL, 947, 1105, 1115, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2314, 'اشرف مرزوق مسلم ابو خاطر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2315, 'أحمد خالد عبد الحي كلاب', 'الادارة العامة للقرآن الكريم', 'دائرة القراءات القرآنية', 'قسم المصحف الشريف', NULL, 974, 1110, 1356, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2316, 'عماد مصباح نصر الدايه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2317, 'وفاء زياد أحمد حجو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (2318, 'زلفى محمد عبد الرزاق محمود مسعود', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (2319, 'انعام محمد عبد الكريم عبد الرحمن شهاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (2320, 'غسان عبد الله يوسف الاغا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2321, 'محمد محمود جميل دردونه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2322, 'اشرف عادل محمود اسماعيل', 'وحدة المشاريع والتعاون الدولي', 'وحدة المشاريع والتعاون الدولي', NULL, NULL, 1206, 1206, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2323, 'محمود زكي محمود زياره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2324, 'محمود اسماعيل سالم ابو الروس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2325, 'أحمد عبد الكريم صالح ابو الروس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2326, 'صقر عبد المالك حسن السلطان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2327, 'عادل ابراهيم خليل سلمان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2328, 'أحمد سلطان رميح الوحيدي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2329, 'وائل شعيب خليل الكولك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2330, 'ظافر حسن عبد المحسن الحوراني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2331, 'مهدي عبد الرحمن حسن ابو سنيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الدعوة والارشاد', NULL, 947, 987, 1387, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2332, 'عبير رمضان محمود النيرب', 'الإدارة العامة للشئون المالية', 'دائرة الموازنة والتدقيق', 'قسم التدقيق', NULL, 1182, 1029, 1364, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2333, 'لؤي عبد الكريم محمد نصر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2334, 'مرفت ابراهيم عبد الله الشيخ خليل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 987, 988, 989, NULL, NULL);
INSERT INTO `employees` VALUES (2335, 'أحمد حسن مصطفى ابو وردة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2336, 'مهدي فايز مصطفى الاطبش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2337, 'اسامه صلاح محمد المصري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2338, 'أيمن رزق اسماعيل ابوظريفه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2339, 'أيمن أحمد اسماعيل قزاعر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2340, 'محمد صبحي عبد العاطي البحيصي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2341, 'عمار محمد زرعي قديح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2342, 'معتز عبد الرحمن حسن ابو سنيمه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2343, 'محمد رجب صالح حمتو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2344, 'وائل موسى فرج عوض الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2345, 'مازن أحمد محمود لافي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2346, 'ابراهيم حسن محمد ابو حصيره', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2347, 'كرم الله صالح عبدالله ابو دلو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2348, 'محمد شحده محمد خطاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2349, 'علياء حسن عبد الله حسان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 987, 988, 1078, NULL, NULL);
INSERT INTO `employees` VALUES (2350, 'سعيد محمد سعيد بكرون', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2351, 'سرار محمد سلمان منون', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2352, 'أحمد ربيع محمد حمدية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2353, 'عمر جمعه أحمد ابو جاموس', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2354, 'مصطفى رجب مصطفى علي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2355, 'محمد ربيع يوسف دردونه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2356, 'نفوذ محمد عبدالله ريان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2357, 'وصفي علي أحمد السقا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2358, 'محمد يحيى حسن الصاع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2359, 'ابراهيم محمد عطوه زعرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2360, 'الحسين ربيع محمود البنا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2361, 'صابر مسلم سلمان التلباني', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2362, 'ربحي رجب راغب أبو شعبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2363, 'عمر أحمد حسين نصار', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2364, 'محمود موسى شحادة عليان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2365, 'سهيل مشيل توفيق ابو داود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2366, 'اسماعيل أحمد محمد المبحوح', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2367, 'نمر محمد مصطفى ابو عون', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2368, 'محمد أحمد محمود سليمان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2369, 'معين أحمد محمد شلدان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2370, 'صباح عبد الله عبد الرازق سلامة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', NULL, 947, 987, 988, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2371, 'محمد سعيد علي رمضان الخضري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2372, 'منذر صافي محمد السكافي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2373, 'أحمد عيد صالح حمادة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2374, 'عبد ربه عبد العزيز محمد شعبان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2375, 'انس موسى نايف نوفل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2376, 'حنان محمد أحمد البيوك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', 'شعبة القراءات القرآنية', 947, 961, 1046, 1200, NULL, NULL);
INSERT INTO `employees` VALUES (2377, 'حسام جمال محمود ابو هاشم', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', NULL, NULL, 967, 968, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2378, 'صابرين محمد مسلم ابو مصطفى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2379, 'عامر سليمان حافظ الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 961, 1076, 1077, NULL, NULL);
INSERT INTO `employees` VALUES (2380, 'خليل سميح سعيد ابو مايله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2381, 'نبيل عبد الكريم سعيد ضبان', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2382, 'غاده عزات أحمد علي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي', NULL, 947, 956, 981, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2383, 'امين محمود محمد زياره', 'الادارة العامة للحج والعمرة', 'دائرة الحج والعمرة وتأهيل الشركات', 'قسم التفتيش والتقويم', NULL, 1100, 1101, 1199, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2384, 'أحمد نصار محمود أبو ثريا', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'نائب العميد للشؤون الاكاديمية', NULL, 949, 1025, 1414, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2385, 'حسن محمد حسن ابو ركبه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2386, 'محمد مروان اسماعيل حمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2387, 'رشدي بسام رشدي وشاح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة شؤون الموظفين والعاملين', 947, 952, 1011, 1150, NULL, NULL);
INSERT INTO `employees` VALUES (2388, 'رامي هشام مصباح الزهري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2389, 'صالح أحمد محمود ابو معروف', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2390, 'محمد سليم حسين الدبجي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2391, 'عادل عبد الكريم ابراهيم حسنه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2392, 'عبد الحميد رمضان محمد حمادة', 'وحدة العلاقات العامة والإعلام', 'دائرة العلاقة العامة', 'قسم العلاقات المحلية', NULL, 948, 1031, 1197, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2393, 'علاء الدين سليمان أحمد مسمح', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم هندسة الصوت', NULL, 948, 1026, 1050, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2394, 'حسام حلمي حسن صيام', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, 'شعبة الدعوة المسجدية', 947, 980, NULL, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (2395, 'حسين زايد حسين سمور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2396, 'عمر حسين موسى المزين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', 'شعبة الصيانة', 947, 961, 1082, 1174, NULL, NULL);
INSERT INTO `employees` VALUES (2397, 'ماجده حسن حسين حمد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', 'شعبة الدعوة المسجدية غزة', 947, 952, 983, 995, NULL, NULL);
INSERT INTO `employees` VALUES (2398, 'سمر سمير ابراهيم الشيخ احمد', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2399, 'معتز عطيه عطاالله المصري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2400, 'اشرف أحمد عبد ابوسعدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2401, 'هيثم هاشم كامل الداية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2402, 'اشرف يونس عبد الكريم الخطيب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2403, 'محمد اسماعيل محمد النجار', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2404, 'غاده تيسير مصطفى لبد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2405, 'عقيل نظمي محمد قلجه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2406, 'حسن سليمان محمد ابو شماس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2407, 'شادي فهمي حمدان كشكو', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2408, 'صالح جميل حسين مطر', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2409, 'سالم سلامه حسن ابو مصطفى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2410, 'عزام أحمد عودة الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2411, 'أحمد فوزي صبحي الطويل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2412, 'سماح محمد عبد الهادي الصليبي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2413, 'عبدالله عيد شراب اسليم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (2414, 'أحمد يوسف محمد البيك', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2415, 'سميره علي موسى العبادله', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2416, 'فتحي عبد الهادي محمد ابو سنيمه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2417, 'علي سلمان علي العروقي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2418, 'عمر محمد محمود المقيد', 'الادارة العامة للمساجد والمديريات', 'دائرة متابعة المساجد', NULL, NULL, 947, 1450, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2419, 'أيمن فريد رجب الاشقر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2420, 'يوسف سالم عرفات القدوة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2421, 'محمد عطيه سالم ابو عيدة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (2422, 'محمد سلمان محمد منون', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم القرآن الكريم -ذكور', 'شعبة مراكز التحفيظ -ذكور', 947, 980, 1017, 1018, NULL, NULL);
INSERT INTO `employees` VALUES (2423, 'وليد محمد عودة حسين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2424, 'رامي شحده شحادة ابو ستيته', 'الادارة العامة للحج والعمرة', 'دائرة الحج والعمرة وتأهيل الشركات', NULL, NULL, 1100, 1101, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2425, 'علي منصور اسماعيل ابو ركاب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2426, 'محمود دياب عبد القادر الحنفي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2427, 'محمد خليل عيد حمادة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2428, 'بسام سلمان علي العروقي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2429, 'كمال سعيد أحمد عبيد', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2430, 'ايمان ياسين خليل الأسطل', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2431, 'فتحية محمود خميس صبح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', NULL, 947, 987, 988, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2432, 'اماني فيصل موسى ابومعمر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2433, 'يحيى عايش سلامه ابو مزيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد', NULL, 947, 956, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2434, 'محمد منصور بدر صليح', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2435, 'سوسن محمد محمود العنابي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2436, 'محمد عوض عبدالله شحادة', 'الادارة العامة للمساجد والمديريات', 'دائرة التراث الاسلامي', 'قسم المكتبات', NULL, 947, 1105, 1366, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2437, 'سالم محمد سويلم ابو سليسل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2438, 'خالد يوسف محمود بارود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2439, 'زياد جمال رضوان عويضه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2440, 'أحمد حسن علي الايوبي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2441, 'خيري أحمد محمد حمدان', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم صيانة الأجهزة الكهربائية', NULL, 1172, 985, 1194, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2442, 'جهاد جودت محمود السوافيري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2443, 'علي جبر محمد حرارة', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2444, 'سمير مصطفى عبد الرحمن سبيته', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2445, 'منتصر عبدالله محمود جودة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2446, 'تيسير زكي محمد ابو بركه', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2447, 'محمد رشاد محمد صليح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2448, 'اياد خضر سعيد الداعور', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2449, 'ساره عثمان محمد شاهين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 980, 981, 1014, NULL, NULL);
INSERT INTO `employees` VALUES (2450, 'عبدالله صبري ديب ثاري', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2451, 'محمد يونس سالم ابو عيده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الأملاك غزة', NULL, 947, 952, 1127, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2452, 'محمد محمود محمد النجار', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2453, 'عماد الدين اسعد هاشم الصفطاوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2454, 'مروان سعيد ياسين حمدونه', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الشبكات والدعم الفني', 'قسم الصيانة والدعم الفني وإدارة الشبكات', NULL, 972, 1004, 1015, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2455, 'ماهر أحمد عبد المجيد يعقوب', 'الإدارة العامة للشئون الإدارية', NULL, NULL, NULL, 1172, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2456, 'اياد عبد الرحيم عبد الفتاح ابو حسنه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2457, 'خالد محمود صالح محمود', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2458, 'نائل اكرم حمدي اخزيق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2459, 'زمزم موسى محمد برهوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', NULL, 947, 987, 988, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2460, 'بلسم حسن سعد شقفه', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2461, 'نهاد خليل سعيد سليمان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2462, 'هاني عبد الرزاق رمضان شخصه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2463, 'محمود ناهض محمود عجور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2464, 'أحمد ايهاب محمد ابووردة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2465, 'هند صلاح عيد ابو ركن', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2466, 'سعيد محمد نصر ابو معمر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2467, 'سائد محمد حسن جبور', 'الادارة العامة للحج والعمرة', 'دائرة الحج والعمرة وتأهيل الشركات', 'قسم تسجيل الحج والعمرة', NULL, 1100, 1101, 1192, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2468, 'محمد كامل شحادة بنر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2469, 'يسرى عبد الفتاح محمود قاسم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 980, 981, 982, NULL, NULL);
INSERT INTO `employees` VALUES (2470, 'عماد عبد المنعم عبد المهدي ابو عمرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2471, 'رمزي صالح رمضان الشافعي', 'وحدة الشؤون القانونية', NULL, 'قسم القضايا', NULL, 944, NULL, 945, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2472, 'جهاد حمدان حسن العمور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2473, 'فريح حسني فريح المصدر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2474, 'محمد علي عبد العزيز درويش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2475, 'فايز فوزي ابراهيم زروق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2476, 'محمد حمد اسماعيل المشهراوي', NULL, 'دائرة الحاسوب وتكنولوجيا المعلومات', NULL, NULL, NULL, 1191, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2477, 'امير محمد أحمد ابو شرخ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', 'شعبة شؤون الموظفين والعاملين', 947, 980, 1086, 1087, NULL, NULL);
INSERT INTO `employees` VALUES (2478, 'نادر فتحي ابراهيم عوض الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2479, 'شادي صالح أحمد حوسو', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2480, 'أحمد محمد عبد الأسطا', 'مكتب الوكيل', 'مكتب الوكيل', 'قسم السكرتاريا والأرشيف مكتب الوزير', NULL, 1041, 1041, 1128, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2481, 'محمود محمد محمود ابو شنب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2482, 'سناء محمد رشدي رضوان', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2483, 'عبدالله ابراهيم عبدالله العقاد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2484, 'جمال محمد عبد الحميد المغربي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 961, 1373, 1003, NULL, NULL);
INSERT INTO `employees` VALUES (2485, 'محمد هاني محمد ابو غولة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة الخدمات', 947, 956, 957, 1336, NULL, NULL);
INSERT INTO `employees` VALUES (2486, 'عبد الهادي عبدالله محمد الشاعر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2487, 'عدنان خضر يوسف ميط', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2488, 'حاتم فتحي عوض الحواجري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2489, 'امجد عواد عبوده الجرجاوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', 'شعبة الخدمات', 947, 961, 1082, 1083, NULL, NULL);
INSERT INTO `employees` VALUES (2490, 'هارون خضر محمد ابو القرع', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم التصميم الهندسي', NULL, 967, 968, 1187, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2491, 'علي محمد أحمد العجوري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2492, 'وفا محمود محمد عياد', 'وحدة الرقابة الداخلية', 'دائرة الرقابة الدينية والفنية', NULL, NULL, 1072, 1091, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2493, 'محمد اشرف موسى زايد أبو عطيوه', 'الإدارة العامة للشئون المالية', 'دائرة المخازن', 'قسم العهد', NULL, 1182, 1038, 1039, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2494, 'صبري ابراهيم علي عابدين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2495, 'اسامه عبد الرحمن عبد الرحمن جودة', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'قسم التخصصات والدراسات', NULL, 949, 1025, 1418, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2496, 'تغريد عبد الكريم سليمان جنديه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', NULL, 947, 952, 983, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2497, 'حسن علي حسن القريناوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم القرآن الكريم -ذكور الوسطى', NULL, 947, 956, 990, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2498, 'نائل حسين عبد القادر حمد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2499, 'يوسف محمود عبدالله عابد', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2500, 'أيمن علي رشاد العسلي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2501, 'اسامه شعبان يونس شملخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2502, 'أحمد سعيد عبد ربه عبد ربه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2503, 'حسين عبد حسن العبسي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2504, 'ابراهيم امريزيق قاعود أبو مغيصيب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2505, 'زكريا محمد خليل ابو طير', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2506, 'أحمد سالم عودة العقيلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2507, 'مؤمن سليم عبدالله مغاري', 'وحدة شؤون القدس', 'دائرة الانشطة والفعاليات', NULL, NULL, 1423, 1435, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2508, 'امينه موسى قاعود ابوجاموس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', 'شعبة مراكز التحفيظ -اناث', 947, 987, 988, 989, NULL, NULL);
INSERT INTO `employees` VALUES (2509, 'نور يوسف عودة ابو حيش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2510, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2511, 'زينب رياض رمضان ابو جحجوح', 'وحدة شؤون القدس', 'دائرة التوثيق والاصدارات', 'قسم الاصدارات والمطبوعات', NULL, 1423, 1442, 1447, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2512, 'خالد محمود ابراهيم الترامسي', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الصيانة العامة', NULL, 1172, 985, 986, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2513, 'سلمان نصر سلمان ابو رخيه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2514, 'جهاد ناهض محمد الزعنون', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الحاسوب وتكنولوجيا المعلومات', NULL, NULL, 972, 1191, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2515, 'صباح محمد حسن ابو عبيده', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2516, 'يوسف عبد الله سليم حسن', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', NULL, NULL, 947, 987, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2517, 'رائف خليل أحمد النيرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2518, 'حموده جابر عبد الستار حموده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', 'شعبة الصيانة', 947, 980, 1086, 1173, NULL, NULL);
INSERT INTO `employees` VALUES (2519, 'نداء أحمد سلامه الغلبان', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2520, 'عادل مصطفى اسماعيل اصليح', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2521, 'احمد عبد المنعم موسى سلامه', 'الإدارة العامة للشئون المالية', NULL, NULL, NULL, 1182, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2522, 'ابراهيم أحمد عبدالله البهنساوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', NULL, 947, 980, 1086, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2523, 'بلال ابراهيم حسين درويش', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم ديوان الوزارة', NULL, 1172, 975, 1226, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2524, 'فضل أحمد سليمان مشعل', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم النقل والمواصلات', NULL, 1172, 1097, 1148, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2525, 'وسام ملوان سالم الناعوق', 'وحدة المشاريع والتعاون الدولي', NULL, NULL, NULL, 1206, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2526, 'محمد هاني رشيد ابو شرخ', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2527, 'حسن عبد الرحيم حسن حويله', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2528, 'مراد حاتم مراد الكردي', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم الاشراف الهندسي', NULL, 967, 968, 1137, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2529, 'منير دياب محمد غالي عسليه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2530, 'دينا علي محمد الهندي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2531, 'محمد هاشم علي تمراز', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2532, 'محمد عطيه حسين فرج الله', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2533, 'سوسن أحمد نعمان زعرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2534, 'ايه أحمد خالد الفرا', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2535, 'يوسف مثقال عيسى العطار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2536, 'أحمد صلاح فريح المصري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2537, 'محمود محمد عبد الله سمور', 'الادارة العامة للدعوة والارشاد', NULL, NULL, NULL, 1035, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2538, 'محمود خالد محمود ابوالسعود', 'الإدارة العامة للأملاك الوقفية', NULL, NULL, NULL, 967, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2539, 'اسلام مطيع موسى السيلاوي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2540, 'حمزه ربحي خلف أهل', 'الإدارة العامة للأملاك الوقفية', 'دائرة الأملاك', 'قسم قواعد بيانات الوقف', NULL, 967, 1117, 1129, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2541, 'بسام جميل محمد اللداوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', NULL, NULL, 947, 987, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2542, 'علاء سمير محمد شاهين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2543, 'بشار حمدان بركه عبيد', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2544, 'ايه جلال محمود حموده', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2545, 'عبيده منذر خليل الغماري', 'وحدة تنمية أموال الوقف', NULL, NULL, NULL, 977, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2546, 'عصام زهدي حسني جنينه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2547, 'مدحت رياض رفعت اسماعيل', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2548, 'محمد أحمد يوسف الرحال', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة المسجدية', NULL, NULL, 1035, 1069, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2549, 'عبدالله عادل علي خضر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2550, 'علا احمد مصطفى الدحدوح', 'وحدة المشاريع والتعاون الدولي', NULL, NULL, NULL, 1206, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2551, 'سعيد محمد سعيد ابو نصر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2552, 'عطاالله منصور أحمد ابو الحسنه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2553, 'رائد رزق سعيد سلمان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2554, 'عوض محمد عوض غيضان', 'وحدة الزكاة والاغاثة', 'دائرة البحث الاجتماعي ', 'قسم البحث الاجتماعي', NULL, 955, 1048, 1164, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2555, 'شفيق فتحي شفيق بارود', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم هندسة الصوت', NULL, 948, 1026, 1050, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2556, 'نبيل اكرم حسن برزق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2557, 'زكيه محمد عطوه البريم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2558, 'ابراهيم يوسف أحمد ابو رضوان', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', NULL, NULL, 1172, 985, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2559, 'منال عطيه محمد حمد', 'الادارة العامة للقرآن الكريم', 'دائرة القرآن الكريم -إناث', 'قسم الدورات والقراءة والإقراء', NULL, 974, 1121, 1360, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2560, 'محمد كمال محمد عماد الدين', 'الادارة العامة للمساجد والمديريات', NULL, NULL, NULL, 947, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2561, 'محمد أحمد حامد القاضي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2562, 'صابرين صابر منصور الباز', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2563, 'ادهم فوزي أحمد راضي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة شؤون الموظفين والعاملين', 947, 952, 1011, 1150, NULL, NULL);
INSERT INTO `employees` VALUES (2564, 'محمد حسن صالح الغلبان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2565, 'السيد صفوت السيد ابو جهل', 'وحدة التخطيط وتطوير الأداء المؤسسي', NULL, NULL, NULL, 966, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2566, 'ياسر عادل اسماعيل صوالحه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2567, 'محمد سامي حمد حجازي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم متابعة المساجد', NULL, 947, 987, 1000, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2568, 'الاء عبد الله علي لبد', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة والإرشاد -اناث', NULL, NULL, 1035, 1075, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2569, 'ختام محمد يوسف ابو القرع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (2570, 'معاذ زياد عبد القادر مصطفى', 'الوكيل', 'مكتب الوكيل', 'قسم السكرتاريا والارشيف الوكيل', NULL, 1300, 1041, 1362, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2571, 'مؤمن صبحي يوسف الصيفي', 'الادارة العامة للمساجد والمديريات', 'قسم التنسيق والمتابعة', NULL, NULL, 947, 1368, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2572, 'تامر أحمد سليمان ابو درويش', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2573, 'عدله محمد سليمان النحال', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم العمل النسائي', NULL, 947, 987, 988, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2574, 'عبد السلام خليل محمد راضي', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', NULL, NULL, 948, 1026, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2575, 'البراء خالد محمد ابو حسن', 'وحدة العلاقات العامة والإعلام', 'دائرة الاذاعة والقناة الالكترونية', 'قسم هندسة الصوت', NULL, 948, 1026, 1050, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2576, 'عبد العزيز حسين مطر شوحه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2577, 'واجد صقر يوسف الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2578, 'ليلى فؤاد عبد الخالق المصري', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2579, 'عبدالله زياد محمد زيدان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الدعوة والارشاد', 'شعبة الدعوة المسجدية', 947, 980, 1378, 1045, NULL, NULL);
INSERT INTO `employees` VALUES (2580, 'محمد محمد أحمد سليمان', 'وحدة الزكاة والاغاثة', NULL, NULL, NULL, 955, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2581, 'حازم زايد اسماعيل ابو خطاب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الدعوة والارشاد الوسطى', NULL, 947, 956, 1342, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2582, 'رباح علي محمود ابووردة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2583, 'وفاء محمد عايش حميد', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الشبكات والدعم الفني', NULL, NULL, 972, 1004, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2584, 'محمود حسن رمضان خضر', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', NULL, NULL, 1172, 985, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2585, 'معاذ ابراهيم حسين درويش', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة أنظمة وتطبيقات الانترنت', NULL, NULL, 972, 978, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2586, 'غاده جمال يوسف البابا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة الدعوة المسجدية', 947, 956, 993, 1133, NULL, NULL);
INSERT INTO `employees` VALUES (2587, 'ابراهيم محمد ابراهيم ابو خاطر', 'الادارة العامة للحج والعمرة', 'دائرة الحج والعمرة وتأهيل الشركات', NULL, NULL, 1100, 1101, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2588, 'ابراهيم سعدي حمدان ابو عربس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2589, 'رندة نوفل أحمد البع', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', NULL, 947, 980, 981, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2590, 'محمد عبد الرؤوف عارف بارود', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الأملاك', NULL, 947, 987, 1266, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2591, 'مصعب أحمد محمد ابو سلمي', 'وحدة الشؤون القانونية', NULL, NULL, NULL, 944, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2592, 'هبه عصام علي سليمان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', NULL, 947, 952, 983, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2593, 'ابراهيم أحمد عطيه بنات', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2594, 'مصطفى سعيد زهدي ثريا', 'وحدة العلاقات العامة والإعلام', 'دائرة الاعلام ', NULL, NULL, 948, 970, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2595, 'نفين محمد رجب ابو شندي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', NULL, 947, 952, 983, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2596, 'أحمد صالح محي الدين العرقان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', NULL, NULL, 947, 987, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2597, 'يحيى نعيم مطر الغلبان', 'الإدارة العامة للشئون المالية', NULL, NULL, NULL, 1182, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2598, 'شيراز محمد موسى عبد القادر', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2599, 'فادي أحمد عبد ربه العطاونه', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2600, 'اخلاص عبد الجبار جبر الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم العمل النسائي', NULL, 947, 961, 1046, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2601, 'عبد المجيد عواد مرزق ابو عمرة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2602, 'أحمد انور عودة الكرد', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', NULL, NULL, 967, 968, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2603, 'عبد المنعم خميس حسن أبو يونس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الأملاك الوسطى', NULL, 947, 956, 1154, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2604, 'علاء أحمد حسن عويضة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم الخدمات المساندة', 'شعبة الخدمات', 947, 987, 1113, 1392, NULL, NULL);
INSERT INTO `employees` VALUES (2605, 'أحمد حسن عبد الشكري', 'الإدارة العامة للأملاك الوقفية', 'دائرة الأملاك', 'قسم الحجج الوقفية', NULL, 967, 1117, 1348, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2606, 'زياد أحمد بركه ابو دقه', 'الإدارة العامة للشئون المالية', 'دائرة المشتريات', NULL, NULL, 1182, 1146, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2607, 'مصطفى ناهض خضر حرب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الخدمات المساندة الوسطى', 'شعبة شؤون الموظفين والعاملين', 947, 956, 957, 1224, NULL, NULL);
INSERT INTO `employees` VALUES (2608, 'محمد توفيق سعيد رضوان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2609, 'نبيل رياض محمد العامودي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2610, 'سليمان خضر سليمان ابو معنيه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', 'شعبة شؤون الموظفين والعاملين', 947, 961, 1082, 1156, NULL, NULL);
INSERT INTO `employees` VALUES (2611, 'حمزه سعيد حسن القمحاوي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', NULL, NULL, 947, 980, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2612, 'جابر عايد محمد ابو سماحه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2613, 'أيمن فتحي يوسف الغمري', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة الحاسوب وتكنولوجيا المعلومات', NULL, NULL, 972, 1191, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2614, 'أيمن شحادة شحده ابو خاطر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2615, 'ثائر نبيل محمد منصور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2616, 'مراد طلال حسن المصري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2617, 'محمد خلف عطاالله ابو زونين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2618, 'علي محمد حسن ابو عنزه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', NULL, 947, 961, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2619, 'جبريل ابراهيم حمد ابو بركه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', NULL, NULL, 947, 961, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2620, 'مصطفى محمد أحمد جودة', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2621, 'عيد عماد محمد الاشقر', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', NULL, NULL, 967, 968, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2622, 'سامر جباره جباره الاغا', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2623, 'محمود حسن حموده السر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', NULL, 947, 961, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2624, 'أسامه محمد أحمد الخطيب', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2625, 'ماضي سلمي محمد بن حسن', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة رفح', 'قسم القرآن الكريم -ذكور', 'شعبة القراءات القرانية', 947, 987, 1010, 1390, NULL, NULL);
INSERT INTO `employees` VALUES (2626, 'منى خلف حسين رجيله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم الخدمات المساندة', NULL, 947, 961, 1082, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2627, 'وسيم محمد عادل حموده', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'قسم الخدمات العامة', NULL, 949, 1062, 1409, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2628, 'ناصر منصور حسين صرصور', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2629, 'ابراهيم عطيه ابراهيم الباز', 'الإدارة العامة للشئون الإدارية', 'دائرة الصيانة', 'قسم الورش', NULL, 1172, 985, 1134, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2630, 'ختام يونس محمد ورش اغا', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'قسم الخدمات العامة', NULL, 949, 1062, 1409, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2631, 'منال علي محمد الغليظ', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم العمل النسائي', 'شعبة الدعوة المسجدية', 947, 980, 981, 982, NULL, NULL);
INSERT INTO `employees` VALUES (2632, 'ناريمان محمد أحمد الحلبي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة مراكز التحفيظ -اناث', 947, 956, 993, 994, NULL, NULL);
INSERT INTO `employees` VALUES (2633, 'كامل محمد حرب موسى', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم الخدمات المساندة', NULL, 947, 980, 1086, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2634, 'أحمد ماجد نافذ النخاله', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم متابعة المساجد', NULL, 947, 952, 1001, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2635, 'مصطفى عيسى عيسى اغنيم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2636, 'رائد صالح محفوظ اخزيق', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', NULL, NULL, 947, 952, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2637, 'خالد عبد الجواد اسماعيل ابو سعده', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم الأملاك الوسطى', NULL, 947, 956, 1154, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2638, 'أحمد ماهر محمد المظلوم', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', NULL, 947, 952, 1332, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2639, 'اشرف محمد عوض ريحان', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الشمال', 'قسم متابعة المساجد', NULL, 947, 980, 1009, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2640, 'معتصم عبد اللطيف سعد سعد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2641, 'عوض ديب محمود الوصيفي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم متابعة المساجد الوسطى', NULL, 947, 956, 996, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2642, 'خليل خالد صالح العرقان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2643, 'وائل عبد النبي محمد الجرجاوي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2644, 'سهير أحمد كامل مدوخ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2645, 'ربا عبدالله أحمد قنوع', 'وحدة العلاقات العامة والإعلام', 'دائرة العلاقة العامة', 'قسم العلاقات المحلية', NULL, 948, 1031, 1197, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2646, 'محمد هاني محمد السحار', 'الإدارة العامة للشئون المالية', 'دائرة الحسابات والايرادات', 'قسم المحاسبة', NULL, 1182, 1042, 1141, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2647, 'أحمد فتحي عوض اللخاوي', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم الدوام والاجازات', NULL, 1172, 975, 1066, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2648, 'اسماعيل جميل محارب ابو عمشه', 'وحدة التخطيط وتطوير الأداء المؤسسي', NULL, NULL, NULL, 966, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2649, 'محمد طلال سعد حبيب', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الخدمات المساندة غزة', 'شعبة الخدمات', 947, 952, 1011, 1012, NULL, NULL);
INSERT INTO `employees` VALUES (2650, 'نمر سالم نمر المصري', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', NULL, NULL, 947, 956, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2651, 'فرح علاء يحيى أبو عرب', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم الدوام والاجازات', NULL, 1172, 975, 1066, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2652, 'حسين محمود محمد الشريف', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', NULL, NULL, 949, 950, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2653, 'خالد علي أحمد حلس', 'وحدة المشاريع والتعاون الدولي', NULL, 'قسم تنفيذ المشاريع', NULL, 1206, NULL, 1317, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2654, 'محمد عمر محمد قنن', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم ديوان الوزارة', NULL, 1172, 975, 1226, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2655, 'أحمد عبد المجيد سليم بهلول', 'الادارة العامة للقرآن الكريم', 'دائرة ديوان الحفاظ', NULL, NULL, 974, 1219, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2656, 'محي الدين أحمد حسين المبحوح', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'قسم الخدمات العامة', NULL, 949, 1025, 1420, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2657, 'ايمان عبد القادر أحمد عوض', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2658, 'ابراهيم عامر ابراهيم شتات', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2659, 'حسام جابر عبد الستار حموده', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'قسم الخدمات العامة', NULL, 949, 1062, 1409, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2660, 'رحمه حسن محمود ابو حجاج', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة مراكز التحفيظ -اناث', 947, 956, 993, 994, NULL, NULL);
INSERT INTO `employees` VALUES (2661, 'عادل محمد عبد الكريم أحمد علوان', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2662, 'ماهر حسين سلامه العودات', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2663, 'أحمد برهم أحمد بريكه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2664, 'محمد محمد وليد الميدنه', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم الدعوة والارشاد غزة', 'شعبة الدعوة المسجدية', 947, 952, 1332, 1333, NULL, NULL);
INSERT INTO `employees` VALUES (2665, 'سعيد جلال يوسف شعت', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2666, 'ابراهيم محمد سليم شاهين', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2667, 'صفاء حاتم محمود ابو موسى', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2668, 'لوسزرين محمد هاشم العطار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2669, 'هبه سعيد بخيت ابو خوصة', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2670, 'حسين عبد القادر عوض قرموط', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2671, 'أيمن محمد أحمد فروانة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2672, 'عبد الكريم محمد حسن شاهين', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2673, 'محمد اسماعيل علي أبو جزر', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة خانيونس', 'قسم متابعة المساجد', NULL, 947, 961, 1008, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2675, 'رائد كمال مصطفى عياش', 'الإدارة العامة للأملاك الوقفية', 'دائرة الهندسة والانشاءات', 'قسم التصميم الهندسي', NULL, 967, 968, 1187, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2676, 'أحمد رباح محمد الشنطي', 'الإدارة العامة للشئون المالية', 'دائرة المخازن', 'قسم العهد', NULL, 1182, 1038, 1039, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2677, 'ايمان ناصر يوسف انشاصي', 'الادارة العامة للقرآن الكريم', 'دائرة القرآن الكريم -إناث', NULL, NULL, 974, 1121, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2678, 'محمد أحمد حسين الغلبان', 'الإدارة العامة للشئون المالية', 'دائرة الحسابات والايرادات', 'قسم المحاسبة', NULL, 1182, 1042, 1141, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2679, 'علاءالدين كمال حموده الدلو', 'الإدارة العامة للشئون الإدارية', 'دائرة شؤون الموظفين', 'قسم ديوان الوزارة', NULL, 1172, 975, 1226, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2680, 'محمود رمضان محمود النيرب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2681, 'يوسف عبد العزيز محمد أبو امنه', 'وحدة الحاسوب وتكنولوجيا المعلومات الجديدة', 'دائرة أنظمة وتطبيقات الانترنت', NULL, NULL, 972, 978, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2682, 'ايناس رمزي شحده المقيد', 'وحدة العلاقات العامة والإعلام', 'دائرة الاعلام ', NULL, NULL, 948, 970, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2683, 'محمد فايق رمضان الناعوق', 'وحدة الرقابة الداخلية', 'دائرة الرقابة المالية', NULL, NULL, 1072, 1210, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2684, 'حمزة صبحي سالم المملوك', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2685, 'محمد رشدي جمعه النجار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2686, 'فاتن توفيق محمد ابو الروس', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة الوسطي', 'قسم العمل النسائي الوسطى', 'شعبة الدعوة المسجدية', 947, 956, 993, 1133, NULL, NULL);
INSERT INTO `employees` VALUES (2687, 'عبد الله ياسين حسن بعلوشة', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2688, 'عبد الله شكري دياب نعيم', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2689, 'سماح زكريا عليان البشيتي', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2690, 'محمد سليم محمد حجازي', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2691, 'فاطمه سليمان مصطفى الاسطل', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2692, 'أحمد محمد بكر محمد سلمي', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنين - غزة', NULL, 949, 950, 1052, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2693, 'بسمه محمد حمدان اللوح', 'وحدة التعليم الشرعي', 'دائرة المدارس الشرعية', 'المدرسة الشرعية للبنات - خانيونس', NULL, 949, 950, 951, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2694, 'ايمان مخيمر علي ابو صبحه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (2702, 'هشام يحيى سالم الخضري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4983, 'امل امين عاشور عطا الله', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4984, 'عدنان أحمد العبد البرديني', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', 'الأقسام الأكاديمية', NULL, 949, 1062, 1063, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4985, 'أحمد عتيق حسين سلامة', 'الإدارة العامة للشئون الإدارية', 'دائرة الخدمات والمواصلات', 'قسم الخدمات الادارية', NULL, 1172, 1097, 1135, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4986, 'علي اكرم فضل مهاني', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4987, 'محمد كمال صابر السوسي', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - مقر الشمال', NULL, NULL, 949, 1062, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4988, 'محمد خالد علي خطاب', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'نائب العميد للشؤون الاكاديمية', NULL, 949, 1025, 1414, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4989, 'محمد ابراهيم اسماعيل الهمص', 'الإدارة العامة للشئون المالية', 'دائرة الموازنة والتدقيق', 'قسم اعداد الموازنة', NULL, 1182, 1029, 1365, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4990, 'إسلام سليمان سالم ابو عمره', 'الادارة العامة للقرآن الكريم', 'دائرة القرآن الكريم -إناث', 'قسم التحفيظ', NULL, 974, 1121, 1358, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4991, 'اماني عواد عودة النجيلي', 'الادارة العامة للمساجد والمديريات', 'مديرية أوقاف محافظة غزة', 'قسم العمل النسائي غزة', NULL, 947, 952, 983, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4992, 'خالد جمال سليم مغاري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4993, 'نهاد محمود ابراهيم الجعبري', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4994, 'عماد محمد حسين ابو غوري', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', 'الأقسام الأكاديمية', NULL, 949, 1025, 1096, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4995, 'محمد عبد السلام محمد مسعود', 'وحدة التعليم الشرعي', 'كلية الدعوة الإسلامية - المقر الرئيسي', NULL, NULL, 949, 1025, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (5008, 'هديل علي سليمان المصري', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (5009, 'سهيلا كمال سلامه كلاب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (5010, 'ماجد عمر محمد ابو شرار', 'الإدارة العامة للشئون المالية', 'دائرة الحسابات والايرادات', 'قسم الإيرادات', NULL, 1182, 1042, 1263, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (5011, 'جاكلين رزق محمد قرموط', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (5012, 'هاني عبد القادر عمر ابو جلال', 'الادارة العامة للدعوة والارشاد', 'دائرة الدعوة المجتمعية والالكترونية', 'قسم الدعوة الالكترونية', NULL, 1035, 1036, 1037, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (5013, 'سامر ابراهيم عيد ابو زور', 'وحدة الرقابة الداخلية', NULL, NULL, NULL, 1072, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for item_vendors
-- ----------------------------
DROP TABLE IF EXISTS `item_vendors`;
CREATE TABLE `item_vendors`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_vendors
-- ----------------------------

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `item_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NULL DEFAULT NULL,
  `store_id` bigint UNSIGNED NULL DEFAULT NULL,
  `total_quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `items_category_id_foreign`(`category_id` ASC) USING BTREE,
  INDEX `items_store_id_foreign`(`store_id` ASC) USING BTREE,
  CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1864 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1243, 'دباسة كبيرة', NULL, '1002', NULL, 1, '1', '0', '1', '2023-04-07 09:14:18', '2023-04-07 14:44:35');
INSERT INTO `items` VALUES (1244, 'دفايه', NULL, '1003', NULL, 1, '3', '0', '1', '2023-04-07 09:14:18', '2023-04-07 09:18:37');
INSERT INTO `items` VALUES (1245, 'لمبات نيون 120 سم', NULL, '1004', NULL, 1, '79', '0', '1', '2023-04-07 09:14:18', '2023-04-30 06:24:50');
INSERT INTO `items` VALUES (1246, 'كاميرات مراقبة', NULL, '1005', NULL, 1, '131', '131', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1247, 'جهاز ups هندي 3 كيلو', NULL, '1006', NULL, 1, '1', '1', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1248, 'مضخة ماء  2 حصان', NULL, '1007', NULL, 1, '8', '8', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1249, 'كشاف ليد', NULL, '1008', NULL, 1, '4', '4', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1250, 'ميكرفون خارجي مع الطبة', NULL, '1009', NULL, 1, '5', '5', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1251, 'ستاند مايك', NULL, '1010', NULL, 1, '6', '6', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1252, 'مايك', NULL, '1011', NULL, 1, '9', '9', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1253, 'بطاريه 12 فولت', NULL, '1012', NULL, 1, '19', '19', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1254, 'محطة تحلية مياه (5 كوب يوميا)', NULL, '1013', NULL, 1, '1', '1', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1255, 'طبلون كهرباء حديد 160*35*100', NULL, '1014', NULL, 1, '1', '1', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1256, 'تي 110*50', NULL, '1015', NULL, 1, '1', '1', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1257, 'تي 200*70', NULL, '1016', NULL, 1, '1', '1', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1258, 'سيبة خشب', NULL, '1017', NULL, 1, '17', '17', '1', '2023-04-07 09:14:18', '2023-04-07 09:14:18');
INSERT INTO `items` VALUES (1259, 'ملزمة', NULL, '1018', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1260, 'طبلون كهرباء 140*200', NULL, '1019', NULL, 1, '3', '3', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1261, 'برميل 1500 لتر', NULL, '1020', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1262, 'برميل 500 لتر', NULL, '1021', NULL, 1, '2', '2', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1263, 'طبلون كهرباء 90*90', NULL, '1022', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1264, 'جهاز بصمة', NULL, '1023', NULL, 1, '17', '17', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1265, 'سماعة صوت داخلية مع الصندوق', NULL, '1024', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1266, 'RACK', NULL, '1025', NULL, 1, '44', '44', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1267, 'PATCH PANel', NULL, '1026', NULL, 1, '5', '5', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1268, 'طرمبة رش', NULL, '1027', NULL, 1, '8', '8', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1269, 'ترنس كهرباء 1 ك', NULL, '1028', NULL, 1, '3', '3', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1270, 'ترنس كهرباء 5 ك', NULL, '1029', NULL, 1, '3', '3', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1271, 'ترنس كهرباء 10 ك', NULL, '1030', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1272, 'فرامة ورق', NULL, '1031', NULL, 1, '82', '82', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1273, 'ماكنة تصوير Sharp E 5320', NULL, '1032', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1274, 'ماكنة تصوير SARB  5731', NULL, '1033', NULL, 1, '9', '9', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1275, 'ماكنة تصوير', NULL, '1034', NULL, 1, '2', '2', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1276, 'مكيف 2 طن', NULL, '1035', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1277, 'ثلاجة منزلية', NULL, '1036', NULL, 1, '5', '5', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1278, 'ثلاجة مياة ساخن بارد', NULL, '1037', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1279, 'ثلاجة بارد ساخن', NULL, '1038', NULL, 1, '47', '47', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1280, 'ثلاجه مكتب', NULL, '1039', NULL, 1, '19', '19', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1281, 'مروحة سقف CHMC', NULL, '1040', NULL, 1, '521', '521', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1282, 'مروحة عمود', NULL, '1041', NULL, 1, '163', '163', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1283, 'مروحة ساخن بارد', NULL, '1042', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1284, 'جوال نوكيا', NULL, '1043', NULL, 1, '2', '2', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1285, 'رسيفر', NULL, '1044', NULL, 1, '8', '8', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1286, 'شاشة lcd 32 بوصه', NULL, '1045', NULL, 1, '2', '2', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1287, 'ماكنة خياطة SINGER دعسة يدوية', NULL, '1046', NULL, 1, '14', '14', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1288, 'ماكنة خياطة حبكة vinos', NULL, '1047', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1289, 'ماكنة ابر لوك brother', NULL, '1048', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1290, 'تلفون عادي', NULL, '1049', NULL, 1, '183', '183', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1291, 'تلفون بان سونيك', NULL, '1050', NULL, 1, '55', '55', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1292, 'فاكس', NULL, '1051', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1293, 'فاكس pana soic  ماليزي 402', NULL, '1052', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1294, 'سنترال', NULL, '1053', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1295, 'جهاز راوتر للنت', NULL, '1054', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1296, 'مكنسة كهربائية', NULL, '1055', NULL, 1, '15', '15', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1297, 'سخان  مياة 30 لتر', NULL, '1056', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1298, 'كشاف', NULL, '1057', NULL, 1, '4', '4', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1299, 'مسجل', NULL, '1058', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1300, 'سماعات حجم كبير', NULL, '1059', NULL, 1, '4', '4', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1301, 'سماعات حجم صغير', NULL, '1060', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1302, 'لاقط صوت', NULL, '1061', NULL, 1, '2', '2', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1303, 'سماعة خارجية  حجم صغير', NULL, '1062', NULL, 1, '4', '4', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1304, 'جهاز صوت', NULL, '1063', NULL, 1, '12', '12', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1305, 'سماعات حجم وسط', NULL, '1064', NULL, 1, '24', '24', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1306, 'مقدح بوش', NULL, '1065', NULL, 1, '2', '2', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1307, 'ماتور ماء دافع', NULL, '1066', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1308, 'خزان مياة  سعة 1500 لتر', NULL, '1067', NULL, 1, '27', '27', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1309, 'خزان مياة سعة 300 لتر', NULL, '1068', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1310, 'خزان مياة 200 لتر', NULL, '1069', NULL, 1, '2', '2', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1311, 'خزان مياة سعة 1000 لتر', NULL, '1070', NULL, 1, '17', '17', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1312, 'طبلون كهرباء 60*60', NULL, '1071', NULL, 1, '2', '2', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1313, 'سيبة حديد', NULL, '1072', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1314, 'طفاية حريق', NULL, '1073', NULL, 1, '61', '61', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1315, 'مولد كهرباء بيركنز 15 kva مع كاتم اصلى', NULL, '1074', NULL, 1, '2', '2', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1316, 'مولد كهرباء 7 kva  روبن', NULL, '1075', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1317, 'مكتب خشب 140*60', NULL, '1076', NULL, 1, '13', '13', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1318, 'مكتب مدير عام', NULL, '1077', NULL, 1, '3', '3', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1319, 'مكتب خشب 140*70', NULL, '1078', NULL, 1, '96', '96', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1320, 'مكتب  خشب 200*100', NULL, '1079', NULL, 1, '7', '7', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1321, 'مكتب خشب 240*100', NULL, '1080', NULL, 1, '1', '1', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1322, 'مكتب خشب 160*60', NULL, '1081', NULL, 1, '17', '17', '1', '2023-04-07 09:14:19', '2023-04-07 09:14:19');
INSERT INTO `items` VALUES (1323, 'مكتب خشب 180 *80', NULL, '1082', NULL, 1, '53', '53', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1324, 'مكتب خشب 120*80', NULL, '1083', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1325, 'مكتب خشب 180*80', NULL, '1084', NULL, 1, '3', '3', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1326, 'مكتب خشب 180*70', NULL, '1085', NULL, 1, '6', '6', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1327, 'مكتب خشب 240 * 60', NULL, '1086', NULL, 1, '4', '4', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1328, 'سارية علم', NULL, '1087', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1329, 'طاولة 120*40', NULL, '1088', NULL, 1, '24', '24', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1330, 'طاولة بلاستيك', NULL, '1089', NULL, 1, '3', '3', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1331, 'طاولة 140*70', NULL, '1090', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1332, 'طاوله 120*60', NULL, '1091', NULL, 1, '65', '65', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1333, 'طاولة صيانة', NULL, '1092', NULL, 1, '5', '5', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1334, 'طاولة تنس', NULL, '1093', NULL, 1, '5', '5', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1335, 'طاولة تلفزيون 140*120', NULL, '1094', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1336, 'طاولة 130*60', NULL, '1095', NULL, 1, '6', '6', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1337, 'طاولة وسط خشب 120*80', NULL, '1096', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1338, 'طاولة 130*55', NULL, '1097', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1339, 'طاولة 110*70', NULL, '1098', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1340, 'طاولة حاسوب 110*50', NULL, '1099', NULL, 1, '40', '40', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1341, 'طاولة 70*40', NULL, '1100', NULL, 1, '3', '3', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1342, 'طاولة حديد مع ملزمة', NULL, '1101', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1343, 'طاولة جانبية 160*50', NULL, '1102', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1344, 'طاولة 120 *50', NULL, '1103', NULL, 1, '20', '20', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1345, 'طاولة 80*50', NULL, '1104', NULL, 1, '4', '4', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1346, 'طاولة 80*50', NULL, '1105', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1347, 'طاولة ماكينة تصوير', NULL, '1106', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1348, 'طاولة 50*70', NULL, '1107', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1349, 'طاولة حاسوب  110*45', NULL, '1108', NULL, 1, '203', '203', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1350, 'طاولة اجتماعات 2.4 م *1.2 م', NULL, '1109', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1351, 'بوفيه خشب 230*120', NULL, '1110', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1352, 'بوفية ضلف زجاج علوية 120*250', NULL, '1111', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1353, 'بوفية 1.9*280', NULL, '1112', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1354, 'كرسي موظف', NULL, '1113', NULL, 1, '653', '653', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1355, 'كرسي بلاستك', NULL, '1114', NULL, 1, '1348', '1348', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1356, 'كرسي انتظار', NULL, '1115', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1357, 'كرسي حاسوب', NULL, '1116', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1358, 'كرسي محاضرات', NULL, '1117', NULL, 1, '1062', '1062', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1359, 'كرسي سكرتارية', NULL, '1118', NULL, 1, '50', '50', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1360, 'كرسي انتظار خارجي 3*1', NULL, '1119', NULL, 1, '50', '50', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1361, 'كمودينة', NULL, '1120', NULL, 1, '266', '266', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1362, 'كرسي مدير', NULL, '1121', NULL, 1, '72', '72', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1363, 'كرسي طالب', NULL, '1122', NULL, 1, '648', '648', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1364, 'كرسي حديد', NULL, '1123', NULL, 1, '6', '6', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1365, 'كرسي وزير', NULL, '1124', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1366, 'كرسي مدير عام', NULL, '1125', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1367, 'كرسي انتظار خشب زان مع وجه جلد', NULL, '1126', NULL, 1, '6', '6', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1368, 'كرسي موظف مستخدم', NULL, '1127', NULL, 1, '3', '3', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1369, 'خزانه 2 ضلفه خشب', NULL, '1128', NULL, 1, '140', '140', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1370, 'خزانه خشب 4 ظلف', NULL, '1129', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1371, 'خزانة شنل 5 درج', NULL, '1130', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1372, 'خزانة ارفف مزدوج خشب 180*80*40', NULL, '1131', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1373, 'خزانة 4 ضلف علوية + 4 ضلف خشب سفلية', NULL, '1132', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1374, 'خزانة خشب 95*60*60', NULL, '1133', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1375, 'خزانة حديد ضلفة واحدة', NULL, '1134', NULL, 1, '6', '6', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1376, 'خزانة 2 ضلفه زجاج علوية + 2 ضلفة سفلية', NULL, '1135', NULL, 1, '79', '79', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1377, 'خزانة 3 ضلف خشب', NULL, '1136', NULL, 1, '6', '6', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1378, 'خزنة حديد مقاس 60*40', NULL, '1137', NULL, 1, '4', '4', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1379, 'خزانة 3 ظلف 120*200', NULL, '1138', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1380, 'خزانة هرمية 2 ضلفة زجاج 90*200', NULL, '1139', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1381, 'خزانة جانبية', NULL, '1140', NULL, 1, '33', '33', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1382, 'خزانة 2 ظلفة  80*2 م مع وجة زجاج', NULL, '1141', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1383, 'خزانة 120 *80', NULL, '1142', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1384, 'خزانة حديد 2 ظلفة', NULL, '1143', NULL, 1, '129', '129', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1385, 'خزانة شنل خشب 4 درج', NULL, '1144', NULL, 1, '3', '3', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1386, 'خزانة خشب 80*190*40', NULL, '1145', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1387, 'خزانة ملفات زجاج علوي 80*195', NULL, '1146', NULL, 1, '5', '5', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1388, 'خزانة 180*85', NULL, '1147', NULL, 1, '3', '3', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1389, 'خزانة اررفف خشب 200*80', NULL, '1148', NULL, 1, '3', '3', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1390, 'خزانة خشب 2 ضلفة علوية + 2 سفلية', NULL, '1149', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1391, 'خزانة ملفات 3 ضلف زجاج علوية', NULL, '1150', NULL, 1, '2', '2', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1392, 'خزانة مكتبة 2 ظلفة  باب زجاج', NULL, '1151', NULL, 1, '24', '24', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1393, 'خزانة 3 ضلف زجاج علوية + 3 سفلية', NULL, '1152', NULL, 1, '14', '14', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1394, 'خزانة ملفات خشب', NULL, '1153', NULL, 1, '53', '53', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1395, 'خزانة شنل 4 ادراج', NULL, '1154', NULL, 1, '89', '89', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1396, 'خزانة ألمنيوم 90*140', NULL, '1155', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1397, 'خزانة خشب 4 ضلف 140*180', NULL, '1156', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1398, 'خزانة مطبخ', NULL, '1157', NULL, 1, '11', '11', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1399, 'خزانة خشب ضلفة واحدة 180 * 60', NULL, '1158', NULL, 1, '1', '1', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1400, 'خزانة شنل 5 ادراج', NULL, '1159', NULL, 1, '11', '11', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1401, 'تي مكتب 190*80', NULL, '1160', NULL, 1, '4', '4', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1402, 'تي مكتب 160*60', NULL, '1161', NULL, 1, '8', '8', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1403, 'تي  170*70', NULL, '1162', NULL, 1, '8', '8', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1404, 'تي مكتب 150*70', NULL, '1163', NULL, 1, '4', '4', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1405, 'تي 160*70', NULL, '1164', NULL, 1, '33', '33', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1406, 'تي مكتب 240*110', NULL, '1165', NULL, 1, '4', '4', '1', '2023-04-07 09:14:20', '2023-04-07 09:14:20');
INSERT INTO `items` VALUES (1407, 'تي مكتب 140 *70', NULL, '1166', NULL, 1, '8', '8', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1408, 'تي 180 *80', NULL, '1167', NULL, 1, '18', '18', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1409, 'رف حديد 6 طبقات', NULL, '1168', NULL, 1, '52', '52', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1410, 'رف حديد 3 أرفف', NULL, '1169', NULL, 1, '19', '19', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1411, 'رف حديد طبقات 100*250', NULL, '1170', NULL, 1, '36', '36', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1412, 'رف حديد 300*100', NULL, '1171', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1413, 'رف حديد 4 ارفف', NULL, '1172', NULL, 1, '17', '17', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1414, 'رف حديد 70*250', NULL, '1173', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1415, 'رف حديد 5 طبقات', NULL, '1174', NULL, 1, '50', '50', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1416, 'اسكمبلة', NULL, '1175', NULL, 1, '46', '46', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1417, 'ارفف حديد', NULL, '1176', NULL, 1, '25', '25', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1418, 'علاقة ملابس', NULL, '1177', NULL, 1, '9', '9', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1419, 'سويتش', NULL, '1178', NULL, 1, '74', '74', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1420, 'شاشاة BENQ 19', NULL, '1179', NULL, 1, '11', '11', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1421, 'جهاز كمبيوتر', NULL, '1180', NULL, 1, '4', '4', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1422, 'جهاز كمبيوتر Dell 3040', NULL, '1181', NULL, 1, '2', '2', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1423, 'شاشة 19VIEVPASTIV', NULL, '1182', NULL, 1, '18', '18', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1424, 'شاشة samsong 24', NULL, '1183', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1425, 'شاشة عرض', NULL, '1184', NULL, 1, '6', '6', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1426, 'شاشة 23 بوصة AOC', NULL, '1185', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1427, 'شاشة 32 بوصة tornido', NULL, '1186', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1428, 'شاشة HP  17', NULL, '1187', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1429, 'شاشة umax', NULL, '1188', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1430, 'طابعة HP 3015 D', NULL, '1189', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1431, 'طابعة 2055 hp', NULL, '1190', NULL, 1, '15', '15', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1432, 'طابعة SAMSUNG 1640', NULL, '1191', NULL, 1, '9', '9', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1433, 'طابعة', NULL, '1192', NULL, 1, '3', '3', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1434, 'طابعة Ricko 3120 B', NULL, '1193', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1435, 'طابعة SAMSUNG 2851', NULL, '1194', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1436, 'طابعة HP 1200', NULL, '1195', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1437, 'طابعة hp1102', NULL, '1196', NULL, 1, '2', '2', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1438, 'طابعة  Epson L386', NULL, '1197', NULL, 1, '2', '2', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1439, 'طابعة hp 1018', NULL, '1198', NULL, 1, '4', '4', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1440, 'طابعة hp 1005', NULL, '1199', NULL, 1, '21', '21', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1441, 'طابعة 1100HP', NULL, '1200', NULL, 1, '3', '3', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1442, 'طابعة 3*1  HP2280', NULL, '1201', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1443, 'جهاز بروجكتور', NULL, '1202', NULL, 1, '2', '2', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1444, 'جهاز UBS', NULL, '1203', NULL, 1, '234', '234', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1445, 'سكنر', NULL, '1204', NULL, 1, '10', '10', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1446, 'كاميرا SONY', NULL, '1205', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1447, 'كاميرا تايكون  80', NULL, '1206', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1448, 'كاميرا canon', NULL, '1207', NULL, 1, '6', '6', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1449, 'جهاز عرض LCD', NULL, '1208', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1450, 'حامل بروجكتور', NULL, '1209', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1451, 'هارد دسك خارجى 2 تيرا', NULL, '1210', NULL, 1, '3', '3', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1452, 'جهاز سيرفر HP Pro LINL 310 E caenrion 8', NULL, '1211', NULL, 1, '6', '6', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1453, 'هارد دسك 1 تيرا', NULL, '1212', NULL, 1, '4', '4', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1454, 'فرش غاز 1 عين', NULL, '1213', NULL, 1, '5', '5', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1455, 'فرش غاز 2 عين', NULL, '1214', NULL, 1, '3', '3', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1456, 'فرش غاز 3 عين', NULL, '1215', NULL, 1, '38', '38', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1457, 'اسطوانة غاز 5 كيلو', NULL, '1216', NULL, 1, '4', '4', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1458, 'اسطوانة غاز 12 ك', NULL, '1217', NULL, 1, '48', '48', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1459, 'غاطس ماء', NULL, '1218', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1460, 'اسطوانة اكسجين', NULL, '1219', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1461, 'ماكنة جلاتين', NULL, '1220', NULL, 1, '3', '3', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1462, 'جهاز بث 700W', NULL, '1221', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1463, 'مكسر صوت', NULL, '1222', NULL, 1, '6', '6', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1464, 'برج ارسال حديد', NULL, '1223', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1465, 'تلفون مركزي', NULL, '1224', NULL, 1, '2', '2', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1466, 'جهاز DVD', NULL, '1225', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1467, 'ماكنة تصوير Kyocera /km3530', NULL, '1226', NULL, 1, '2', '2', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1468, 'ماكنة تصوير 161 RicoH  ريكو', NULL, '1227', NULL, 1, '9', '9', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1469, 'مكيف', NULL, '1228', NULL, 1, '49', '49', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1470, 'ثلاجة عرض 190*60', NULL, '1229', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1471, 'ماكنة حبكة خياطة Juki', NULL, '1230', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1472, 'ماكنة خياطة درزة vinos', NULL, '1231', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1473, 'ماكنة خياطة درزة  Juki', NULL, '1232', NULL, 1, '4', '4', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1474, 'تلفون بناسونك عادي', NULL, '1233', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1475, 'تلفون بناسونك شاشة سبيكر', NULL, '1234', NULL, 1, '2', '2', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1476, 'فاكس PANASONIC', NULL, '1235', NULL, 1, '8', '8', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1477, 'بدالة تلفون', NULL, '1236', NULL, 1, '11', '11', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1478, 'سخان ماء 40 لتر', NULL, '1237', NULL, 1, '15', '15', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1479, 'سخان  مياة كهربي 60لتر', NULL, '1238', NULL, 1, '9', '9', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1480, 'سخان ماء', NULL, '1239', NULL, 1, '3', '3', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1481, 'ميكرفون يدوي', NULL, '1240', NULL, 1, '3', '3', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1482, 'كشاف ليد 1000 video light', NULL, '1241', NULL, 1, '1', '1', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1483, 'خزان مياة سعة 2000 لتر', NULL, '1242', NULL, 1, '24', '24', '1', '2023-04-07 09:14:21', '2023-04-07 09:14:21');
INSERT INTO `items` VALUES (1484, 'خزان ماء 500 لتر', NULL, '1243', NULL, 1, '5', '5', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1485, 'راوتر نت', NULL, '1244', NULL, 1, '4', '4', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1486, 'سماعة صوت داخليه', NULL, '1245', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1487, 'تلفون لاسلكى', NULL, '1246', NULL, 1, '14', '14', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1488, 'ثلاجة مياه 3 حنفية', NULL, '1247', NULL, 1, '8', '8', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1489, 'ثلاجة ماء 2 حنفية', NULL, '1248', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1490, 'جهاز DVR للكاميرات', NULL, '1249', NULL, 1, '10', '10', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1491, 'جهاز انذار حريق', NULL, '1250', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1492, 'مولد kva65 بيركنز مع كاتم', NULL, '1251', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1493, 'مولد كهرباء 5كيلو', NULL, '1252', NULL, 1, '4', '4', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1494, 'مايد اذاعة داينمك', NULL, '1253', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1495, 'ماكنة تصويرRICOH mp 171', NULL, '1254', NULL, 1, '16', '16', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1496, 'مولد KVA 22  بيركنز انجليزي', NULL, '1255', NULL, 1, '3', '3', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1497, 'جهاز كاتور لغسيل السيارات', NULL, '1256', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1498, 'مروحة حائط', NULL, '1257', NULL, 1, '14', '14', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1499, 'ستاند كاميرا تصوير', NULL, '1258', NULL, 1, '3', '3', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1500, 'مكتب خشب 120*60', NULL, '1259', NULL, 1, '29', '29', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1501, 'لاب توب HP-VIC Core i7 th12', NULL, '1260', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1502, 'مكتب خشب 140*60', NULL, '1261', NULL, 1, '4', '4', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1503, 'مكتب خشب  150*70', NULL, '1262', NULL, 1, '23', '23', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1504, 'مكتب خشب 160*80', NULL, '1263', NULL, 1, '14', '14', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1505, 'مكتب خشب 100*190', NULL, '1264', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1506, 'مكتب 190*80*', NULL, '1265', NULL, 1, '3', '3', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1507, 'مكتب 240 *110', NULL, '1266', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1508, 'مكتب خشب 100*210', NULL, '1267', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1509, 'مكتب خشب 240*110', NULL, '1268', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1510, 'مكتب خشب 120*70', NULL, '1269', NULL, 1, '151', '151', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1511, 'مكتب خشب 220*120', NULL, '1270', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1512, 'مكتب خشب 180 * 100', NULL, '1271', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1513, 'مكتب 220*100 خشب زان', NULL, '1272', NULL, 1, '3', '3', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1514, 'مكتب خشب 170*80', NULL, '1273', NULL, 1, '5', '5', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1515, 'مكتب 220*90', NULL, '1274', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1516, 'منصة خطابة', NULL, '1275', NULL, 1, '8', '8', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1517, 'طاولة ماكنة تصوير خشب 2 ضلفة 70*50*60', NULL, '1276', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1518, 'طاولة بلاستك', NULL, '1277', NULL, 1, '8', '8', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1519, 'طاولة كمبيوتر', NULL, '1278', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1520, 'طاولة اجتماعات 190*90', NULL, '1279', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1521, 'طابعة hp pro M102A', NULL, '1280', NULL, 1, '4', '4', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1522, 'طاولة تلفزيون 120*40*60سم', NULL, '1281', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1523, 'طاولة وسط 40*80', NULL, '1282', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1524, 'طاولة طالب', NULL, '1283', NULL, 1, '393', '393', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1525, 'مكتب خشب 160*70', NULL, '1284', NULL, 1, '259', '259', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1526, 'طاولة وسط 110*60', NULL, '1285', NULL, 1, '6', '6', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1527, 'طاولة حديد 40*90', NULL, '1286', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1528, 'طاولة خشب', NULL, '1287', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1529, 'طاولة اجتماعات مربعة 480*300', NULL, '1288', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1530, 'طاولة وسط 100*50', NULL, '1289', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1531, 'طاولة ماكنة تصوير', NULL, '1290', NULL, 1, '12', '12', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1532, 'طاولة زان 70*230', NULL, '1291', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1533, 'ملحق جانبي  120*40*60', NULL, '1292', NULL, 1, '3', '3', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1534, 'طاولة اجتماعات 240*100', NULL, '1293', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1535, 'كرسي انتظار ديانا', NULL, '1294', NULL, 1, '916', '916', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1536, 'كرسي انتظار جلد بأيدي وارجل زان', NULL, '1295', NULL, 1, '59', '59', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1537, 'كرسي انتظار براير', NULL, '1296', NULL, 1, '260', '260', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1538, 'كرسي انتظار جلد او قماش ارجل حديد', NULL, '1297', NULL, 1, '6', '6', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1539, 'كرسي مختبر', NULL, '1298', NULL, 1, '91', '91', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1540, 'كرسي انتظار ايدي وارجل حديد', NULL, '1299', NULL, 1, '6', '6', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1541, 'خزانة خشب 2 ضلفة زجاج علوي+2 سلفي', NULL, '1300', NULL, 1, '5', '5', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1542, 'خزانه خشب 5 ضلف علوي +3ضلفة سفلي260*240', NULL, '1301', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1543, 'خزانة خشب 3 ضلف علوية + 3 سفلية', NULL, '1302', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1544, 'خزان بلاستك 5000 لتر', NULL, '1303', NULL, 1, '6', '6', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1545, 'خزانة خشب 2 ضلفه 200*80*40سم', NULL, '1304', NULL, 1, '4', '4', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1546, 'خزانة اسعافات', NULL, '1305', NULL, 1, '3', '3', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1547, 'خزنة حديد55*75', NULL, '1306', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1548, 'خزانة خشب 3 ضلف  علوي 3سفلي', NULL, '1307', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1549, 'خزانة اررفف خشب', NULL, '1308', NULL, 1, '28', '28', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1550, 'خزانة 2ضلفة وجه زجاج 180*120', NULL, '1309', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1551, 'خزانة تلفزيون', NULL, '1310', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1552, 'كاونتر خشب 3.45* 5', NULL, '1311', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1553, 'طاولة اجتماعات 160*70', NULL, '1312', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1554, 'طاولة اجتماعات 240*60', NULL, '1313', NULL, 1, '10', '10', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1555, 'طاولة اجتماعات 120*250', NULL, '1314', NULL, 1, '3', '3', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1556, 'طاولة اجتماعات بيضاوية 150*90', NULL, '1315', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1557, 'حامل ارفف خيزران', NULL, '1316', NULL, 1, '4', '4', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1558, 'كاونتر خشب 110*170', NULL, '1317', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1559, 'مكتب خشب 170*70', NULL, '1318', NULL, 1, '9', '9', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1560, 'حامل خشب', NULL, '1319', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1561, 'سرير طبى', NULL, '1320', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1562, 'بروجكتر', NULL, '1321', NULL, 1, '17', '17', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1563, 'طاولة 50*60', NULL, '1322', NULL, 1, '4', '4', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1564, 'طقم كنب', NULL, '1323', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1565, 'كنبة جلد ثلاثية', NULL, '1324', NULL, 1, '3', '3', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1566, 'سرير مفرد', NULL, '1325', NULL, 1, '11', '11', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1567, 'صندوق عطاء', NULL, '1326', NULL, 1, '3', '3', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1568, 'طاولة 70*70', NULL, '1327', NULL, 1, '1', '1', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1569, 'جهاز لاب توب HP', NULL, '1328', NULL, 1, '132', '132', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1570, 'شاشة 17 samsong', NULL, '1329', NULL, 1, '2', '2', '1', '2023-04-07 09:14:22', '2023-04-07 09:14:22');
INSERT INTO `items` VALUES (1571, 'شاشة 17 PENQ', NULL, '1330', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1572, 'شاشة 17 Maxview', NULL, '1331', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1573, 'شاشة  Viewsonic 19', NULL, '1332', NULL, 1, '5', '5', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1574, 'شاشة عرض بروجكتر جلد', NULL, '1333', NULL, 1, '3', '3', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1575, 'شاشة  19 samsong', NULL, '1334', NULL, 1, '14', '14', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1576, 'شاشة Ben QLCD', NULL, '1335', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1577, 'شاشة 17 HP', NULL, '1336', NULL, 1, '7', '7', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1578, 'شاشة 19 LG', NULL, '1337', NULL, 1, '185', '185', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1579, 'شاشة HP  19', NULL, '1338', NULL, 1, '73', '73', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1580, 'شاشة 19 DELL', NULL, '1339', NULL, 1, '17', '17', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1581, 'طابعة ملون Canon IP 2700', NULL, '1340', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1582, 'شاشة 17 LG', NULL, '1341', NULL, 1, '7', '7', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1583, 'طابعة hp p2055dn', NULL, '1342', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1584, 'طابعة ملونة ابسون L310', NULL, '1343', NULL, 1, '4', '4', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1585, 'طابعة  Epson L382', NULL, '1344', NULL, 1, '4', '4', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1586, 'طابعة  Hp pro 400', NULL, '1345', NULL, 1, '24', '24', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1587, 'طابعة  hp1010', NULL, '1346', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1588, 'جهاز UPS', NULL, '1347', NULL, 1, '6', '6', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1589, 'سكنر 5590 hp', NULL, '1348', NULL, 1, '27', '27', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1590, 'كاميرا', NULL, '1349', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1591, 'انفيرتر 3 كيلو', NULL, '1350', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1592, 'ميكروفون BM800', NULL, '1351', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1593, 'ترنس كهرباء 1 ك', NULL, '1352', NULL, 1, '3', '3', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1594, 'جهاز لاب توب Toshiba', NULL, '1353', NULL, 1, '13', '13', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1595, 'تلفزيون', NULL, '1354', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1596, 'جهاز حاسوب تجميع', NULL, '1355', NULL, 1, '269', '269', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1597, 'مايك لاسلكي', NULL, '1356', NULL, 1, '4', '4', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1598, 'سماعة سبيكر', NULL, '1357', NULL, 1, '18', '18', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1599, 'جهاز لاب توب ACER', NULL, '1358', NULL, 1, '8', '8', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1600, 'طابعه hp 1102', NULL, '1359', NULL, 1, '47', '47', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1601, 'طابعة Hp Pro 402dn', NULL, '1360', NULL, 1, '18', '18', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1602, 'جهاز مولد مؤثرات صوت', NULL, '1361', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1603, 'عربة يد عجل واحد', NULL, '1362', NULL, 1, '5', '5', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1604, 'وحدة مايكروتك', NULL, '1363', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1605, 'جهاز لاب توب Lenovo', NULL, '1364', NULL, 1, '67', '67', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1606, 'جهاز لاب توب Dell', NULL, '1365', NULL, 1, '14', '14', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1607, 'حامل شاخص مساحة', NULL, '1366', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1608, 'خزانة اطفاء حريق 2 ضلفة المونيوم', NULL, '1367', NULL, 1, '6', '6', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1609, 'جهاز لاب توب samsong', NULL, '1368', NULL, 1, '4', '4', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1610, 'اسكمبلة زجاج', NULL, '1369', NULL, 1, '8', '8', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1611, 'طاولة وسط خشب 120*60', NULL, '1370', NULL, 1, '5', '5', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1612, 'طاولة وسط زجاج 120*60', NULL, '1371', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1613, 'طاولة وسط زجاج 120*70', NULL, '1372', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1614, 'طاولة وسط خشب 60*90', NULL, '1373', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1615, 'طاولة ماكنة تصوير خشب 80*70*60سم', NULL, '1374', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1616, 'طابعة Richo 301', NULL, '1375', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1617, 'طاولة اجتماعات دائرية 450*140', NULL, '1376', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1618, 'شاشة 23انش HP', NULL, '1377', NULL, 1, '3', '3', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1619, 'ملحق جانبي 100*50', NULL, '1378', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1620, 'ملحق جانبي 110*45', NULL, '1379', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1621, 'طاولة وسط زجاج 80*35', NULL, '1380', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1622, 'خزان سولار حديد 2000لتر', NULL, '1381', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1623, 'كاونتر خشب دائري دورين 230*170*120', NULL, '1382', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1624, 'انفيرتر بطاريات', NULL, '1383', NULL, 1, '3', '3', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1625, 'انفيرتر 15كيلو وات', NULL, '1384', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1626, 'لوح طاقة شمسية', NULL, '1385', NULL, 1, '156', '156', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1627, 'كاونتر خشب 60*250', NULL, '1386', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1628, 'انفيرتر 5 كيلو', NULL, '1387', NULL, 1, '6', '6', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1629, 'كاونتر خشب 160*170', NULL, '1388', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1630, 'خزانة 2 ضلفة زجاج', NULL, '1389', NULL, 1, '35', '35', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1631, 'طاولة وسط 80*60', NULL, '1390', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1632, 'مكتب خشب 160*90', NULL, '1391', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1633, 'طاولة وسط خشب 60*70', NULL, '1392', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1634, 'طاولة طابعة 75*45*70', NULL, '1393', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1635, 'جهاز باركود', NULL, '1394', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1636, 'قارئ باركود', NULL, '1395', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1637, 'ماكينة تصوير RICOH 3350', NULL, '1396', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1638, 'مكتب خشب 65*125', NULL, '1397', NULL, 1, '7', '7', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1639, 'طاولة صيانة 60*120', NULL, '1398', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1640, 'جهاز هوت للصيانة HAKOOO700', NULL, '1399', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1641, 'POWER SUPLY خاص بالصيانة', NULL, '1400', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1642, 'جهاز KVM 8 مخارج', NULL, '1401', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1643, 'شفاط هواء 10 انش', NULL, '1402', NULL, 1, '7', '7', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1644, 'طابعة SAMSONG 1660', NULL, '1403', NULL, 1, '4', '4', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1645, 'ارفف خشبية', NULL, '1404', NULL, 1, '2', '2', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1646, 'طاولة وسط 120*60', NULL, '1405', NULL, 1, '7', '7', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1647, 'ملحق جانبي 90*45', NULL, '1406', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1648, 'طاولة خشب 55*65', NULL, '1407', NULL, 1, '1', '1', '1', '2023-04-07 09:14:23', '2023-04-07 09:14:23');
INSERT INTO `items` VALUES (1649, 'رف خشبي 30*85', NULL, '1408', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1650, 'جهاز لاب توب ASUS', NULL, '1409', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1651, 'جهاز كمبيوتر DELL 390', NULL, '1410', NULL, 1, '13', '13', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1652, 'جهاز كمبيوتر hp 280', NULL, '1411', NULL, 1, '22', '22', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1653, 'تي مكتب 70*150', NULL, '1412', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1654, 'ماكنة تصوير Richo 3030 A', NULL, '1413', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1655, 'طابعة HP 2050 A', NULL, '1414', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1656, 'جهاز مساحة Topcon (AT - G4)', NULL, '1415', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1657, 'بريزما', NULL, '1416', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1658, 'خزنة حديد 50*40', NULL, '1417', NULL, 1, '5', '5', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1659, 'كانتر خشب 130*230', NULL, '1418', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1660, 'شاشة 32 بوصة', NULL, '1419', NULL, 1, '3', '3', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1661, 'ناسخ اسطوانات 10 cdrom', NULL, '1420', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1662, 'جهاز كمبيوتر HP', NULL, '1421', NULL, 1, '5', '5', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1663, 'شاشة HP 21', NULL, '1422', NULL, 1, '6', '6', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1664, 'مخشير لا سلكي', NULL, '1423', NULL, 1, '5', '5', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1665, 'جهاز مساحة توتال ستيشن Trimble', NULL, '1424', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1666, 'جهاز تعقيم بخار', NULL, '1425', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1667, 'شاشة Samsong 45 بوصة', NULL, '1426', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1668, 'شاشة Samsong 70 بوصة', NULL, '1427', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1669, 'شاشة LUXO 40', NULL, '1428', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1670, 'جهاز tablet', NULL, '1429', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1671, 'جهاز كمبيوتر DELL 3010', NULL, '1430', NULL, 1, '4', '4', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1672, 'جهاز كمبيوتر HP 500', NULL, '1431', NULL, 1, '14', '14', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1673, 'تي مكتب 180*80', NULL, '1432', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1674, 'تي مكتب 120*80', NULL, '1433', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1675, 'طابعة hp 404 dn', NULL, '1434', NULL, 1, '5', '5', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1676, 'شاشة LG 30 بوصة', NULL, '1435', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1677, 'طقم كنب مورس 10 مقاعد', NULL, '1436', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1678, 'طابعة ابسون L3150', NULL, '1437', NULL, 1, '3', '3', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1679, 'بوفيه ضلف زجاج علوية + ضلف خشب سفلية  150*250', NULL, '1438', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1680, 'خزانة زجاج  210*80', NULL, '1439', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1681, 'شاشة LG 32بوصة', NULL, '1440', NULL, 1, '4', '4', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1682, 'تلفون انتركوم', NULL, '1441', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1683, 'طقم كنب جلد 7 مقاعد', NULL, '1442', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1684, 'شاشة 60 بوصة MULLER', NULL, '1443', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1685, 'طاولة اجتماعات بيضاوية 570*180', NULL, '1444', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1686, 'خزانة خشب 2 باب علوي +2 سفلي', NULL, '1445', NULL, 1, '13', '13', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1687, 'تي مكتب 120*60', NULL, '1446', NULL, 1, '4', '4', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1688, 'شاشة 43 بوصة HYUNDAI', NULL, '1447', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1689, 'جهاز UPS للطاقة الشمسية', NULL, '1448', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1690, 'بطارية 200 أمبير', NULL, '1449', NULL, 1, '33', '33', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1691, 'بطارية 26 أمبير', NULL, '1450', NULL, 1, '6', '6', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1692, 'جهاز سيرفر power Edge T 610', NULL, '1451', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1693, 'جهاز كمبيوتر HP copaq dx2420 micro T', NULL, '1452', NULL, 1, '0', '0', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1694, 'جهاز كمبيوتر Dell optipled 760', NULL, '1453', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1695, 'سويتش HP 180 - 48G', NULL, '1454', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1696, 'سويتش HP 1810 - 24G', NULL, '1455', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1697, 'سويتش HP 1810 - 16G', NULL, '1456', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1698, 'Qnap - Ts 653 A', NULL, '1457', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1699, 'My cloud 2 T', NULL, '1458', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1700, 'وحدة تكييف مركزي', NULL, '1459', NULL, 1, '14', '14', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1701, 'بطارية 1247 أمبير', NULL, '1460', NULL, 1, '72', '72', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1702, 'جهاز كنترول', NULL, '1461', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1703, 'أمان 400 أمبير', NULL, '1462', NULL, 1, '3', '3', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1704, 'جهاز sennheiser SK100', NULL, '1463', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1705, 'جهاز اوزمو موبايل OM170', NULL, '1464', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1706, 'تراي بوت كاميرا', NULL, '1465', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1707, 'جهاز لاب توب HP omen', NULL, '1466', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1708, 'جهاز لاب توب DELL inspiron 15-7577', NULL, '1467', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1709, 'طاولة جانبية 50*60', NULL, '1468', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1710, 'شاشة SAMSONG 40 بوصة', NULL, '1469', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1711, 'طاولة وسط بلاستيك', NULL, '1470', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1712, 'شاشة HUNDAI 40 بوصة', NULL, '1471', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1713, 'شاشة fujitsu', NULL, '1472', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1714, 'جهاز كمبيوتر DELL 7010', NULL, '1473', NULL, 1, '4', '4', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1715, 'ماكنة تصوير RICOH ATICIO 2075', NULL, '1474', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1716, 'مروحة سقف متنوع', NULL, '1475', NULL, 1, '9', '9', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1717, 'مقسم  Panaconic', NULL, '1476', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1718, 'طاولة اجتماعات 110*240', NULL, '1477', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1719, 'طاولة قص للخياطة 120*200', NULL, '1478', NULL, 1, '3', '3', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1720, 'طاولة 120*80', NULL, '1479', NULL, 1, '39', '39', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1721, 'طابعة Epson l 3151', NULL, '1480', NULL, 1, '3', '3', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1722, 'SWICH', NULL, '1481', NULL, 1, '4', '4', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1723, 'شاشة 32 بوصة samsong', NULL, '1482', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1724, 'طابعة canon G1400', NULL, '1483', NULL, 1, '1', '1', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1725, 'خزانة شنل 2 درج', NULL, '1484', NULL, 1, '2', '2', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1726, 'سكنر Scanner level2 hp scanset', NULL, '1485', NULL, 1, '3', '3', '1', '2023-04-07 09:14:24', '2023-04-07 09:14:24');
INSERT INTO `items` VALUES (1727, 'كرسي موظف طبي مع مسند أسفل الظهر', NULL, '1486', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1728, 'طاولة طالب 120*60*75', NULL, '1487', NULL, 1, '20', '20', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1729, 'خزانة 2ضلفة 80*60*200 جديدة', NULL, '1488', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1730, 'طاولة وسط 60*60', NULL, '1489', NULL, 1, '5', '5', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1731, 'طاولة وسط مستديرة + 4 سكمبلة', NULL, '1490', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1732, 'خزنة حديد 30*30', NULL, '1491', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1733, 'طبلون تحكم 50*35', NULL, '1492', NULL, 1, '7', '7', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1734, 'ماكنة تصوير Ricoh mp2550', NULL, '1493', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1735, 'طابعة HP 7500 A', NULL, '1494', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1736, 'طابعة HP 8600', NULL, '1495', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1737, 'طابعة HP 7000', NULL, '1496', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1738, 'طاولة 140*40', NULL, '1497', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1739, 'ماكنة تصوير SHarp 5620 N', NULL, '1498', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1740, 'سبورة ذكية', NULL, '1499', NULL, 1, '4', '4', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1741, 'طبلون كهرباء 90*230', NULL, '1500', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1742, 'بطارية 100 أمبير', NULL, '1501', NULL, 1, '5', '5', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1743, 'DNR-Hybrid', NULL, '1502', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1744, 'قبان الكتروني', NULL, '1503', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1745, 'طفاية حريق كبيرة بعجلات', NULL, '1504', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1746, 'خزانة ادراج عدد 45*45*15', NULL, '1505', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1747, 'رف حديد 7 طبقات', NULL, '1506', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1748, 'طبلون 120*220', NULL, '1507', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1749, 'شاشة 32 بوصة omega', NULL, '1508', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1750, 'خزانة مكتبة ارفف خشب ابواب زجاج', NULL, '1509', NULL, 1, '36', '36', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1751, 'طاولة زان 160*100', NULL, '1510', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1752, 'ماكنة تخريس ورق', NULL, '1511', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1753, 'ماكنة تصوير RICOH 3260', NULL, '1512', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1754, 'مضخة مياه 1 حصان', NULL, '1513', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1755, 'مضخة مياه 1/2 حصان', NULL, '1514', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1756, 'طابعة RICOH M171', NULL, '1515', NULL, 1, '12', '12', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1757, 'شاشة 32بوصة HYUNDAI', NULL, '1516', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1758, 'طاولة حديد 60*60', NULL, '1517', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1759, 'طاولة زان 70*190', NULL, '1518', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1760, 'شاشة 32 بوصة JAC', NULL, '1519', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1761, 'جهاز UPS 10 K SMART', NULL, '1520', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1762, 'جهاز UPS 20 K Tescom', NULL, '1521', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1763, 'طبلون كهرباء 125*120', NULL, '1522', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1764, 'جهاز ضبط طبقات الصوت', NULL, '1523', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1765, 'جهاز HYBRID', NULL, '1524', NULL, 1, '4', '4', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1766, 'جهاز HYBRID شريحة جوال', NULL, '1525', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1767, 'كرت صوت Pringer', NULL, '1526', NULL, 1, '3', '3', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1768, 'جهاز حاسوب للبث الاذاعي', NULL, '1527', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1769, 'جهاز كاسيت sony', NULL, '1528', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1770, 'طاولة زان 70*270', NULL, '1529', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1771, 'كرت صوت M-AUDIO', NULL, '1530', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1772, 'طاولة دائرية 80 سم', NULL, '1531', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1773, 'فرشة اسفنج', NULL, '1532', NULL, 1, '4', '4', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1774, 'سماعة اذاعة لا سلكي', NULL, '1533', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1775, 'طبلون تحكم 80*80', NULL, '1534', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1776, 'انتينة ارسال GTA', NULL, '1535', NULL, 1, '4', '4', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1777, 'موزع بث 4 مخارج SIPLETER', NULL, '1536', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1778, 'كاميرا microsoft HD', NULL, '1537', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1779, 'جهاز تسجيل خارجي', NULL, '1538', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1780, 'جهاز تسجيل صوت خارجي زووم', NULL, '1539', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1781, 'جهاز بث نوع  Elinos 5kw', NULL, '1540', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1782, 'LED Screen Smart 4K', NULL, '1541', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1783, 'طابعة samsong 4833 fd', NULL, '1542', NULL, 1, '3', '3', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1784, 'خزنة 20*20', NULL, '1543', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1785, 'خزان مياه سعة 5000 لتر', NULL, '1544', NULL, 1, '4', '4', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1786, 'خزان مياه ستانلس 1000 لتر', NULL, '1545', NULL, 1, '5', '5', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1787, 'صيدلية اسعافات', NULL, '1546', NULL, 1, '3', '3', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1788, 'ماكنة تصوير Rico 6000', NULL, '1547', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1789, 'شاشة كونكا 50 بوصة', NULL, '1548', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1790, 'طاولة حاسوب 90*40', NULL, '1549', NULL, 1, '16', '16', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1791, 'شاشة MULLER 55 بوصة', NULL, '1550', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1792, 'خزانة ارفف مكتبة', NULL, '1551', NULL, 1, '32', '32', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1793, 'ماكنة قص العشب', NULL, '1552', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1794, 'مضخة مياه 5 حصان', NULL, '1553', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1795, 'كرسي مختبر حاسوب', NULL, '1554', NULL, 1, '75', '75', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1796, 'كنبة جلد مجوز', NULL, '1555', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1797, 'مقص ورق كبير', NULL, '1556', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1798, 'طابعة samsong 1765', NULL, '1557', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1799, 'مكتب حديد 110*60', NULL, '1558', NULL, 1, '3', '3', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1800, 'طاولة مستديرة', NULL, '1559', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1801, 'طبلون كهرباء 140*90', NULL, '1560', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1802, 'طاولة 120*120', NULL, '1561', NULL, 1, '10', '10', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1803, 'مكوى بخار 60لتر حجم كبير', NULL, '1562', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1804, 'ماكنة خياطة LADA', NULL, '1563', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1805, 'مروحة سقف تورنادو العربي', NULL, '1564', NULL, 1, '11', '11', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1806, 'طابعة CANON COLOR INKJET PRINTER', NULL, '1565', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1807, 'مكتب خشب مضلع 1.6*1.2م', NULL, '1566', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1808, 'ماكنة عد النقود', NULL, '1567', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1809, 'ماكنة تصوير RICOH Aficio MP4002 SP', NULL, '1568', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1810, 'شاشة MAX VISION \'\' 17', NULL, '1569', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1811, 'خزنة حديد ارتفاع 56سم ضد الحريق', NULL, '1570', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1812, 'جهاز لاب توب MSI INTEL cor I7', NULL, '1571', NULL, 1, '9', '9', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1813, 'قارئ ذاكرة كاميرا نوع SANDISK', NULL, '1572', NULL, 1, '1', '1', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1814, 'سخان شاف', NULL, '1573', NULL, 1, '2', '2', '1', '2023-04-07 09:14:25', '2023-04-07 09:14:25');
INSERT INTO `items` VALUES (1815, 'جك شاشة ثابت', NULL, '1574', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1816, 'ماكنة تصوير RICOH 201', NULL, '1575', NULL, 1, '12', '12', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1817, 'شاشة سمارت ليد 75 بوصة', NULL, '1576', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1818, 'سكنر EPSON 410', NULL, '1577', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1819, 'شاشة FLIP MONITOR24 FULL HD', NULL, '1578', NULL, 1, '2', '2', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1820, 'هارد خارجي 4 تيرا', NULL, '1579', NULL, 1, '3', '3', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1821, 'دعاسة مكتب', NULL, '1580', NULL, 1, '22', '22', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1822, 'طابعة Hp laserjet pro M 404 dn', NULL, '1581', NULL, 1, '3', '3', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1823, 'شاشة HP24\" with HDMI', NULL, '1582', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1824, 'جهاز لاب توب MSI Katana COR i5 GF66 11TH', NULL, '1583', NULL, 1, '2', '2', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1825, 'شاشة ذكية', NULL, '1584', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1826, 'طابعة RICOH MP2550', NULL, '1585', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1827, 'شاشة HP بوصة W 25', NULL, '1586', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1828, 'سكنر AVISION AV', NULL, '1587', NULL, 1, '8', '8', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1829, 'لاب توب Asos cor i7', NULL, '1588', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1830, 'جوال SAMSUNG Galaxy S22 Ultra', NULL, '1589', NULL, 1, '2', '2', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1831, 'باور بانك ROMOSS 20000MAH', NULL, '1590', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1832, 'شاشة Monitor 50 Linch Muller UK', NULL, '1591', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1833, 'جهاز حاسوب PC مواصفات عالية', NULL, '1592', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1834, 'شاشة FUJITSU  19', NULL, '1593', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1835, 'خلاطة باطون', NULL, '1594', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1836, 'قاعدة لاب توب بمروحة', NULL, '1595', NULL, 1, '7', '7', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1837, 'حقيبة لاب توب', NULL, '1596', NULL, 1, '10', '10', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1838, 'شاشة 24\" FUJITSU', NULL, '1597', NULL, 1, '4', '4', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1839, 'بطارية 75 أمبير', NULL, '1598', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1840, 'شاشة LG 23 بوصة', NULL, '1599', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1841, 'شاشة HP 27\" FHD', NULL, '1600', NULL, 1, '4', '4', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1842, 'آله حاسبة برول', NULL, '1601', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1843, 'كرسي انتظار ثلاثي ستانلس', NULL, '1602', NULL, 1, '3', '3', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1844, 'طاولة إجتماعات 200*100', NULL, '1603', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1845, 'طاولة بيضاوية زجاج 110*60', NULL, '1604', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1846, 'طقم كنب جلد أسود صناعة محلية', NULL, '1605', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1847, 'مقدح براغي 13 ملم بوش ألماني', NULL, '1606', NULL, 1, '3', '3', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1848, 'دسك نوع بوش 2200 -9 انش', NULL, '1607', NULL, 1, '2', '2', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1849, 'خزانة 2 ضلفة خشب ساندويش', NULL, '1608', NULL, 1, '3', '3', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1850, 'محبرة ختم', NULL, '1609', NULL, 1, '14', '14', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1851, 'خزنة حديد 96*52*48', NULL, '1610', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1852, 'خزنة حديد 60*35', NULL, '1611', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1853, 'شاشة Monitor 50 Inch Muller SNY', NULL, '1612', NULL, 1, '2', '2', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1854, 'خزنة حديد 39*40', NULL, '1613', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1855, 'ماكنة تصوير  Richo Aficio 2051', NULL, '1614', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1856, 'دولاب صاج ضلفتين مع 4 ارفف', NULL, '1615', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1857, 'وحدة ادراج معدنية للملفات شنل 4 ادراج', NULL, '1616', NULL, 1, '2', '2', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1858, 'ماكينة قطع ورق A4', NULL, '1617', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1859, 'شاشة  hp LED MONITOR 24 INCH', NULL, '1618', NULL, 1, '2', '2', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1860, 'لاب توب msi GL65', NULL, '1619', NULL, 1, '2', '2', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1861, 'هارد ديسك داخلي 4 تيرا', NULL, '1620', NULL, 1, '1', '1', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');
INSERT INTO `items` VALUES (1862, 'لابتوب HP 250 G9 I3 \"12\" RAM 8G M.2 256 SSD', NULL, '1621', 2, 1, '11', '11', '1', '2023-04-07 09:14:26', '2023-04-30 06:18:14');
INSERT INTO `items` VALUES (1863, 'خزانية مكتبية بدون ابواب 200*80*40', NULL, '1622', NULL, 1, '2', '2', '1', '2023-04-07 09:14:26', '2023-04-07 09:14:26');

-- ----------------------------
-- Table structure for items_tmp
-- ----------------------------
DROP TABLE IF EXISTS `items_tmp`;
CREATE TABLE `items_tmp`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 622 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of items_tmp
-- ----------------------------
INSERT INTO `items_tmp` VALUES (1, 'دباسة كبيرة', 1);
INSERT INTO `items_tmp` VALUES (2, 'دفايه', 3);
INSERT INTO `items_tmp` VALUES (3, 'لمبات نيون 120 سم', 79);
INSERT INTO `items_tmp` VALUES (4, 'كاميرات مراقبة', 131);
INSERT INTO `items_tmp` VALUES (5, 'جهاز ups هندي 3 كيلو', 1);
INSERT INTO `items_tmp` VALUES (6, 'مضخة ماء  2 حصان', 8);
INSERT INTO `items_tmp` VALUES (7, 'كشاف ليد', 4);
INSERT INTO `items_tmp` VALUES (8, 'ميكرفون خارجي مع الطبة', 5);
INSERT INTO `items_tmp` VALUES (9, 'ستاند مايك', 6);
INSERT INTO `items_tmp` VALUES (10, 'مايك', 9);
INSERT INTO `items_tmp` VALUES (11, 'بطاريه 12 فولت', 19);
INSERT INTO `items_tmp` VALUES (12, 'محطة تحلية مياه (5 كوب يوميا)', 1);
INSERT INTO `items_tmp` VALUES (13, 'طبلون كهرباء حديد 160*35*100', 1);
INSERT INTO `items_tmp` VALUES (14, 'تي 110*50', 1);
INSERT INTO `items_tmp` VALUES (15, 'تي 200*70', 1);
INSERT INTO `items_tmp` VALUES (16, 'سيبة خشب', 17);
INSERT INTO `items_tmp` VALUES (17, 'ملزمة', 1);
INSERT INTO `items_tmp` VALUES (18, 'طبلون كهرباء 140*200', 3);
INSERT INTO `items_tmp` VALUES (19, 'برميل 1500 لتر', 1);
INSERT INTO `items_tmp` VALUES (20, 'برميل 500 لتر', 2);
INSERT INTO `items_tmp` VALUES (21, 'طبلون كهرباء 90*90', 1);
INSERT INTO `items_tmp` VALUES (22, 'جهاز بصمة', 17);
INSERT INTO `items_tmp` VALUES (23, 'سماعة صوت داخلية مع الصندوق', 1);
INSERT INTO `items_tmp` VALUES (24, 'RACK', 44);
INSERT INTO `items_tmp` VALUES (25, 'PATCH PANel', 5);
INSERT INTO `items_tmp` VALUES (26, 'طرمبة رش', 8);
INSERT INTO `items_tmp` VALUES (27, 'ترنس كهرباء 1 ك', 3);
INSERT INTO `items_tmp` VALUES (28, 'ترنس كهرباء 5 ك', 3);
INSERT INTO `items_tmp` VALUES (29, 'ترنس كهرباء 10 ك', 1);
INSERT INTO `items_tmp` VALUES (30, 'فرامة ورق', 82);
INSERT INTO `items_tmp` VALUES (31, 'ماكنة تصوير Sharp E 5320', 1);
INSERT INTO `items_tmp` VALUES (32, 'ماكنة تصوير SARB  5731', 9);
INSERT INTO `items_tmp` VALUES (33, 'ماكنة تصوير', 2);
INSERT INTO `items_tmp` VALUES (34, 'مكيف 2 طن', 1);
INSERT INTO `items_tmp` VALUES (35, 'ثلاجة منزلية', 5);
INSERT INTO `items_tmp` VALUES (36, 'ثلاجة مياة ساخن بارد', 1);
INSERT INTO `items_tmp` VALUES (37, 'ثلاجة بارد ساخن', 47);
INSERT INTO `items_tmp` VALUES (38, 'ثلاجه مكتب', 19);
INSERT INTO `items_tmp` VALUES (39, 'مروحة سقف CHMC', 521);
INSERT INTO `items_tmp` VALUES (40, 'مروحة عمود', 163);
INSERT INTO `items_tmp` VALUES (41, 'مروحة ساخن بارد', 1);
INSERT INTO `items_tmp` VALUES (42, 'جوال نوكيا', 2);
INSERT INTO `items_tmp` VALUES (43, 'رسيفر', 8);
INSERT INTO `items_tmp` VALUES (44, 'شاشة lcd 32 بوصه', 2);
INSERT INTO `items_tmp` VALUES (45, 'ماكنة خياطة SINGER دعسة يدوية', 14);
INSERT INTO `items_tmp` VALUES (46, 'ماكنة خياطة حبكة vinos', 1);
INSERT INTO `items_tmp` VALUES (47, 'ماكنة ابر لوك brother', 1);
INSERT INTO `items_tmp` VALUES (48, 'تلفون عادي', 183);
INSERT INTO `items_tmp` VALUES (49, 'تلفون بان سونيك', 55);
INSERT INTO `items_tmp` VALUES (50, 'فاكس', 1);
INSERT INTO `items_tmp` VALUES (51, 'فاكس pana soic  ماليزي 402', 1);
INSERT INTO `items_tmp` VALUES (52, 'سنترال', 1);
INSERT INTO `items_tmp` VALUES (53, 'جهاز راوتر للنت', 1);
INSERT INTO `items_tmp` VALUES (54, 'مكنسة كهربائية', 15);
INSERT INTO `items_tmp` VALUES (55, 'سخان  مياة 30 لتر', 1);
INSERT INTO `items_tmp` VALUES (56, 'كشاف', 4);
INSERT INTO `items_tmp` VALUES (57, 'مسجل', 1);
INSERT INTO `items_tmp` VALUES (58, 'سماعات حجم كبير', 4);
INSERT INTO `items_tmp` VALUES (59, 'سماعات حجم صغير', 1);
INSERT INTO `items_tmp` VALUES (60, 'لاقط صوت', 2);
INSERT INTO `items_tmp` VALUES (61, 'سماعة خارجية  حجم صغير', 4);
INSERT INTO `items_tmp` VALUES (62, 'جهاز صوت', 12);
INSERT INTO `items_tmp` VALUES (63, 'سماعات حجم وسط', 24);
INSERT INTO `items_tmp` VALUES (64, 'مقدح بوش', 2);
INSERT INTO `items_tmp` VALUES (65, 'ماتور ماء دافع', 1);
INSERT INTO `items_tmp` VALUES (66, 'خزان مياة  سعة 1500 لتر', 27);
INSERT INTO `items_tmp` VALUES (67, 'خزان مياة سعة 300 لتر', 1);
INSERT INTO `items_tmp` VALUES (68, 'خزان مياة 200 لتر', 2);
INSERT INTO `items_tmp` VALUES (69, 'خزان مياة سعة 1000 لتر', 17);
INSERT INTO `items_tmp` VALUES (70, 'طبلون كهرباء 60*60', 2);
INSERT INTO `items_tmp` VALUES (71, 'سيبة حديد', 1);
INSERT INTO `items_tmp` VALUES (72, 'طفاية حريق', 61);
INSERT INTO `items_tmp` VALUES (73, 'مولد كهرباء بيركنز 15 kva مع كاتم اصلى', 2);
INSERT INTO `items_tmp` VALUES (74, 'مولد كهرباء 7 kva  روبن', 1);
INSERT INTO `items_tmp` VALUES (75, 'مكتب خشب 140*60', 13);
INSERT INTO `items_tmp` VALUES (76, 'مكتب مدير عام', 3);
INSERT INTO `items_tmp` VALUES (77, 'مكتب خشب 140*70', 96);
INSERT INTO `items_tmp` VALUES (78, 'مكتب  خشب 200*100', 7);
INSERT INTO `items_tmp` VALUES (79, 'مكتب خشب 240*100', 1);
INSERT INTO `items_tmp` VALUES (80, 'مكتب خشب 160*60', 17);
INSERT INTO `items_tmp` VALUES (81, 'مكتب خشب 180 *80', 53);
INSERT INTO `items_tmp` VALUES (82, 'مكتب خشب 120*80', 2);
INSERT INTO `items_tmp` VALUES (83, 'مكتب خشب 180*80', 3);
INSERT INTO `items_tmp` VALUES (84, 'مكتب خشب 180*70', 6);
INSERT INTO `items_tmp` VALUES (85, 'مكتب خشب 240 * 60', 4);
INSERT INTO `items_tmp` VALUES (86, 'سارية علم', 1);
INSERT INTO `items_tmp` VALUES (87, 'طاولة 120*40', 24);
INSERT INTO `items_tmp` VALUES (88, 'طاولة بلاستيك', 3);
INSERT INTO `items_tmp` VALUES (89, 'طاولة 140*70', 1);
INSERT INTO `items_tmp` VALUES (90, 'طاوله 120*60', 65);
INSERT INTO `items_tmp` VALUES (91, 'طاولة صيانة', 5);
INSERT INTO `items_tmp` VALUES (92, 'طاولة تنس', 5);
INSERT INTO `items_tmp` VALUES (93, 'طاولة تلفزيون 140*120', 1);
INSERT INTO `items_tmp` VALUES (94, 'طاولة 130*60', 6);
INSERT INTO `items_tmp` VALUES (95, 'طاولة وسط خشب 120*80', 1);
INSERT INTO `items_tmp` VALUES (96, 'طاولة 130*55', 2);
INSERT INTO `items_tmp` VALUES (97, 'طاولة 110*70', 1);
INSERT INTO `items_tmp` VALUES (98, 'طاولة حاسوب 110*50', 40);
INSERT INTO `items_tmp` VALUES (99, 'طاولة 70*40', 3);
INSERT INTO `items_tmp` VALUES (100, 'طاولة حديد مع ملزمة', 1);
INSERT INTO `items_tmp` VALUES (101, 'طاولة جانبية 160*50', 1);
INSERT INTO `items_tmp` VALUES (102, 'طاولة 120 *50', 20);
INSERT INTO `items_tmp` VALUES (103, 'طاولة 80*50', 4);
INSERT INTO `items_tmp` VALUES (104, 'طاولة 80*50', 2);
INSERT INTO `items_tmp` VALUES (105, 'طاولة ماكينة تصوير', 2);
INSERT INTO `items_tmp` VALUES (106, 'طاولة 50*70', 2);
INSERT INTO `items_tmp` VALUES (107, 'طاولة حاسوب  110*45', 203);
INSERT INTO `items_tmp` VALUES (108, 'طاولة اجتماعات 2.4 م *1.2 م', 2);
INSERT INTO `items_tmp` VALUES (109, 'بوفيه خشب 230*120', 1);
INSERT INTO `items_tmp` VALUES (110, 'بوفية ضلف زجاج علوية 120*250', 2);
INSERT INTO `items_tmp` VALUES (111, 'بوفية 1.9*280', 1);
INSERT INTO `items_tmp` VALUES (112, 'كرسي موظف', 653);
INSERT INTO `items_tmp` VALUES (113, 'كرسي بلاستك', 1348);
INSERT INTO `items_tmp` VALUES (114, 'كرسي انتظار', 1);
INSERT INTO `items_tmp` VALUES (115, 'كرسي حاسوب', 1);
INSERT INTO `items_tmp` VALUES (116, 'كرسي محاضرات', 1062);
INSERT INTO `items_tmp` VALUES (117, 'كرسي سكرتارية', 50);
INSERT INTO `items_tmp` VALUES (118, 'كرسي انتظار خارجي 3*1', 50);
INSERT INTO `items_tmp` VALUES (119, 'كمودينة', 266);
INSERT INTO `items_tmp` VALUES (120, 'كرسي مدير', 72);
INSERT INTO `items_tmp` VALUES (121, 'كرسي طالب', 648);
INSERT INTO `items_tmp` VALUES (122, 'كرسي حديد', 6);
INSERT INTO `items_tmp` VALUES (123, 'كرسي وزير', 1);
INSERT INTO `items_tmp` VALUES (124, 'كرسي مدير عام', 2);
INSERT INTO `items_tmp` VALUES (125, 'كرسي انتظار خشب زان مع وجه جلد', 6);
INSERT INTO `items_tmp` VALUES (126, 'كرسي موظف مستخدم', 3);
INSERT INTO `items_tmp` VALUES (127, 'خزانه 2 ضلفه خشب', 140);
INSERT INTO `items_tmp` VALUES (128, 'خزانه خشب 4 ظلف', 1);
INSERT INTO `items_tmp` VALUES (129, 'خزانة شنل 5 درج', 1);
INSERT INTO `items_tmp` VALUES (130, 'خزانة ارفف مزدوج خشب 180*80*40', 2);
INSERT INTO `items_tmp` VALUES (131, 'خزانة 4 ضلف علوية + 4 ضلف خشب سفلية', 2);
INSERT INTO `items_tmp` VALUES (132, 'خزانة خشب 95*60*60', 1);
INSERT INTO `items_tmp` VALUES (133, 'خزانة حديد ضلفة واحدة', 6);
INSERT INTO `items_tmp` VALUES (134, 'خزانة 2 ضلفه زجاج علوية + 2 ضلفة سفلية', 79);
INSERT INTO `items_tmp` VALUES (135, 'خزانة 3 ضلف خشب', 6);
INSERT INTO `items_tmp` VALUES (136, 'خزنة حديد مقاس 60*40', 4);
INSERT INTO `items_tmp` VALUES (137, 'خزانة 3 ظلف 120*200', 2);
INSERT INTO `items_tmp` VALUES (138, 'خزانة هرمية 2 ضلفة زجاج 90*200', 1);
INSERT INTO `items_tmp` VALUES (139, 'خزانة جانبية', 33);
INSERT INTO `items_tmp` VALUES (140, 'خزانة 2 ظلفة  80*2 م مع وجة زجاج', 1);
INSERT INTO `items_tmp` VALUES (141, 'خزانة 120 *80', 1);
INSERT INTO `items_tmp` VALUES (142, 'خزانة حديد 2 ظلفة', 129);
INSERT INTO `items_tmp` VALUES (143, 'خزانة شنل خشب 4 درج', 3);
INSERT INTO `items_tmp` VALUES (144, 'خزانة خشب 80*190*40', 2);
INSERT INTO `items_tmp` VALUES (145, 'خزانة ملفات زجاج علوي 80*195', 5);
INSERT INTO `items_tmp` VALUES (146, 'خزانة 180*85', 3);
INSERT INTO `items_tmp` VALUES (147, 'خزانة اررفف خشب 200*80', 3);
INSERT INTO `items_tmp` VALUES (148, 'خزانة خشب 2 ضلفة علوية + 2 سفلية', 1);
INSERT INTO `items_tmp` VALUES (149, 'خزانة ملفات 3 ضلف زجاج علوية', 2);
INSERT INTO `items_tmp` VALUES (150, 'خزانة مكتبة 2 ظلفة  باب زجاج', 24);
INSERT INTO `items_tmp` VALUES (151, 'خزانة 3 ضلف زجاج علوية + 3 سفلية', 14);
INSERT INTO `items_tmp` VALUES (152, 'خزانة ملفات خشب', 53);
INSERT INTO `items_tmp` VALUES (153, 'خزانة شنل 4 ادراج', 89);
INSERT INTO `items_tmp` VALUES (154, 'خزانة ألمنيوم 90*140', 1);
INSERT INTO `items_tmp` VALUES (155, 'خزانة خشب 4 ضلف 140*180', 1);
INSERT INTO `items_tmp` VALUES (156, 'خزانة مطبخ', 11);
INSERT INTO `items_tmp` VALUES (157, 'خزانة خشب ضلفة واحدة 180 * 60', 1);
INSERT INTO `items_tmp` VALUES (158, 'خزانة شنل 5 ادراج', 11);
INSERT INTO `items_tmp` VALUES (159, 'تي مكتب 190*80', 4);
INSERT INTO `items_tmp` VALUES (160, 'تي مكتب 160*60', 8);
INSERT INTO `items_tmp` VALUES (161, 'تي  170*70', 8);
INSERT INTO `items_tmp` VALUES (162, 'تي مكتب 150*70', 4);
INSERT INTO `items_tmp` VALUES (163, 'تي 160*70', 33);
INSERT INTO `items_tmp` VALUES (164, 'تي مكتب 240*110', 4);
INSERT INTO `items_tmp` VALUES (165, 'تي مكتب 140 *70', 8);
INSERT INTO `items_tmp` VALUES (166, 'تي 180 *80', 18);
INSERT INTO `items_tmp` VALUES (167, 'رف حديد 6 طبقات', 52);
INSERT INTO `items_tmp` VALUES (168, 'رف حديد 3 أرفف', 19);
INSERT INTO `items_tmp` VALUES (169, 'رف حديد طبقات 100*250', 36);
INSERT INTO `items_tmp` VALUES (170, 'رف حديد 300*100', 1);
INSERT INTO `items_tmp` VALUES (171, 'رف حديد 4 ارفف', 17);
INSERT INTO `items_tmp` VALUES (172, 'رف حديد 70*250', 1);
INSERT INTO `items_tmp` VALUES (173, 'رف حديد 5 طبقات', 50);
INSERT INTO `items_tmp` VALUES (174, 'اسكمبلة', 46);
INSERT INTO `items_tmp` VALUES (175, 'ارفف حديد', 25);
INSERT INTO `items_tmp` VALUES (176, 'علاقة ملابس', 9);
INSERT INTO `items_tmp` VALUES (177, 'سويتش', 74);
INSERT INTO `items_tmp` VALUES (178, 'شاشاة BENQ 19', 11);
INSERT INTO `items_tmp` VALUES (179, 'جهاز كمبيوتر', 4);
INSERT INTO `items_tmp` VALUES (180, 'جهاز كمبيوتر Dell 3040', 2);
INSERT INTO `items_tmp` VALUES (181, 'شاشة 19VIEVPASTIV', 18);
INSERT INTO `items_tmp` VALUES (182, 'شاشة samsong 24', 1);
INSERT INTO `items_tmp` VALUES (183, 'شاشة عرض', 6);
INSERT INTO `items_tmp` VALUES (184, 'شاشة 23 بوصة AOC', 1);
INSERT INTO `items_tmp` VALUES (185, 'شاشة 32 بوصة tornido', 1);
INSERT INTO `items_tmp` VALUES (186, 'شاشة HP  17', 1);
INSERT INTO `items_tmp` VALUES (187, 'شاشة umax', 1);
INSERT INTO `items_tmp` VALUES (188, 'طابعة HP 3015 D', 1);
INSERT INTO `items_tmp` VALUES (189, 'طابعة 2055 hp', 15);
INSERT INTO `items_tmp` VALUES (190, 'طابعة SAMSUNG 1640', 9);
INSERT INTO `items_tmp` VALUES (191, 'طابعة', 3);
INSERT INTO `items_tmp` VALUES (192, 'طابعة Ricko 3120 B', 1);
INSERT INTO `items_tmp` VALUES (193, 'طابعة SAMSUNG 2851', 1);
INSERT INTO `items_tmp` VALUES (194, 'طابعة HP 1200', 1);
INSERT INTO `items_tmp` VALUES (195, 'طابعة hp1102', 2);
INSERT INTO `items_tmp` VALUES (196, 'طابعة  Epson L386', 2);
INSERT INTO `items_tmp` VALUES (197, 'طابعة hp 1018', 4);
INSERT INTO `items_tmp` VALUES (198, 'طابعة hp 1005', 21);
INSERT INTO `items_tmp` VALUES (199, 'طابعة 1100HP', 3);
INSERT INTO `items_tmp` VALUES (200, 'طابعة 3*1  HP2280', 1);
INSERT INTO `items_tmp` VALUES (201, 'جهاز بروجكتور', 2);
INSERT INTO `items_tmp` VALUES (202, 'جهاز UBS', 234);
INSERT INTO `items_tmp` VALUES (203, 'سكنر', 10);
INSERT INTO `items_tmp` VALUES (204, 'كاميرا SONY', 1);
INSERT INTO `items_tmp` VALUES (205, 'كاميرا تايكون  80', 1);
INSERT INTO `items_tmp` VALUES (206, 'كاميرا canon', 6);
INSERT INTO `items_tmp` VALUES (207, 'جهاز عرض LCD', 1);
INSERT INTO `items_tmp` VALUES (208, 'حامل بروجكتور', 1);
INSERT INTO `items_tmp` VALUES (209, 'هارد دسك خارجى 2 تيرا', 3);
INSERT INTO `items_tmp` VALUES (210, 'جهاز سيرفر HP Pro LINL 310 E caenrion 8', 6);
INSERT INTO `items_tmp` VALUES (211, 'هارد دسك 1 تيرا', 4);
INSERT INTO `items_tmp` VALUES (212, 'فرش غاز 1 عين', 5);
INSERT INTO `items_tmp` VALUES (213, 'فرش غاز 2 عين', 3);
INSERT INTO `items_tmp` VALUES (214, 'فرش غاز 3 عين', 38);
INSERT INTO `items_tmp` VALUES (215, 'اسطوانة غاز 5 كيلو', 4);
INSERT INTO `items_tmp` VALUES (216, 'اسطوانة غاز 12 ك', 48);
INSERT INTO `items_tmp` VALUES (217, 'غاطس ماء', 1);
INSERT INTO `items_tmp` VALUES (218, 'اسطوانة اكسجين', 1);
INSERT INTO `items_tmp` VALUES (219, 'ماكنة جلاتين', 3);
INSERT INTO `items_tmp` VALUES (220, 'جهاز بث 700W', 1);
INSERT INTO `items_tmp` VALUES (221, 'مكسر صوت', 6);
INSERT INTO `items_tmp` VALUES (222, 'برج ارسال حديد', 1);
INSERT INTO `items_tmp` VALUES (223, 'تلفون مركزي', 2);
INSERT INTO `items_tmp` VALUES (224, 'جهاز DVD', 1);
INSERT INTO `items_tmp` VALUES (225, 'ماكنة تصوير Kyocera /km3530', 2);
INSERT INTO `items_tmp` VALUES (226, 'ماكنة تصوير 161 RicoH  ريكو', 9);
INSERT INTO `items_tmp` VALUES (227, 'مكيف', 49);
INSERT INTO `items_tmp` VALUES (228, 'ثلاجة عرض 190*60', 1);
INSERT INTO `items_tmp` VALUES (229, 'ماكنة حبكة خياطة Juki', 1);
INSERT INTO `items_tmp` VALUES (230, 'ماكنة خياطة درزة vinos', 1);
INSERT INTO `items_tmp` VALUES (231, 'ماكنة خياطة درزة  Juki', 4);
INSERT INTO `items_tmp` VALUES (232, 'تلفون بناسونك عادي', 1);
INSERT INTO `items_tmp` VALUES (233, 'تلفون بناسونك شاشة سبيكر', 2);
INSERT INTO `items_tmp` VALUES (234, 'فاكس PANASONIC', 8);
INSERT INTO `items_tmp` VALUES (235, 'بدالة تلفون', 11);
INSERT INTO `items_tmp` VALUES (236, 'سخان ماء 40 لتر', 15);
INSERT INTO `items_tmp` VALUES (237, 'سخان  مياة كهربي 60لتر', 9);
INSERT INTO `items_tmp` VALUES (238, 'سخان ماء', 3);
INSERT INTO `items_tmp` VALUES (239, 'ميكرفون يدوي', 3);
INSERT INTO `items_tmp` VALUES (240, 'كشاف ليد 1000 video light', 1);
INSERT INTO `items_tmp` VALUES (241, 'خزان مياة سعة 2000 لتر', 24);
INSERT INTO `items_tmp` VALUES (242, 'خزان ماء 500 لتر', 5);
INSERT INTO `items_tmp` VALUES (243, 'راوتر نت', 4);
INSERT INTO `items_tmp` VALUES (244, 'سماعة صوت داخليه', 1);
INSERT INTO `items_tmp` VALUES (245, 'تلفون لاسلكى', 14);
INSERT INTO `items_tmp` VALUES (246, 'ثلاجة مياه 3 حنفية', 8);
INSERT INTO `items_tmp` VALUES (247, 'ثلاجة ماء 2 حنفية', 2);
INSERT INTO `items_tmp` VALUES (248, 'جهاز DVR للكاميرات', 10);
INSERT INTO `items_tmp` VALUES (249, 'جهاز انذار حريق', 1);
INSERT INTO `items_tmp` VALUES (250, 'مولد kva65 بيركنز مع كاتم', 1);
INSERT INTO `items_tmp` VALUES (251, 'مولد كهرباء 5كيلو', 4);
INSERT INTO `items_tmp` VALUES (252, 'مايد اذاعة داينمك', 2);
INSERT INTO `items_tmp` VALUES (253, 'ماكنة تصويرRICOH mp 171', 16);
INSERT INTO `items_tmp` VALUES (254, 'مولد KVA 22  بيركنز انجليزي', 3);
INSERT INTO `items_tmp` VALUES (255, 'جهاز كاتور لغسيل السيارات', 1);
INSERT INTO `items_tmp` VALUES (256, 'مروحة حائط', 14);
INSERT INTO `items_tmp` VALUES (257, 'ستاند كاميرا تصوير', 3);
INSERT INTO `items_tmp` VALUES (258, 'مكتب خشب 120*60', 29);
INSERT INTO `items_tmp` VALUES (259, 'لاب توب HP-VIC Core i7 th12', 1);
INSERT INTO `items_tmp` VALUES (260, 'مكتب خشب 140*60', 4);
INSERT INTO `items_tmp` VALUES (261, 'مكتب خشب  150*70', 23);
INSERT INTO `items_tmp` VALUES (262, 'مكتب خشب 160*80', 14);
INSERT INTO `items_tmp` VALUES (263, 'مكتب خشب 100*190', 1);
INSERT INTO `items_tmp` VALUES (264, 'مكتب 190*80*', 3);
INSERT INTO `items_tmp` VALUES (265, 'مكتب 240 *110', 1);
INSERT INTO `items_tmp` VALUES (266, 'مكتب خشب 100*210', 1);
INSERT INTO `items_tmp` VALUES (267, 'مكتب خشب 240*110', 1);
INSERT INTO `items_tmp` VALUES (268, 'مكتب خشب 120*70', 151);
INSERT INTO `items_tmp` VALUES (269, 'مكتب خشب 220*120', 1);
INSERT INTO `items_tmp` VALUES (270, 'مكتب خشب 180 * 100', 2);
INSERT INTO `items_tmp` VALUES (271, 'مكتب 220*100 خشب زان', 3);
INSERT INTO `items_tmp` VALUES (272, 'مكتب خشب 170*80', 5);
INSERT INTO `items_tmp` VALUES (273, 'مكتب 220*90', 1);
INSERT INTO `items_tmp` VALUES (274, 'منصة خطابة', 8);
INSERT INTO `items_tmp` VALUES (275, 'طاولة ماكنة تصوير خشب 2 ضلفة 70*50*60', 1);
INSERT INTO `items_tmp` VALUES (276, 'طاولة بلاستك', 8);
INSERT INTO `items_tmp` VALUES (277, 'طاولة كمبيوتر', 1);
INSERT INTO `items_tmp` VALUES (278, 'طاولة اجتماعات 190*90', 2);
INSERT INTO `items_tmp` VALUES (279, 'طابعة hp pro M102A', 4);
INSERT INTO `items_tmp` VALUES (280, 'طاولة تلفزيون 120*40*60سم', 1);
INSERT INTO `items_tmp` VALUES (281, 'طاولة وسط 40*80', 2);
INSERT INTO `items_tmp` VALUES (282, 'طاولة طالب', 393);
INSERT INTO `items_tmp` VALUES (283, 'مكتب خشب 160*70', 259);
INSERT INTO `items_tmp` VALUES (284, 'طاولة وسط 110*60', 6);
INSERT INTO `items_tmp` VALUES (285, 'طاولة حديد 40*90', 1);
INSERT INTO `items_tmp` VALUES (286, 'طاولة خشب', 2);
INSERT INTO `items_tmp` VALUES (287, 'طاولة اجتماعات مربعة 480*300', 1);
INSERT INTO `items_tmp` VALUES (288, 'طاولة وسط 100*50', 2);
INSERT INTO `items_tmp` VALUES (289, 'طاولة ماكنة تصوير', 12);
INSERT INTO `items_tmp` VALUES (290, 'طاولة زان 70*230', 1);
INSERT INTO `items_tmp` VALUES (291, 'ملحق جانبي  120*40*60', 3);
INSERT INTO `items_tmp` VALUES (292, 'طاولة اجتماعات 240*100', 2);
INSERT INTO `items_tmp` VALUES (293, 'كرسي انتظار ديانا', 916);
INSERT INTO `items_tmp` VALUES (294, 'كرسي انتظار جلد بأيدي وارجل زان', 59);
INSERT INTO `items_tmp` VALUES (295, 'كرسي انتظار براير', 260);
INSERT INTO `items_tmp` VALUES (296, 'كرسي انتظار جلد او قماش ارجل حديد', 6);
INSERT INTO `items_tmp` VALUES (297, 'كرسي مختبر', 91);
INSERT INTO `items_tmp` VALUES (298, 'كرسي انتظار ايدي وارجل حديد', 6);
INSERT INTO `items_tmp` VALUES (299, 'خزانة خشب 2 ضلفة زجاج علوي+2 سلفي', 5);
INSERT INTO `items_tmp` VALUES (300, 'خزانه خشب 5 ضلف علوي +3ضلفة سفلي260*240', 1);
INSERT INTO `items_tmp` VALUES (301, 'خزانة خشب 3 ضلف علوية + 3 سفلية', 2);
INSERT INTO `items_tmp` VALUES (302, 'خزان بلاستك 5000 لتر', 6);
INSERT INTO `items_tmp` VALUES (303, 'خزانة خشب 2 ضلفه 200*80*40سم', 4);
INSERT INTO `items_tmp` VALUES (304, 'خزانة اسعافات', 3);
INSERT INTO `items_tmp` VALUES (305, 'خزنة حديد55*75', 2);
INSERT INTO `items_tmp` VALUES (306, 'خزانة خشب 3 ضلف  علوي 3سفلي', 1);
INSERT INTO `items_tmp` VALUES (307, 'خزانة اررفف خشب', 28);
INSERT INTO `items_tmp` VALUES (308, 'خزانة 2ضلفة وجه زجاج 180*120', 1);
INSERT INTO `items_tmp` VALUES (309, 'خزانة تلفزيون', 1);
INSERT INTO `items_tmp` VALUES (310, 'كاونتر خشب 3.45* 5', 1);
INSERT INTO `items_tmp` VALUES (311, 'طاولة اجتماعات 160*70', 2);
INSERT INTO `items_tmp` VALUES (312, 'طاولة اجتماعات 240*60', 10);
INSERT INTO `items_tmp` VALUES (313, 'طاولة اجتماعات 120*250', 3);
INSERT INTO `items_tmp` VALUES (314, 'طاولة اجتماعات بيضاوية 150*90', 1);
INSERT INTO `items_tmp` VALUES (315, 'حامل ارفف خيزران', 4);
INSERT INTO `items_tmp` VALUES (316, 'كاونتر خشب 110*170', 2);
INSERT INTO `items_tmp` VALUES (317, 'مكتب خشب 170*70', 9);
INSERT INTO `items_tmp` VALUES (318, 'حامل خشب', 1);
INSERT INTO `items_tmp` VALUES (319, 'سرير طبى', 2);
INSERT INTO `items_tmp` VALUES (320, 'بروجكتر', 17);
INSERT INTO `items_tmp` VALUES (321, 'طاولة 50*60', 4);
INSERT INTO `items_tmp` VALUES (322, 'طقم كنب', 2);
INSERT INTO `items_tmp` VALUES (323, 'كنبة جلد ثلاثية', 3);
INSERT INTO `items_tmp` VALUES (324, 'سرير مفرد', 11);
INSERT INTO `items_tmp` VALUES (325, 'صندوق عطاء', 3);
INSERT INTO `items_tmp` VALUES (326, 'طاولة 70*70', 1);
INSERT INTO `items_tmp` VALUES (327, 'جهاز لاب توب HP', 132);
INSERT INTO `items_tmp` VALUES (328, 'شاشة 17 samsong', 2);
INSERT INTO `items_tmp` VALUES (329, 'شاشة 17 PENQ', 1);
INSERT INTO `items_tmp` VALUES (330, 'شاشة 17 Maxview', 1);
INSERT INTO `items_tmp` VALUES (331, 'شاشة  Viewsonic 19', 5);
INSERT INTO `items_tmp` VALUES (332, 'شاشة عرض بروجكتر جلد', 3);
INSERT INTO `items_tmp` VALUES (333, 'شاشة  19 samsong', 14);
INSERT INTO `items_tmp` VALUES (334, 'شاشة Ben QLCD', 1);
INSERT INTO `items_tmp` VALUES (335, 'شاشة 17 HP', 7);
INSERT INTO `items_tmp` VALUES (336, 'شاشة 19 LG', 185);
INSERT INTO `items_tmp` VALUES (337, 'شاشة HP  19', 73);
INSERT INTO `items_tmp` VALUES (338, 'شاشة 19 DELL', 17);
INSERT INTO `items_tmp` VALUES (339, 'طابعة ملون Canon IP 2700', 1);
INSERT INTO `items_tmp` VALUES (340, 'شاشة 17 LG', 7);
INSERT INTO `items_tmp` VALUES (341, 'طابعة hp p2055dn', 1);
INSERT INTO `items_tmp` VALUES (342, 'طابعة ملونة ابسون L310', 4);
INSERT INTO `items_tmp` VALUES (343, 'طابعة  Epson L382', 4);
INSERT INTO `items_tmp` VALUES (344, 'طابعة  Hp pro 400', 24);
INSERT INTO `items_tmp` VALUES (345, 'طابعة  hp1010', 1);
INSERT INTO `items_tmp` VALUES (346, 'جهاز UPS', 6);
INSERT INTO `items_tmp` VALUES (347, 'سكنر 5590 hp', 27);
INSERT INTO `items_tmp` VALUES (348, 'كاميرا', 1);
INSERT INTO `items_tmp` VALUES (349, 'انفيرتر 3 كيلو', 1);
INSERT INTO `items_tmp` VALUES (350, 'ميكروفون BM800', 1);
INSERT INTO `items_tmp` VALUES (351, 'ترنس كهرباء 1 ك', 3);
INSERT INTO `items_tmp` VALUES (352, 'جهاز لاب توب Toshiba', 13);
INSERT INTO `items_tmp` VALUES (353, 'تلفزيون', 1);
INSERT INTO `items_tmp` VALUES (354, 'جهاز حاسوب تجميع', 269);
INSERT INTO `items_tmp` VALUES (355, 'مايك لاسلكي', 4);
INSERT INTO `items_tmp` VALUES (356, 'سماعة سبيكر', 18);
INSERT INTO `items_tmp` VALUES (357, 'جهاز لاب توب ACER', 8);
INSERT INTO `items_tmp` VALUES (358, 'طابعه hp 1102', 47);
INSERT INTO `items_tmp` VALUES (359, 'طابعة Hp Pro 402dn', 18);
INSERT INTO `items_tmp` VALUES (360, 'جهاز مولد مؤثرات صوت', 2);
INSERT INTO `items_tmp` VALUES (361, 'عربة يد عجل واحد', 5);
INSERT INTO `items_tmp` VALUES (362, 'وحدة مايكروتك', 2);
INSERT INTO `items_tmp` VALUES (363, 'جهاز لاب توب Lenovo', 67);
INSERT INTO `items_tmp` VALUES (364, 'جهاز لاب توب Dell', 14);
INSERT INTO `items_tmp` VALUES (365, 'حامل شاخص مساحة', 1);
INSERT INTO `items_tmp` VALUES (366, 'خزانة اطفاء حريق 2 ضلفة المونيوم', 6);
INSERT INTO `items_tmp` VALUES (367, 'جهاز لاب توب samsong', 4);
INSERT INTO `items_tmp` VALUES (368, 'اسكمبلة زجاج', 8);
INSERT INTO `items_tmp` VALUES (369, 'طاولة وسط خشب 120*60', 5);
INSERT INTO `items_tmp` VALUES (370, 'طاولة وسط زجاج 120*60', 2);
INSERT INTO `items_tmp` VALUES (371, 'طاولة وسط زجاج 120*70', 1);
INSERT INTO `items_tmp` VALUES (372, 'طاولة وسط خشب 60*90', 1);
INSERT INTO `items_tmp` VALUES (373, 'طاولة ماكنة تصوير خشب 80*70*60سم', 2);
INSERT INTO `items_tmp` VALUES (374, 'طابعة Richo 301', 1);
INSERT INTO `items_tmp` VALUES (375, 'طاولة اجتماعات دائرية 450*140', 1);
INSERT INTO `items_tmp` VALUES (376, 'شاشة 23انش HP', 3);
INSERT INTO `items_tmp` VALUES (377, 'ملحق جانبي 100*50', 2);
INSERT INTO `items_tmp` VALUES (378, 'ملحق جانبي 110*45', 2);
INSERT INTO `items_tmp` VALUES (379, 'طاولة وسط زجاج 80*35', 1);
INSERT INTO `items_tmp` VALUES (380, 'خزان سولار حديد 2000لتر', 1);
INSERT INTO `items_tmp` VALUES (381, 'كاونتر خشب دائري دورين 230*170*120', 1);
INSERT INTO `items_tmp` VALUES (382, 'انفيرتر بطاريات', 3);
INSERT INTO `items_tmp` VALUES (383, 'انفيرتر 15كيلو وات', 2);
INSERT INTO `items_tmp` VALUES (384, 'لوح طاقة شمسية', 156);
INSERT INTO `items_tmp` VALUES (385, 'كاونتر خشب 60*250', 1);
INSERT INTO `items_tmp` VALUES (386, 'انفيرتر 5 كيلو', 6);
INSERT INTO `items_tmp` VALUES (387, 'كاونتر خشب 160*170', 1);
INSERT INTO `items_tmp` VALUES (388, 'خزانة 2 ضلفة زجاج', 35);
INSERT INTO `items_tmp` VALUES (389, 'طاولة وسط 80*60', 2);
INSERT INTO `items_tmp` VALUES (390, 'مكتب خشب 160*90', 2);
INSERT INTO `items_tmp` VALUES (391, 'طاولة وسط خشب 60*70', 2);
INSERT INTO `items_tmp` VALUES (392, 'طاولة طابعة 75*45*70', 1);
INSERT INTO `items_tmp` VALUES (393, 'جهاز باركود', 1);
INSERT INTO `items_tmp` VALUES (394, 'قارئ باركود', 1);
INSERT INTO `items_tmp` VALUES (395, 'ماكينة تصوير RICOH 3350', 2);
INSERT INTO `items_tmp` VALUES (396, 'مكتب خشب 65*125', 7);
INSERT INTO `items_tmp` VALUES (397, 'طاولة صيانة 60*120', 1);
INSERT INTO `items_tmp` VALUES (398, 'جهاز هوت للصيانة HAKOOO700', 2);
INSERT INTO `items_tmp` VALUES (399, 'POWER SUPLY خاص بالصيانة', 1);
INSERT INTO `items_tmp` VALUES (400, 'جهاز KVM 8 مخارج', 2);
INSERT INTO `items_tmp` VALUES (401, 'شفاط هواء 10 انش', 7);
INSERT INTO `items_tmp` VALUES (402, 'طابعة SAMSONG 1660', 4);
INSERT INTO `items_tmp` VALUES (403, 'ارفف خشبية', 2);
INSERT INTO `items_tmp` VALUES (404, 'طاولة وسط 120*60', 7);
INSERT INTO `items_tmp` VALUES (405, 'ملحق جانبي 90*45', 1);
INSERT INTO `items_tmp` VALUES (406, 'طاولة خشب 55*65', 1);
INSERT INTO `items_tmp` VALUES (407, 'رف خشبي 30*85', 1);
INSERT INTO `items_tmp` VALUES (408, 'جهاز لاب توب ASUS', 2);
INSERT INTO `items_tmp` VALUES (409, 'جهاز كمبيوتر DELL 390', 13);
INSERT INTO `items_tmp` VALUES (410, 'جهاز كمبيوتر hp 280', 22);
INSERT INTO `items_tmp` VALUES (411, 'تي مكتب 70*150', 1);
INSERT INTO `items_tmp` VALUES (412, 'ماكنة تصوير Richo 3030 A', 1);
INSERT INTO `items_tmp` VALUES (413, 'طابعة HP 2050 A', 1);
INSERT INTO `items_tmp` VALUES (414, 'جهاز مساحة Topcon (AT - G4)', 1);
INSERT INTO `items_tmp` VALUES (415, 'بريزما', 2);
INSERT INTO `items_tmp` VALUES (416, 'خزنة حديد 50*40', 5);
INSERT INTO `items_tmp` VALUES (417, 'كانتر خشب 130*230', 1);
INSERT INTO `items_tmp` VALUES (418, 'شاشة 32 بوصة', 3);
INSERT INTO `items_tmp` VALUES (419, 'ناسخ اسطوانات 10 cdrom', 1);
INSERT INTO `items_tmp` VALUES (420, 'جهاز كمبيوتر HP', 5);
INSERT INTO `items_tmp` VALUES (421, 'شاشة HP 21', 6);
INSERT INTO `items_tmp` VALUES (422, 'مخشير لا سلكي', 5);
INSERT INTO `items_tmp` VALUES (423, 'جهاز مساحة توتال ستيشن Trimble', 1);
INSERT INTO `items_tmp` VALUES (424, 'جهاز تعقيم بخار', 1);
INSERT INTO `items_tmp` VALUES (425, 'شاشة Samsong 45 بوصة', 1);
INSERT INTO `items_tmp` VALUES (426, 'شاشة Samsong 70 بوصة', 1);
INSERT INTO `items_tmp` VALUES (427, 'شاشة LUXO 40', 1);
INSERT INTO `items_tmp` VALUES (428, 'جهاز tablet', 1);
INSERT INTO `items_tmp` VALUES (429, 'جهاز كمبيوتر DELL 3010', 4);
INSERT INTO `items_tmp` VALUES (430, 'جهاز كمبيوتر HP 500', 14);
INSERT INTO `items_tmp` VALUES (431, 'تي مكتب 180*80', 2);
INSERT INTO `items_tmp` VALUES (432, 'تي مكتب 120*80', 2);
INSERT INTO `items_tmp` VALUES (433, 'طابعة hp 404 dn', 5);
INSERT INTO `items_tmp` VALUES (434, 'شاشة LG 30 بوصة', 1);
INSERT INTO `items_tmp` VALUES (435, 'طقم كنب مورس 10 مقاعد', 1);
INSERT INTO `items_tmp` VALUES (436, 'طابعة ابسون L3150', 3);
INSERT INTO `items_tmp` VALUES (437, 'بوفيه ضلف زجاج علوية + ضلف خشب سفلية  150*250', 2);
INSERT INTO `items_tmp` VALUES (438, 'خزانة زجاج  210*80', 1);
INSERT INTO `items_tmp` VALUES (439, 'شاشة LG 32بوصة', 4);
INSERT INTO `items_tmp` VALUES (440, 'تلفون انتركوم', 2);
INSERT INTO `items_tmp` VALUES (441, 'طقم كنب جلد 7 مقاعد', 2);
INSERT INTO `items_tmp` VALUES (442, 'شاشة 60 بوصة MULLER', 1);
INSERT INTO `items_tmp` VALUES (443, 'طاولة اجتماعات بيضاوية 570*180', 1);
INSERT INTO `items_tmp` VALUES (444, 'خزانة خشب 2 باب علوي +2 سفلي', 13);
INSERT INTO `items_tmp` VALUES (445, 'تي مكتب 120*60', 4);
INSERT INTO `items_tmp` VALUES (446, 'شاشة 43 بوصة HYUNDAI', 1);
INSERT INTO `items_tmp` VALUES (447, 'جهاز UPS للطاقة الشمسية', 2);
INSERT INTO `items_tmp` VALUES (448, 'بطارية 200 أمبير', 33);
INSERT INTO `items_tmp` VALUES (449, 'بطارية 26 أمبير', 6);
INSERT INTO `items_tmp` VALUES (450, 'جهاز سيرفر power Edge T 610', 1);
INSERT INTO `items_tmp` VALUES (451, 'جهاز كمبيوتر HP copaq dx2420 micro T', 0);
INSERT INTO `items_tmp` VALUES (452, 'جهاز كمبيوتر Dell optipled 760', 1);
INSERT INTO `items_tmp` VALUES (453, 'سويتش HP 180 - 48G', 1);
INSERT INTO `items_tmp` VALUES (454, 'سويتش HP 1810 - 24G', 1);
INSERT INTO `items_tmp` VALUES (455, 'سويتش HP 1810 - 16G', 1);
INSERT INTO `items_tmp` VALUES (456, 'Qnap - Ts 653 A', 1);
INSERT INTO `items_tmp` VALUES (457, 'My cloud 2 T', 1);
INSERT INTO `items_tmp` VALUES (458, 'وحدة تكييف مركزي', 14);
INSERT INTO `items_tmp` VALUES (459, 'بطارية 1247 أمبير', 72);
INSERT INTO `items_tmp` VALUES (460, 'جهاز كنترول', 2);
INSERT INTO `items_tmp` VALUES (461, 'أمان 400 أمبير', 3);
INSERT INTO `items_tmp` VALUES (462, 'جهاز sennheiser SK100', 2);
INSERT INTO `items_tmp` VALUES (463, 'جهاز اوزمو موبايل OM170', 1);
INSERT INTO `items_tmp` VALUES (464, 'تراي بوت كاميرا', 1);
INSERT INTO `items_tmp` VALUES (465, 'جهاز لاب توب HP omen', 1);
INSERT INTO `items_tmp` VALUES (466, 'جهاز لاب توب DELL inspiron 15-7577', 1);
INSERT INTO `items_tmp` VALUES (467, 'طاولة جانبية 50*60', 2);
INSERT INTO `items_tmp` VALUES (468, 'شاشة SAMSONG 40 بوصة', 1);
INSERT INTO `items_tmp` VALUES (469, 'طاولة وسط بلاستيك', 1);
INSERT INTO `items_tmp` VALUES (470, 'شاشة HUNDAI 40 بوصة', 1);
INSERT INTO `items_tmp` VALUES (471, 'شاشة fujitsu', 1);
INSERT INTO `items_tmp` VALUES (472, 'جهاز كمبيوتر DELL 7010', 4);
INSERT INTO `items_tmp` VALUES (473, 'ماكنة تصوير RICOH ATICIO 2075', 1);
INSERT INTO `items_tmp` VALUES (474, 'مروحة سقف متنوع', 9);
INSERT INTO `items_tmp` VALUES (475, 'مقسم  Panaconic', 1);
INSERT INTO `items_tmp` VALUES (476, 'طاولة اجتماعات 110*240', 2);
INSERT INTO `items_tmp` VALUES (477, 'طاولة قص للخياطة 120*200', 3);
INSERT INTO `items_tmp` VALUES (478, 'طاولة 120*80', 39);
INSERT INTO `items_tmp` VALUES (479, 'طابعة Epson l 3151', 3);
INSERT INTO `items_tmp` VALUES (480, 'SWICH', 4);
INSERT INTO `items_tmp` VALUES (481, 'شاشة 32 بوصة samsong', 1);
INSERT INTO `items_tmp` VALUES (482, 'طابعة canon G1400', 1);
INSERT INTO `items_tmp` VALUES (483, 'خزانة شنل 2 درج', 2);
INSERT INTO `items_tmp` VALUES (484, 'سكنر Scanner level2 hp scanset', 3);
INSERT INTO `items_tmp` VALUES (485, 'كرسي موظف طبي مع مسند أسفل الظهر', 1);
INSERT INTO `items_tmp` VALUES (486, 'طاولة طالب 120*60*75', 20);
INSERT INTO `items_tmp` VALUES (487, 'خزانة 2ضلفة 80*60*200 جديدة', 1);
INSERT INTO `items_tmp` VALUES (488, 'طاولة وسط 60*60', 5);
INSERT INTO `items_tmp` VALUES (489, 'طاولة وسط مستديرة + 4 سكمبلة', 1);
INSERT INTO `items_tmp` VALUES (490, 'خزنة حديد 30*30', 1);
INSERT INTO `items_tmp` VALUES (491, 'طبلون تحكم 50*35', 7);
INSERT INTO `items_tmp` VALUES (492, 'ماكنة تصوير Ricoh mp2550', 1);
INSERT INTO `items_tmp` VALUES (493, 'طابعة HP 7500 A', 1);
INSERT INTO `items_tmp` VALUES (494, 'طابعة HP 8600', 1);
INSERT INTO `items_tmp` VALUES (495, 'طابعة HP 7000', 1);
INSERT INTO `items_tmp` VALUES (496, 'طاولة 140*40', 1);
INSERT INTO `items_tmp` VALUES (497, 'ماكنة تصوير SHarp 5620 N', 1);
INSERT INTO `items_tmp` VALUES (498, 'سبورة ذكية', 4);
INSERT INTO `items_tmp` VALUES (499, 'طبلون كهرباء 90*230', 2);
INSERT INTO `items_tmp` VALUES (500, 'بطارية 100 أمبير', 5);
INSERT INTO `items_tmp` VALUES (501, 'DNR-Hybrid', 2);
INSERT INTO `items_tmp` VALUES (502, 'قبان الكتروني', 1);
INSERT INTO `items_tmp` VALUES (503, 'طفاية حريق كبيرة بعجلات', 1);
INSERT INTO `items_tmp` VALUES (504, 'خزانة ادراج عدد 45*45*15', 1);
INSERT INTO `items_tmp` VALUES (505, 'رف حديد 7 طبقات', 2);
INSERT INTO `items_tmp` VALUES (506, 'طبلون 120*220', 1);
INSERT INTO `items_tmp` VALUES (507, 'شاشة 32 بوصة omega', 1);
INSERT INTO `items_tmp` VALUES (508, 'خزانة مكتبة ارفف خشب ابواب زجاج', 36);
INSERT INTO `items_tmp` VALUES (509, 'طاولة زان 160*100', 2);
INSERT INTO `items_tmp` VALUES (510, 'ماكنة تخريس ورق', 1);
INSERT INTO `items_tmp` VALUES (511, 'ماكنة تصوير RICOH 3260', 2);
INSERT INTO `items_tmp` VALUES (512, 'مضخة مياه 1 حصان', 1);
INSERT INTO `items_tmp` VALUES (513, 'مضخة مياه 1/2 حصان', 1);
INSERT INTO `items_tmp` VALUES (514, 'طابعة RICOH M171', 12);
INSERT INTO `items_tmp` VALUES (515, 'شاشة 32بوصة HYUNDAI', 1);
INSERT INTO `items_tmp` VALUES (516, 'طاولة حديد 60*60', 1);
INSERT INTO `items_tmp` VALUES (517, 'طاولة زان 70*190', 1);
INSERT INTO `items_tmp` VALUES (518, 'شاشة 32 بوصة JAC', 1);
INSERT INTO `items_tmp` VALUES (519, 'جهاز UPS 10 K SMART', 2);
INSERT INTO `items_tmp` VALUES (520, 'جهاز UPS 20 K Tescom', 1);
INSERT INTO `items_tmp` VALUES (521, 'طبلون كهرباء 125*120', 1);
INSERT INTO `items_tmp` VALUES (522, 'جهاز ضبط طبقات الصوت', 1);
INSERT INTO `items_tmp` VALUES (523, 'جهاز HYBRID', 4);
INSERT INTO `items_tmp` VALUES (524, 'جهاز HYBRID شريحة جوال', 1);
INSERT INTO `items_tmp` VALUES (525, 'كرت صوت Pringer', 3);
INSERT INTO `items_tmp` VALUES (526, 'جهاز حاسوب للبث الاذاعي', 1);
INSERT INTO `items_tmp` VALUES (527, 'جهاز كاسيت sony', 1);
INSERT INTO `items_tmp` VALUES (528, 'طاولة زان 70*270', 1);
INSERT INTO `items_tmp` VALUES (529, 'كرت صوت M-AUDIO', 1);
INSERT INTO `items_tmp` VALUES (530, 'طاولة دائرية 80 سم', 1);
INSERT INTO `items_tmp` VALUES (531, 'فرشة اسفنج', 4);
INSERT INTO `items_tmp` VALUES (532, 'سماعة اذاعة لا سلكي', 1);
INSERT INTO `items_tmp` VALUES (533, 'طبلون تحكم 80*80', 1);
INSERT INTO `items_tmp` VALUES (534, 'انتينة ارسال GTA', 4);
INSERT INTO `items_tmp` VALUES (535, 'موزع بث 4 مخارج SIPLETER', 1);
INSERT INTO `items_tmp` VALUES (536, 'كاميرا microsoft HD', 2);
INSERT INTO `items_tmp` VALUES (537, 'جهاز تسجيل خارجي', 2);
INSERT INTO `items_tmp` VALUES (538, 'جهاز تسجيل صوت خارجي زووم', 2);
INSERT INTO `items_tmp` VALUES (539, 'جهاز بث نوع  Elinos 5kw', 1);
INSERT INTO `items_tmp` VALUES (540, 'LED Screen Smart 4K', 2);
INSERT INTO `items_tmp` VALUES (541, 'طابعة samsong 4833 fd', 3);
INSERT INTO `items_tmp` VALUES (542, 'خزنة 20*20', 1);
INSERT INTO `items_tmp` VALUES (543, 'خزان مياه سعة 5000 لتر', 4);
INSERT INTO `items_tmp` VALUES (544, 'خزان مياه ستانلس 1000 لتر', 5);
INSERT INTO `items_tmp` VALUES (545, 'صيدلية اسعافات', 3);
INSERT INTO `items_tmp` VALUES (546, 'ماكنة تصوير Rico 6000', 1);
INSERT INTO `items_tmp` VALUES (547, 'شاشة كونكا 50 بوصة', 1);
INSERT INTO `items_tmp` VALUES (548, 'طاولة حاسوب 90*40', 16);
INSERT INTO `items_tmp` VALUES (549, 'شاشة MULLER 55 بوصة', 1);
INSERT INTO `items_tmp` VALUES (550, 'خزانة ارفف مكتبة', 32);
INSERT INTO `items_tmp` VALUES (551, 'ماكنة قص العشب', 1);
INSERT INTO `items_tmp` VALUES (552, 'مضخة مياه 5 حصان', 1);
INSERT INTO `items_tmp` VALUES (553, 'كرسي مختبر حاسوب', 75);
INSERT INTO `items_tmp` VALUES (554, 'كنبة جلد مجوز', 1);
INSERT INTO `items_tmp` VALUES (555, 'مقص ورق كبير', 1);
INSERT INTO `items_tmp` VALUES (556, 'طابعة samsong 1765', 1);
INSERT INTO `items_tmp` VALUES (557, 'مكتب حديد 110*60', 3);
INSERT INTO `items_tmp` VALUES (558, 'طاولة مستديرة', 2);
INSERT INTO `items_tmp` VALUES (559, 'طبلون كهرباء 140*90', 1);
INSERT INTO `items_tmp` VALUES (560, 'طاولة 120*120', 10);
INSERT INTO `items_tmp` VALUES (561, 'مكوى بخار 60لتر حجم كبير', 1);
INSERT INTO `items_tmp` VALUES (562, 'ماكنة خياطة LADA', 1);
INSERT INTO `items_tmp` VALUES (563, 'مروحة سقف تورنادو العربي', 11);
INSERT INTO `items_tmp` VALUES (564, 'طابعة CANON COLOR INKJET PRINTER', 2);
INSERT INTO `items_tmp` VALUES (565, 'مكتب خشب مضلع 1.6*1.2م', 1);
INSERT INTO `items_tmp` VALUES (566, 'ماكنة عد النقود', 1);
INSERT INTO `items_tmp` VALUES (567, 'ماكنة تصوير RICOH Aficio MP4002 SP', 1);
INSERT INTO `items_tmp` VALUES (568, 'شاشة MAX VISION \'\' 17', 1);
INSERT INTO `items_tmp` VALUES (569, 'خزنة حديد ارتفاع 56سم ضد الحريق', 1);
INSERT INTO `items_tmp` VALUES (570, 'جهاز لاب توب MSI INTEL cor I7', 9);
INSERT INTO `items_tmp` VALUES (571, 'قارئ ذاكرة كاميرا نوع SANDISK', 1);
INSERT INTO `items_tmp` VALUES (572, 'سخان شاف', 2);
INSERT INTO `items_tmp` VALUES (573, 'جك شاشة ثابت', 1);
INSERT INTO `items_tmp` VALUES (574, 'ماكنة تصوير RICOH 201', 12);
INSERT INTO `items_tmp` VALUES (575, 'شاشة سمارت ليد 75 بوصة', 1);
INSERT INTO `items_tmp` VALUES (576, 'سكنر EPSON 410', 1);
INSERT INTO `items_tmp` VALUES (577, 'شاشة FLIP MONITOR24 FULL HD', 2);
INSERT INTO `items_tmp` VALUES (578, 'هارد خارجي 4 تيرا', 3);
INSERT INTO `items_tmp` VALUES (579, 'دعاسة مكتب', 22);
INSERT INTO `items_tmp` VALUES (580, 'طابعة Hp laserjet pro M 404 dn', 3);
INSERT INTO `items_tmp` VALUES (581, 'شاشة HP24\" with HDMI', 1);
INSERT INTO `items_tmp` VALUES (582, 'جهاز لاب توب MSI Katana COR i5 GF66 11TH', 2);
INSERT INTO `items_tmp` VALUES (583, 'شاشة ذكية', 1);
INSERT INTO `items_tmp` VALUES (584, 'طابعة RICOH MP2550', 1);
INSERT INTO `items_tmp` VALUES (585, 'شاشة HP بوصة W 25', 1);
INSERT INTO `items_tmp` VALUES (586, 'سكنر AVISION AV', 8);
INSERT INTO `items_tmp` VALUES (587, 'لاب توب Asos cor i7', 1);
INSERT INTO `items_tmp` VALUES (588, 'جوال SAMSUNG Galaxy S22 Ultra', 2);
INSERT INTO `items_tmp` VALUES (589, 'باور بانك ROMOSS 20000MAH', 1);
INSERT INTO `items_tmp` VALUES (590, 'شاشة Monitor 50 Linch Muller UK', 1);
INSERT INTO `items_tmp` VALUES (591, 'جهاز حاسوب PC مواصفات عالية', 1);
INSERT INTO `items_tmp` VALUES (592, 'شاشة FUJITSU  19', 1);
INSERT INTO `items_tmp` VALUES (593, 'خلاطة باطون', 1);
INSERT INTO `items_tmp` VALUES (594, 'قاعدة لاب توب بمروحة', 7);
INSERT INTO `items_tmp` VALUES (595, 'حقيبة لاب توب', 10);
INSERT INTO `items_tmp` VALUES (596, 'شاشة 24\" FUJITSU', 4);
INSERT INTO `items_tmp` VALUES (597, 'بطارية 75 أمبير', 1);
INSERT INTO `items_tmp` VALUES (598, 'شاشة LG 23 بوصة', 1);
INSERT INTO `items_tmp` VALUES (599, 'شاشة HP 27\" FHD', 4);
INSERT INTO `items_tmp` VALUES (600, 'آله حاسبة برول', 1);
INSERT INTO `items_tmp` VALUES (601, 'كرسي انتظار ثلاثي ستانلس', 3);
INSERT INTO `items_tmp` VALUES (602, 'طاولة إجتماعات 200*100', 1);
INSERT INTO `items_tmp` VALUES (603, 'طاولة بيضاوية زجاج 110*60', 1);
INSERT INTO `items_tmp` VALUES (604, 'طقم كنب جلد أسود صناعة محلية', 1);
INSERT INTO `items_tmp` VALUES (605, 'مقدح براغي 13 ملم بوش ألماني', 3);
INSERT INTO `items_tmp` VALUES (606, 'دسك نوع بوش 2200 -9 انش', 2);
INSERT INTO `items_tmp` VALUES (607, 'خزانة 2 ضلفة خشب ساندويش', 3);
INSERT INTO `items_tmp` VALUES (608, 'محبرة ختم', 14);
INSERT INTO `items_tmp` VALUES (609, 'خزنة حديد 96*52*48', 1);
INSERT INTO `items_tmp` VALUES (610, 'خزنة حديد 60*35', 1);
INSERT INTO `items_tmp` VALUES (611, 'شاشة Monitor 50 Inch Muller SNY', 2);
INSERT INTO `items_tmp` VALUES (612, 'خزنة حديد 39*40', 1);
INSERT INTO `items_tmp` VALUES (613, 'ماكنة تصوير  Richo Aficio 2051', 1);
INSERT INTO `items_tmp` VALUES (614, 'دولاب صاج ضلفتين مع 4 ارفف', 1);
INSERT INTO `items_tmp` VALUES (615, 'وحدة ادراج معدنية للملفات شنل 4 ادراج', 2);
INSERT INTO `items_tmp` VALUES (616, 'ماكينة قطع ورق A4', 1);
INSERT INTO `items_tmp` VALUES (617, 'شاشة  hp LED MONITOR 24 INCH', 2);
INSERT INTO `items_tmp` VALUES (618, 'لاب توب msi GL65', 2);
INSERT INTO `items_tmp` VALUES (619, 'هارد ديسك داخلي 4 تيرا', 1);
INSERT INTO `items_tmp` VALUES (620, 'لابتوب HP 250 G9 I3 \"12\" RAM 8G M.2 256 SSD', 11);
INSERT INTO `items_tmp` VALUES (621, 'خزانية مكتبية بدون ابواب 200*80*40', 2);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (2, '2022_08_20_171555_create_employees_table', 1);
INSERT INTO `migrations` VALUES (3, '2022_08_21_053106_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2022_08_21_053111_create_permission_group_table', 1);
INSERT INTO `migrations` VALUES (5, '2022_08_21_053112_create_permissions_table', 1);
INSERT INTO `migrations` VALUES (6, '2022_08_21_053113_create_roles_table', 1);
INSERT INTO `migrations` VALUES (7, '2022_08_21_053119_create_role_has_permissions_table', 1);
INSERT INTO `migrations` VALUES (8, '2022_08_21_053120_create_model_has_permissions_table', 1);
INSERT INTO `migrations` VALUES (9, '2022_08_21_053121_create_model_has_roles_table', 1);
INSERT INTO `migrations` VALUES (10, '2022_08_21_053122_create_oauth_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (11, '2022_08_21_053123_create_oauth_auth_codes_table', 1);
INSERT INTO `migrations` VALUES (12, '2022_08_21_053124_create_oauth_clients_table', 1);
INSERT INTO `migrations` VALUES (13, '2022_08_21_053125_create_oauth_personal_access_clients_table', 1);
INSERT INTO `migrations` VALUES (14, '2022_08_21_053126_create_oauth_refresh_tokens_table', 1);
INSERT INTO `migrations` VALUES (15, '2022_08_21_053127_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (16, '2022_08_21_053136_create_users_table', 1);
INSERT INTO `migrations` VALUES (17, '2022_08_21_053206_add_foreign_keys_to_model_has_permissions_table', 1);
INSERT INTO `migrations` VALUES (18, '2022_08_21_053206_add_foreign_keys_to_model_has_roles_table', 1);
INSERT INTO `migrations` VALUES (19, '2022_08_21_053206_add_foreign_keys_to_role_has_permissions_table', 1);
INSERT INTO `migrations` VALUES (20, '2023_03_12_094414_create_transactions_table', 1);
INSERT INTO `migrations` VALUES (21, '2023_03_13_104856_create_stores_table', 1);
INSERT INTO `migrations` VALUES (22, '2023_03_13_104908_create_vendors_table', 1);
INSERT INTO `migrations` VALUES (23, '2023_03_13_104919_create_categories_table', 1);
INSERT INTO `migrations` VALUES (24, '2023_03_13_104932_create_items_table', 1);
INSERT INTO `migrations` VALUES (25, '2023_03_13_105040_create_batches_table', 1);
INSERT INTO `migrations` VALUES (26, '2023_03_13_105045_create_units_table', 1);
INSERT INTO `migrations` VALUES (27, '2023_03_13_105055_create_testaments_table', 1);
INSERT INTO `migrations` VALUES (28, '2023_03_13_110749_create_item_vendors_table', 1);
INSERT INTO `migrations` VALUES (29, '2023_03_15_153632_create_relations', 1);
INSERT INTO `migrations` VALUES (30, '2023_04_02_045811_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (31, '2023_04_06_183554_create_edaras_table', 2);
INSERT INTO `migrations` VALUES (32, '2023_04_06_183627_create_departments_table', 2);
INSERT INTO `migrations` VALUES (33, '2023_04_06_183651_create_daeras_table', 2);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 4);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 5);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifications_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (1, 'تم إضافة لمبات نيون 120 سم عدد: 40 على ذمتك', 'https://inventory.test/admin/dashboard', 1, 1, '2023-04-07 14:30:24', '2023-04-30 09:22:49');
INSERT INTO `notifications` VALUES (3, 'تم إضافة دفايه عدد: 3 على ذمتك', 'https://inventory.test/admin/dashboard', 1, 1, '2023-04-07 14:39:20', '2023-04-30 09:22:49');
INSERT INTO `notifications` VALUES (7, 'تم نقل دفايه عدد: 3 من ذمتك', 'https://inventory.test/admin/dashboard', 1, 1, '2023-04-30 09:03:48', '2023-04-30 09:22:49');
INSERT INTO `notifications` VALUES (8, 'تم إضافة دفايه عدد: 3 على ذمتك', 'https://inventory.test/admin/dashboard', 1, 1, '2023-04-30 09:03:48', '2023-04-30 09:22:49');
INSERT INTO `notifications` VALUES (9, 'تم نقل دفايه عدد: 3 من ذمتك', 'https://inventory.test/admin/dashboard', 1, 1, '2023-04-30 09:05:09', '2023-04-30 09:22:49');
INSERT INTO `notifications` VALUES (10, 'تم إضافة دفايه عدد: 3 على ذمتك', 'https://inventory.test/admin/dashboard', 1, 1, '2023-04-30 09:05:09', '2023-04-30 09:22:49');
INSERT INTO `notifications` VALUES (11, 'تم نقل دفايه عدد: 3 من ذمتك', 'https://inventory.test/admin/dashboard', 1, 1, '2023-04-30 09:10:35', '2023-04-30 09:22:49');
INSERT INTO `notifications` VALUES (13, 'تم نقل لمبات نيون 120 سم عدد: 40 من ذمتك', 'https://inventory.test/admin/dashboard', 1, 1, '2023-04-30 09:22:04', '2023-04-30 09:22:49');

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_auth_codes_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permission_group
-- ----------------------------
DROP TABLE IF EXISTS `permission_group`;
CREATE TABLE `permission_group`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_group
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `request_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'get',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint NOT NULL,
  `sort` int NOT NULL DEFAULT 1,
  `show_in_menu` tinyint NOT NULL DEFAULT 1,
  `has_link` tinyint NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 1, 'get', '', '', '', 'مجموعات المستخدمين', 'admin.roles.index', NULL, 'admin', 'icon-briefcase', 0, 1, 1, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (2, 1, 'get', 'roles', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'getIndex', 'المجموعات', 'admin.roles.view', '', 'admin', 'icon-briefcase', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (3, 1, 'get', 'roles/list', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'getList', 'عرض المجموعات', 'admin.roles.list', '', 'admin', 'icon-briefcase', 1, 2, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (4, 1, 'get', 'roles/add', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'getAdd', 'إضافة مجموعة', 'admin.roles.add', '', 'admin', 'icon-briefcase', 1, 3, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (5, 1, 'post', 'roles/add', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'postAdd', 'إضافة مجموعة', 'admin.roles.post.add', '', 'admin', 'icon-briefcase', 1, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (6, 1, 'get', 'roles/edit/{id}', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'getEdit', 'تعديل مجموعة', 'admin.roles.edit', '', 'admin', 'icon-briefcase', 1, 4, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (7, 1, 'post', 'roles/edit/{id}', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'postEdit', 'تعديل مجموعة', 'admin.roles.post.edit', '', 'admin', 'icon-briefcase', 1, 3, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (8, 1, 'get', 'roles/delete/{id}', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'getDelete', 'حذف مجموعة', 'admin.roles.delete', '', 'admin', 'icon-briefcase', 1, 5, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (9, 1, 'post', 'roles/status', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'postStatus', 'تعديل حالة مجموعة', 'admin.roles.status', '', 'admin', 'icon-briefcase', 1, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (10, 1, 'get', 'roles/permissions/{id}', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'getPermissions', 'تعديل صلاحيات المجموعات', 'admin.roles.permissions', '', 'admin', 'icon-briefcase', 1, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (11, 1, 'post', 'roles/permissions/{id}', 'App\\Http\\Controllers\\Admin\\RolesController::class', 'postPermissions', 'تعديل صلاحيات المجموعات', 'admin.roles.post.permissions', '', 'admin', 'icon-briefcase', 1, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (12, 1, 'get', '', '', '', 'المستخدمون', 'admin.users.view', '', 'admin', 'icon-briefcase', 0, 2, 1, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (13, 1, 'get', 'users', 'App\\Http\\Controllers\\Admin\\UsersController::class', 'getIndex', 'المستخدمون', 'admin.users.view', '', 'admin', 'icon-briefcase', 12, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (14, 1, 'get', 'users/list', 'App\\Http\\Controllers\\Admin\\UsersController::class', 'getList', 'عرض المستخدمين', 'admin.users.list', '', 'admin', 'icon-briefcase', 12, 2, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (15, 1, 'get', 'users/add', 'App\\Http\\Controllers\\Admin\\UsersController::class', 'getAdd', 'إضافة مستخدم', 'admin.users.add', '', 'admin', 'icon-briefcase', 12, 3, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (16, 1, 'post', 'users/add', 'App\\Http\\Controllers\\Admin\\UsersController::class', 'postAdd', 'إضافة مستخدم', 'admin.users.store', '', 'admin', 'icon-briefcase', 12, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (17, 1, 'get', 'users/edit/{id}', 'App\\Http\\Controllers\\Admin\\UsersController::class', 'getEdit', 'تعديل مستخدم', 'admin.users.edit', NULL, 'admin', 'icon-briefcase', 12, 1, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (18, 1, 'post', 'users/edit/{id}', 'App\\Http\\Controllers\\Admin\\UsersController::class', 'postEdit', 'تعديل مستخدم', 'admin.users.update', '', 'admin', 'icon-briefcase', 1, 3, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (19, 1, 'get', 'users/delete/{id}', 'App\\Http\\Controllers\\Admin\\UsersController::class', 'getDelete', 'حذف مستخدم', 'admin.users.delete', '', 'admin', 'icon-briefcase', 1, 3, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (20, 1, 'get', '', '', '', 'التصنيفات', 'admin.categories.view', NULL, 'admin', 'icon-briefcase', 0, 1, 1, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (21, 1, 'get', 'categories', 'App\\Http\\Controllers\\Admin\\CategoriesController::class', 'getIndex', 'التصنيفات', 'admin.categories.view', '', 'admin', 'icon-briefcase', 20, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (22, 1, 'get', 'categories/list', 'App\\Http\\Controllers\\Admin\\CategoriesController::class', 'getList', 'عرض التصنيفات', 'admin.categories.list', '', 'admin', 'icon-briefcase', 20, 2, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (23, 1, 'get', 'categories/add', 'App\\Http\\Controllers\\Admin\\CategoriesController::class', 'getAdd', 'إضافة تصنيف', 'admin.categories.add', '', 'admin', 'icon-briefcase', 20, 3, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (24, 1, 'post', 'categories/add', 'App\\Http\\Controllers\\Admin\\CategoriesController::class', 'postAdd', 'إضافة تصنيف', 'admin.categories.post.add', '', 'admin', 'icon-briefcase', 20, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (25, 1, 'get', 'categories/edit/{id}', 'App\\Http\\Controllers\\Admin\\CategoriesController::class', 'getEdit', 'تعديل تصنيف', 'admin.categories.edit', '', 'admin', 'icon-briefcase', 20, 4, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (26, 1, 'post', 'categories/edit/{id}', 'App\\Http\\Controllers\\Admin\\CategoriesController::class', 'postEdit', 'تعديل تصنيف', 'admin.categories.post.edit', '', 'admin', 'icon-briefcase', 20, 3, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (27, 1, 'get', 'categories/delete/{id}', 'App\\Http\\Controllers\\Admin\\CategoriesController::class', 'getDelete', 'حذف تصنيف', 'admin.categories.delete', '', 'admin', 'icon-briefcase', 20, 5, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (28, 1, 'get', '', '', '', 'الأصناف', 'admin.items.index', NULL, 'admin', 'icon-briefcase', 0, 1, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (29, 1, 'get', 'items', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getIndex', 'الأصناف', 'admin.items.view', '', 'admin', 'icon-briefcase', 28, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (30, 1, 'get', 'items/list', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getList', 'عرض الأصناف', 'admin.items.list', '', 'admin', 'icon-briefcase', 28, 2, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (31, 1, 'get', 'items/add', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getAdd', 'إضافة صنف', 'admin.items.add', '', 'admin', 'icon-briefcase', 28, 3, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (32, 1, 'post', 'items/add', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'postAdd', 'إضافة صنف', 'admin.items.post.add', '', 'admin', 'icon-briefcase', 28, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (33, 1, 'get', 'items/edit/{id}', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getEdit', 'تعديل صنف', 'admin.items.edit', '', 'admin', 'icon-briefcase', 28, 4, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (34, 1, 'post', 'items/edit/{id}', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'postEdit', 'تعديل صنف', 'admin.items.post.edit', '', 'admin', 'icon-briefcase', 28, 3, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (35, 1, 'get', 'items/delete/{id}', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getDelete', 'حذف صنف', 'admin.items.delete', '', 'admin', 'icon-briefcase', 28, 5, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (44, 1, 'get', '', '', '', 'الأصناف', 'admin.items.index', NULL, 'admin', 'icon-briefcase', 0, 1, 1, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (45, 1, 'get', 'items', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getIndex', 'الأصناف', 'admin.items.view', '', 'admin', 'icon-briefcase', 44, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (46, 1, 'get', 'items/list', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getList', 'عرض الأصناف', 'admin.items.list', '', 'admin', 'icon-briefcase', 44, 2, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (47, 1, 'get', 'items/add', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getAdd', 'إضافة صنف', 'admin.items.add', '', 'admin', 'icon-briefcase', 44, 3, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (48, 1, 'post', 'items/add', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'postAdd', 'إضافة صنف', 'admin.items.post.add', '', 'admin', 'icon-briefcase', 44, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (49, 1, 'get', 'items/add-items', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getAddItems', 'إضافة إرسالية', 'admin.items.addItems', '', 'admin', 'icon-briefcase', 44, 3, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (50, 1, 'post', 'items/add-items', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'postAddItems', 'إضافة إرسالية', 'admin.items.post.addItems', '', 'admin', 'icon-briefcase', 44, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (51, 1, 'get', 'items/edit/{id}', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getEdit', 'تعديل صنف', 'admin.items.edit', '', 'admin', 'icon-briefcase', 44, 4, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (52, 1, 'post', 'items/edit/{id}', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'postEdit', 'تعديل صنف', 'admin.items.post.edit', '', 'admin', 'icon-briefcase', 44, 3, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (53, 1, 'get', 'items/delete/{id}', 'App\\Http\\Controllers\\Admin\\ItemsController::class', 'getDelete', 'حذف صنف', 'admin.items.delete', '', 'admin', 'icon-briefcase', 44, 5, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (54, 1, 'get', '', '', '', 'العُهد', 'admin.testaments.index', NULL, 'admin', 'icon-briefcase', 0, 1, 1, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (55, 1, 'get', 'testaments', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'getIndex', 'العُهد', 'admin.testaments.view', '', 'admin', 'icon-briefcase', 54, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (56, 1, 'get', 'testaments/list', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'getList', 'عرض العُهد', 'admin.testaments.list', '', 'admin', 'icon-briefcase', 54, 2, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (57, 1, 'get', 'testaments/add', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'getAdd', 'تحويل عُهدة من مخزن لشخص', 'admin.testaments.add', '', 'admin', 'icon-briefcase', 54, 3, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (58, 1, 'post', 'testaments/add', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'postAdd', 'تحويل عُهدة من مخزن لشخص', 'admin.testaments.post.add', '', 'admin', 'icon-briefcase', 54, 3, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (59, 1, 'get', 'testaments/edit/{id}', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'getEdit', 'تعديل عُهدة', 'admin.testaments.edit', '', 'admin', 'icon-briefcase', 54, 4, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (60, 1, 'post', 'testaments/edit/{id}', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'postEdit', 'تعديل عُهدة', 'admin.testaments.post.edit', '', 'admin', 'icon-briefcase', 54, 3, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (61, 1, 'get', 'testaments/delete/{id}', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'getDelete', 'حذف عُهدة', 'admin.testaments.delete', '', 'admin', 'icon-briefcase', 54, 5, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (62, 1, 'get', 'testaments/convert/person-to-person', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'getPersonToPerson', 'تحويل عُهدة من شخص لشخص', 'admin.testaments.convert.person_to_person', '', 'admin', 'icon-briefcase', 54, 6, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (63, 1, 'post', 'testaments/convert/person-to-person', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'postPersonToPerson', 'تحويل عُهدة من شخص لشخص', 'admin.testaments.post.convert.person_to_person', '', 'admin', 'icon-briefcase', 54, 6, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (64, 1, 'get', 'testaments/convert/person-to-store', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'getPersonToStore', 'تحويل عُهدة من شخص لمخزن', 'admin.testaments.convert.person_to_store', '', 'admin', 'icon-briefcase', 54, 7, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (65, 1, 'post', 'testaments/convert/person-to-store', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'postPersonToStore', 'تحويل عُهدة من شخص لمخزن', 'admin.testaments.post.convert.person_to_store', '', 'admin', 'icon-briefcase', 54, 7, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (66, 1, 'get', 'testaments/convert/store-to-store', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'getStoreToStore', 'تحويل عُهدة من مخرن لمخزن', 'admin.testaments.convert.store_to_store', '', 'admin', 'icon-briefcase', 54, 8, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (67, 1, 'post', 'testaments/convert/store-to-store', 'App\\Http\\Controllers\\Admin\\TestamentsController::class', 'postStoreToStore', 'تحويل عُهدة من مخرن لمخزن', 'admin.testaments.post.convert.store_to_store', '', 'admin', 'icon-briefcase', 54, 8, 0, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (68, 1, 'get', '', '', '', 'السجلات', 'admin.transactions.index', NULL, 'admin', 'icon-briefcase', 0, 1, 1, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (69, 1, 'get', 'transactions', 'App\\Http\\Controllers\\Admin\\TransactionsController::class', 'getIndex', 'سجلات العُهد', 'admin.transactions.view', '', 'admin', 'icon-briefcase', 68, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (70, 1, 'get', 'transactions/list', 'App\\Http\\Controllers\\Admin\\TransactionsController::class', 'getList', 'سجل الحركات', 'admin.transactions.list', '', 'admin', 'icon-briefcase', 68, 2, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (71, 1, 'get', '', '', '', 'التقارير', 'admin.reports.index', NULL, 'admin', 'icon-briefcase', 0, 1, 1, 0, NULL, NULL);
INSERT INTO `permissions` VALUES (72, 1, 'get', 'store-employee-testaments-report', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'store_employee_testaments_report', 'كشف عهدة الموظف أو المخزن', 'admin.reports.store_employee_testaments_report', '', 'admin', 'icon-briefcase', 71, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (73, 1, 'get', 'store-employee-testaments-report/export-pdf', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'export_store_employee_testaments_report', 'تصدير التقرير', 'admin.reports.export_store_employee_testaments_report', '', 'admin', 'icon-briefcase', 71, 1, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (74, 1, 'get', 'items-transitions-report', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'items_transitions_report', 'كشف حركات الصنف', 'admin.reports.items_transitions_report', '', 'admin', 'icon-briefcase', 71, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (75, 1, 'get', 'items-transitions-report/export-pdf', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'export_items_transitions_report', 'تصدير التقرير', 'admin.reports.export_items_transitions_report', '', 'admin', 'icon-briefcase', 71, 1, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (76, 1, 'get', 'total-testament-report', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'total_testament_report', 'كشف العُهد الإجمالي', 'admin.reports.total_testament_report', '', 'admin', 'icon-briefcase', 71, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (77, 1, 'get', 'total-testament-report/export-pdf', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'export_total_testament_report', 'تصدير التقرير', 'admin.reports.export_total_testament_report', '', 'admin', 'icon-briefcase', 71, 1, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (78, 1, 'get', 'detailed-testament-report', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'detailed_testament_report', 'كشف العُهد المفصل', 'admin.reports.detailed_testament_report', '', 'admin', 'icon-briefcase', 71, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (79, 1, 'get', 'detailed-testament-report/export-pdf', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'export_detailed_testament_report', 'تصدير التقرير', 'admin.reports.export_detailed_testament_report', '', 'admin', 'icon-briefcase', 71, 1, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (80, 1, 'get', 'separate-item-balances-report', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'separate_item_balances_report', 'كشف أرصدة الصنف المنفصل', 'admin.reports.separate_item_balances_report', '', 'admin', 'icon-briefcase', 71, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (81, 1, 'get', 'separate-item-balances-report/export-pdf', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'export_separate_item_balances_report', 'تصدير التقرير', 'admin.reports.export_separate_item_balances_report', '', 'admin', 'icon-briefcase', 71, 1, 0, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (82, 1, 'get', 'detailed-employee-testament-transitions', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'detailed_employee_testament_transitions', 'حركات عهدة الموظف التفصيلي', 'admin.reports.detailed_employee_testament_transitions', '', 'admin', 'icon-briefcase', 71, 1, 1, 1, NULL, NULL);
INSERT INTO `permissions` VALUES (83, 1, 'get', 'detailed-employee-testament-transitions/export-pdf', 'App\\Http\\Controllers\\Admin\\ReportsController::class', 'export_detailed_employee_testament_transitions', 'تصدير التقرير', 'admin.reports.export_detailed_employee_testament_transitions', '', 'admin', 'icon-briefcase', 71, 1, 0, 1, NULL, NULL);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (11, 1);
INSERT INTO `role_has_permissions` VALUES (12, 1);
INSERT INTO `role_has_permissions` VALUES (13, 1);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (15, 1);
INSERT INTO `role_has_permissions` VALUES (16, 1);
INSERT INTO `role_has_permissions` VALUES (17, 1);
INSERT INTO `role_has_permissions` VALUES (18, 1);
INSERT INTO `role_has_permissions` VALUES (19, 1);
INSERT INTO `role_has_permissions` VALUES (20, 1);
INSERT INTO `role_has_permissions` VALUES (21, 1);
INSERT INTO `role_has_permissions` VALUES (22, 1);
INSERT INTO `role_has_permissions` VALUES (23, 1);
INSERT INTO `role_has_permissions` VALUES (24, 1);
INSERT INTO `role_has_permissions` VALUES (25, 1);
INSERT INTO `role_has_permissions` VALUES (26, 1);
INSERT INTO `role_has_permissions` VALUES (27, 1);
INSERT INTO `role_has_permissions` VALUES (28, 1);
INSERT INTO `role_has_permissions` VALUES (29, 1);
INSERT INTO `role_has_permissions` VALUES (30, 1);
INSERT INTO `role_has_permissions` VALUES (31, 1);
INSERT INTO `role_has_permissions` VALUES (32, 1);
INSERT INTO `role_has_permissions` VALUES (33, 1);
INSERT INTO `role_has_permissions` VALUES (34, 1);
INSERT INTO `role_has_permissions` VALUES (35, 1);
INSERT INTO `role_has_permissions` VALUES (44, 1);
INSERT INTO `role_has_permissions` VALUES (45, 1);
INSERT INTO `role_has_permissions` VALUES (46, 1);
INSERT INTO `role_has_permissions` VALUES (47, 1);
INSERT INTO `role_has_permissions` VALUES (48, 1);
INSERT INTO `role_has_permissions` VALUES (49, 1);
INSERT INTO `role_has_permissions` VALUES (50, 1);
INSERT INTO `role_has_permissions` VALUES (51, 1);
INSERT INTO `role_has_permissions` VALUES (52, 1);
INSERT INTO `role_has_permissions` VALUES (53, 1);
INSERT INTO `role_has_permissions` VALUES (54, 1);
INSERT INTO `role_has_permissions` VALUES (55, 1);
INSERT INTO `role_has_permissions` VALUES (56, 1);
INSERT INTO `role_has_permissions` VALUES (57, 1);
INSERT INTO `role_has_permissions` VALUES (58, 1);
INSERT INTO `role_has_permissions` VALUES (59, 1);
INSERT INTO `role_has_permissions` VALUES (60, 1);
INSERT INTO `role_has_permissions` VALUES (61, 1);
INSERT INTO `role_has_permissions` VALUES (62, 1);
INSERT INTO `role_has_permissions` VALUES (63, 1);
INSERT INTO `role_has_permissions` VALUES (64, 1);
INSERT INTO `role_has_permissions` VALUES (65, 1);
INSERT INTO `role_has_permissions` VALUES (66, 1);
INSERT INTO `role_has_permissions` VALUES (67, 1);
INSERT INTO `role_has_permissions` VALUES (68, 1);
INSERT INTO `role_has_permissions` VALUES (69, 1);
INSERT INTO `role_has_permissions` VALUES (70, 1);
INSERT INTO `role_has_permissions` VALUES (71, 1);
INSERT INTO `role_has_permissions` VALUES (72, 1);
INSERT INTO `role_has_permissions` VALUES (73, 1);
INSERT INTO `role_has_permissions` VALUES (74, 1);
INSERT INTO `role_has_permissions` VALUES (75, 1);
INSERT INTO `role_has_permissions` VALUES (76, 1);
INSERT INTO `role_has_permissions` VALUES (77, 1);
INSERT INTO `role_has_permissions` VALUES (78, 1);
INSERT INTO `role_has_permissions` VALUES (79, 1);
INSERT INTO `role_has_permissions` VALUES (80, 1);
INSERT INTO `role_has_permissions` VALUES (81, 1);
INSERT INTO `role_has_permissions` VALUES (82, 1);
INSERT INTO `role_has_permissions` VALUES (83, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin', 'admin', 1, '2020-08-30 10:16:44', '2020-08-30 10:16:44');
INSERT INTO `roles` VALUES (2, 'Employee', 'admin', 1, '2020-08-30 10:16:44', '2020-08-30 10:16:44');

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES (1, 'مخزن الرئيسي', '100', NULL, NULL);
INSERT INTO `stores` VALUES (2, 'مخزن التكهين', '200', NULL, NULL);

-- ----------------------------
-- Table structure for testaments
-- ----------------------------
DROP TABLE IF EXISTS `testaments`;
CREATE TABLE `testaments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `testament_status` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `return_testament_date` date NULL DEFAULT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `unit_id` bigint UNSIGNED NULL DEFAULT NULL,
  `store_id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `testaments_batch_id_foreign`(`batch_id` ASC) USING BTREE,
  INDEX `testaments_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `testaments_item_id_foreign`(`item_id` ASC) USING BTREE,
  INDEX `testaments_unit_id_foreign`(`unit_id` ASC) USING BTREE,
  INDEX `testaments_store_id_foreign`(`store_id` ASC) USING BTREE,
  CONSTRAINT `testaments_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `testaments_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `testaments_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `testaments_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `testaments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testaments
-- ----------------------------
INSERT INTO `testaments` VALUES (6, '3', '1', NULL, NULL, 1244, 1, 1, 1, NULL, '2023-04-07 09:14:57', '2023-04-30 09:10:35');
INSERT INTO `testaments` VALUES (8, '40', '1', NULL, NULL, 1245, 5, 1, 1, NULL, '2023-04-07 14:30:23', '2023-04-30 09:22:04');
INSERT INTO `testaments` VALUES (9, '1', '1', NULL, NULL, 1243, 5, 1, 1, NULL, '2023-04-07 14:44:35', '2023-04-30 07:24:03');
INSERT INTO `testaments` VALUES (10, '39', '1', NULL, NULL, 1245, 1, 1, 1, NULL, '2023-04-30 06:24:50', '2023-04-30 06:24:50');

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('1','2','3','4') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `testament_id` bigint UNSIGNED NULL DEFAULT NULL,
  `item_id` bigint UNSIGNED NULL DEFAULT NULL,
  `new_user` bigint UNSIGNED NULL DEFAULT NULL,
  `old_user` bigint UNSIGNED NULL DEFAULT NULL,
  `new_store` bigint UNSIGNED NULL DEFAULT NULL,
  `old_store` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transactions_new_user_foreign`(`new_user` ASC) USING BTREE,
  INDEX `transactions_old_user_foreign`(`old_user` ASC) USING BTREE,
  INDEX `transactions_old_store_foreign`(`old_store` ASC) USING BTREE,
  INDEX `transactions_new_store_foreign`(`new_store` ASC) USING BTREE,
  INDEX `transactions_item_id_foreign`(`item_id` ASC) USING BTREE,
  INDEX `transactions_testament_id_foreign`(`testament_id` ASC) USING BTREE,
  CONSTRAINT `transactions_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_new_store_foreign` FOREIGN KEY (`new_store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_new_user_foreign` FOREIGN KEY (`new_user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_old_store_foreign` FOREIGN KEY (`old_store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_old_user_foreign` FOREIGN KEY (`old_user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_testament_id_foreign` FOREIGN KEY (`testament_id`) REFERENCES `testaments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transactions
-- ----------------------------
INSERT INTO `transactions` VALUES (6, '1', 'تم إضافة دفايه عدد: 2 على الموظف مازن اعبيد النجار', NULL, 1244, NULL, NULL, NULL, 1, '2023-04-07 09:14:57', '2023-04-07 09:14:57');
INSERT INTO `transactions` VALUES (7, '1', 'تم إضافة دباسة كبيرة عدد: 1 على الموظف مازن اعبيد النجار', NULL, 1243, NULL, NULL, NULL, 1, '2023-04-07 13:16:23', '2023-04-07 13:16:23');
INSERT INTO `transactions` VALUES (8, '1', 'تم إضافة لمبات نيون 120 سم عدد: 40 على الموظف Admin', NULL, 1245, 1, NULL, NULL, 1, '2023-04-07 14:30:24', '2023-04-07 14:30:24');
INSERT INTO `transactions` VALUES (9, '2', 'تم تحويل دفايه عدد: 3 من الموظف Admin إلى الموظف مازن اعبيد النجار في الموافق: 2023-04-07 14:39:20', NULL, 1244, 1, NULL, NULL, NULL, '2023-04-07 14:39:20', '2023-04-07 14:39:20');
INSERT INTO `transactions` VALUES (10, '3', 'تم إرجاع دباسة كبيرة عدد: 1 إلى مخزن الرئيسي', NULL, 1243, NULL, NULL, 1, NULL, '2023-04-07 14:40:52', '2023-04-07 14:40:52');
INSERT INTO `transactions` VALUES (11, '1', 'تم إضافة دباسة كبيرة عدد: 1 على الموظف مازن اعبيد النجار', NULL, 1243, NULL, NULL, NULL, 1, '2023-04-07 14:44:35', '2023-04-07 14:44:35');
INSERT INTO `transactions` VALUES (12, '1', 'تم إضافة لمبات نيون 120 سم عدد: 39 على الموظف مازن اعبيد النجار', NULL, 1245, NULL, NULL, NULL, 1, '2023-04-30 06:24:50', '2023-04-30 06:24:50');
INSERT INTO `transactions` VALUES (13, '2', 'تم تحويل دفايه عدد: 3 من الموظف Admin إلى الموظف Admin في الموافق: 2023-04-30 09:03:48', NULL, 1244, 1, 1, NULL, NULL, '2023-04-30 09:03:48', '2023-04-30 09:03:48');
INSERT INTO `transactions` VALUES (14, '2', 'تم تحويل دفايه عدد: 3 من الموظف Admin إلى الموظف Admin في الموافق: 2023-04-30 09:05:09', NULL, 1244, 1, 1, NULL, NULL, '2023-04-30 09:05:09', '2023-04-30 09:05:09');
INSERT INTO `transactions` VALUES (15, '2', 'تم تحويل دفايه عدد: 3 من الموظف مازن اعبيد النجار إلى الموظف Admin في الموافق: 2023-04-30 09:10:35', NULL, 1244, NULL, 1, NULL, NULL, '2023-04-30 09:10:35', '2023-04-30 09:10:35');
INSERT INTO `transactions` VALUES (16, '2', 'تم تحويل لمبات نيون 120 سم عدد: 40 من الموظف مازن اعبيد النجار إلى الموظف Admin في الموافق: 2023-04-30 09:22:04', NULL, 1245, NULL, 1, NULL, NULL, '2023-04-30 09:22:04', '2023-04-30 09:22:04');

-- ----------------------------
-- Table structure for units
-- ----------------------------
DROP TABLE IF EXISTS `units`;
CREATE TABLE `units`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of units
-- ----------------------------
INSERT INTO `units` VALUES (1, 'عدد', NULL, NULL);
INSERT INTO `units` VALUES (2, 'كرتونة', NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint UNSIGNED NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE,
  UNIQUE INDEX `users_employee_id_unique`(`employee_id` ASC) USING BTREE,
  CONSTRAINT `users_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', '123456789', 'Admin@yahoo.com', NULL, '$2y$10$o2xL1dD575HQ72idFNHpV.ri6vMLmlJrPY.AVma3t1iYn5SPg4O5i', 'active', NULL, 'OTTpmwRApvoYW39higyo7k37OXLNkORkRZHPdoQHJ5FWio91YoKhqa1T91qm', NULL, NULL, NULL);
INSERT INTO `users` VALUES (5, 'مازن اعبيد النجار', 'm.alngar', 'm.alngar@a.com', NULL, '$2y$10$a/FYLBE3GLJQVgR5JYnko.baXKhZ3kGDB8lvvJzfXdhlBa/W9fLI.', 'active', 1, NULL, '2023-04-30 17:49:18', '2023-04-30 17:49:18', NULL);

-- ----------------------------
-- Table structure for vendors
-- ----------------------------
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vendors
-- ----------------------------
INSERT INTO `vendors` VALUES (1, 'المشتريات', '1000', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
