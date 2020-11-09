import 'package:expert_properties/components/bgCard.dart';
import 'package:expert_properties/components/category_selector.dart';
import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
// import 'package:expert_properties/components/foldables_sidebar.dart';

import 'listScreen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../components/iconText_button.dart';

class CommercialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAFabColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Commercial',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          //  any changes, change in constants.dart
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CategorySelector(),
              Expanded(
                flex: 7,
                child: BgCard(
                  colour: kActiveBgCardColor,
                  cardChild: ListScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
