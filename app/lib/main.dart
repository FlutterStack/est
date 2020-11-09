// import 'package:expert_properties/components/foldables_sidebar.dart';
import 'package:flutter/material.dart';
import 'maincreens/first_page.dart';
import 'package:expert_properties/routes.dart';

void main() => runApp(Properties());

class Properties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0a0a0a),
        scaffoldBackgroundColor: Color(0xFF0a0a0a),
      ),
      initialRoute: '/splash',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
