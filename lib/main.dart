// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Weather Application',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmers App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red[900], // Netflix red
        hintColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18.0, color: Colors.white),
          bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
        // Add other theme customizations here
      ),
      home: HomeScreen(),
    );
  }
}
