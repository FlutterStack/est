import 'package:flutter/material.dart';
import 'package:expert_properties/constants.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
import "package:url_launcher/url_launcher.dart";

class FloatingWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String txt;
  Color bgColor = kAFabColor;
  FloatingWidget({Key key, this.leadingIcon, this.txt, this.bgColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 150,
      child: FloatingActionButton(
        elevation: 5,
        backgroundColor: Color(0x00ed0e0d0),
        onPressed: () async {
          const url = 'tel: 8056533860';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75.0),
        ),
        heroTag: null,
        child: Ink(
          decoration: BoxDecoration(
            color: kAFabColor,
            borderRadius: BorderRadius.circular(75.0),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 300.0,
              minHeight: 50.0,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  leadingIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
