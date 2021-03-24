import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:movie_app_3/screens/help_screen/widget/const_help.dart';
import 'package:movie_app_3/screens/help_screen/widget/help_item.dart';

class Help extends StatelessWidget {
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
        appBar: AppBar(
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
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
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
