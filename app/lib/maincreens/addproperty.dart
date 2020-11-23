import 'package:expert_properties/Model/properties.dart';
import 'package:expert_properties/bloc/estates/cubit/estate_cubit.dart';
import 'package:expert_properties/bloc/properties/cubit/property_cubit.dart';
import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProperty extends StatefulWidget {
  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final TextEditingController _txtEstatename = TextEditingController();
  final TextEditingController _txtlocation = TextEditingController();
  final TextEditingController _txtdescription = TextEditingController();
  final TextEditingController _txtamount = TextEditingController();
  final TextEditingController _txtrooms = TextEditingController();
  final TextEditingController _txtgarage = TextEditingController();
  final TextEditingController _txtkitchens = TextEditingController();
  final TextEditingController _txtbathroom = TextEditingController();
  final TextEditingController _txtsize = TextEditingController();
  // List<Property> types = [];
  int selectedTypeId;
  String hintText = "";
  bool isSave = false;
  @override
  void dispose() {
    _txtEstatename.dispose();
    _txtlocation.dispose();
    _txtdescription.dispose();
    _txtamount.dispose();
    _txtrooms.dispose();
    _txtgarage.dispose();
    _txtkitchens.dispose();
    _txtbathroom.dispose();
    _txtsize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kAFabColor,
        title: Text("Add Property"),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<PropertyCubit, PropertyState>(
          builder: (context, state) {
            if (state is PropertyLoaded) {
              print("Loaded property...");

              return loadPropertyFields(state.property);
            }
          },
        ),
      ),
    );
  }

  Widget loadPropertyFields(List<Property> types) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // Container(
          //   child: Text(
          //     'Property Information',
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          Container(
            child: Column(
              children: [
                TextField(
                  controller: _txtEstatename,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    labelText: "Estate Name",
                    labelStyle: TextStyle(color: Colors.black87),
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _txtlocation,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    labelText: "Location",
                    labelStyle: TextStyle(color: Colors.black87),
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  style: TextStyle(color: Colors.black),
                  controller: _txtamount,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    labelText: "Amount",
                    labelStyle: TextStyle(color: Colors.black87),
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 60,
                  padding: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black87,
                    ),
                  ),
                  child: DropdownButton(
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    icon: Icon(Icons.arrow_drop_down),
                    iconEnabledColor: Colors.black,
                    hint: Container(
                      width: 150, //and here
                      child: Text(
                        "Select Item Type",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    style: TextStyle(color: Colors.grey[700]),
                    value: selectedTypeId,
                    isDense: true,
                    isExpanded: true,
                    onChanged: (value) {
                      this.setState(() {
                        selectedTypeId = value;
                      });
                    },
                    items: List.generate(
                      types.length,
                      (index) {
                        return DropdownMenuItem(
                          value: types[index].propertyId,
                          child: Text(
                            types[index].propertyName,
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          onTap: () {
                            setState(() {
                              hintText = types[index].propertyName;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _txtrooms,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    labelText: "No. of rooms",
                    labelStyle: TextStyle(color: Colors.black87),
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _txtgarage,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    labelText: "No. of garage",
                    labelStyle: TextStyle(color: Colors.black87),
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _txtkitchens,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    labelText: "No. of kitchens",
                    labelStyle: TextStyle(color: Colors.black87),
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _txtbathroom,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    labelText: "No. of bathrooms",
                    labelStyle: TextStyle(color: Colors.black87),
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _txtsize,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    labelText: "No. of Square meters",
                    labelStyle: TextStyle(color: Colors.black87),
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _txtdescription,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    labelText: "Description",
                    labelStyle: TextStyle(color: Colors.black87),
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                  maxLines: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: kAFabColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onPressed: () {
                      addEstate();
                    },
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> addEstate() async {
    final EstateCubit _estateCubit = BlocProvider.of<EstateCubit>(context);
    Map<String, dynamic> info = {
      "name": _txtEstatename.text,
      "location": _txtlocation.text,
      "amount": _txtamount.text,
      "propertyId": selectedTypeId.toString(),
      "rooms": _txtrooms.text,
      "garage": _txtgarage.text,
      "kitchens": _txtkitchens.text,
      "bathrooms": _txtbathroom.text,
      "size": _txtsize.text,
      "desc": _txtdescription.text
    };
    isSave = await _estateCubit.addEstate(info).then((value) => value);
    setState(() {
      isSave = isSave;
    });
    if (isSave == true) {
      print("SUCCESS! Your Property is Uploaded.");
    } else {
      print("Unable to insert estate");
    }
  }
}
