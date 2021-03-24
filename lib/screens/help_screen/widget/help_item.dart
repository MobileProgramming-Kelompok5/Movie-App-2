import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:movie_app_3/model/help.dart';

class HelpItem extends StatelessWidget {
  String title;
  String answer;

  HelpItem(this.title, this.answer);
  @override
  Widget build(BuildContext context) {
    return GFAccordion(
      contentPadding: const EdgeInsets.all(20),
      titlePadding: const EdgeInsets.only(
        left: 15,
        top: 10,
        bottom: 10,
        right: 5,
      ),
      title: title,
      collapsedTitleBackgroundColor: Colors.transparent,
      expandedTitleBackgroundColor: Colors.white10,
      contentBackgroundColor: Colors.white54,
      titleBorder: Border.all(color: Colors.white),
      textStyle: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 18,
        color: Colors.white,
        height: 1.5,
      ),
      content: answer,
      contentBorder: Border.all(color: Colors.white),
      collapsedIcon: Icon(
        Icons.add,
        color: Colors.white,
      ),
      expandedIcon: Icon(
        Icons.minimize,
        color: Colors.white,
      ),
      titleBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      contentBorderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)),
    );
  }
}
