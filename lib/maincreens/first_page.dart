import 'file:///C:/Users/Devi/AndroidStudioProjects/expert_properties/lib/components/bgCard.dart';
import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/iconText_button.dart';
// import 'package:foldable_sidebar/foldable_sidebar.dart';

class FirstPage extends StatefulWidget {
  FirstPage(context);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    final Duration duration = const Duration(milliseconds: 300);
    return AnimatedPositioned(
      top: isCollapsed ? 0 : 0.2 * screenHeight,
      bottom: isCollapsed ? 0 : 0.2 * screenWidth,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      duration: duration,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAFabColor,
          leading: IconButton(
            icon: InkWell(child: Icon(Icons.menu)),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
          ),
          title: Text(
            'Choose Property',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Material(
          color: Color(0x00ed0e0d),
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          elevation: 8,
          child: Center(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: BgCard(
                      colour:
                          kActiveBgCardColor, // any changes, change in constants.dart
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Expanded(
                            child: BgCard(
                              colour:
                                  kButtonContainerColor, // any changes, change in constants.dart
                              cardChild: IconTextButton(
                                icon: FontAwesomeIcons.warehouse,
                                text: 'Residential',
                              ),
                              onPress: () {
                                Navigator.pushNamed(context, '/residential');
                              },
                            ),
                          ),
                          Expanded(
                            child: BgCard(
                              colour:
                                  kButtonContainerColor, // any changes, change in constants.dart
                              cardChild: IconTextButton(
                                icon: FontAwesomeIcons.home,
                                text: 'Commercial',
                              ),
                              onPress: () {
                                Navigator.pushNamed(context, '/commercial');
                              },
                            ),
                          ),
                          Expanded(
                            child: BgCard(
                              colour:
                                  kButtonContainerColor, // any changes, change in constants.dart
                              cardChild: IconTextButton(
                                icon: FontAwesomeIcons.shopware,
                                text: 'Industrial',
                              ),
                              onPress: () {
                                Navigator.pushNamed(context, '/industrial');
                              },
                            ),
                          ),
                          Expanded(
                            child: BgCard(
                              colour:
                                  kButtonContainerColor, //  any changes, change in constants.dart
                              cardChild: IconTextButton(
                                icon: FontAwesomeIcons.mountain,
                                text: 'Agricultural',
                              ),
                              onPress: () {
                                Navigator.pushNamed(context, '/agricultural');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
