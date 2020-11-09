import 'package:expert_properties/maincreens/first_page.dart';
import 'package:expert_properties/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:expert_properties/constants.dart';

final Color backgroundColor = kActiveBgCardColor;

class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 300);
  Animation<Offset> _slideAnimation;
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          FirstPage(context), //dashboardContext
        ],
      ),
    );
  }
}

Widget menu(context) {
  Animation<Offset> _slideAnimation;
  // return SlideTransition(
  //   position: _slideAnimation,
  //   child:
  return Padding(
    padding: EdgeInsets.only(left: 10.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/images/LOGO V2 PNG (1).png",
                width: 180,
                height: 180,
              ),
              Positioned(
                  left: 25,
                  top: 150,
                  width: 300,
                  height: 80,
                  child: Text("powered by FXCorp"))
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Profile();
                },
              ));
            },
            leading: Icon(Icons.person),
            title: Text(
              "Your Profile",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped settings");
            },
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          // Divider(
          //   height: 1,
          //   color: Colors.grey,
          // ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Favorites");
            },
            leading: Icon(Icons.payment),
            title: Text("Favorites"),
          ),

          // ListTile(
          //   onTap: () {
          //     debugPrint("Tapped Notifications");
          //   },
          //   leading: Icon(Icons.notifications),
          //   title: Text("Notifications"),
          // ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Log Out");
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    ),
    // ),
  );
}
