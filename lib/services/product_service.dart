import 'dart:convert';

import 'package:flutter_mini_project/models/product_model.dart';
import 'package:flutter_mini_project/route_generator_settings.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final urlApi = RouteGeneratorSettings.urlApi;

  Future<List<ProductModel>?> getAllDataProducts() async {
    Uri urlApiProduct = Uri.parse("$urlApi/products");

    try {
      http.Response dataProducts = await http.get(urlApiProduct);
      List<dynamic> dataProductsResult = jsonDecode(dataProducts.body);

      return dataProductsResult
          .map((value) => ProductModel.fromJson(value))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<ProductModel?> getDetailProduct(int idProduct) async {
    Uri urlApiDetailProduct = Uri.parse("$urlApi/products/$idProduct");

    try {
      http.Response dataDetailProduct = await http.get(urlApiDetailProduct);
      dynamic dataDetailProductResult = jsonDecode(dataDetailProduct.body);

      return ProductModel.fromJson(dataDetailProductResult);
    } catch (e) {
      return null;
    }
  }
}
