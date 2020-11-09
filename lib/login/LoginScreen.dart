import 'dart:async';
import 'package:expert_properties/Component_new/ColorCode.dart';
import 'package:expert_properties/Component_new/GlobalStrintText.dart';
import 'package:expert_properties/Model/LoginModel.dart';
import 'package:expert_properties/Preferences/Preferences.dart';
import 'package:expert_properties/SignupScreen/SignupScreen.dart';
import 'package:expert_properties/menu/menuDashboard.dart';
import 'package:expert_properties/constants.dart';
import 'package:expert_properties/login/responsive_ui.dart';
import 'package:expert_properties/maincreens/first_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'FadeAnimation.dart';

//----------------------------------------------------------------------------------------------//
class LoginScreen extends StatefulWidget {
  static String tag = GlobalStringText.tagLoginScreen;
  @override
  LoginScreenState createState() => new LoginScreenState();
}

//----------------------------------------------------------------------------------------------//
class LoginScreenState extends State<LoginScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  ScrollController _scrollController = new ScrollController();
  TextEditingController LoginEmailController = new TextEditingController();
  TextEditingController LoginPasswordController = new TextEditingController();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  String Email, Password;
  String status = '';
  String errMessage = GlobalStringText.errMessage;
  var data;
  var ReciveUserID = "";
  var ReciveUserFirstName = "";
  var ReciveUserLastName = "";
  var ReciveUserEmail = "";
  var ReciveUserFullName = "";
  GlobalKey<FormState> _key = new GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _validate = false;
//----------------------------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
  }

//----------------------------------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

