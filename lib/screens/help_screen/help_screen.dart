import 'package:flutter/material.dart';

import 'package:movie_app_3/screens/help_screen/widget/const_help.dart';
import 'package:movie_app_3/screens/help_screen/widget/help_item.dart';

class Help extends StatelessWidget {
  final PreferredSizeWidget appBar = AppBar(
    elevation: 0,
    title: Text(
      'FAQs',
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontFamily: 'Poppins',
      ),
    ),
    backgroundColor: Colors.transparent,
    centerTitle: true,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Color(0xff112339),
            Colors.black,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.98 -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top,
                child: ListView(
                  children: HELP_CATEGORIES
                      .map((data) => HelpItem(data.title, data.answer))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
