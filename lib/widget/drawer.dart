import 'package:flutter/material.dart';

import 'package:movie_app_3/screens/help_screen/help_screen.dart';
import 'package:movie_app_3/widget/custom_box.dart';
import '../widget/custom_box.dart';
import '../style/theme.dart' as style;

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        elevation: 0,
        child: Container(
          color: style.Colors.thirdColor,
          child: ListView(
            children: [
              Container(
                height: 170,
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Image.asset(
                          'assets/images/Logo.png',
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.help_outline_sharp,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Help',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Help(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        'About us',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway'),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              title: "Moviez",
                              descriptions: "This App is made by Kelompok 5",
                              text: "Ok",
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
