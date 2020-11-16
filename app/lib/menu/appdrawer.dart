import 'package:expert_properties/Model/user.dart';
import 'package:expert_properties/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  User user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserInitial) {
          print('User Initial');
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
            ModalRoute.withName('/homescreen'),
          );
        }
      },
      builder: (context, state) {
        if (state is UserInitial) {
          print("Initial User");
          return loadDrawer();
        } else if (state is UserLoaded) {
          user = state.user;
          return loadDrawer();
        } else if (state is UserUpdate) {
          user = state.user;
          return loadDrawer();
        }
      },
    ));
  }

  // LOAD DRAWER
  Widget loadDrawer() {
    return Center(
      child: Column(
        children: [
          Container(
            color: Colors.red,
            width: double.infinity,
            height: 210,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 90, bottom: 10),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/logob.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: Text(
                    user.firstName + " " + user.lastName,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90, bottom: 30),
                  child: Text(
                    user.email,
                  ),

                ),
          

              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.person),
                          onTap: () {
                        
                            Navigator.pushNamed(context, '/user/profile');
                          },
                          dense: true,
                          title: Text('Profile',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                        ),
                       
                        
                        SizedBox(height: 20),
                        ListTile(
                          leading: Icon(Icons.favorite),
                          onTap: () {
                           
                            Navigator.pushNamed(context, '/user/favorites');
                          },
                          dense: true,
                          title: Text('Favorites',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app),
                      onTap: () {
                        performLogout();
                      },
                      dense: true,
                      title: Text('Log Out',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // PERFORM LOGOUT
  void performLogout() {
    final UserCubit _userCubit = BlocProvider.of<UserCubit>(context);
    _userCubit.logoutUser();
  }
}
