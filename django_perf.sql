/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : django_perf

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 14/02/2024 15:14:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add case', 1, 'add_case');
INSERT INTO `auth_permission` VALUES (2, 'Can change case', 1, 'change_case');
INSERT INTO `auth_permission` VALUES (3, 'Can delete case', 1, 'delete_case');
INSERT INTO `auth_permission` VALUES (4, 'Can view case', 1, 'view_case');
INSERT INTO `auth_permission` VALUES (5, 'Can add manufacturers', 2, 'add_manufacturers');
INSERT INTO `auth_permission` VALUES (6, 'Can change manufacturers', 2, 'change_manufacturers');
INSERT INTO `auth_permission` VALUES (7, 'Can delete manufacturers', 2, 'delete_manufacturers');
INSERT INTO `auth_permission` VALUES (8, 'Can view manufacturers', 2, 'view_manufacturers');
INSERT INTO `auth_permission` VALUES (9, 'Can add platform', 3, 'add_platform');
INSERT INTO `auth_permission` VALUES (10, 'Can change platform', 3, 'change_platform');
INSERT INTO `auth_permission` VALUES (11, 'Can delete platform', 3, 'delete_platform');
INSERT INTO `auth_permission` VALUES (12, 'Can view platform', 3, 'view_platform');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add performance test results', 5, 'add_performancetestresults');
INSERT INTO `auth_permission` VALUES (18, 'Can change performance test results', 5, 'change_performancetestresults');
INSERT INTO `auth_permission` VALUES (19, 'Can delete performance test results', 5, 'delete_performancetestresults');
INSERT INTO `auth_permission` VALUES (20, 'Can view performance test results', 5, 'view_performancetestresults');
INSERT INTO `auth_permission` VALUES (21, 'Can add log entry', 6, 'add_logentry');
INSERT INTO `auth_permission` VALUES (22, 'Can change log entry', 6, 'change_logentry');
INSERT INTO `auth_permission` VALUES (23, 'Can delete log entry', 6, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (24, 'Can view log entry', 6, 'view_logentry');
INSERT INTO `auth_permission` VALUES (25, 'Can add permission', 7, 'add_permission');
INSERT INTO `auth_permission` VALUES (26, 'Can change permission', 7, 'change_permission');
INSERT INTO `auth_permission` VALUES (27, 'Can delete permission', 7, 'delete_permission');
INSERT INTO `auth_permission` VALUES (28, 'Can view permission', 7, 'view_permission');
INSERT INTO `auth_permission` VALUES (29, 'Can add group', 8, 'add_group');
INSERT INTO `auth_permission` VALUES (30, 'Can change group', 8, 'change_group');
INSERT INTO `auth_permission` VALUES (31, 'Can delete group', 8, 'delete_group');
INSERT INTO `auth_permission` VALUES (32, 'Can view group', 8, 'view_group');
INSERT INTO `auth_permission` VALUES (33, 'Can add user', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change user', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete user', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view user', 9, 'view_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add content type', 10, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (38, 'Can change content type', 10, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (39, 'Can delete content type', 10, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (40, 'Can view content type', 10, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (41, 'Can add session', 11, 'add_session');
INSERT INTO `auth_permission` VALUES (42, 'Can change session', 11, 'change_session');
INSERT INTO `auth_permission` VALUES (43, 'Can delete session', 11, 'delete_session');
INSERT INTO `auth_permission` VALUES (44, 'Can view session', 11, 'view_session');
INSERT INTO `auth_permission` VALUES (45, 'Can add logs', 12, 'add_logs');
INSERT INTO `auth_permission` VALUES (46, 'Can change logs', 12, 'change_logs');
INSERT INTO `auth_permission` VALUES (47, 'Can delete logs', 12, 'delete_logs');
INSERT INTO `auth_permission` VALUES (48, 'Can view logs', 12, 'view_logs');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (6, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (8, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (7, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (9, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (10, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (1, 'Performance', 'case');
INSERT INTO `django_content_type` VALUES (12, 'Performance', 'logs');
INSERT INTO `django_content_type` VALUES (2, 'Performance', 'manufacturers');
INSERT INTO `django_content_type` VALUES (5, 'Performance', 'performancetestresults');
INSERT INTO `django_content_type` VALUES (3, 'Performance', 'platform');
INSERT INTO `django_content_type` VALUES (4, 'Performance', 'user');
INSERT INTO `django_content_type` VALUES (11, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'Performance', '0001_initial', '2024-02-09 15:55:52.946876');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2024-02-09 15:55:52.998691');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-02-09 15:55:53.567086');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0001_initial', '2024-02-09 15:55:53.702184');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0002_logentry_remove_auto_add', '2024-02-09 15:55:53.711191');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-09 15:55:53.719180');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2024-02-09 15:55:53.838866');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2024-02-09 15:55:53.945009');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2024-02-09 15:55:54.008015');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2024-02-09 15:55:54.017011');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2024-02-09 15:55:54.064598');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2024-02-09 15:55:54.069601');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2024-02-09 15:55:54.079611');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2024-02-09 15:55:54.138620');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2024-02-09 15:55:54.193606');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2024-02-09 15:55:54.248787');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2024-02-09 15:55:54.260796');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0012_alter_user_first_name_max_length', '2024-02-09 15:55:54.318496');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2024-02-09 15:55:54.353771');
INSERT INTO `django_migrations` VALUES (20, 'Performance', '0002_logs', '2024-02-10 14:44:03.174723');
INSERT INTO `django_migrations` VALUES (21, 'Performance', '0003_performancetestresults_log_alter_logs_test_script_id', '2024-02-10 23:50:24.557173');
INSERT INTO `django_migrations` VALUES (22, 'Performance', '0004_alter_performancetestresults_test_result', '2024-02-12 02:30:14.786657');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for performance_case
-- ----------------------------
DROP TABLE IF EXISTS `performance_case`;
CREATE TABLE `performance_case`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `test_case_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `test_case_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `test_script_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `test_script` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` smallint(0) NOT NULL,
  `create_edit_time` datetime(6) NOT NULL,
  `del_flag` smallint(0) NOT NULL,
  `user_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Performance_case_user_id_7090354a_fk_Performance_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `Performance_case_user_id_7090354a_fk_Performance_user_id` FOREIGN KEY (`user_id`) REFERENCES `performance_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of performance_case
