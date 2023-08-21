import 'package:ecom/model/product.dart';

class CategoryModel {
  CategoryModel({
    required this.name,
    required this.products,
  });
  String name;
  List<Product> products;
}
