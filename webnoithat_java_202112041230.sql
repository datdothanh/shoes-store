--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.338.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 12/7/2021 12:02:03 PM
-- Server version: 8.0.26
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- Set default database
--
USE webnoithat_java;

--
-- Drop procedure `proc_get_users_filter`
--
DROP PROCEDURE IF EXISTS proc_get_users_filter;

--
-- Drop procedure `proc_get_user_by_username`
--
DROP PROCEDURE IF EXISTS proc_get_user_by_username;

--
-- Drop table `user`
--
DROP TABLE IF EXISTS user;

--
-- Drop procedure `proc_get_contact_filter`
--
DROP PROCEDURE IF EXISTS proc_get_contact_filter;

--
-- Drop table `contact`
--
DROP TABLE IF EXISTS contact;

--
-- Drop procedure `proc_get_news_event`
--
DROP PROCEDURE IF EXISTS proc_get_news_event;

--
-- Drop procedure `proc_get_news_home`
--
DROP PROCEDURE IF EXISTS proc_get_news_home;

--
-- Drop procedure `proc_get_news_hot`
--
DROP PROCEDURE IF EXISTS proc_get_news_hot;

--
-- Drop procedure `proc_get_news_product`
--
DROP PROCEDURE IF EXISTS proc_get_news_product;

--
-- Drop procedure `proc_get_news_sale`
--
DROP PROCEDURE IF EXISTS proc_get_news_sale;

--
-- Drop procedure `proc_get_newss_filter`
--
DROP PROCEDURE IF EXISTS proc_get_newss_filter;

--
-- Drop table `news`
--
DROP TABLE IF EXISTS news;

--
-- Drop procedure `proc_get_orderDetails_filter`
--
DROP PROCEDURE IF EXISTS proc_get_orderDetails_filter;

--
-- Drop procedure `proc_get_products_top_selling`
--
DROP PROCEDURE IF EXISTS proc_get_products_top_selling;

--
-- Drop table `order_detail`
--
DROP TABLE IF EXISTS order_detail;

--
-- Drop procedure `proc_get_orders_by_user`
--
DROP PROCEDURE IF EXISTS proc_get_orders_by_user;

--
-- Drop procedure `proc_get_orders_filter`
--
DROP PROCEDURE IF EXISTS proc_get_orders_filter;

--
-- Drop table `order`
--
DROP TABLE IF EXISTS `order`;

--
-- Drop procedure `proc_get_productCategory_home`
--
DROP PROCEDURE IF EXISTS proc_get_productCategory_home;

--
-- Drop procedure `proc_get_productCategorys_filter`
--
DROP PROCEDURE IF EXISTS proc_get_productCategorys_filter;

--
-- Drop table `product_category`
--
DROP TABLE IF EXISTS product_category;

--
-- Drop procedure `proc_get_products_filter`
--
DROP PROCEDURE IF EXISTS proc_get_products_filter;

--
-- Drop table `product`
--
DROP TABLE IF EXISTS product;

--
-- Drop procedure `proc_get_project_home`
--
DROP PROCEDURE IF EXISTS proc_get_project_home;

--
-- Drop procedure `proc_get_project_hot`
--
DROP PROCEDURE IF EXISTS proc_get_project_hot;

--
-- Drop procedure `proc_get_projects_filter`
--
DROP PROCEDURE IF EXISTS proc_get_projects_filter;

--
-- Drop table `project`
--
DROP TABLE IF EXISTS project;

--
-- Drop procedure `proc_get_recruitment_home`
--
DROP PROCEDURE IF EXISTS proc_get_recruitment_home;

--
-- Drop procedure `proc_get_recruitment_hot`
--
DROP PROCEDURE IF EXISTS proc_get_recruitment_hot;

--
-- Drop procedure `proc_get_recruitments_filter`
--
DROP PROCEDURE IF EXISTS proc_get_recruitments_filter;

--
-- Drop table `recruitment`
--
DROP TABLE IF EXISTS recruitment;

--
-- Set default database
--
USE webnoithat_java;

