class QuanLyAnh {
  final String idanh;
  final String fileAnh;
  // Các thuộc tính khác của QuanLyAnh

  QuanLyAnh({required this.idanh, required this.fileAnh});
  factory QuanLyAnh.fromJson(Map<String, dynamic> json) {
    return QuanLyAnh(
        idanh: json['idanh'] as String? ?? '',
        fileAnh: json['fileAnh'] as String? ?? ''
    );
  }
  factory QuanLyAnh.defaultConstructor() {
    return QuanLyAnh(
      idanh: 'default_image_id',
      fileAnh: 'Default Name',
    );
  }

  @override
  String toString() {
    return 'QuanLyAnh{idanh: $idanh, fileAnh: $fileAnh}';
  }
}
List<QuanLyAnh> dataImage=[];