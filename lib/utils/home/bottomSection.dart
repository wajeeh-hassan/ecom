

import 'package:flutter/material.dart';



class BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              // Your website content goes here
              child: Center(
                child: Text('Website Content'),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Stay Connected',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Follow us on social media for updates and news!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook),
                      onPressed: () {
                        // Open Facebook link
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.mail),
                      onPressed: () {
                        // Open Twitter link
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {
                        // Open Instagram link
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
    );
  }
}
