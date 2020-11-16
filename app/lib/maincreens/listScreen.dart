import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:expert_properties/house_constants.dart';
import '../Widgets/filter_widget.dart';

import '../Widgets/image_widget.dart';

class ListScreen extends StatelessWidget {
  final filterArray = [
    "<Rs 1,00,00,000",
    "For sale",
    "3-4 beds",
    "Kitchen",
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: kActiveBgCardColor,
      ),
    );
    return Scaffold(
      backgroundColor: kActiveBgCardColor,
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            
              Text(
                "City",
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Goa",
                style: GoogleFonts.notoSans(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: .2,
              ),
              Container(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: filterArray.length,
                  itemBuilder: (context, index) {
                    return FilterWidget(
                      filterTxt: filterArray[index],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                  Constants.houseList.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ImageWidget(
                        Constants.houseList[index],
                        index,
                        Constants.imageList,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
