import 'package:carousel_pro/carousel_pro.dart';
import 'package:expert_properties/Model/estate_details.dart';
import 'package:expert_properties/bloc/estates/cubit/estate_cubit.dart';
import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EstateDetails extends StatefulWidget {
  final Map<String, dynamic> details;
  EstateDetails(this.details);
  @override
  _EstateDetailsState createState() => _EstateDetailsState();
}

class _EstateDetailsState extends State<EstateDetails> {
  List details = [];
  final oCcy = new NumberFormat("##,##,###", "en_INR");
  List<String> imageList = [
    "assets/images/house_1.jpg",
    "assets/images/house_2.jpg",
    "assets/images/house_3.jpg",
    "assets/images/house_4.jpg",
    "assets/images/house_5.jpg",
    "assets/images/house_6.png",
  ];

  List detailProps = [
    'no_of_rooms',
    'no_of_garage',
    'no_of_kitchens',
    'no_of_bathrooms',
    'size'
  ];

  List descProps = ['Room', 'Garage', 'Kitchen', 'Bathroom', 'Square foot'];
  @override
  void initState() {
    getDetails(this.widget.details['details'].estateId);
    super.initState();
  }

  Future<List> getDetails(int estateId) async {
    final EstateCubit _estateCubit = BlocProvider.of<EstateCubit>(context);
    details =
        await _estateCubit.getEstateDetails(estateId).then((value) => value);
    setState(() {
      details = details;
    });
    print('details' + details.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 66, 66, 0.9),
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Details'),
      ),
      body: Column(
        children: [
          loadDetails(),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.widget.details['details'].name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    this.widget.details['details'].description,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "House Information",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 110,
                  child: ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                details[0][detailProps[index]].toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  descProps[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loadDetails() {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Carousel(
            images:
                List.generate(imageList.length, (index) => loadImages(index)),
            showIndicator: false,
            borderRadius: false,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
            overlayShadow: false,
            overlayShadowColors: Colors.black, //dint change color
            overlayShadowSize: 0.7,
          ),
          Positioned(
            left: 0,
            top: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  color: Color.fromRGBO(66, 66, 66, 0.9),
                ),
              ),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(5),
              width: 150,
              child: Text(
                "Rs: " + oCcy.format(this.widget.details['details'].amount),
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AssetImage loadImages(int i) {
    return AssetImage(imageList[i]);
  }
}