-- ----------------------------
INSERT INTO `performance_case` VALUES (1, '新建任务', 'GN-001-001', 'S0100201GN_01', '/**\r\n * @Author       : Sunmy\r\n * @Date         : 2023-08-07 20:32:52\r\n * @LastEditTime : 2023-12-22 08:05:46\r\n * @LastEditors  : Sunmy ldspdvs@gmail.com\r\n * @FilePath     : Demo_pthread_create_func_arg.c\r\n * @Description  : pthread_create 创建任务时传递不同类型的参数给执行函数\r\n *\r\n * 依照以下方式传递参数\r\n * void *int_pthread_func_arg(void *arg)\r\n * {\r\n *     PRINTF(\"int_pthread_func_arg(void *arg): %d\", arg);\r\n * }\r\n *\r\n * void *arg = NULL;\r\n * arg = (void *)999888777;\r\n */\r\n#include \"main_includes.h\"\r\n\r\nstatic void *int_pthread_func_arg(void *arg)\r\n{\r\n    PRINTF(\"Start int_pthread_func_arg\");\r\n    PRINTF(\"Enter int_pthread_func_arg arg is: %d\", arg);\r\n    PRINTF(\"Enter int_pthread_func_arg arg at: %p\", arg);\r\n    PRINTF(\"End int_pthread_func_arg\");\r\n}\r\n\r\nstatic void *char_pthread_func_arg(void *arg)\r\n{\r\n    PRINTF(\"Start char_pthread_func_arg\");\r\n    PRINTF(\"Enter char_pthread_func_arg arg is: %c\", arg);\r\n    PRINTF(\"Enter char_pthread_func_arg arg at: %p\", arg);\r\n    PRINTF(\"End char_pthread_func_arg\");\r\n}\r\n\r\nstatic void *string_pthread_func_arg(void *arg)\r\n{\r\n    PRINTF(\"Start string_pthread_func_arg\");\r\n    PRINTF(\"Enter string_pthread_func_arg arg is: %s\", arg);\r\n    PRINTF(\"Enter string_pthread_func_arg arg at: %p\", arg);\r\n    PRINTF(\"End string_pthread_func_arg\");\r\n}\r\n\r\nint Demo_pthread_create_func_arg(void)\r\n{\r\n\r\n    // 定义变量\r\n    int ret;\r\n    pthread_t pthread1, pthread2, pthread3;\r\n    pthread_attr_t pthread_attr1, pthread_attr2, pthread_attr3;\r\n    struct sched_param param_prio1, param_prio2, param_prio3;\r\n\r\n    // pthread1属性初始化\r\n    pthread_attr_init(&pthread_attr1);\r\n    void *arg = NULL;\r\n    arg = (void *)999888777;\r\n\r\n    // pthread1设置优先级\r\n    param_prio1.sched_priority = 10;\r\n    pthread_attr_setschedparam(&pthread_attr1, &param_prio1);\r\n\r\n    // 创建线程pthread1\r\n    ret = pthread_create(&pthread1, &pthread_attr1, int_pthread_func_arg, arg);\r\n    VERIFY_STATUS(ret, \"pthread_create(&pthread1,&pthread_attr1,int_pthread_func_arg,arg)\");\r\n\r\n    // pthread2属性初始化\r\n    pthread_attr_init(&pthread_attr2);\r\n    arg = (void *)\'A\';\r\n\r\n    // pthread2设置优先级\r\n    param_prio2.sched_priority = 10;\r\n    pthread_attr_setschedparam(&pthread_attr2, &param_prio2);\r\n\r\n    // 创建线程pthread2\r\n    ret = pthread_create(&pthread2, &pthread_attr2, char_pthread_func_arg, arg);\r\n    VERIFY_STATUS(ret, \"pthread_create(&pthread2,&pthread_attr2,int_pthread_func_arg,arg)\");\r\n\r\n    // pthread3属性初始化\r\n    pthread_attr_init(&pthread_attr3);\r\n    arg = (void *)\"String\";\r\n\r\n    // pthread3设置优先级\r\n    param_prio3.sched_priority = 10;\r\n    pthread_attr_setschedparam(&pthread_attr3, &param_prio3);\r\n\r\n    // 创建线程pthread3\r\n    ret = pthread_create(&pthread3, &pthread_attr3, string_pthread_func_arg, arg);\r\n    VERIFY_STATUS(ret, \"pthread_create(&pthread3, &pthread_attr3, string_pthread_func_arg, arg)\");\r\n\r\n    // 等待线程结束\r\n    ret = pthread_join(pthread1, NULL);\r\n    VERIFY_STATUS(ret, \"pthread_join(pthread1,NULL)\");\r\n\r\n    ret = pthread_join(pthread2, NULL);\r\n    VERIFY_STATUS(ret, \"pthread_join(pthread2,NULL)\");\r\n\r\n    ret = pthread_join(pthread3, NULL);\r\n    VERIFY_STATUS(ret, \"pthread_join(pthread3,NULL)\");\r\n\r\n    goto pass;\r\n\r\npass:\r\n    case_pass();\r\n    return PASS;\r\nfail:\r\n    case_fail();\r\n    return FAIL;\r\n}', 1, '2024-02-10 00:04:31.351821', 1, 1);
INSERT INTO `performance_case` VALUES (2, '新建文件', 'GN-002-001', 'S0100202GN_01', '/**\r\n * 文件测试\r\n*/\r\n#include \"main_includes.h\"\r\n\r\n#define MAX_EXTENSIONS 5\r\nint file_success(void)\r\n{\r\n    int fd, ret;\r\n    char *write_buf = \"test wtrie\";\r\n    char *read_buf = \"\";\r\n    char *file_path = \"./test.txt\";\r\n\r\n    // 创建文件\r\n    fd = creat(file_path, 0777);\r\n    VERIFY(fd >= 0, \"creat(file_path, 0777);\");\r\n\r\n    // 打开文件\r\n    fd = open(file_path, O_RDWR, 0666);\r\n    VERIFY(fd > 0, \"open(file_path, O_RDWR, 0666)\");\r\n\r\n    // 写入文件\r\n    ret = write(fd, write_buf, strlen(write_buf));\r\n    VERIFY(ret > 0, \"write(fd, write_buf, strlen(write_buf))\");\r\n\r\n    // 同步磁盘\r\n    ret = fsync(fd);\r\n    VERIFY_STATUS(ret, \"fsync(fd)\");\r\n\r\n    // 设置文件读写位置\r\n    ret = lseek(fd, SEEK_SET, 0);\r\n    VERIFY(ret >= 0, \"lseek(fd,SEEK_SET,0)\");\r\n\r\n    // 读取文件\r\n    ret = read(fd, read_buf, strlen(write_buf));\r\n\r\n    // 比较写入和读取内容是否一致\r\n    ret = strncmp(write_buf, read_buf, strlen(read_buf));\r\n    VERIFY_STATUS(ret, \"strncmp failed\");\r\n\r\n    ret = close(fd);\r\n    VERIFY_STATUS(ret, \"close(fd)\");\r\n\r\n    // 删除文件\r\n    ret = remove(file_path);\r\n    VERIFY_STATUS(ret, \"remove(file_pat)\");\r\n\r\n    // ret = unlink(file_path);\r\n    // VERIFY_STATUS(ret, \"unlink(file_pat)\");\r\n\r\n    goto pass;\r\n\r\npass:\r\n    case_pass();\r\n    return PASS;\r\nfail:\r\n    case_fail();\r\n    return FAIL;\r\n}', 0, '2024-02-10 00:11:04.108133', 1, 2);
INSERT INTO `performance_case` VALUES (3, '创建线程', 'GN-003-001', 'S0100201GN_1', '/******************用例描述********************/\r\n/**文   件   名: S0100201GN_1.c\r\n**\r\n** 文件创建日期: 2022 年 5 月 13 日\r\n**\r\n** 描        述: 创建一个线程创建任务, 通过线程是否就绪判断线程是否被成功创建\r\n******************/\r\n\r\n#include \"main_includes.h\"\r\n\r\nstatic pthread_t main_thread_201_1;\r\nstatic int count = 0;\r\n\r\n/*\r\n * 任务函数定义开始\r\n */\r\nstatic void *main_task_thread201_1(void *arg)\r\n{\r\n    count++;\r\n    VERIFY(count == 1, \"ENTER the main_thread_201_1\");\r\n    VERIFY(count > 1, \"ENTER the main_thread_201_1\");\r\n\r\n    return (NULL);\r\n}\r\n\r\n/*\r\n * 任务创建测试\r\n */\r\nint S0100201GN_02(void)\r\n{\r\n    int status, ret;\r\n    bool is_ready;\r\n    pthread_attr_t main_attr201_1;\r\n\r\n    /*\r\n     * 防止系统认为该main_attr201_1已初始化\r\n     */\r\n    memset(&main_attr201_1, 0, sizeof(pthread_attr_t));\r\n\r\n    /*\r\n     * 初始化main_attr201_1\r\n     */\r\n    pthread_attr_init(&main_attr201_1);\r\n\r\n    /*\r\n     * 设置调度策略，是否继承调度参数，优先级\r\n     */\r\n    // main_attr201_1.schedpolicy = SCHED_RR;\r\n    // main_attr201_1.inheritsched = PTHREAD_EXPLICIT_SCHED;\r\n    // main_attr201_1.schedparam.sched_priority = 24;\r\n\r\n    // main_thread_201_1线程的指针  main_attr201_1指向任务属性对象的指针，main_task_thread201_1任务执行函数，NULL任务执行函数的参数\r\n    main_thread_201_1 = 0;\r\n    status = pthread_create(&main_thread_201_1, &main_attr201_1, main_task_thread201_1, NULL);\r\n    // if (status != 0)\r\n    // {\r\n    //     // goto fail;\r\n    //     PRINTF_ERROR(\"thread create success\");\r\n    // }\r\n    // else\r\n    // {\r\n    //     PRINTF_SUCCESS(\" creating main_thread_201_1.\");\r\n    // }\r\n    VERIFY(status == 0, \"creating main_thread_201_1\");\r\n    PRINTF(\"status:%d\", status);\r\n\r\n    /*\r\n     * 等待任务结束\r\n     */\r\n    ret = pthread_join(main_thread_201_1, NULL);\r\n    VERIFY(ret == 0, \"pthread_join\");\r\n\r\n    VERIFY(1 == 0, \"1==0 有错误计数\");\r\n\r\n    // if (1 == 1)\r\n    // {\r\n    //     PRINTF_ERROR1(\"PASS Test PRINTF_ERROR1\");\r\n    // }\r\n    // else\r\n    // {\r\n    //     PRINTF(\"FAIL Test PRINTF_ERROR\");\r\n    // }\r\n\r\n    // goto pass;\r\n\r\n    \r\n\r\npass:\r\n    case_pass();\r\n    return PASS;\r\nfail:\r\n    case_fail();\r\n    return FAIL;\r\n}', 1, '2024-02-10 08:32:03.148996', 1, 2);
INSERT INTO `performance_case` VALUES (4, 'Test_Case_Name00', 'GN-003-000', 'S0100201GN_00', 'Test_Script_00', 1, '2024-02-10 08:32:03.148996', 1, 1);
INSERT INTO `performance_case` VALUES (5, 'Test_Case_Name01', 'GN-003-020', 'S0100201GN_01', 'Test_Script_01', 0, '2024-02-12 10:43:22.781269', 1, 1);
INSERT INTO `performance_case` VALUES (6, 'Test_Case_Name02', 'GN-003-002', 'S0100201GN_02', 'Test_Script_02', 2, '2024-02-10 08:32:03.148996', 1, 3);
INSERT INTO `performance_case` VALUES (7, 'Test_Case_Name03', 'GN-003-003', 'S0100201GN_03', 'Test_Script_03', 0, '2024-02-10 08:32:03.148996', 1, 2);
INSERT INTO `performance_case` VALUES (8, 'Test_Case_Name04', 'GN-003-004', 'S0100201GN_04', 'Test_Script_04', 0, '2024-02-10 08:32:03.148996', 1, 2);
INSERT INTO `performance_case` VALUES (9, 'Test_Case_Name05', 'GN-003-005', 'S0100201GN_05', 'Test_Script_05', 0, '2024-02-10 08:32:03.148996', 1, 1);
INSERT INTO `performance_case` VALUES (10, 'Test_Case_Name06', 'GN-003-006', 'S0100201GN_06', 'Test_Script_06', 1, '2024-02-10 08:32:03.148996', 1, 3);
INSERT INTO `performance_case` VALUES (11, 'Test_Case_Name07', 'GN-003-007', 'S0100201GN_07', 'Test_Script_07', 2, '2024-02-10 08:32:03.148996', 1, 3);
INSERT INTO `performance_case` VALUES (12, 'Test_Case_Name08', 'GN-003-008', 'S0100201GN_08', 'Test_Script_08', 2, '2024-02-10 08:32:03.148996', 1, 1);
INSERT INTO `performance_case` VALUES (13, 'Test_Case_Name09', 'GN-003-009', 'S0100201GN_09', 'Test_Script_09', 1, '2024-02-10 08:32:03.148996', 1, 2);
INSERT INTO `performance_case` VALUES (14, 'Test_Case_Name10', 'GN-003-010', 'S0100201GN_10', 'Test_Script_10', 0, '2024-02-10 08:32:03.148996', 1, 1);
INSERT INTO `performance_case` VALUES (15, 'Test_Case_Name11', 'GN-003-011', 'S0100201GN_11', 'Test_Script_11', 1, '2024-02-10 08:32:03.148996', 1, 3);
INSERT INTO `performance_case` VALUES (16, 'Test_Case_Name12', 'GN-003-012', 'S0100201GN_12', 'Test_Script_12', 2, '2024-02-10 08:32:03.148996', 1, 1);
INSERT INTO `performance_case` VALUES (17, 'Test_Case_Name13', 'GN-003-013', 'S0100201GN_13', 'Test_Script_13', 1, '2024-02-10 08:32:03.148996', 1, 2);
INSERT INTO `performance_case` VALUES (18, 'Test_Case_Name14', 'GN-003-014', 'S0100201GN_14', 'Test_Script_14', 2, '2024-02-10 08:32:03.148996', 1, 1);
INSERT INTO `performance_case` VALUES (19, 'Test_Case_Name15', 'GN-003-015', 'S0100201GN_15', 'Test_Script_15', 2, '2024-02-10 08:32:03.148996', 1, 2);
INSERT INTO `performance_case` VALUES (20, 'Test_Case_Name16', 'GN-003-016', 'S0100201GN_16', 'Test_Script_16', 1, '2024-02-10 08:32:03.148996', 1, 1);
INSERT INTO `performance_case` VALUES (21, 'Test_Case_Name17', 'GN-003-017', 'S0100201GN_17', 'Test_Script_17', 2, '2024-02-10 08:32:03.148996', 1, 2);
INSERT INTO `performance_case` VALUES (22, 'Test_Case_Name18', 'GN-003-018', 'S0100201GN_18', 'Test_Script_18', 1, '2024-02-10 08:32:03.148996', 1, 3);
INSERT INTO `performance_case` VALUES (23, 'Test_Case_Name19', 'GN-003-019', 'S0100201GN_19', 'Test_Script_19', 1, '2024-02-10 11:01:25.998003', 1, 1);

