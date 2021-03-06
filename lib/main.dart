import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
        },
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.yellow[900],
          accentColor: Colors.yellow,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.yellow[900],
            selectionHandleColor: Colors.yellow[900],
            selectionColor: Colors.yellow[200]
          )
        ),
      ),
    );
  }
}
