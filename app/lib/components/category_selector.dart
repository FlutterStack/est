import 'package:expert_properties/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> comCatergories = [
    'Hotel/Resort',
    'Office',
    'Store/Warehouse'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: kAFabColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: comCatergories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Text(
                comCatergories[index],
                style: TextStyle(
                    color:
                        index == selectedIndex ? Colors.white : Colors.white60,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    letterSpacing: 1.2),
              ),
            ),
          );
        },
      ),
    );
  }
}
