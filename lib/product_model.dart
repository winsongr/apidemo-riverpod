import 'dart:math';

class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  ProductModel.fromJson(Map<String, dynamic> json) {
    try {
      if (json['id'] is num) {
        id = json['id'];
      }
    } catch (e) {
      print('id $e');
    }
    try {
      if (json['title'] is String) {
        title = json['title'];
      }
    } catch (e) {
      print('title $e');
    }
    try {
      if (json['price'] is double || json['price'] is num) {
        price = json['price'].toDouble();
      }
    } catch (e) {
      print('price $e');
    }
    try {
      if (json['description'] is String) {
        description = json['description'];
      }
    } catch (e) {
      print('description $e');
    }
    try {
      if (json['category'] is String) {
        category = json['category'];
      }
    } catch (e) {
      print('category $e');
    }
    try {
      if (json['image'] is String) {
        image = json['image'];
      }
    } catch (e) {
      print('image $e');
    }
    try {
      rating =
          json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    } catch (e) {
      print('rating $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating?.toJson();
    }
    return data;
  }

  static Future<ProductModel?> parseInfo(Map<String, dynamic> json) async {
    try {
      // print(json);
      return ProductModel.fromJson(json);
    } catch (e) {
      print('ProductModel parseInfo exception : $e');
      return null;
    }
  }
}

class Rating {
  double? rate;
  double? count;

  Rating({required this.rate, required this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    try {
      if (json['rate'] is double || json['rate'] is num) {
        rate = json['rate'].toDouble();
      }
    } catch (e) {
      print('rate $e');
    }
    try {
      if (json['count'] is double || json['count'] is num) {
        count = json['count'].toDouble();
      }
    } catch (e) {
      print('count $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
