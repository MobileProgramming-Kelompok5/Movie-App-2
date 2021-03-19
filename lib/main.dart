import 'package:flutter/material.dart';
import 'package:movie_app_3/screens/home_screen/home_screen.dart';
import 'package:movie_app_3/widget/onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool seen;
//Onboard 1 time
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  seen = prefs.getBool("seen") ?? false;
  print(seen.toString());
  await prefs.setBool("seen", true);
  runApp(MyApp());
}

// void main() {
//   runApp(MyApp());
//   Paint.enableDithering = true;
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: seen == false ? "/onboarding" : "/home",
      routes: {
        '/home': (context) => HomeScreen(),
        "/onboarding": (context) => Onboarding(),
      },
    );
  }
}