//-----------------------------------------------------------------------------------//
    return new WillPopScope(
      onWillPop: () async {
        Future.value(
            false); //return a `Future` with false value so this route cant be popped or closed.
      },
      child: new Scaffold(
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
                  FormUI(),
                  SizedBox(
                    height: 15.0,
                  ),
                  FormTextField(),
                  SizedBox(
                    height: 15.0,
                  ),
                  FormBtnLoginSignup(),
                  SizedBox(
                    height: 20.0,
                  ),
                  FormForgotPassword(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//----------------------------------------------------------------------------------------------//
  Widget FormUI() {
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
                color: ColorCode.AppColorCode,
                child: Stack(
                  children: <Widget>[
                    // Positioned(
                    //   left: 30,
                    //   width: 80,
                    //   height: 200,
                    //   child: FadeAnimation(
                    //       1,
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             image: DecorationImage(
                    //                 image: AssetImage(
                    //                     GlobalStringText.Imagetlight1))),
                    //       )),
                    // ),
                    // Positioned(
                    //   left: 140,
                    //   width: 80,
                    //   height: 150,
                    //   child: FadeAnimation(
                    //       1.3,
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             image: DecorationImage(
                    //                 image: AssetImage(
                    //                     GlobalStringText.Imagetlight2))),
                    //       )),
                    // ),
                    // Positioned(
                    //   right: 40,
                    //   top: 40,
                    //   width: 80,
                    //   height: 150,
                    //   child: FadeAnimation(
                    //       1.5,
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             image: DecorationImage(
                    //                 image: AssetImage(
                    //                     GlobalStringText.ImagetClock))),
                    //       )),
                    // ),
                    Positioned(
                      child: FadeAnimation(
                          1.6,
                          Container(
                            margin: EdgeInsets.only(top: 70),
                            child: Center(
                              child: FadeAnimation(
                                1.3,
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/logob.jpg'),
                                    ),
                                  ),
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
  Widget FormTextField() {
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
                  height: 80.0,
                ),
//------------------------------------------------------------------------------------------------------------//
                new TextFormField(
                  focusNode: myFocusNodeEmail,
                  controller: LoginEmailController,
                  validator: validateEmail,
                  onSaved: (String val) {
                    Email = val;
                  },
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(),
                    hintText: 'Enter EmailID',
                    hintStyle: TextStyle(
                        fontSize: 12.0, color: ColorCode.WhiteTextColorCode),
                    //helperText: 'Keep it short, this is just a demo.',
                    labelText: 'EmailID',
                    labelStyle: new TextStyle(
                        fontSize: 14.0,
                        color: ColorCode.WhiteTextColorCode,
                        fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: kAFabColor,
                    ),
                    prefixText: ' ',
                  ),
                ),
                SizedBox(height: 10.0),
//------------------------------------------------------------------------------------------------------------//
                new TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  focusNode: myFocusNodePassword,
                  controller: LoginPasswordController,
                  validator: (value) =>
                      value.isEmpty ? "Password can't be empty" : null,
                  onSaved: (val) => Password = val,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(
                        fontSize: 12.0, color: ColorCode.WhiteTextColorCode),
                    //helperText: 'Keep it short, this is just a demo.',
                    labelText: 'Password',
                    labelStyle: new TextStyle(
                        fontSize: 14.0,
                        color: ColorCode.WhiteTextColorCode,
                        fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: kAFabColor,
                    ),
                    prefixText: ' ',
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

//--------------------------------------------------------------------------------------------------------------------------------//
  Widget FormBtnLoginSignup() {
    return FadeAnimation(
      2,
      Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(children: <Widget>[
            Expanded(
              child: new FlatButton.icon(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: ColorCode.AppColorCode)),
                color: ColorCode.AppColorCode,
                icon: Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.white,
                  size: 18.0,
                ), //`Icon` to display
                label: Text(GlobalStringText.Login.toUpperCase(),
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )), //`Text` to display
                onPressed: () {
                  // _sendToServer();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (BuildContext context) => MenuDashboard()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: new FlatButton.icon(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: ColorCode.AppColorCode)),
                color: ColorCode.AppColorCode,
                icon: Icon(
                  FontAwesomeIcons.userPlus,
                  color: Colors.white,
                  size: 18.0,
                ), //`Icon` to display
                label: Text(GlobalStringText.Signup.toUpperCase(),
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )), //`Text` to display
                onPressed: () =>
                    Navigator.of(context).pushNamed(SignupScreen.tag),
              ),
            ),
          ])),
    );
  }

//--------------------------------------------------------------------------------------------------------------------------------//
  Widget FormForgotPassword() {
    return FadeAnimation(
      2,
      Center(
        child: Center(
          child: Text(
            GlobalStringText.Forgot,
            style: TextStyle(
                color: ColorCode.AppColorCode, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

//-----------------------------------------------------------------------------------------------------------------------------------------//
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
  String url = 'http://192.168.0.200/anuj/ATMA/Login.php';
  GetLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ReciveUserID = prefs.getString(Preferences.KEY_UserID).toString();
    ReciveUserEmail = prefs.getString(Preferences.KEY_Email).toString();
    ReciveUserFullName = prefs.getString(Preferences.KEY_FullName).toString();
    print("ReciveUserID" + prefs.getString(Preferences.KEY_UserID).toString());
    http.post(url, body: {
      "Email": LoginEmailController.text,
      "Password": LoginPasswordController.text,
      "Token": GlobalStringText.Token
    }).then((result) {
//------------------------------------------------------------------------------------------------------------//
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      print("jsonresp ${result.body}");

      data = json.decode(result.body);
      if (!data['Status']) {
        _displaySnackbar(context);
        _SignInFailedAlert();
        return;
      }
      LoginModel loginModel = LoginModel.fromJson(data);
      _success(loginModel);
      _displaySnackbar(context);
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

  //------------------------------------------------------------------------------------------------------------//
  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      GetLogin();
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  //----------------------------------------------------------------------------------------------//
  void _displaySnackbar(BuildContext context) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        GlobalStringText.PleaseWait,
        style: TextStyle(color: ColorCode.WhiteTextColorCode),
      ),
      backgroundColor: ColorCode.AppColorCode,
    ));
  }

//------------------------------------------------------------------------------------------------------------//
  void _success(LoginModel loginModel) {
    // if (loginModel.jSONDATA.status == 'Active') {
    new Preferences().storeDataAtLogin(loginModel);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MenuDashboard()),
    );
  }
  // }

  //-------------------------------------------------------------------------------------------------------------//
  Future<void> _SignInFailedAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            GlobalStringText.SomethingWentWrong,
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 15.0,
                color: ColorCode.AppColorCode,
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
                      color: ColorCode.AppColorCode,
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
                GlobalStringText.TryAgain,
                style: new TextStyle(
                    fontSize: 15.0,
                    color: ColorCode.AppColorCode,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
//----------------------------------------------------------------------------------------------//
