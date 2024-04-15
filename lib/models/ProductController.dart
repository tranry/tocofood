import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totofood/models/Product.dart';
import 'package:totofood/models/QuanLyAnh.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class ProductController extends GetxController {
  var demoProducts = <Product>[].obs;
  var isLoading = true.obs;
  StreamSubscription? _subscription;
  @override
  void onInit() {
    super.onInit();
    _listenToChanges();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  void _listenToChanges() {
    _subscription = fetchData(Get.context!).listen((newData) {
      demoProducts.assignAll(newData);
      update(); // Thông báo cập nhật dữ liệu để cập nhật giao diện người dùng
    });
  }
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? "";  // Handle the case where 'token' is null
  }
  Future<void> initData(BuildContext context) async {
    await fetchData(context);
    isLoading(false);

  }
  Stream<List<Product>> fetchData(BuildContext context) async* {
    while (true) {
      final String token = await getToken();
      var url = 'http://api.servepics.com:44318/api/SanPham/DanhSach';
      var headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        List<Product> products = [];
        await Future.forEach(data, (item) async {
          var product = Product.fromJson(item, await fetchDataImageForProduct(item['idanh']));
          products.add(product);
        });
        yield products; // Emit the updated data as part of the stream
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false);
      }
      await Future.delayed(Duration(seconds: 665)); // Wait for a period before fetching data again
    }
  }

  Future<QuanLyAnh> fetchDataImageForProduct(String idAnh) async {
    final String token = await getToken();
    var url = 'http://api.servepics.com:44318/api/QuanLyAnh/$idAnh';
    var headers = <String, String>{
      'accept': 'text/plain',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return QuanLyAnh.fromJson(data);
    } else {
      throw Exception('Failed to fetch image data');
    }
  }
}