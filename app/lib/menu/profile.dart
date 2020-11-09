import 'package:expert_properties/constants.dart';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            'Your Profile',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            //  any changes, change in constants.dart
          ),
          elevation: 0.0,
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     iconSize: 30.0,
          //     color: Colors.white,
          //     onPressed: () {},
          //   ),
          // ],
        ),
        backgroundColor: kActiveBgCardColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/jerry.jpg'),
              ),
              Text(
                'Jerry',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Location',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                  height: 20.0,
                  width: 150,
                  child: Divider(
                    color: Colors.teal.shade100,
                  )), //i used sized box to give space bw the logo nd the boxes + added one divider line
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '8056533860',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ), // this bow is created with container
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.mail,
                        color: Colors.teal.shade900,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'mailid@gmail.com',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    ],
                  ),
                ),
              ), //this box is created with card and row
              // Card(
              //   color: Colors.white,
              //   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.mail,
              //       color: Colors.teal.shade900,
              //     ),
              //     title: Text(
              //       'mailid@gmail.com',
              //       style: TextStyle(
              //         color: Colors.teal.shade900,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20.0,
              //         fontFamily: 'Source Sans Pro',
              //       ),
              //     ),
              //   ),
              // ), //this card is created with list tile
            ],
          ),
        ),
      ),
    );
  }
}
