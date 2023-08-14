
import 'package:flutter/cupertino.dart';


class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class CategorySection {
  final String name;
  final List<Product> products;
  CategorySection({required this.name, required this.products});
}


class CategoryListWidget extends StatefulWidget {
  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
   List<CategorySection> categories = [];

  void loadCategories(){
    categories.add(CategorySection(
      name: 'Electronics',
      products: [
        Product(name: 'Smartphone', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 599.99),
        Product(name: 'Laptop', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 999.99),
        Product(name: 'Headphones', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 149.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),

      ],
    ));

    categories.add( CategorySection(
      name: 'Clothing',
      products: [
        Product(name: 'T-Shirt', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 19.99),
        Product(name: 'Jeans', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 39.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Sneakers', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),

      ],
    ));


    categories.add( CategorySection(
      name: 'Food',
      products: [
        Product(name: 'Burger', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 19.99),
        Product(name: 'Shawarma', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 39.99),
        Product(name: 'Pasta', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Sandwich', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Dall chawal', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Kheer', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'Qoorma', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),
        Product(name: 'raita/salad', imageUrl: 'https://picsum.photos/seed/picsum/200/300', price: 79.99),

      ],
    ));



  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    loadCategories();
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: categories.map((category) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  category.name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 250.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width:MediaQuery.of(context).size.width / 6,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Image.network(category.products[index].imageUrl, fit: BoxFit.fill),height: 200,
                          ),
                          SizedBox(height: 8.0),
                          Text(category.products[index].name),
                          Text('\$${category.products[index].price.toStringAsFixed(2)}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

