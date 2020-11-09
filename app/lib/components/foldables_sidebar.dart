// import 'package:expert_properties/constants.dart';
// import 'package:expert_properties/screens/first_page.dart';
// import 'package:flutter/material.dart';
// import 'package:foldable_sidebar/foldable_sidebar.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   FSBStatus drawerStatus;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: FoldableSidebarBuilder(
//           drawerBackgroundColor: Colors.black,
//           drawer: CustomDrawer(
//             closeDrawer: () {
//               setState(() {
//                 drawerStatus = FSBStatus.FSB_CLOSE;
//               });
//             },
//           ),
//           screenContents: FirstPage(),
//           status: drawerStatus,
//         ),
//         floatingActionButton: FloatingActionButton(
//             backgroundColor: Colors.black,
//             child: Icon(
//               Icons.menu,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               setState(() {
//                 drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
//                     ? FSBStatus.FSB_CLOSE
//                     : FSBStatus.FSB_OPEN;
//               });
//             }),
//       ),
//     );
//   }
// }
//
// class CustomDrawer extends StatelessWidget {
//   final Function closeDrawer;
//
//   const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData mediaQuery = MediaQuery.of(context);
//     return Container(
//       color: kActiveBgCardColor,
//       width: mediaQuery.size.width * 0.60,
//       height: mediaQuery.size.height,
//       child: Column(
//         children: <Widget>[
//           Container(
//               width: double.infinity,
//               height: 200,
//               color: Colors.grey.withAlpha(20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "assets/images/logow.png",
//                     width: 170,
//                     height: 170,
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text("powered by FXCorp")
//                 ],
//               )),
//           ListTile(
//             onTap: () {
//               debugPrint("Tapped Profile");
//             },
//             leading: Icon(Icons.person),
//             title: Text(
//               "Your Profile",
//             ),
//           ),
//           Divider(
//             height: 1,
//             color: Colors.grey,
//           ),
//           ListTile(
//             onTap: () {
//               debugPrint("Tapped settings");
//             },
//             leading: Icon(Icons.settings),
//             title: Text("Settings"),
//           ),
//           Divider(
//             height: 1,
//             color: Colors.grey,
//           ),
//           ListTile(
//             onTap: () {
//               debugPrint("Tapped Payments");
//             },
//             leading: Icon(Icons.payment),
//             title: Text("Payments"),
//           ),
//           Divider(
//             height: 1,
//             color: Colors.grey,
//           ),
//           ListTile(
//             onTap: () {
//               debugPrint("Tapped Notifications");
//             },
//             leading: Icon(Icons.notifications),
//             title: Text("Notifications"),
//           ),
//           Divider(
//             height: 1,
//             color: Colors.grey,
//           ),
//           ListTile(
//             onTap: () {
//               debugPrint("Tapped Log Out");
//             },
//             leading: Icon(Icons.exit_to_app),
//             title: Text("Log Out"),
//           ),
//         ],
//       ),
//     );
//   }
// }
