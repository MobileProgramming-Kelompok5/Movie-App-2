import 'package:flutter/material.dart';
import 'package:movie_app_3/style/theme.dart' as style;
import 'package:movie_app_3/widget/drawer.dart';
import 'package:movie_app_3/widget/home_screen1.dart';

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
            title: Text('Moviez',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                )),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.search,
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
                    'Top Movies',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Genres',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          drawer: MyDrawer(),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              // Popular(),
              // Text(
              //   'first',
              //   style: Theme.of(context).textTheme.bodyText1,
              // ),
              FirstTab(),
              Text(
                'first',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
