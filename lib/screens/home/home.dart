import 'package:ecom/utils/colorConstants.dart';
import 'package:ecom/utils/colors_constants/colors.dart';
import 'package:ecom/utils/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'bottomSection.dart';
import 'categoryHorizontalList.dart';
import 'homeCrusal.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('E-commerce App'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(),
            SizedBox(height: 16.0),
            CarouselWidget(),
            SizedBox(height: 16.0),

            CategoryListWidget(),
            SizedBox(height: 16.0),

            // BottomSection()
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Row(
          children: [
            SizedBox(width: 16.0),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              width: 50,
              height: 50,
              child: Image.network(
                  fit: BoxFit.fill, 'https://picsum.photos/200/300?grayscale'),
            ),
            SizedBox(width: 16.0),
            Flexible(
              flex: 2,
              child: Center(
                child: searchTextField(
                  name: "Search",
                  hintText: "Search the Products",
                  isFeildFocus: false,
                  keyBoardType: TextInputType.text,
                  textChanged: (text) {},
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(width: 16.0),
          ],
        ),
      ),
    );
  }
}
