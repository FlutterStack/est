import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:expert_properties/constants.dart';
import '../Widgets/floating_widget.dart';
import '../Widgets/house_widget.dart';
import '../Widgets/menu_widget.dart';
import 'package:expert_properties/data_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailScreen extends StatelessWidget {
  House house;
  List<String> imageList;
  int imgPath_Index;
  ItemDetailScreen(
    this.house,
    this.imgPath_Index,
    this.imageList,
  );
  final houseArray = [
    "1.416",
    "4",
    "2",
    "2",
    "3",
  ];
  final typeArray = [
    "Square foot",
    "Bedrooms",
    "Bedrooms",
    "Garage",
    "Kitchen",
  ];
  Color menuWidgetColor = kInFabColor;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final oCcy = new NumberFormat("##,##,###", "en_INR");
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: kActiveBgCardColor,
      ),
    );
    return Scaffold(
      backgroundColor: kActiveBgCardColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        width: screenWidth,
        child: Expanded(
          child:
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // children: <Widget>[
              //   FloatingWidget(
              //     leadingIcon: Icons.mail,
              //     txt: "Message",
              //   ),
              FloatingWidget(
            leadingIcon: Icons.phone,
            txt: "Call",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 0, bottom: 10),
                    child: SizedBox(
                      height: 200.0,
                      width: screenWidth,
                      child: Carousel(
                        images: [
                          ExactAssetImage(imageList[imgPath_Index]),
                          ExactAssetImage(imageList[0]),
                          ExactAssetImage(imageList[1]),
                          ExactAssetImage(imageList[2]),
                          ExactAssetImage(imageList[3]),
                          ExactAssetImage(imageList[4]),
                          ExactAssetImage(imageList[5]),
                        ],
                        showIndicator: true,
                        borderRadius: false,
                        moveIndicatorFromBottom: 180.0,
                        noRadiusForIndicator: true,
                        overlayShadow: false,
                        overlayShadowColors: Colors.white, //dint change color
                        overlayShadowSize: 0.7,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MenuWidget(
                            iconImg: Icons.arrow_back,
                            iconColor: Colors.white,
                            conBackColor: kInFabColor,
                            onbtnTap: () {
                              Navigator.of(context).pop(false);
                            }),
                        MenuWidget(
                          iconImg: Icons.favorite_border,
                          iconColor: kAFabColor,
                          size: 25.0,
                          conBackColor: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rs' + "${oCcy.format(house.amount)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 10,
                          ),
                          child: Text(
                            house.address,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 15),
                    //   child: Container(
                    //     height: 45,
                    //     width: 120,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12.0),
                    //       border: Border.all(
                    //         color: Colors.grey[200],
                    //       ),
                    //     ),
                    // child: Center(
                    //   child: Text(
                    //     "20 hours ago",
                    //     style: Theme.of(context).textTheme.caption.copyWith(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 16,
                    //         ),
                    //   ),
                    // ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  left: 15,
                ),
                child: Text(
                  "House Information",
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: houseArray.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: HouseWidget(
                        type: typeArray[index],
                        number: houseArray[index].toString(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  "Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
