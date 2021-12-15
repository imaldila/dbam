import 'package:d_bam/constants.dart';
import 'package:d_bam/screens/choose_screen.dart';
import 'package:d_bam/screens/form_gangguan_screen.dart';
import 'package:d_bam/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme:
              ElevatedButtonThemeData(style: kElevatedBtnStyle),
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          ChooseScreen.id: (context) => ChooseScreen(),
          FormGangguan.id: (context) => FormGangguan()
        });
  }
}
