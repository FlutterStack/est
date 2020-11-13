import 'package:expert_properties/Model/user_favorites.dart';
import 'package:expert_properties/bloc/user/cubit/user_cubit.dart';
import 'package:expert_properties/bloc/userfavorites/cubit/userfavorites_cubit.dart';
import 'package:expert_properties/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFavorites extends StatefulWidget {
  @override
  _UserFavoritesState createState() => _UserFavoritesState();
}

class _UserFavoritesState extends State<UserFavorites> {
  List<String> imageList = [
    "assets/images/house_1.jpg",
    "assets/images/house_2.jpg",
    "assets/images/house_3.jpg",
    "assets/images/house_4.jpg",
    "assets/images/house_5.jpg",
    "assets/images/house_6.png",
  ];
  List selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kAFabColor,
        title: Text('Favorites'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              final UserfavoritesCubit _userFavCubit =
                  BlocProvider.of<UserfavoritesCubit>(context);
              _userFavCubit.getAllUserFavorites(state.user.userId);
              return BlocBuilder<UserfavoritesCubit, UserfavoritesState>(
                builder: (context, state) {
                  if (state is UserfavoritesInitial) {
                    return favoriteInitial();
                  } else if (state is UserFavoritesLoading) {
                    return favLoading();
                  } else if (state is UserFavoritesLoaded) {
                    selectedItems.clear();
                    selectedItems =
                        state.userFav.map((e) => e.estateId).toList();
                    return loadFavorites(state.userFav);
                  } else if (state is UserFavoritesError) {
                    return favError();
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget favoriteInitial() {
    return Container();
  }

  Widget favLoading() {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget favError() {
    return Center(
      child: Text(
        'No favorites yet.',
        style: TextStyle(
            color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget loadFavorites(List<UserFav> userFav) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: userFav.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/estate/info',
                arguments: {
                  'details': userFav[index],
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
                                userFav[index].name,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
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
                              userFav[index].description,
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
                          selectedItems.contains(userFav[index].estateId)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // addUserFavorites(
                          //     estates[index].estateId, user.userId);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
