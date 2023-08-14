import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../colors_constants/colors.dart';
import '../helpers/styles.dart';


class CustomizedTextField_DropDown extends StatelessWidget {
  String hintText;
  String name;
  dropDownItem itemSelectedValue;

  List<dropDownItem> items;

  final Function(dropDownItem) itemSelected;

  CustomizedTextField_DropDown(
      {Key? key,
      required this.name,
      required this.hintText,
      required this.itemSelectedValue,
      required this.items,
      required this.itemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // items = items.toSet().toList();

    return Column(
      children: [
        // --------------------- title ------------------------
        const SizedBox(
          height: 10,
        ),

        // --------------------- text field ------------------------
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: boxGreyColor,
          ),
          child: StatefulBuilder(builder: (context, StateSetter setState) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButton<dropDownItem>(
                      underline: Container(),
                      isExpanded: true,
                      // Initial Value
                      value: itemSelectedValue,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      selectedItemBuilder: (BuildContext context) {
                        return items.map((dropDownItem item) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              item.title ?? "",
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList();
                      },
                      // Array list of items
                      items: items.map((dropDownItem item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Row(
                            children: [
                              item == itemSelectedValue
                                  ? Image.asset(
                                      "assets/images/selected_idd.png",
                                      height: 15,
                                      width: 15,
                                    )
                                  : Image.asset(
                                      "assets/images/unselected_dd.png",
                                      // height: 23,
                                      width: 15,
                                    ),
                              SizedBox(width: 30),
                              Text(item.title),
                            ],
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (dropDownItem? newValue) {
                        print(newValue?.title);
                        itemSelectedValue = newValue!;
                        itemSelected(newValue!);
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

///-----------------------------------------------------------------

class searchTextField extends StatelessWidget {
  String? prefixImage;
  String? postfixImage;
  String hintText;
  String name;
  bool isFeildFocus;
  TextInputType keyBoardType;
  final Function(String) textChanged;

  // final VoidCallback callbackEyeIcon;
  // final Function(bool)? callbackFocus;

  searchTextField(
      {Key? key,
      required this.name,
      required this.hintText,
      required this.keyBoardType,
      this.isFeildFocus = false,
      this.prefixImage,
      this.postfixImage,
      required this.textChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible;
    // ----------------------------------------------
    // This checks if the text input type is Password
    // or something else-----------------------------
    if (keyBoardType == TextInputType.visiblePassword) {
      isPasswordVisible = false;
    } else {
      isPasswordVisible = true;
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: boxGreyColor,
                border: Border.all(color: borderGreyColor, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                    style: mediumWhiteText18(blackTextColor),
                    keyboardType: keyBoardType,
                    obscureText: isPasswordVisible ? false : true,
                    cursorColor: blackTextColor,
                    onChanged: (text) {
                      textChanged(text);
                    },
                    decoration: InputDecoration(
                      // suffixIconColor: blackTextColor,
                      border: InputBorder.none,
                      filled: true,
                      fillColor: boxGreyColor,
                      hintText: hintText,
                      prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search)),
                    )),
              );
            }),
          ),
        ),

      ],
    );
  }
}

class dropDownItem<T> {
  final String title;
  final T? data;
  dropDownItem({required this.title,required this.data});
}

