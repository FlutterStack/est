import 'package:expert_properties/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _txtFirstname = TextEditingController();
  final TextEditingController _txtLastname = TextEditingController();
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtMobile = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isRegistered = false;
  @override
  void dispose() {
    _txtFirstname.dispose();
    _txtLastname.dispose();
    _txtEmail.dispose();
    _txtMobile.dispose();
    _txtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      key: _scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 220,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .11),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: _txtFirstname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Enter Firstname',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _txtLastname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Enter Lastname',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _txtEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _txtMobile,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Mobile No.',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _txtPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Enter Password',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(20),
                        color: Colors.red[700],
                        onPressed: () {
                          performSignUp();
                        },
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login',
                          ModalRoute.withName('/signup'),
                        );
                      },
                      child: Text('Back to Login'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future performSignUp() async {
    final UserCubit _userCubit = BlocProvider.of<UserCubit>(context);
    Map<String, dynamic> info = {
      "firstname": _txtFirstname.text,
      "lastname": _txtLastname.text,
      "email": _txtEmail.text,
      "mobile": _txtMobile.text,
      "password": _txtPassword.text
    };
    isRegistered = await _userCubit.registerUser(info).then((value) => value);
    setState(() {
      isRegistered = isRegistered;
    });

    if (isRegistered == true) {
      showSnackBar(context);
    }
  }

  /////////////////////
  ///showSnackBar
  /////////////////////
  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'You successfully registered!',
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      backgroundColor: Color.fromRGBO(66, 66, 66, 0.9),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
