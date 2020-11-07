// import 'package:expert_properties/components/foldables_sidebar.dart';
import 'file:///C:/Users/Devi/AndroidStudioProjects/expert_properties/lib/menu/menuDashboard.dart';
import 'file:///C:/Users/Devi/AndroidStudioProjects/expert_properties/lib/maincreens/agricultural_page.dart';
import 'package:expert_properties/maincreens/commercial_page.dart';
import 'file:///C:/Users/Devi/AndroidStudioProjects/expert_properties/lib/maincreens/industrial_page.dart';
import 'file:///C:/Users/Devi/AndroidStudioProjects/expert_properties/lib/maincreens/residential_page.dart';
import 'package:expert_properties/maincreens/to_sell_page.dart';
import 'file:///C:/Users/Devi/AndroidStudioProjects/expert_properties/lib/maincreens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'maincreens/first_page.dart';

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
      routes: {
        '/': (context) => FirstPage(context),
        '/splash': (context) => SplashScreen(),
        '/residential': (context) => ResidentialPage(),
        '/commercial': (context) => CommercialPage(),
        '/industrial': (context) => IndustrialPage(),
        '/agricultural': (context) => AgriculturalPage(),
        '/toSell': (context) => ToSellPage(),
        '/menuDashboard': (context) => MenuDashboard(),
      },
    );
  }
}
