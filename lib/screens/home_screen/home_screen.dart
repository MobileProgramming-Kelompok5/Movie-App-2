import 'package:flutter/material.dart';
import 'package:movie_app_3/widget/drawer.dart';
import 'package:movie_app_3/screens/home_screen/widget/home_screen1.dart';
import 'package:movie_app_3/screens/home_screen/widget/home_screen2.dart';
import 'package:movie_app_3/widget/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Moviez',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2.0,
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Discover',
                    style: TextStyle(fontSize: 16, fontFamily: 'Raleway'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Genres',
                    style: TextStyle(fontSize: 16, fontFamily: 'Raleway'),
                  ),
                ),
              ],
            ),
          ),
          drawer: MyDrawer(),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              FirstTab(),
              SecondTab(),
            ],
          ),
        ),
      ),
    );
  }
}
