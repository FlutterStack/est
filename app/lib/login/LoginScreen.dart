import 'dart:async';
import 'package:expert_properties/Component_new/GlobalStrintText.dart';
import 'package:expert_properties/Model/user.dart';
import 'package:expert_properties/bloc/user/cubit/user_cubit.dart';
import 'package:expert_properties/login/responsive_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_slider/intro_slider.dart';
// import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'FadeAnimation.dart';

class LoginScreen extends StatefulWidget {
  static String tag = GlobalStringText.tagLoginScreen;
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  User user;
  ScrollController _scrollController = new ScrollController();
  TextEditingController _txtEmail = new TextEditingController();
  TextEditingController _txtPassword = new TextEditingController();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  String status = '';
  String errMessage = GlobalStringText.errMessage;
  var data;
  GlobalKey<FormState> _key = new GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Scaffold(
      backgroundColor: Colors.red[400],
      key: _scaffoldKey,
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserInitial) {
            print("User Initial");
          } else if (state is UserLoading) {
            print("User Loading");
          } else if (state is UserLoaded) {
            print("User Loaded");
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/homescreen',
              ModalRoute.withName('/login'),
            );
            showSnackBar(context);
          }
        },
        builder: (context, state) {
          if (state is UserInitial) {
            return initialLogin();
          } else if (state is UserLoaded) {
            user = state.user;
            return userLoaded(state.user);
          }
        },
      ),
    );
  }

  //initialLogin
  Widget initialLogin() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 160,
                backgroundColor: Colors.white10,
                child: CircleAvatar(
                  radius: 140,
                  backgroundColor: Colors.white12,
                  child: CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.white24,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/images/logob.jpg'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _txtEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  labelText: "Enter Email",
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _txtPassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Enter Password",
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                child: Text('Forgot Password?'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Colors.red[900],
                  onPressed: () {
                    performLogin();
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/signup',
                    ModalRoute.withName('/login'),
                  );
                },
                child: Text(
                  'Fist time here? SignUp',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //userLoaded
  Widget userLoaded(User user) {
    return Center(child: Text("Signed in as ${user.firstName}"));
  }

  ///////////////////
  ///performLogin()
  //////////////////
  void performLogin() async {
    final UserCubit _userCubit = BlocProvider.of<UserCubit>(context);
    _userCubit.getUser(_txtEmail.text, _txtPassword.text);
  }

  /////////////////////
  ///showSnackBar
  /////////////////////
  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'Login Success',
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      backgroundColor: Colors.black,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
