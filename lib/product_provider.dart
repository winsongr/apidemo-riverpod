import 'package:apidemo/product_model.dart';
import 'package:apidemo/product_repository.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];
  ProductProvider(ref);
  getProductData() async {
    productList = await ProductRepository().getProduct();
    notifyListeners();
  }
}
