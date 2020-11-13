import 'package:expert_properties/maincreens/estates.dart';
import 'package:flutter/material.dart';
import 'package:expert_properties/menu/menuDashboard.dart';
import 'package:expert_properties/maincreens/agricultural_page.dart';
import 'package:expert_properties/maincreens/commercial_page.dart';
import 'package:expert_properties/maincreens/splash_screen.dart';
import 'package:expert_properties/maincreens/residential_page.dart';
import 'package:expert_properties/maincreens/to_sell_page.dart';
import 'package:expert_properties/maincreens/splash_screen.dart';
import 'package:expert_properties/maincreens/industrial_page.dart';
import 'package:expert_properties/login/LoginScreen.dart';
import 'maincreens/agricultural_page.dart';
import 'maincreens/commercial_page.dart';
import 'maincreens/first_page.dart';
import 'maincreens/industrial_page.dart';
import 'maincreens/residential_page.dart';
import 'maincreens/splash_screen.dart';
import 'maincreens/to_sell_page.dart';
import 'menu/menuDashboard.dart';
import 'package:expert_properties/maincreens/estate_details.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/homescreen':
        return MaterialPageRoute(builder: (context) => FirstPage(context));
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/residential':
        return MaterialPageRoute(builder: (_) => ResidentialPage());
      case '/commercial':
        return MaterialPageRoute(builder: (_) => CommercialPage());
      case '/industrial':
        return MaterialPageRoute(builder: (_) => IndustrialPage());
      case '/agricultural':
        return MaterialPageRoute(builder: (_) => AgriculturalPage());
      case '/toSell':
        return MaterialPageRoute(builder: (_) => ToSellPage());
      case '/menuDashboard':
        return MaterialPageRoute(builder: (_) => MenuDashboard());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/estates':
        return MaterialPageRoute(builder: (_) => Estate(args));
      case '/estate/info':
        return MaterialPageRoute(builder: (_) => EstateDetails(args));
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Unknown Route'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
