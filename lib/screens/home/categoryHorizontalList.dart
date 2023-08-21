import 'package:ecom/utils/colorConstants.dart';
import 'package:ecom/utils/mockData.dart';
import 'package:ecom/utils/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatefulWidget {
  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  final productBGcolor = Colors.blueAccent.withOpacity(0.1);
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      loading = false;
      setState(() {});
    });
    // loadCategories();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: mockCategoryData.map((category) {
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
                child: Shimmer(
                  linearGradient: AppColors.shimmerGradient,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: productBGcolor,
                            borderRadius: BorderRadius.circular(10)),
                        width: 170,
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerLoading(
                              isLoading: loading,
                              child: CustomImageWidget(
                                image: category.products[index].imageUrl,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(category.products[index].name),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                  '\$${category.products[index].price.toStringAsFixed(2)}'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class CustomImageWidget extends StatefulWidget {
  const CustomImageWidget({
    required this.image,
    super.key,
  });

  final String image;

  @override
  State<CustomImageWidget> createState() => _CustomImageWidgetState();
}

class _CustomImageWidgetState extends State<CustomImageWidget> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) {
        hovering = true;
        setState(() {});
      },
      onExit: (value) {
        hovering = false;
        setState(() {});
      },
      child: Container(
        width: 170,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: hovering ? Colors.black38 : Colors.black12,
              spreadRadius: hovering ? 5 : 0,
              blurRadius: hovering ? 15 : 10,
              offset: Offset(0, 3))
        ], color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        child: Image.network(
          widget.image,
          fit: BoxFit.fill,
        ),
        height: 200,
      ),
    );
  }
}
