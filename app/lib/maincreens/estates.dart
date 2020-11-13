import 'package:expert_properties/Model/estate.dart';
import 'package:expert_properties/bloc/estates/cubit/estate_cubit.dart';
import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expert_properties/utils.dart';
import 'package:intl/intl.dart';

class Estate extends StatefulWidget {
  final Map<String, dynamic> property;
  Estate(this.property);
  @override
  _EstateState createState() => _EstateState();
}

class _EstateState extends State<Estate> {
  Utils utils = new Utils();
  List<EstateInfo> estates = [];
  bool matchFound = false;
  List<String> imageList = [
    "assets/images/house_1.jpg",
    "assets/images/house_2.jpg",
    "assets/images/house_3.jpg",
    "assets/images/house_4.jpg",
    "assets/images/house_5.jpg",
    "assets/images/house_6.png",
  ];
  final oCcy = new NumberFormat("##,##,###", "en_INR");
  TextEditingController _txtSearch = new TextEditingController();
  String searchKey = "";
  @override
  void initState() {
    loadEstatesByPropertyId();
    print(this.widget.property['property'].propertyName);
    _txtSearch.addListener(() {
      setState(() {
        searchKey = _txtSearch.text;
      });
    });
    super.initState();
  }

  Future loadEstatesByPropertyId() async {
    final EstateCubit _estateCubit = BlocProvider.of<EstateCubit>(context);
    estates = await _estateCubit
        .getEstatesByPropertyId(this.widget.property['property'].propertyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kAFabColor,
        title: Text(this.widget.property['property'].propertyName),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: _txtSearch,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintText: 'Search Estate',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
              child: BlocBuilder<EstateCubit, EstateState>(
                builder: (context, state) {
                  if (state is EstateInitial) {
                    print("Initializing estate");
                    return initialEstate();
                  } else if (state is EstateLoading) {
                    print("Loading State");
                    return loadingEstate();
                  } else if (state is EstateLoaded) {
                    print("Loaded State");
                    return loadEstates(state.estate);
                  } else if (state is EstateError) {
                    print("EstateError");
                    return emptyEstates();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // INITIAL ESTATE
  Widget initialEstate() {
    return Container(
      child: Text(""),
    );
  }

  // LOADING ESTATE
  Widget loadingEstate() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  // LOAD ESTATES
  Widget loadEstates(List<EstateInfo> estates) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: estates.length,
      itemBuilder: (context, index) {
        return (estates[index]
                    .name
                    .toLowerCase()
                    .contains(searchKey.toLowerCase()) ||
                searchKey.isEmpty)
            ? Container(
                margin: EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/estate/info',
                      arguments: {
                        'details': estates[index],
                      },
                    );
                  },
                  child: Card(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              child: Container(
                                width: double.infinity,
                                child: Image.asset(
                                  imageList[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 250,
                                    child: Text(
                                      estates[index].name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    estates[index].description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          right: 10,
                          top: 170,
                          child: Container(
                            width: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.black26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 10),
                                )
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                print("hello");
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }

  Widget emptyEstates() {
    return Center(
      child: Container(
        child: Text(
          'No Estates Available Yet.',
          style: TextStyle(color: Colors.black54, fontSize: 18),
        ),
      ),
    );
  }
}