--
-- Create table `recruitment`
--
CREATE TABLE recruitment (
  recruitment_id varchar(36) NOT NULL,
  created_date datetime(6) DEFAULT NULL,
  link_image varchar(255) DEFAULT NULL,
  modified_date datetime(6) DEFAULT NULL,
  recruitment_content varchar(5000) DEFAULT NULL,
  recruitment_home int DEFAULT NULL,
  recruitment_hot int DEFAULT NULL,
  recruitment_title varchar(255) DEFAULT NULL,
  PRIMARY KEY (recruitment_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

--
-- Create procedure `proc_get_recruitments_filter`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_recruitments_filter (IN PageIndex int, IN PageSize int, IN Fil nvarchar(255))
BEGIN
  DECLARE start int;
  DECLARE end int;
  SET START = ((PageIndex - 1) * PageSize);
  SET end = ((PageIndex - 1) * PageSize) + PageSize;

  SELECT
    *
  FROM recruitment r
  WHERE (Fil IS NULL)
  OR (r.recruitment_title LIKE CONCAT('%', Fil, '%'))
  ORDER BY r.modified_date DESC
  LIMIT start, PageSize;
END
$$

--
-- Create procedure `proc_get_recruitment_hot`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_recruitment_hot ()
BEGIN
  SELECT
    *
  FROM recruitment r
  WHERE r.recruitment_hot = 1
  LIMIT 6;

END
$$

--
-- Create procedure `proc_get_recruitment_home`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_recruitment_home ()
BEGIN
  SELECT
    *
  FROM recruitment r
  WHERE r.recruitment_home = 1
  ORDER BY r.modified_date DESC
  LIMIT 3;
END
$$

DELIMITER ;

--
-- Create table `project`
--
CREATE TABLE project (
  project_id varchar(36) NOT NULL,
  created_date datetime(6) DEFAULT NULL,
  link_image varchar(255) DEFAULT NULL,
  modified_date datetime(6) DEFAULT NULL,
  project_content varchar(5000) DEFAULT NULL,
  project_home int DEFAULT NULL,
  project_hot int DEFAULT NULL,
  project_title varchar(255) DEFAULT NULL,
  PRIMARY KEY (project_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

--
-- Create procedure `proc_get_projects_filter`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_projects_filter (IN PageIndex int, IN PageSize int, IN Fil nvarchar(255))
BEGIN
  DECLARE start int;
  DECLARE end int;
  SET START = ((PageIndex - 1) * PageSize);
  SET end = ((PageIndex - 1) * PageSize) + PageSize;

  SELECT
    *
  FROM project p
  WHERE (Fil IS NULL)
  OR (p.project_title LIKE CONCAT('%', Fil, '%'))
  ORDER BY p.modified_date DESC
  LIMIT start, PageSize;
END
$$

--
-- Create procedure `proc_get_project_hot`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_project_hot ()
BEGIN
  SELECT
    *
  FROM project p
  WHERE p.project_hot = 1
  LIMIT 6;

END
$$

--
-- Create procedure `proc_get_project_home`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_project_home ()
BEGIN
  SELECT
    *
  FROM project p
  WHERE p.project_home = 1
  LIMIT 4;

END
$$

DELIMITER ;

--
-- Create table `product`
--
CREATE TABLE product (
  product_id varchar(36) NOT NULL,
  created_date datetime(6) DEFAULT NULL,
  modified_date datetime(6) DEFAULT NULL,
  product_color int DEFAULT NULL,
  product_description varchar(5000) DEFAULT NULL,
  product_description_short varchar(1000) DEFAULT NULL,
  product_dimensions varchar(1000) DEFAULT NULL,
  product_evaluate double DEFAULT NULL,
  product_image varchar(255) DEFAULT NULL,
  product_manufacturer varchar(255) DEFAULT NULL,
  product_material varchar(255) DEFAULT NULL,
  product_name varchar(255) DEFAULT NULL,
  product_original_price double DEFAULT NULL,
  product_sale_price double DEFAULT NULL,
  product_category_id varchar(36) DEFAULT NULL,
  PRIMARY KEY (product_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 780,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

--
-- Create procedure `proc_get_products_filter`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_products_filter (IN PageIndex int, IN PageSize int, IN Fil nvarchar(255), IN SortStatus int, IN FieldSort varchar(30), IN CategoryId char(36), IN Price double)
BEGIN
  DECLARE start int;
  DECLARE end int;
  SET start = ((PageIndex - 1) * PageSize);
  IF (Price > 0) THEN
    IF (SortStatus = 1) THEN
      SELECT
        *
      FROM product p
      WHERE ((Fil IS NULL)
      OR (p.product_name LIKE CONCAT('%', Fil, '%'))
      OR (p.product_category_id LIKE CONCAT('%', Fil, '%')))
      AND ((CategoryId IS NULL)
      OR (p.product_category_id LIKE CONCAT('%', CategoryId, '%')))
      AND (p.product_sale_price / 1000000 <= Price)

      ORDER BY p.product_sale_price DESC
      LIMIT start, PageSize;
    END IF;
    IF (SortStatus = 2) THEN
      SELECT
        *
      FROM product p
      WHERE ((Fil IS NULL)
      OR (p.product_name LIKE CONCAT('%', Fil, '%')))
      AND ((CategoryId IS NULL)
      OR (p.product_category_id LIKE CONCAT('%', CategoryId, '%')))
      AND (p.product_sale_price / 1000000 <= Price)
      ORDER BY p.product_sale_price ASC
      LIMIT start, PageSize;
    END IF;
    IF (SortStatus != 1
      || SortStatus != 2
      || SortStatus = NULL) THEN
      SELECT
        *
      FROM product p
      WHERE ((Fil IS NULL)
      OR (p.product_name LIKE CONCAT('%', Fil, '%')))
      AND ((CategoryId IS NULL)
      OR (p.product_category_id LIKE CONCAT('%', CategoryId, '%')))
      AND (p.product_sale_price / 1000000 <= Price)
      LIMIT start, PageSize;
    END IF;
  END IF;
  IF (Price = 0) THEN
    IF (SortStatus = 1) THEN
      SELECT
        *
      FROM product p
      WHERE ((Fil IS NULL)
      OR (p.product_name LIKE CONCAT('%', Fil, '%'))
      OR (p.product_category_id LIKE CONCAT('%', Fil, '%')))
      AND ((CategoryId IS NULL)
      OR (p.product_category_id LIKE CONCAT('%', CategoryId, '%')))
      ORDER BY p.product_sale_price DESC
      LIMIT start, PageSize;
    END IF;
    IF (SortStatus = 2) THEN
      SELECT
        *
      FROM product p
      WHERE ((Fil IS NULL)
      OR (p.product_name LIKE CONCAT('%', Fil, '%')))
      AND ((CategoryId IS NULL)
      OR (p.product_category_id LIKE CONCAT('%', CategoryId, '%')))
      ORDER BY p.product_sale_price ASC
      LIMIT start, PageSize;
    END IF;
    IF (SortStatus != 1
      || SortStatus != 2
      || SortStatus = NULL) THEN
      SELECT
        *
      FROM product p
      WHERE ((Fil IS NULL)
      OR (p.product_name LIKE CONCAT('%', Fil, '%')))
      AND ((CategoryId IS NULL)
      OR (p.product_category_id LIKE CONCAT('%', CategoryId, '%')))
      ORDER BY p.modified_date DESC
      LIMIT start, PageSize;
    END IF;
  END IF;
END
$$

DELIMITER ;

--
-- Create table `product_category`
--
CREATE TABLE product_category (
  product_category_id varchar(36) NOT NULL,
  created_date datetime(6) DEFAULT NULL,
  modified_date datetime(6) DEFAULT NULL,
  product_category_description varchar(255) DEFAULT NULL,
  product_category_home varchar(255) DEFAULT NULL,
  product_category_image varchar(255) DEFAULT NULL,
  product_category_name varchar(255) DEFAULT NULL,
  PRIMARY KEY (product_category_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

--
-- Create procedure `proc_get_productCategorys_filter`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_productCategorys_filter (IN PageIndex int, IN PageSize int, IN Fil nvarchar(255))
BEGIN
  DECLARE start int;
  DECLARE end int;
  SET start = ((PageIndex - 1) * PageSize);
  SET end = ((PageIndex - 1) * PageSize) + PageSize;

  SELECT
    *
  FROM product_category p
  WHERE (Fil IS NULL)
  OR (p.product_category_name LIKE CONCAT('%', Fil, '%'))
  ORDER BY p.modified_date DESC
  LIMIT start, PageSize;
END
$$

--
-- Create procedure `proc_get_productCategory_home`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_productCategory_home ()
BEGIN
  SELECT
    *
  FROM product_category pc
  WHERE pc.product_category_home = 1
  LIMIT 6;

END
$$

DELIMITER ;

--
-- Create table `order`
--
CREATE TABLE `order` (
  order_id varchar(36) NOT NULL,
  address varchar(255) DEFAULT NULL,
  created_date datetime(6) DEFAULT NULL,
  full_name varchar(255) DEFAULT NULL,
  modified_date datetime(6) DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  payment_methods int DEFAULT NULL,
  phone_number varchar(255) DEFAULT NULL,
  user_id varchar(36) DEFAULT NULL,
  user_name varchar(255) DEFAULT NULL,
  status_order int DEFAULT NULL,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 862,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

--
-- Create procedure `proc_get_orders_filter`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_orders_filter (IN PageIndex int, IN PageSize int, IN Fil nvarchar(255))
BEGIN
  DECLARE start int;
  DECLARE end int;
  SET start = ((PageIndex - 1) * PageSize);
  SELECT
    *
  FROM `order` o
  WHERE (Fil IS NULL)
  OR (o.full_name LIKE CONCAT('%', Fil, '%'))
  OR (o.phone_number LIKE CONCAT('%', Fil, '%'))
  LIMIT start, PageSize;
END
$$

--
-- Create procedure `proc_get_orders_by_user`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_orders_by_user (IN UserId varchar(36))
BEGIN
  SELECT
    *
  FROM `order` o
  WHERE o.user_id = UserId;
END
$$

DELIMITER ;

--
-- Create table `order_detail`
--
CREATE TABLE order_detail (
  order_id varchar(36) DEFAULT '',
  amount int DEFAULT NULL,
  product_id varchar(36) DEFAULT NULL,
  order_detail_id varchar(36) NOT NULL,
  product_name varchar(255) DEFAULT NULL,
  price double DEFAULT NULL,
  PRIMARY KEY (order_detail_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 910,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

--
-- Create procedure `proc_get_products_top_selling`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_products_top_selling (IN number int)
BEGIN
  SELECT
    p.*
  FROM product p
    JOIN order_detail o
      ON p.product_id = o.product_id LIMIT number;
END
$$

--
-- Create procedure `proc_get_orderDetails_filter`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_orderDetails_filter (IN PageIndex int, IN PageSize int, IN Fil nvarchar(255))
BEGIN
  DECLARE start int;
  DECLARE end int;
  SET start = ((PageIndex - 1) * PageSize);
  SELECT
    *
  FROM order_detail o
  WHERE (Fil IS NULL)
  OR (o.product_name LIKE CONCAT('%', Fil, '%')
  OR o.product_name IS NULL)
  LIMIT start, PageSize;
END
$$

DELIMITER ;

--
-- Create table `news`
--
CREATE TABLE news (
  news_id varchar(36) NOT NULL,
  created_date datetime(6) DEFAULT NULL,
  link_image varchar(255) DEFAULT NULL,
  modified_date datetime(6) DEFAULT NULL,
  news_content varchar(5000) DEFAULT NULL,
  news_event int DEFAULT NULL,
  news_home int DEFAULT NULL,
  news_hot int DEFAULT NULL,
  news_product int DEFAULT NULL,
  news_sale int DEFAULT NULL,
  news_title varchar(2000) DEFAULT NULL,
  PRIMARY KEY (news_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

--
-- Create procedure `proc_get_newss_filter`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_newss_filter (IN PageIndex int, IN PageSize int, IN Fil nvarchar(255))
BEGIN
  DECLARE start int;
  DECLARE end int;
  SET start = ((PageIndex - 1) * PageSize);
  SET end = ((PageIndex - 1) * PageSize) + PageSize;
  SELECT
    *
  FROM news n
  WHERE (Fil IS NULL)
  OR (n.news_title LIKE CONCAT('%', Fil, '%'))
  ORDER BY n.modified_date DESC
  LIMIT start, PageSize;
END
$$

--
-- Create procedure `proc_get_news_sale`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_news_sale ()
BEGIN
  SELECT
    *
  FROM news n
  WHERE n.news_sale = 1
  ORDER BY n.modified_date DESC
  LIMIT 6;
END
$$

--
-- Create procedure `proc_get_news_product`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_news_product ()
BEGIN
  SELECT
    *
  FROM news n
  WHERE n.news_product = 1
  ORDER BY n.modified_date DESC
  LIMIT 6;
END
$$

--
-- Create procedure `proc_get_news_hot`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_news_hot ()
BEGIN
  SELECT
    *
  FROM news n
  WHERE n.news_hot = 1
  ORDER BY n.modified_date DESC
  LIMIT 6;
END
$$

--
-- Create procedure `proc_get_news_home`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_news_home ()
BEGIN
  SELECT
    *
  FROM news n
  WHERE n.news_home = 1
  LIMIT 3;

END
$$

--
-- Create procedure `proc_get_news_event`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_news_event ()
BEGIN
  SELECT
    *
  FROM news n
  WHERE n.news_event = 1
  ORDER BY n.modified_date DESC
  LIMIT 6;
END
$$

DELIMITER ;

--
-- Create table `contact`
--
CREATE TABLE contact (
  contact_id varchar(36) NOT NULL,
  contact_email varchar(255) DEFAULT NULL,
  contact_name varchar(255) DEFAULT NULL,
  contact_phone varchar(255) DEFAULT NULL,
  contact_reminder varchar(255) DEFAULT NULL,
  created_date datetime(6) DEFAULT NULL,
  modified_date datetime(6) DEFAULT NULL,
  PRIMARY KEY (contact_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

--
-- Create procedure `proc_get_contact_filter`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_contact_filter (IN PageIndex int, IN PageSize int, IN Fil nvarchar(255))
BEGIN
  DECLARE start int;
  DECLARE end int;
  SET start = ((PageIndex - 1) * PageSize);
  SET end = ((PageIndex - 1) * PageSize) + PageSize;

  SELECT
    *
  FROM contact c
  WHERE (Fil IS NULL)
  OR (c.contact_name LIKE CONCAT('%', Fil, '%'))
  ORDER BY c.modified_date DESC
  LIMIT start, PageSize;
END
$$

DELIMITER ;

--
-- Create table `user`
--
CREATE TABLE user (
  user_id varchar(36) NOT NULL,
  address varchar(255) DEFAULT NULL,
  created_date datetime(6) DEFAULT NULL,
  full_name varchar(255) DEFAULT NULL,
  modified_date datetime(6) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  phone_number varchar(255) DEFAULT NULL,
  role int DEFAULT NULL,
  user_name varchar(255) DEFAULT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

DELIMITER $$

--
-- Create procedure `proc_get_user_by_username`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_user_by_username (IN userName varchar(255))
BEGIN
  SELECT
    *
  FROM user u
  WHERE u.user_name = userName LIMIT 1;
END
$$

--
-- Create procedure `proc_get_users_filter`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE proc_get_users_filter (IN PageIndex int, IN PageSize int, IN Fil nvarchar(255))
BEGIN
  DECLARE start int;
  DECLARE end int;
  SET start = ((PageIndex - 1) * PageSize);
  SET end = ((PageIndex - 1) * PageSize) + PageSize;

  SELECT
    *
  FROM user u
  WHERE (Fil IS NULL)
  OR (u.user_name LIKE CONCAT('%', Fil, '%')
  OR u.full_name LIKE CONCAT('%', Fil, '%')
  OR u.address LIKE CONCAT('%', Fil, '%'))
  ORDER BY u.modified_date DESC
  LIMIT start, PageSize;
END
$$

DELIMITER ;

-- 
-- Dumping data for table user
--
INSERT INTO user VALUES
('0530d44e-34d9-11ec-9f32-b00cd19df262', 'Hà Nội', '2021-10-24 21:45:24', 'dat', '2021-12-04 05:22:29.27', '123456', '128731831', 1, 'dat123456'),
('0530d44e-34d9-11ec-9f32-b00cd19df263', '11', '2021-09-19 00:00:00', 'dat', '2021-09-19 00:00:00', '1234567', '1111111111', 2, 'dat1234567'),
('a8d2d9a3-e69d-4034-9224-599aeb45136c', '21321', NULL, '21223312', NULL, '111312', '3123121232', 0, '123123');

-- 
-- Dumping data for table recruitment
--
INSERT INTO recruitment VALUES
('03f4118b-5894-4c4b-bcdf-c70c25def9cd', '2021-09-19 00:00:00', 'tuyendung1.png', '2021-09-19 00:00:00', 'Mô tả công việc\r\n- Hiểu rõ và thuộc tính năng, giá, ưu nhược điểm của sản phẩm, sản phẩm tương tự, sản phẩm của đối thủ cạnh tranh.\r\n- Thu nhập và đánh giá thông tin về cạnh tranh, về khách hàng và thị trường.\r\n- Tiếp xúc khách hàng và ghi nhận toàn bộ các thông tin của khách hàng trong báo cáo tiếp xúc khách hàng. Báo cáo nội dung tiếp xúc khách hàng trong ngày cho Trưởng phòng.\r\n- Theo dõi quá trình thanh lý hợp đồng, hỗ trợ phòng kế toán đốc thúc công nợ, chỉ xong trách nhiệm khi khách hàng đã thanh toán xong.\r\n- Tìm hiểu nhu cầu của khách hàng. Tìm kiếm khách hàng tiềm năng.', 1, 0, 'Tuyển dụng nhân viên bán hàng'),
('6e77f5cf-7614-4e80-a0bd-6b63dfc84e0b', '2021-09-19 00:00:00', 'tuyendung2.png', '2021-09-19 00:00:00', 'Mô tả công việc\r\n- Soạn thảo các văn bản chung của Công ty.\r\n- Thực hiện công tác BHXH, BHYT của Công ty đảm bảo việc tuân thủ đúng các chế độ chính sách liên quan và quyền lợi của người lao động\r\n- Theo dõi, kiểm soát tình hình biến động nhân lực, ký HĐTV, HĐLĐ trong toàn công ty.\r\n- Thực hiện một số nhiệm vụ khác theo yêu cầu của cấp trên.', 1, 1, 'TUYỂN DỤNG NHÂN VIÊN HÀNH CHÍNH VĂN PHÒNG'),
('958c9352-4280-4225-aa5b-2ce270f5d48f', '2021-09-19 00:00:00', 'tuyendung3.png', '2021-09-19 00:00:00', 'Mô tả công việc\r\n- Vị trí tuyển dụng: Công nhân sản xuất\r\n- Số lượng tuyển: 20 người (Nam), độ tuổi từ 20 đến 40.\r\n- Thời gian làm việc: Theo ca', 1, 1, 'TUYỂN DỤNG CÔNG NHÂN SẢN XUẤT'),
('f70194f3-dbef-4a3c-ba5f-27f20d6fc1dc', '2021-09-19 00:00:00', 'tuyendung4.png', '2021-09-19 00:00:00', 'Đảm bảo hệ thống Website hoạt động thông suốt.', 0, 0, 'Tuyển dụng nhân viên IT');

-- 
-- Dumping data for table project
--
INSERT INTO project VALUES
('165bf5ba-abc6-422d-80a0-b219e0ee9fc6', '2021-09-19 00:00:00', 'project1_new.png', NULL, 'Tại dự dự án căn hộ chung cư nhà anh Phương Việt Á Đông đã cải tạo không gian nội thất phòng khách, phòng thư giãn, phòng ăn, không gian bếp, phòng thờ và 4 phòng ngủ. Toàn bộ nội thất trong căn hộ được sử dụng gỗ óc chó tự nhiên sang trọng. Nội thất gỗ óc chó đang được giới thượng lưu ưa chuộng trong những năm gần đây. Đây là dòng gỗ được nhập khẩu từ Bắc Mỹ, có độ bền cao và hệ thống vân gỗ tự nhiên đa dạng, mang vẻ đẹp mộc mạc nhưng vô cùng sang trọng. Những món đồ nội thất được tạo nên từ gỗ óc chó luôn thu hút người xem ngay từ cái nhìn đầu tiên.', 1, 0, 'NỘI THẤT CĂN HỘ CHUNG CƯ CAO CẤP – HOÀNG ĐẠO THÚY'),
('bba6d0b9-e91e-4b20-94b7-14ba860d21bc', '2021-09-19 00:00:00', 'project2_new.png', NULL, 'Khu đô thị Hồ Xương Rồng tọa lạc tại vị trí trung tâm thành phố Thái Nguyên (Công ty cổ phần Sông Đà 2 làm chủ đầu tư). Khu đô thị có hồ nước rộng 9ha. Đây là khu đô thị cao cấp, góp phần tạo ra một điểm nhấn quan trọng cho bức tranh đô thị Thái Nguyên. Gia đình  sở hữu ngôi biệt thự rộng 210m2 tại khu đô thị hồ xương rồng. Với mong muốn tất cả các thành viên trong gia đình được tận hưởng giây phút thư giãn thoải mái nhất trong chính ngôi nhà của mình. Gia chủ đã lựa chọn Việt Á Đông cho công trình thiết kế nội thất của gia đình cùng vật liệu chủ đạo là gỗ óc chó.', 1, 0, 'THI CÔNG THIẾT KẾ NỘI THẤT BIỆT THỰ HỒ XƯƠNG RỒNG'),
('e9a74c05-9db2-46cb-b792-a0c8aed8f314', '2021-09-19 00:00:00', 'project3_new.png', NULL, 'Trong kiến trúc nhà ở biệt thự là không gian đẳng cấp nhất, được nhiều người mơ ước nhất. Vì vậy, các gia chủ thường rất kỹ tính trong việc lựa chọn đơn vị thiết kế nội thất để trang hoàng cho ngôi biệt thự của gia đình. Để xứng tầm đẳng cấp cho căn biệt thự rộng 500m2 đã lựa chọn Việt Á Đông thi công thiết kế nội thất biệt thự bằng gỗ óc chó cho tổ ấm của gia đình. Mời quý vị cùng chiêm ngưỡng vẻ đẹp đẳng cấp nội thất gỗ óc chó đằng sau cánh cửa của gia đình được việt Á Đông thiết kế như thế nào nhé.', 1, 1, 'THIẾT KẾ NỘI THẤT GỖ ÓC CHÓ TẠI BIỆT THỰ ĐẶNG XÁ'),
('eb9bf535-2393-44d8-81ef-df06f003ea5b', '2021-09-19 00:00:00', 'project4_new.png', NULL, 'Biệt thự liền kề gia đình có tổng diện tích 87m2. Được thiết kế thi công hoàn thiện bởi Nội thất Việt Á Đông. Toàn bộ thiết kế nội thất sử dụng vật liệu gỗ óc chó cao cấp nhập khẩu từ Bắc Mỹ. Mang đến không gian sang trọng, tiện nghi, hiện đại.', 1, 1, 'THIẾT KẾ NỘI THẤT GỖ ÓC CHÓ BIỆT THỰ LIỀN KỀ NGUYỄN TRÃI'),
('f1852909-5f91-49ba-9b31-7b0b2c145123', '2021-09-19 00:00:00', 'project5_new.png', NULL, 'Dự án nội thất biệt thự gỗ gõ đỏ tại Lideco được Việt Á Đông thi công thiết kế với phong cách tân cổ điển. Mang nét đẹp sang trọng. Gia chủ là một người yêu thích nội thất bằng gỗ tự nhiên nên toàn bộ nội thất đều được sử dụng bằng gỗ gõ đỏ.', 0, 0, 'THIẾT KẾ NỘI THẤT BIỆT THỰ GỖ GÕ ĐỎ LIDECO');

-- 
-- Dumping data for table product_category
--
INSERT INTO product_category VALUES
('33757229-0b61-4e52-8415-752b6387f551', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 'Bàn ghế trẻ ăn', '1', 'loai-sp-banghetreem.png', 'Trẻ em'),
('6bcd08e4-eabe-49f2-ba24-6433a30a924c', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 'Tủ quần áo', '1', 'loai-sp-tuquanao.png', 'Phòng ngủ'),
('728bb108-c820-40f6-9f96-30434a486c02', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 'Ghế ăn', '1', 'loai-sp-ghean.png', 'Nhà bếp'),
('7a7b922a-2ccd-441d-8a38-c89746772fb4', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 'Giường', '1', 'loai-sp-giuong.png', 'Phòng ngủ'),
('80796201-d22b-4630-9727-0babfbcfb4e9', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 'Sàn gỗ tự nhiên', '1', 'loai-sp-sango.png', 'Sàn gỗ'),
('d12fe84e-558b-4843-9e5f-51310b05feb4', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 'Bộ bàn ăn', '1', 'loai-sp-banan.png', 'Nhà bếp'),
('fa6423d6-c959-482c-9d24-bb27e91b946d', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 'Bộ ghế Sofa', '0', 'loai-sp-sofa.png', 'Phòng khách');

-- 
-- Dumping data for table product
--
INSERT INTO product VALUES
('1b4d6f69-167d-420f-94e6-bb0c0f7269b8', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 956956, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Giường ngủ gỗ Lim', 'Chiều cao đầu giường: 110 cm\r\nChiều cao chân giường: 60 cm\r\nChiều dài: 200 cm\r\nChiều rộng: 180 cm', 1, 'giuong2.png', 'Gemmy wood', 'Gỗ Lim', 'Giường ngủ gỗ Lim', 46000000, 35900000, '7a7b922a-2ccd-441d-8a38-c89746772fb4'),
('2d60bfe0-77a6-4773-a943-da0807aa71df', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 19314485, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bộ bàn ăn 4 ghế gỗ thông', 'Chi tiết xem sản phẩm', 1, 'table2_1.png', 'Gemmy wood', 'Gỗ thông', 'Bộ bàn ăn 4 ghế gỗ thông', 7900000, 5900000, 'd12fe84e-558b-4843-9e5f-51310b05feb4'),
('3df5505b-3bf5-11ec-8d07-98e7430c3bbc', '2021-11-02 22:55:03', '2021-11-03 09:09:18', 3, '12321123', '12312312', '12312', 5, 'cate2.png', '12312312', '312312123', '12312', 111111, 111111, '6bcd08e4-eabe-49f2-ba24-6433a30a924c'),
('4604dbc5-c51c-420b-a5d3-647143f3e3da', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 19314485, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Ghế thư giãn trẻ em', 'Chiều rộng : 47 cm\r\n\r\nĐộ sâu : 56 cm\r\n\r\nChiều cao : 68 cm\r\n\r\nChiều rộng ghế : 38 cm\r\n\r\nChiều sâu ghế : 36 cm\r\n\r\nChiều cao ghế : 24 cm', 1, 'sp-ghe-tre-em-1.png', 'Gemmy wood', 'Gỗ thông', 'Ghế thư giãn trẻ em', 1450000, 1200000, '33757229-0b61-4e52-8415-752b6387f551'),
('4af5647e-3f57-4d72-960f-6eafca4046a0', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 19514483, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bộ bàn ăn gỗ keo 6 ghế', 'Chi tiết xem sản phẩm', 1, 'table3_1.png', 'Gemmy wood', 'Gỗ keo', 'Bộ bàn ăn gỗ keo 6 ghế', 13900000, 10900000, 'd12fe84e-558b-4843-9e5f-51310b05feb4'),
('536e528a-df82-43a2-95e5-9e8c52b49924', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 956956, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bộ ghế Sofa gỗ Óc chó', 'Ghế sofa ba chỗ:\r\nChiều cao: 72 cm\r\nChiều sâu: 75 cm\r\nChiều rộng: 210 cm\r\n\r\nGhế sofa đơn:\r\nChiều cao: 72 cm\r\nChiều sâu: 75 cm\r\nChiều rộng: 79 cm\r\n\r\nBàn:\r\nChiều cao: 45.5 cm\r\nChiều dài: 122 cm\r\nChiều rộng: 60 cm', 1, 'sofa2.png', 'Gemmy wood', 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bộ ghế Sofa gỗ Óc chó', 120500000, 101000000, 'fa6423d6-c959-482c-9d24-bb27e91b946d'),
('54bd4d1b-3b8a-11ec-8d07-98e7430c3bbc', '2021-11-02 10:09:45', '2021-11-02 10:09:45', 1, 'Abc', 'aaaaa', '10', 23432, 'cate1.png', 'Abc', 'Gỗ lim', 'Ghế ', 10000000, 100000, '1253c55e-11ef-47d2-939c-f8af2ab5b47e'),
('701ffd83-dff0-4d98-a8e0-6caa873400bf', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 253242134, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bộ giường đôi gỗ keo', 'Chiều cao đầu giường: 102 cm\r\nChiều cao chân giường: 61.5 cm\r\nChiều dài tối đa: 210 cm\r\nChiều rộng tối đa: 180 cm', 1, 'giuong3.png', 'Gemmy wood', 'Gỗ keo', 'Bộ giường đôi gỗ keo', 19900000, 15900000, '7a7b922a-2ccd-441d-8a38-c89746772fb4'),
('7bc0d460-08f9-4c30-8c02-6bdde1a84fa3', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 19414485, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bộ ghế Sofa gỗ Teak', 'Ghế sofa ba chỗ:\r\nChiều cao: 72 cm\r\nChiều sâu: 75 cm\r\nChiều rộng: 210 cm\r\n\r\nSofa hai chỗ:\r\nChiều cao: 72 cm\r\nChiều sâu: 75 cm\r\nChiều rộng: 145 cm\r\n\r\nGhế sofa đơn:\r\nChiều cao: 72 cm\r\nChiều sâu: 75 cm\r\nChiều rộng: 79 cm', 1, 'sofa4.png', 'Gemmy wood', 'Gỗ Teak', 'Bộ ghế Sofa gỗ Teak', 29900000, 22600000, 'fa6423d6-c959-482c-9d24-bb27e91b946d'),
('7ef663da-5c24-4064-a30c-72fae77b6c52', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 19414485, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Ghế ăn gỗ Óc chó sang trọng', 'Rộng: 48 cm\r\nSâu: 50 cm\r\nCao: 83 cm', 1, 'sp-ghe-an-go-oc-cho-1.png', 'Gemmy wood', 'Gỗ óc chó', 'Ghế ăn gỗ Óc chó sang trọng', 1370000, 1150000, '728bb108-c820-40f6-9f96-30434a486c02'),
('84a3c7f2-3bf3-11ec-8d07-98e7430c3bbc', '2021-11-02 22:42:42', '2021-11-02 22:42:42', 2, '12312123123', 'aaaaa', '12312312', 12, '5.png', 'Gemmy wood', '12312123', '12312', 12312312, 12312312, '1253c55e-11ef-47d2-939c-f8af2ab5b47e'),
('8a34ff09-aceb-4f98-8ecf-c3ef0dfe5065', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 987049, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Tủ quần áo 3 cánh', 'Chiều sâu: 53 cm\r\nChiều rộng: 147 cm\r\nChiều cao: 224 cm', 1, 'sp-tu-1.png', 'Gemmy wood', 'Gỗ óc chó', 'Tủ quần áo 3 cánh', 26500000, 21900000, '6bcd08e4-eabe-49f2-ba24-6433a30a924c'),
('a1e584a5-4845-4b9d-8887-c0ef25ce7c5e', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 19314485, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bàn ghế trẻ em BE001', 'Kích thước bàn:\r\n\r\nChiều dài : 83 cm\r\n\r\nChiều rộng : 58 cm\r\n\r\nChiều cao : 48 cm\r\n\r\nKích thước ghế:\r\n\r\nChiều rộng : 24 cm\r\n\r\nĐộ sâu : 24 cm\r\n\r\nChiều cao ghế : 28 cm\r\n\r\nTối đa tải : 35 kg', 1, 'sp-ghe-tre-em-2.png', 'Gemmy wood', 'Gỗ thông', 'Bàn ghế trẻ em BE001', 2700000, 2150000, '33757229-0b61-4e52-8415-752b6387f551'),
('aa80041c-a5d3-4e49-8132-477554221978', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 1584324, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bộ ghế Sofa gỗ Mun', 'Ghế sofa ba chỗ:\r\nChiều cao: 72 cm\r\nChiều sâu: 75 cm\r\nChiều rộng: 210 cm\r\n\r\nSofa hai chỗ:\r\nChiều cao: 72 cm\r\nChiều sâu: 75 cm\r\nChiều rộng: 145 cm\r\n\r\nGhế sofa đơn:\r\nChiều cao: 72 cm\r\nChiều sâu: 75 cm\r\nChiều rộng: 79 cm', 1, 'sofa3.png', 'Gemmy wood', 'Gỗ mun', 'Bộ ghế Sofa gỗ Mun', 42200000, 35900000, 'fa6423d6-c959-482c-9d24-bb27e91b946d'),
('ae6536c6-45c0-45c5-a7d7-b4aedcc5c1e6', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 253242134, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Sàn gỗ keo', 'Rộng: 20 cm\r\nDày: 1 cm\r\nDài: 80 cm', 1, 'san-go-keo.png', 'Gemmy wood', 'Gỗ keo', 'Sàn gỗ keo', 1400000, 1050000, '80796201-d22b-4630-9727-0babfbcfb4e9'),
('b24ecb98-e9ba-4920-ab89-365c8e12076f', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 19614184, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bộ tủ quần áo gỗ thông', 'Tủ 3 đầu giường 3 ngăn kéo:\r\nChiều cao: 60 cm\r\nChiều rộng: 48 cm\r\nChiều sâu:  40 cm\r\n\r\nTủ 5 ngăn kéo:\r\nChiều cao: 98 cm\r\nChiều rộng: 93 cm\r\nChiều sâu:  42 cm\r\n\r\nTủ quần áo 2 cánh:\r\nChiều cao: 190 cm\r\nChiều rộng: 120 cm\r\nChiều sâu:  58 cm', 1, 'sp-tu-2.png', 'Gemmy wood', 'Gỗ thông', 'Bộ tủ quần áo gỗ thông', 17900000, 12500000, '6bcd08e4-eabe-49f2-ba24-6433a30a924c'),
('cba6df98-bb53-4b66-baed-2f3ccdf05f01', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 19414485, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Ghế ăn gỗ Sồi', 'Rộng: 48 cm\r\nSâu: 50 cm\r\nCao: 83 cm', 1, 'sp-ghe-an-go-soi-1.png', 'Gemmy wood', 'Gỗ sồi', 'Ghế ăn gỗ Sồi', 1170000, 950000, '728bb108-c820-40f6-9f96-30434a486c02'),
('cea45034-afaf-4df4-88ed-1518034b3899', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 255255255, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Giường ngủ gỗ Thông', 'Chiều cao đầu giường: 102 cm\r\nChiều cao chân giường: 61.5 cm\r\nChiều dài: 200 cm\r\nChiều rộng: 150 cm', 1, 'giuong4.png', 'Gemmy wood', 'Gỗ thông', 'Giường ngủ gỗ Thông', 18500000, 13900000, '7a7b922a-2ccd-441d-8a38-c89746772fb4'),
('d6ff20c3-036b-44da-998e-35970ef9707d', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 183182180, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Bộ ghế Sofa nỉ hiện đại', '2 Ghế sofa hai chỗ: Chiều cao: 72cm Chiều rộng: 75 cm Chiều dài: 180 cm / Bàn: Chiều cao: 45 cm Chiều dài: 120 cm Chiều rộng: 58 cm', 1, 'sofa1.png', 'Gemmy wood', 'Gỗ thông', 'Bộ ghế Sofa nỉ hiện đại', 38600000, 33900000, 'fa6423d6-c959-482c-9d24-bb27e91b946d'),
('e43be20c-3c4a-11ec-8d07-98e7430c3bbc', '2021-11-03 09:08:09', '2021-11-03 09:08:38', 3, '12231123123', '13211212312', '123131', 5, '4.png', '12123231123', '121123', '1231231', 1111, 111111, '33757229-0b61-4e52-8415-752b6387f551'),
('f2f8ab6e-ad19-49ba-a5e3-9e2ebcf11f78', '2021-09-19 00:00:00', '2021-09-19 00:00:00', 253242134, 'Sản phẩm này được bảo hành 1 năm bao gồm các lỗi sản xuất, các vấn đề về mối mọt. Đối với các sản phẩm được bọc, bảo hành áp dụng cho khung, đệm và các cơ chế, nếu có.', 'Giường đơn gỗ óc chó', 'Chiều cao đầu giường: 90 cm\r\nChiều cao chân giường: 60 cm\r\nChiều dài: 195 cm\r\nChiều rộng: 140 cm', 1, 'giuong1.png', 'Gemmy wood', 'Gỗ óc chó', 'Giường đơn gỗ óc chó', 26500000, 20900000, '7a7b922a-2ccd-441d-8a38-c89746772fb4');

-- 
-- Dumping data for table order_detail
--
INSERT INTO order_detail VALUES
('2b989a33-ab80-47da-a00c-cf37df0e8690', 4, '536e528a-df82-43a2-95e5-9e8c52b49924', 'ea17eabf-3ad7-48e4-b0c3-ca2eb93599ac', 'Bộ ghế Sofa gỗ Óc chó', 101000000);

-- 
-- Dumping data for table `order`
--
INSERT INTO `order` VALUES
('2b989a33-ab80-47da-a00c-cf37df0e8690', 'Hà Nội', '2021-12-06 14:54:37.071', 'dat123456', '2021-12-06 14:54:37.071', 'ok', 0, '128731831', '0530d44e-34d9-11ec-9f32-b00cd19df262', 'dat123456', 4);

-- 
-- Dumping data for table news
--
INSERT INTO news VALUES
('bba6d0b9-e91e-4b20-94b7-14ba860d21bd', '2021-09-19 00:00:00', 'newss1.jpg', NULL, 'Những sản phẩm sàn gỗ công nghiệp đến từ Hàn Quốc luôn đạt được sự tinh tế trong thiết kế và nhẹ nhàng trong màu sắc, sàn gỗ Hàn Quốc là dòng sản phẩm sàn nằm trong top đầu những loại sàn gỗ công nghiệp được nhập khẩu về Việt Nam sớm nhất từ những năm 2000. Sàn gỗ công nghiệp Hàn Quốc luôn được nhiều khách hàng yêu thích không chỉ bởi màu sắc sàn trang nhã, vân gỗ sang trọng mà giá sàn gỗ công nghiệp Hàn Quốc cũng vô cùng phù hợp với khả năng tài chính của người dùng. Bên dưới là giá chi tiết hai dòng sàn gỗ Hàn Quốc DONGWHA và Hansol phổ biến nhất hiện tại.\r\n\r\nSàn gỗ DONGWHA (dày 8mm) : 265.000 đ/m2 bảo hành 10 năm.\r\nSàn gỗ Hansol (dày 8mm) : 270.000 đ/m2 bảo hành 10 năm.\r\n\r\nSàn gỗ công nghiệp Hàn Quốc thuộc dòng sàn gỗ công nghiệp chịu nước phù hợp với thời tiết thay đổi thất thường tại Việt Nam. Sàn gỗ Hàn Quốc với lõi HDF cứng cáp cùng bề mặt chống trầy AC4 cho sàn ổn định theo thời gian sử dụng. Vậy những ưu, khuyết điểm nào làm nên thương hiệu của dòng sàn gỗ công nghiệp Hàn Quốc?', 1, 1, 1, 1, 0, 'Báo giá sàn gỗ 2020, Giá sàn gỗ công nghiệp Việt Nam, Hàn Quốc'),
('bba6d0b9-e91e-4b20-94b7-14ba860d21be', '2021-09-19 00:00:00', 'newss2.jpg', NULL, 'Nếu bạn đang ấp ủ ý tưởng về một bể bơi trong sân nhà thì đừng ngần ngại. Mùa hè này chính là thời điểm thích hợp để biến mơ ước này thành hiện thực với vô vàn thiết kế đẹp mắt dành cho bạn.\r\n\r\nNếu bạn đang ấp ủ ý tưởng về một bể bơi trong sân nhà thì đừng ngần ngại. Mùa hè này chính là thời điểm thích hợp để biến mơ ước này thành hiện thực với vô vàn thiết kế đẹp mắt dành cho bạn.\r\n\r\nBơi lội là một trong những cách tốt nhất để giữ dáng và bảo vệ sức khỏe; tuy nhiên việc đi đến các hồ bơi công cộng lại khiến bạn có nhiều e ngại. Bạn muốn có một bể bơi của riêng mình nhưng sân sau lại quá hẹp? Thật ra vấn đề này đã được giải quyết, một bể bơi nho nhỏ dành riêng cho khoảng sân sau nhỏ là một điều hoàn toàn có thể thực hiện được.', 1, 1, 1, 0, 1, 'Ý tưởng sử dụng gỗ nhựa ngoài trời Awood trang trí cho hồ bơi & sân vườn cực đẹp'),
('bba6d0b9-e91e-4b20-94b7-14ba860d21bf', '2021-09-19 00:00:00', 'newss2.jpg', NULL, 'Không gian thiết kế trên được lên ý tưởng bởi Charles và Ray Eames, là sự kết hợp những chiếc ghế đơn mang biểu trưng sự hiện đại, chiếc ghế cong mang cảm giác thoải mái ở màu sắc tươi mới, kết hợp chân ghế biểu tưởng tháp Eiffel, với bàn lớn mặt bàn trang trí đá hoa cương cho không gian tươi mát, mang các thành viên gia đình quây quần bên nhau vui đùa.', 0, 1, 1, 1, 1, 'Ý tưởng màu sắc thiết kế đương đại');

-- 
-- Dumping data for table contact
--
-- Table webnoithat_java.contact does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;