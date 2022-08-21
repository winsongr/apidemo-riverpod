import 'dart:convert';

import 'package:apidemo/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>> getProduct() async {
    List<ProductModel> productList = [];

    String url = 'https://fakestoreapi.com/products';

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);
    for (var singleProduct in responseData) {
      ProductModel? productModel = await compute(
          ProductModel.parseInfo, singleProduct as Map<String, dynamic>);

      productList.add(productModel!);
    }
    return productList;
  }
}
