import 'package:flutter/material.dart';
import 'package:totofood/models/QuanLyAnh.dart';

class Product {
  final String idSanPham;
  final QuanLyAnh idAnh;
  final String tenSanPham;
  final double giaBan;
  final double giaVon;
  final String donVi;
  final int soLuongHienCo;
  final String ghiChu;
  final double rating;
  bool isFavourite, isPopular;
  Product({
    required this.idSanPham,
    required this.idAnh,
    required this.tenSanPham,
    required this.giaBan,
    required this.giaVon,
    required this.donVi,
    required this.soLuongHienCo,
    required this.ghiChu,
    this.rating=4.8,
    this.isFavourite=false,
    this.isPopular=true
  });
  factory Product.fromJson(Map<String, dynamic> json,QuanLyAnh image) {
    return Product(
      idSanPham: json['idsanPham'] as String? ?? '',
      idAnh: image,
      tenSanPham: json['tenSanPham'] as String? ?? '',
      giaBan: (json['giaBan'] as int?)?.toDouble() ?? 0,
      giaVon: (json['giaVon'] as int?)?.toDouble() ?? 0,
      donVi: json['donVi'] as String? ?? '',
      soLuongHienCo: json['soLuongHienCo'] as int? ?? 0,
      ghiChu: json['ghiChu'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'Product{idSanPham: $idSanPham, idAnh: $idAnh, tenSanPham: $tenSanPham, giaBan: $giaBan, giaVon: $giaVon, donVi: $donVi, soLuongHienCo: $soLuongHienCo, ghiChu: $ghiChu, rating: $rating, isFavourite: $isFavourite, isPopular: $isPopular}';
  } // Hàm khởi tạo không tham số tùy chỉnh
  factory Product.defaultConstructor() {
    return Product(
      idSanPham: 'default_id',
      idAnh: QuanLyAnh.defaultConstructor(),
      tenSanPham: 'Default Name',
      giaBan: 0,
      giaVon: 0,
      donVi: 'Default Unit',
      soLuongHienCo: 0,
      ghiChu: 'Default Note',
    );
  }
}

// Our demo Products

List<Product> demoProducts = [];