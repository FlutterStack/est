import 'dart:async';
import 'dart:convert';
import 'package:expert_properties/Component_new/ColorCode.dart';
import 'package:expert_properties/Component_new/GlobalStrintText.dart';
import 'package:expert_properties/login/FadeAnimation.dart';
import 'package:expert_properties/login/LoginScreen.dart';
import 'package:expert_properties/login/responsive_ui.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//----------------------------------------------------------------------------------------------//
class SignupScreen extends StatefulWidget {
  static String tag = GlobalStringText.tagSignupScreen;
  @override
  SignupScreenState createState() => new SignupScreenState();
}

//----------------------------------------------------------------------------------------------//
class SignupScreenState extends State<SignupScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  ScrollController _scrollController = new ScrollController();
  TextEditingController signupFirstNameController = new TextEditingController();
  TextEditingController signupLastNameController = new TextEditingController();
  TextEditingController signupMobileNumberController =
      new TextEditingController();
  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  final FocusNode myFocusNodeFirstName = FocusNode();
  final FocusNode myFocusNodeLastName = FocusNode();
  final FocusNode myFocusNodeMobileNumber = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String firstName, lastName, mobileNumber, email, password, confirmPassword;
  var loading = true;
  String status = '';
  String errMessage = GlobalStringText.errMessage;
  var data;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//----------------------------------------------------------------------------------------------//
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  String getDropDownValue = "";
  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
      //GetDropDownValue =_selectedCompany.toString();
      print(_selectedCompany.name.toString());
    });
  }

//----
//----------------------------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
  }

//----------------------------------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
//-------------------------------------------------------------------------------//
    return Scaffold(
      key: _scaffoldKey,
      body: new Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: new Form(
            key: _key,
            autovalidate: _validate,
            child: Column(
              children: <Widget>[
                formUI(),
                SizedBox(
                  height: 15.0,
                ),
                formTextField(),
                formBtnSignup(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//----------------------------------------------------------------------------------------------//
  Widget formUI() {
    return new Column(
      children: <Widget>[
        new Container(
          child: new ListView(
            padding: EdgeInsets.only(left: 0.0, right: 0.0),
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
//------------------------------------------------------------------------------------------------------------//
              new Container(
                height: 300,
                color: ColorCode.appColorCode,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeAnimation(
                          1,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        GlobalStringText.Imagetlight1))),
                          )),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        GlobalStringText.Imagetlight2))),
                          )),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.5,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        GlobalStringText.ImagetClock))),
                          )),
                    ),
                    Positioned(
                      child: FadeAnimation(
                          1.6,
                          Container(
                            margin: EdgeInsets.only(top: 150),
                            child: Center(
                              child: FadeAnimation(
                                1.3,
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/logob.jpg'))),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

//------------------------------------------------------------------------------------------------------------//
  Widget formTextField() {
    return new Column(
      children: <Widget>[
        new FadeAnimation(
          2,
          Container(
            child: new ListView(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              controller: _scrollController,
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
//------------------------------------------------------------------------------------------------------------//
                new TextFormField(
                  focusNode: myFocusNodeFirstName,
                  controller: signupFirstNameController,
                  validator: validateFirstName,
                  onSaved: (String val) {
                    firstName = val;
                  },
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(),
                    hintText: 'Enter First Name',
                    hintStyle: TextStyle(
                        fontSize: 12.0, color: ColorCode.blackTextColorCode),
                    //helperText: 'Keep it short, this is just a demo.',
                    labelText: 'First Name',
                    labelStyle: new TextStyle(
                        fontSize: 14.0,
                        color: ColorCode.blackTextColorCode,
                        fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xFFCEA910),
                    ),
                    prefixText: ' ',
                    //suffixText: 'USD',
                    //suffixStyle: const TextStyle(color: Colors.green)
                  ),
                ),
                SizedBox(height: 10.0),
//------------------------------------------------------------------------------------------------------------//
                TextFormField(
                  focusNode: myFocusNodeLastName,
                  controller: signupLastNameController,
                  validator: validateLastName,
                  onSaved: (String val) {
                    lastName = val;
                  },
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(),
                    hintText: 'Enter Last Name',
                    hintStyle: TextStyle(
                        fontSize: 12.0, color: ColorCode.blackTextColorCode),
                    //helperText: 'Keep it short, this is just a demo.',
                    labelText: 'Last Name',
                    labelStyle: new TextStyle(
                        fontSize: 14.0,
                        color: ColorCode.blackTextColorCode,
                        fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xFFCEA910),
                    ),
                    prefixText: ' ',
                    //suffixText: 'USD',
                    //suffixStyle: const TextStyle(color: Colors.green)
                  ),
                ),
                SizedBox(height: 10.0),
//------------------------------------------------------------------------------------------------------------//
                new TextFormField(
                  focusNode: myFocusNodeMobileNumber,
                  controller: signupMobileNumberController,
                  keyboardType: TextInputType.phone,
                  validator: validateMobile,
                  onSaved: (String val) {
                    mobileNumber = val;
                  },
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(),
                    hintText: 'Enter Mobile Number',
                    hintStyle: TextStyle(
                        fontSize: 12.0, color: ColorCode.blackTextColorCode),
                    //helperText: 'Keep it short, this is just a demo.',
                    labelText: 'Mobile Number',
                    labelStyle: new TextStyle(
                        fontSize: 14.0,
                        color: ColorCode.blackTextColorCode,
                        fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Color(0xFFCEA910),
                    ),
                    prefixText: ' ',
                    //suffixText: 'USD',
                    //suffixStyle: const TextStyle(color: Colors.green)
                  ),
                ),
                SizedBox(height: 10.0),
//------------------------------------------------------------------------------------------------------------//
                new TextFormField(
                  focusNode: myFocusNodeEmail,
                  controller: signupEmailController,
                  validator: validateEmail,
                  onSaved: (String val) {
                    email = val;
                  },
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(),
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(
                        fontSize: 12.0, color: ColorCode.blackTextColorCode),
                    //helperText: 'Keep it short, this is just a demo.',
                    labelText: 'Email Address',
                    labelStyle: new TextStyle(
                        fontSize: 14.0,
                        color: ColorCode.blackTextColorCode,
                        fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xFFCEA910),
                    ),
                    prefixText: ' ',
                    //suffixText: 'USD',
                    //suffixStyle: const TextStyle(color: Colors.green)
                  ),
                ),
                SizedBox(height: 10.0),
//------------------------------------------------------------------------------------------------------------//
                new TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  focusNode: myFocusNodePassword,
                  controller: signupPasswordController,
                  validator: (value) =>
                      value.isEmpty ? "Password can't be empty" : null,
                  onSaved: (val) => password = val,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(
                        fontSize: 12.0, color: ColorCode.blackTextColorCode),
                    //helperText: 'Keep it short, this is just a demo.',
                    labelText: 'Password',
                    labelStyle: new TextStyle(
                        fontSize: 14.0,
                        color: ColorCode.blackTextColorCode,
                        fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFFCEA910),
                    ),
                    prefixText: ' ',
                    //suffixText: 'USD',
                    //suffixStyle: const TextStyle(color: Colors.green)
                  ),
                ),

//------------------------------------------------------------------------------------------------------------//
                new Padding(
                    padding: EdgeInsets.only(left: 0.0, right: 0.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          icon: Icon(
                            FontAwesomeIcons.shoppingCart,
                            color: Color(0xFFCEA910),
                            size: 20.0,
                          ),
                          value: _selectedCompany,
                          items: _dropdownMenuItems,
                          onChanged: onChangeDropdownItem,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: ColorCode.blackTextColorCode,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

//--------------------------------------------------------------------------------------------------------------------------------//
  Widget formBtnSignup() {
    return FadeAnimation(
      2,
      Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(children: <Widget>[
            Expanded(
              child: new FlatButton.icon(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: ColorCode.appColorCode)),
                color: ColorCode.appColorCode,
                icon: Icon(
                  FontAwesomeIcons.registered,
                  color: Colors.white,
                  size: 18.0,
                ), //`Icon` to display
                label: Text(GlobalStringText.Register.toUpperCase(),
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )), //`Text` to display
                onPressed: () {
                  _sendToServer();
                },
              ),
            ),
          ])),
    );
  }

