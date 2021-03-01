import 'package:flutter/material.dart';

import '../pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFF6930c3);
    final primaryColorDark = Color(0xFF4e2391);
    final primaryColorLight = Color(0xFF803af0);

    Map<int, Color> color = {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };
    MaterialColor customColor = MaterialColor(0xFF6930c3, color);

    final TextStyle headline1 = TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: primaryColorDark);
    final TextStyle headline2 = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: primaryColorDark);
    final TextStyle headline3 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: primaryColorDark,
    );
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: customColor,
          primaryColor: primaryColor,
          primaryColorDark: primaryColorDark,
          primaryColorLight: primaryColorLight,
          accentColor: primaryColor,
          backgroundColor: Colors.white,
          textTheme: TextTheme(headline1: headline1),
          // buttonTheme: ButtonThemeData(
          //   buttonColor: primaryColor,
          //   colorScheme: ColorScheme()
          // ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            textStyle: headline3,
            shadowColor: Colors.black,
          )),
          // colorScheme: ColorScheme.light(primary: primaryColor),
          // buttonColor: primaryColor,
          // splashColor: primaryColorLight,
          // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          // textTheme: ButtonTextTheme.primary,
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20))),
          inputDecorationTheme: InputDecorationTheme(
              alignLabelWithHint: true,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColorLight)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)))),
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
