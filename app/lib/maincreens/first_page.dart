import 'package:expert_properties/Model/properties.dart';
import 'package:expert_properties/bloc/properties/cubit/property_cubit.dart';
import 'package:expert_properties/components/bgCard.dart';
import 'package:expert_properties/constants.dart';
import 'package:expert_properties/menu/appdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/iconText_button.dart';


class FirstPage extends StatefulWidget {
  FirstPage(context);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  List icons = [
    FontAwesomeIcons.warehouse,
    FontAwesomeIcons.home,
    FontAwesomeIcons.shopware,
    FontAwesomeIcons.mountain
  ];
  @override
  void initState() {
    loadProperties();
    super.initState();
  }

  Future loadProperties() async {
    final PropertyCubit _propertyCubit =
        BlocProvider.of<PropertyCubit>(context);
    _propertyCubit.loadProperties();
  }

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
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: kAFabColor,
          title: Text(
            'Choose Property',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
         
        ),
        drawer: AppDrawer(),
        body: Container(
          padding: EdgeInsets.all(30),
          child: BlocBuilder<PropertyCubit, PropertyState>(
            builder: (context, state) {
              if (state is PropertyInitial) {
                print("Initializing Property...");
                return propertyInitial();
              } else if (state is PropertyLoading) {
                print("Loading property...");
                return loadingProperty();
              } else if (state is PropertyLoaded) {
                print("Loaded property...");
                return displayedProperties(state.property);
              } else if (state is PropertyError) {
                print("Error");
                return propertyError();
              }
            },
          ),
        ),
      ),
    );
  }

  //PROPERTY INITIAL
  Widget propertyInitial() {
    return Container();
  }

  // LOADING PROPERTY
  Widget loadingProperty() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  // DISPLAYED PROPERTY
  Widget displayedProperties(List<Property> property) {
    return ListView.builder(
      itemCount: property.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/estates',
                        arguments: {
                          'property': property[index],
                        },
                      );
                      // Navigator.pushNamed(
                      //   context,
                      //   '/residential',
                      // );
                    },
                    contentPadding: EdgeInsets.all(15),
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        icons[index],
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    title: Text(
                      property[index].propertyName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      property[index].description,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                height: 120.0,
              ),
            )
          ],
        );
      },
    );
  }

  // PROPERTY ERROR
  Widget propertyError() {
    return Container();
  }
}