//-----------------------------------------------------------------------------------------------------------------------------------------//
  String validateFirstName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "First Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateLastName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Last Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  //---------------------------------------------------------------------------------------------------//
  String signupurl = 'http://192.168.0.200/anuj/ATMA/Registration.php';
  postSignupData() {
    http.post(signupurl, body: {
      "FirstName": signupFirstNameController.text.toString(),
      "LastName": signupLastNameController.text.toString(),
      "Email": signupEmailController.text.toString(),
      "Mobile": signupMobileNumberController.text.toString(),
      "Password": signupPasswordController.text.toString(),
      "Token": GlobalStringText.Token
    }).then((resultSignup) {
//------------------------------------------------------------------------------------------------------------//
      setStatus(
          resultSignup.statusCode == 200 ? resultSignup.body : errMessage);
//------------------------------------------------------------------------------------------------------------//
      data = json.decode(resultSignup.body);
      if (!data['Status'] == true) {
        _displaySnackbar(context);
        trueAlert(context);
        return;
      } else if (!data['Status'] == false) {
        _displaySnackbar(context);
        _StatusFalseAlert(context);
      }
//------------------------------------------------------------------------------------------------------------//
    }).catchError((error) {
      setStatus(error);
    });
  }

//---------------------------------------------------------------------------------------------------//
  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  //-------------------------------------------------------------------------------------------------------------------//
  _sendToServer() async {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("true");
      postSignupData();
    } else {
      // validation error
      setState(() {
        print("Faield");
        _validate = true;
      });
    }
  }

  //--------------------------------------------------------------------------------------//
  Future<void> trueAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            GlobalStringText.Warning,
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 15.0,
                color: ColorCode.appColorCode,
                fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  data['MSG'].toString(),
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: ColorCode.appColorCode,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                _scaffoldKey.currentState.hideCurrentSnackBar();
                Navigator.of(context).pop();
              },
              child: Text(
                GlobalStringText.ok,
                style: new TextStyle(
                    fontSize: 15.0,
                    color: ColorCode.appColorCode,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  //--------------------------------------------------------------------------------------------------------//
  Future<void> _StatusFalseAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            GlobalStringText.Thanks,
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 15.0,
                color: ColorCode.appColorCode,
                fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  data['MSG'].toString(),
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: ColorCode.appColorCode,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                _scaffoldKey.currentState.hideCurrentSnackBar();
                /* Navigator.of(context).pop();*/
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                GlobalStringText.ok,
                style: new TextStyle(
                    fontSize: 15.0,
                    color: ColorCode.appColorCode,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

//----------------------------------------------------------------------------------------------//
  void _displaySnackbar(BuildContext context) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        GlobalStringText.PleaseWait,
        style: TextStyle(color: ColorCode.whiteTextColorCode),
      ),
      backgroundColor: ColorCode.appColorCode,
    ));
  }
}

//----------------------------------------------------------------------------------------------//
class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'BUYER'),
      Company(2, 'SELLER'),
    ];
  }
}
