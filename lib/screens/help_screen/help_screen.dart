import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

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
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                  child: Column(
                children: [
                  GFAccordion(
                    title: "What is Moviez?",
                    collapsedTitleBackgroundColor: Colors.transparent,
                    expandedTitleBackgroundColor: Colors.white10,
                    contentBackgroundColor: Colors.white54,
                    titleBorder: Border.all(color: Colors.white),
                    textStyle: TextStyle(
                        fontFamily: 'Raleaway',
                        fontSize: 18,
                        color: Colors.white),
                    content:
                        'Moviez is a mobile application to share information about movies with features watch a trailer. This created by Group 5 and this is for educational purposes only. ',
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
                  ),
                  GFAccordion(
                    title: "How do I join Moviez? Does it cost anything?",
                    collapsedTitleBackgroundColor: Colors.transparent,
                    expandedTitleBackgroundColor: Colors.white10,
                    contentBackgroundColor: Colors.white54,
                    titleBorder: Border.all(color: Colors.white),
                    textStyle: TextStyle(
                        fontFamily: 'Raleaway',
                        fontSize: 18,
                        color: Colors.white),
                    content:
                        'Moviez is open to everyone and does not require you to do anything to join.',
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
                  ),
                  GFAccordion(
                    title: "Why does this app only provides a trailer?",
                    collapsedTitleBackgroundColor: Colors.transparent,
                    expandedTitleBackgroundColor: Colors.white10,
                    contentBackgroundColor: Colors.white54,
                    titleBorder: Border.all(color: Colors.white),
                    textStyle: TextStyle(
                        fontFamily: 'Raleaway',
                        fontSize: 18,
                        color: Colors.white),
                    content:
                        'Of course, dude. If we provides the movie, we will be in a jail :).',
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
                  ),
                  GFAccordion(
                    title: "Why does this application only has a few movies?",
                    collapsedTitleBackgroundColor: Colors.transparent,
                    expandedTitleBackgroundColor: Colors.white10,
                    contentBackgroundColor: Colors.white54,
                    titleBorder: Border.all(color: Colors.white),
                    textStyle: TextStyle(
                        fontFamily: 'Raleaway',
                        fontSize: 18,
                        color: Colors.white),
                    content:
                        'Of course! Because we used a free API provider. We are broke lah.',
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
                  ),
                  GFAccordion(
                    title: "Why user does not need to sign up?",
                    collapsedTitleBackgroundColor: Colors.transparent,
                    expandedTitleBackgroundColor: Colors.white10,
                    contentBackgroundColor: Colors.white54,
                    titleBorder: Border.all(color: Colors.white),
                    textStyle: TextStyle(
                        fontFamily: 'Raleaway',
                        fontSize: 18,
                        color: Colors.white),
                    content:
                        'Our application only provides information and trailer so it does not matter.',
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
                  ),
                  GFAccordion(
                    title: "How do I manage my device?",
                    collapsedTitleBackgroundColor: Colors.transparent,
                    expandedTitleBackgroundColor: Colors.white10,
                    contentBackgroundColor: Colors.white54,
                    titleBorder: Border.all(color: Colors.white),
                    textStyle: TextStyle(
                        fontFamily: 'Raleaway',
                        fontSize: 18,
                        color: Colors.white),
                    content:
                        'The Moviez Support team is here to help. Please contact us for assistance with managing your devices.',
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
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
