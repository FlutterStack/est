import 'package:expert_properties/components/bgCard.dart';
import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../components/iconText_button.dart';

class ToSellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: BgCard(
                  colour:
                      kActiveBgCardColor, //any changes, change in constants.dart
                  cardChild: Center(
                    child: Text(
                      'Sell or Rent',
                      style:
                          kLargeTextStyle, //  any changes, change in constants.dart
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: BgCard(
                  colour: kActiveBgCardColor,
                  cardChild: Row(
                    children: <Widget>[
                      Expanded(
                        child: BgCard(
                          colour:
                              kButtonContainerColor, //any changes, change in constants.dart
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
                          colour:
                              kButtonContainerColor, //any changes, change in constants.dart
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
                flex: 4,
                child: BgCard(
                  colour: kActiveBgCardColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
