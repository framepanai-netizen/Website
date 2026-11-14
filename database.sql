-- สร้างและเลือกฐานข้อมูล
CREATE DATABASE IF NOT EXISTS frameshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE frameshop;

-- 1. ตารางเก็บข้อมูลสมาชิก
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    credit DECIMAL(10,2) DEFAULT 0.00,
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. ตารางเก็บข้อมูลสินค้าและบริการ (สคริปต์, รับเปิดเซิร์ฟ, VPS)
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category ENUM('script', 'server', 'vps') NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    delivery_data TEXT NOT NULL, -- ข้อมูลส่งมอบอัตโนมัติ เช่น ลิงก์ดาวน์โหลด หรือ IP VPS
    stock INT DEFAULT 99
);

-- 3. ตารางประวัติการสั่งซื้อสินค้า
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    received_data TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. เพิ่มรายการสินค้าตัวอย่าง
INSERT INTO products (name, category, price, description, delivery_data, stock) VALUES
('สคริปต์ระบบกาชาปอง 3D', 'script', 300.00, 'สุ่มไอเทมพร้อมอนิเมชั่นสวยงาม รองรับมือถือ/PC', 'ลิงก์โหลด: https://drive.google.com/file/d/gacha-3d-v2', 99),
('สคริปต์ระบบงานดำ + ปล้นร้าน', 'script', 500.00, 'ระบบงัดร้านค้า แจ้งเตือนตำรวจอัตโนมัติ', 'ลิงก์โหลด: https://drive.google.com/file/d/robbery-system', 99),
('แพ็กเกจเปิดเซิร์ฟพร้อมเล่น', 'server', 1500.00, 'ตัวเกมมือถือ+PC + ระบบพื้นฐาน + ฟรี VPS 1 เดือน', 'รับเซิร์ฟเวอร์อัตโนมัติ Key: FRAME-SV-2026', 10),
('VPS Starter 4GB RAM', 'vps', 199.00, 'CPU 2 Core | RAM 4GB | SSD 50GB | กันยิง DDoS', 'IP: 103.253.44.12 | User: Administrator | Pass: Frame@2026', 5),
('สคริปต์ระบบแต่งรถ + จูนเครื่อง', 'script', 450.00, 'UI ทันสมัย ปรับสี ล้อ สปอยเลอร์ เซฟลงฐานข้อมูล', 'ลิงก์โหลด: https://drive.google.com/file/d/tuning-car-ui', 99),
('VPS Pro 8GB RAM', 'vps', 350.00, 'CPU 4 Core | RAM 8GB | SSD 80GB | รองรับ 150+ คน', 'IP: 103.253.44.88 | User: Administrator | Pass: FramePro#88', 8);
