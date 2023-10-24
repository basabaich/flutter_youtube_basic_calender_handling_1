import 'package:flutter/material.dart';
import './home_screen.dart';
import './second_screen.dart';
import './third_screen.dart';
import './error_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //
    //
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Calenders',
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomeScreen(),
        SecondScreen.routeName: (ctx) => const SecondScreen(),
        ThirdScreen.routeName: (ctx) => const ThirdScreen(),
      },
      //Error dynamic screen which was not predefined then the follwing:
      onGenerateRoute: (settings) {
        //print(settings.arguments);
        return null;
      },
      //This route will be generated due to any error in our application:
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const ErrorScreen(),
      ), //MaterialPageRoute
    ); //MaterialApp
  }
}
