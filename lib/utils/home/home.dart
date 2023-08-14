import 'package:ecom/utils/colors_constants/colors.dart';
import 'package:ecom/utils/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'bottomSection.dart';
import 'categoryHorizontalList.dart';
import 'homeCrusal.dart';


class MainScreen extends StatelessWidget {
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
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 80,
                      height: 80,
                      child: Image.network(
                          fit : BoxFit.fill,
                          'https://picsum.photos/200/300?grayscale'
                      ),
                    ),

                    SizedBox(width: 16.0),

                    Expanded(
                      child: Center(
                        child: searchTextField(
                          name: "First Name",
                          hintText: "Enter First Name",
                          keyBoardType: TextInputType.text,
                          textChanged: (text) {
                          },
                        ),
                      ),
                    ),

                    SizedBox(width: 16.0),

                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          size: 48,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),


                  ],
                ),
              ),
            ),
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

