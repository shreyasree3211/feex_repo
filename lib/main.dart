import 'package:feex/constants.dart';
import 'package:feex/routes.dart';
import 'package:feex/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: lightBlueColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kPrimaryColor),
          bodyText2: TextStyle(color: kSecondaryColor),
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}