-- ----------------------------
-- Table structure for performance_logs
-- ----------------------------
DROP TABLE IF EXISTS `performance_logs`;
CREATE TABLE `performance_logs`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `del_flag` smallint(0) NOT NULL,
  `test_script_id_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Performance_logs_test_script_id_id_1fd5be8e_fk_Performan`(`test_script_id_id`) USING BTREE,
  CONSTRAINT `Performance_logs_test_script_id_id_1fd5be8e_fk_Performan` FOREIGN KEY (`test_script_id_id`) REFERENCES `performance_case` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of performance_logs
-- ----------------------------
INSERT INTO `performance_logs` VALUES (2, '2023_1_0_1_1_100001_1', 'ns', 'logs/2023_1_1_1_1_100001_1.log', 1, 4);
INSERT INTO `performance_logs` VALUES (3, 'ALice', 'ms', 'logs/9.jpg', 1, 19);

-- ----------------------------
-- Table structure for performance_manufacturers
-- ----------------------------
DROP TABLE IF EXISTS `performance_manufacturers`;
CREATE TABLE `performance_manufacturers`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` smallint(0) NOT NULL,
  `del_flag` smallint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of performance_manufacturers
-- ----------------------------
INSERT INTO `performance_manufacturers` VALUES (1, '麒麟', 0, 1);
INSERT INTO `performance_manufacturers` VALUES (2, '统信', 0, 1);
INSERT INTO `performance_manufacturers` VALUES (3, '翼辉', 1, 1);
INSERT INTO `performance_manufacturers` VALUES (4, '618', 1, 1);

-- ----------------------------
-- Table structure for performance_performancetestresults
-- ----------------------------
DROP TABLE IF EXISTS `performance_performancetestresults`;
CREATE TABLE `performance_performancetestresults`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `year` smallint(0) NOT NULL,
  `batch` smallint(0) NOT NULL,
  `category` smallint(0) NOT NULL,
  `test_result` decimal(10, 4) NOT NULL,
  `test_threshold` decimal(10, 2) NOT NULL,
  `create_edit_time` date NOT NULL,
  `del_flag` smallint(0) NOT NULL,
  `manufacturer_id` bigint(0) NOT NULL,
  `platform_id` bigint(0) NOT NULL,
  `test_case_id` bigint(0) NOT NULL,
  `test_user_id` bigint(0) NOT NULL,
  `log` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Performance_performa_manufacturer_id_9dab9415_fk_Performan`(`manufacturer_id`) USING BTREE,
  INDEX `Performance_performa_platform_id_0ddbcd54_fk_Performan`(`platform_id`) USING BTREE,
  INDEX `Performance_performa_test_case_id_afac6436_fk_Performan`(`test_case_id`) USING BTREE,
  INDEX `Performance_performa_test_user_id_d63c7a69_fk_Performan`(`test_user_id`) USING BTREE,
  CONSTRAINT `Performance_performa_manufacturer_id_9dab9415_fk_Performan` FOREIGN KEY (`manufacturer_id`) REFERENCES `performance_manufacturers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Performance_performa_platform_id_0ddbcd54_fk_Performan` FOREIGN KEY (`platform_id`) REFERENCES `performance_platform` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Performance_performa_test_case_id_afac6436_fk_Performan` FOREIGN KEY (`test_case_id`) REFERENCES `performance_case` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Performance_performa_test_user_id_d63c7a69_fk_Performan` FOREIGN KEY (`test_user_id`) REFERENCES `performance_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of performance_performancetestresults
-- ----------------------------
INSERT INTO `performance_performancetestresults` VALUES (5, 6, 0, 0, 4.2200, 3.00, '2024-02-11', 1, 1, 1, 5, 1, 'logs/8.log');
INSERT INTO `performance_performancetestresults` VALUES (6, 6, 0, 0, 1.9180, 3.00, '2024-02-11', 1, 1, 1, 6, 1, 'logs/7.log');
INSERT INTO `performance_performancetestresults` VALUES (7, 6, 0, 0, 3.2200, 3.00, '2024-02-12', 1, 1, 1, 7, 1, 'logs/6.log');
INSERT INTO `performance_performancetestresults` VALUES (8, 6, 0, 0, 3.2112, 3.00, '2024-02-12', 1, 1, 1, 8, 2, 'logs/5.log');
INSERT INTO `performance_performancetestresults` VALUES (9, 6, 0, 0, 2.2112, 3.00, '2024-02-12', 1, 1, 1, 9, 2, 'logs/4.log');
INSERT INTO `performance_performancetestresults` VALUES (10, 6, 0, 0, 4.2112, 3.00, '2024-02-12', 1, 1, 1, 10, 1, 'logs/3.log');
INSERT INTO `performance_performancetestresults` VALUES (108, 1, 1, 1, 1.2112, 3.00, '2024-02-12', 1, 4, 2, 3, 3, 'logs/2.log');
INSERT INTO `performance_performancetestresults` VALUES (109, 3, 2, 0, 1.2112, 3.50, '2024-02-12', 1, 1, 2, 4, 2, 'logs/1.log');

-- ----------------------------
-- Table structure for performance_platform
-- ----------------------------
DROP TABLE IF EXISTS `performance_platform`;
CREATE TABLE `performance_platform`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` smallint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of performance_platform
-- ----------------------------
INSERT INTO `performance_platform` VALUES (1, 'LS2K1000', 'armV7,64', 1);
INSERT INTO `performance_platform` VALUES (2, 'LS2K2000', 'armV8,32', 1);
INSERT INTO `performance_platform` VALUES (3, 'LS2K0500', NULL, 1);
INSERT INTO `performance_platform` VALUES (4, 'LS2P0500', NULL, 1);
INSERT INTO `performance_platform` VALUES (5, 'FT-M6678', NULL, 1);

-- ----------------------------
-- Table structure for performance_user
-- ----------------------------
DROP TABLE IF EXISTS `performance_user`;
CREATE TABLE `performance_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `del_flag` smallint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of performance_user
-- ----------------------------
INSERT INTO `performance_user` VALUES (1, 'Alice', 'Alice', 1);
INSERT INTO `performance_user` VALUES (2, 'Tom', 'Tom', 1);
INSERT INTO `performance_user` VALUES (3, 'Lucy', 'Lucy', 1);

SET FOREIGN_KEY_CHECKS = 1;
