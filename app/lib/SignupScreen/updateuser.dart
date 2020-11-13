import 'package:expert_properties/Model/user.dart';
import 'package:expert_properties/bloc/user/cubit/user_cubit.dart';
import 'package:expert_properties/bloc/userfavorites/cubit/userfavorites_cubit.dart';
import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class UpdateUserInfo extends StatefulWidget {
  @override
  _UpdateUserInfoState createState() => _UpdateUserInfoState();
}

class _UpdateUserInfoState extends State<UpdateUserInfo> {
  final TextEditingController _txtFirstname = TextEditingController();
  final TextEditingController _txtLastname = TextEditingController();
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtMobile = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isEditEnabled = false;
  int userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Profile'),
        actions: [
          FlatButton(
            color: Colors.transparent,
            onPressed: () {
              updateUserInfo();
            },
            child: Text(
              isEditEnabled ? 'Save' : 'Edit',
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(66, 66, 66, 0.9),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   width: 300,
                //   margin: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.height * .10),
                //   child: Text(
                //     'Hey! View your profile',
                //     style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                //   ),
                // ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 300,
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                ),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is UserLoaded) {
                      return loadUser(state.user);
                    } else if (state is UserUpdate) {
                      return loadUser(state.user);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loadUser(User user) {
    _txtFirstname.text = user.firstName.toString();
    _txtLastname.text = user.lastName;
    _txtEmail.text = user.email;
    _txtMobile.text = user.mobileNo;
    _txtPassword.text = user.password;
    userId = user.userId;
    return FutureBuilder<User>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return new Center(
            child: new CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return new Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                readOnly: isEditEnabled == false ? true : false,
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
                readOnly: isEditEnabled == false ? true : false,
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
                readOnly: isEditEnabled == false ? true : false,
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
                readOnly: isEditEnabled == false ? true : false,
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
                readOnly: isEditEnabled == false ? true : false,
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
            ],
          );
        }
      },
    );
  }

  Future updateUserInfo() async {
    setState(() {
      (isEditEnabled == false) ? isEditEnabled = true : isEditEnabled = false;
    });
    if (isEditEnabled == false) {
      final UserCubit _userCubit = BlocProvider.of<UserCubit>(context);
      Map<String, dynamic> info = {
        "userId": userId.toString(),
        "firstname": _txtFirstname.text,
        "lastname": _txtLastname.text,
        "email": _txtEmail.text,
        "mobile": _txtMobile.text,
        "password": _txtPassword.text
      };
      Map<String, dynamic> body = {
        "idusers": userId,
        "first_name": _txtFirstname.text,
        "last_name": _txtLastname.text,
        "email": _txtEmail.text,
        "mobile_no": _txtMobile.text,
        "password": _txtPassword.text
      };
      User user = User.fromJson(body);
      print('user details: $user');
      _userCubit.updateUser(info, user);
    }
  }
}
