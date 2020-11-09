import 'package:expert_properties/components/bgCard.dart';
import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
// import 'package:expert_properties/data_model.dart';

import 'listScreen.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../components/iconText_button.dart';
enum SaleOrRent { sale, rent }

class ResidentialPage extends StatefulWidget {
  @override
  _ResidentialPageState createState() => _ResidentialPageState();
}

class _ResidentialPageState extends State<ResidentialPage> {
  SaleOrRent selectedOption = SaleOrRent.sale;
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
          'Residential Properties',
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
              Expanded(
                flex: 1,
                child: BgCard(
                  colour: kActiveBgCardColor,
                  cardChild: Row(
                    children: <Widget>[
                      Expanded(
                        child: BgCard(
                          onPress: () {
                            setState(() {
                              selectedOption = SaleOrRent.sale;
                            });
                          },

                          colour: selectedOption == SaleOrRent.sale
                              ? kButtonContainerColor
                              : kActiveBgCardColor, //any changes, change in constants.dart
                          cardChild: Center(
                            child: Expanded(
                              child: Text(
                                'Sale',
                                style: kBodyTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: BgCard(
                          onPress: () {
                            setState(() {
                              selectedOption = SaleOrRent.rent;
                            });
                          },
                          colour: selectedOption == SaleOrRent.rent
                              ? kButtonContainerColor
                              : kActiveBgCardColor, //any changes, change in constants.dart
                          cardChild: Center(
                            child: Expanded(
                              child: Text(
                                'Rent',
                                style: kBodyTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: BgCard(
                  colour: kActiveBgCardColor,
                  cardChild: selectedOption != SaleOrRent.rent
                      ? ListScreen()
                      : Center(
                          child: Text(
                            'hey, no rental properties are available yet..',
                            style: kTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
