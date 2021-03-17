import 'package:flutter/material.dart';
import 'package:movie_app_3/screens/home_screen.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: Onboarding(),

      initialRoute: seen == false ? "/onboarding" : "/home",
      routes: {
        '/home': (context) => HomeScreen(),
        "/onboarding": (context) => Onboarding(),
      },
    );
  }
}
