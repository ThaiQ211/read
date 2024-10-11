CREATE DATABASE QL_PKDIENTHOAI
GO
USE QL_PKDIENTHOAI
GO





-- Bảng Loại sản phẩm
CREATE TABLE LoaiSanPham (
    MaLoaiSanPham NVARCHAR(20) PRIMARY KEY,
    TenLoaiSanPham NVARCHAR(50) NOT NULL
);

-- Bảng Nhà cung cấp
CREATE TABLE NhaCungCap (
    MaNhaCungCap NVARCHAR(20) PRIMARY KEY,
    TenNhaCungCap NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(50),
    SoDienThoai NVARCHAR(15),
    Email NVARCHAR(50)
);


-- Bảng Sản phẩm
CREATE TABLE SanPham (
    MaSanPham NVARCHAR(20) PRIMARY KEY,
    TenSanPham NVARCHAR(50) NOT NULL,
    
    MoTa NVARCHAR(200),
    GiaBan FLOAT NOT NULL,
    SoLuongTon INT,
    MaNhaCungCap NVARCHAR(20),
	MaLoaiSanPham NVARCHAR(20),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap),
	FOREIGN KEY (MaLoaiSanPham) REFERENCES LoaiSanPham(MaLoaiSanPham)
);



-- Bảng Khách hàng
CREATE TABLE KhachHang (
    MaKhachHang NVARCHAR(20) PRIMARY KEY,
    TenKhachHang NVARCHAR(50) NOT NULL,
    SoDienThoai NVARCHAR(15),
    Email NVARCHAR(50),
    DiaChi NVARCHAR(50)
);

-- Bảng Đơn hàng
CREATE TABLE DonHang (
    MaDonHang NVARCHAR(20) PRIMARY KEY,
    MaKhachHang NVARCHAR(20) NOT NULL,
    NgayDatHang DATETIME NOT NULL,
    TinhTrangDonHang NVARCHAR(50),
    TongTien FLOAT,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

-- Bảng Chi tiết đơn hàng
CREATE TABLE ChiTietDonHang (
    MaDonHang NVARCHAR(20) NOT NULL,
    MaSanPham NVARCHAR(20) NOT NULL,
    SoLuong INT,
    DonGia FLOAT,
    PRIMARY KEY (MaDonHang, MaSanPham),  -- Khóa chính tổng hợp
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

-- Bảng Hóa đơn
CREATE TABLE HoaDon (
    MaHoaDon NVARCHAR(20) PRIMARY KEY,
    MaDonHang NVARCHAR(20) NOT NULL,
    NgayThanhToan DATETIME NOT NULL,
    TongTien FLOAT,
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
);

-- Bảng Nhập kho
CREATE TABLE NhapKho (
    MaNhapKho NVARCHAR(20) NOT NULL,
    MaSanPham NVARCHAR(20) NOT NULL,
    MaNhaCungCap NVARCHAR(20) NOT NULL,
    NgayNhapKho DATETIME NOT NULL,
    SoLuongNhap INT,
    GiaNhap FLOAT,
    PRIMARY KEY (MaNhapKho, MaSanPham),  -- Khóa chính tổng hợp
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
);

-- Bảng Nhân viên
CREATE TABLE NhanVien (
    MaNhanVien NVARCHAR(20) PRIMARY KEY,
    TenNhanVien NVARCHAR(50) NOT NULL,
    ChucVu NVARCHAR(20),
    SoDienThoai NVARCHAR(15),
    Email NVARCHAR(50),
    Luong FLOAT
);

-- Bảng Báo cáo doanh thu
CREATE TABLE BaoCaoDoanhThu (
    MaBaoCao NVARCHAR PRIMARY KEY,
    Thang INT NOT NULL,
    Nam INT NOT NULL,
    TongDoanhThu FLOAT
);
