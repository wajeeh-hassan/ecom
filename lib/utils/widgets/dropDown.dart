import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors_constants/colors.dart';
import '../helpers/styles.dart';

class Customized_DropDown extends StatelessWidget {
  String hintText;
  String name;

  List<String> items;
  String dropdownvalue;

  final Function(String) itemSelected;

  // List of items in our dropdown menu
  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  Customized_DropDown(
      {Key? key,
      required this.name,
      required this.hintText,
      required this.items,
      required this.dropdownvalue,
      required this.itemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // items = items.toSet().toList();

    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: borderGreyColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: StatefulBuilder(builder: (context, StateSetter setState) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  // Initial Value
                  value: dropdownvalue,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    itemSelected(newValue ?? "");
                    setState(() {
                      dropdownvalue = newValue ?? "";
                    });
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
