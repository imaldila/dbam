import 'package:d_bam/constants.dart';
import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PackageData>(create: (BuildContext context) {
          return PackageData();
        }),
        ChangeNotifierProvider<DatePicker>(create: (BuildContext context) {
          return DatePicker();
        }),
        ChangeNotifierProvider<CategoryData>(create: (BuildContext context) {
          return CategoryData();
        }),
        ChangeNotifierProvider<TextData>(create: (BuildContext context) {
          return TextData();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: kElevatedBtnStyle,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

// onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case HomeScreen.id:
      //       return PageTransition(
      //           child: HomeScreen(), type: PageTransitionType.rightToLeft);
      //     case ChooseScreen.id:
      //       return PageTransition(
      //           child: ChooseScreen(), type: PageTransitionType.rightToLeft);
      //     case FormGangguan.id:
      //       return PageTransition(
      //           child: FormGangguan(),
      //           type: PageTransitionType.leftToRight,
      //           settings: settings);

      //     default:
      //       return null;
      //   }
      // },
      // routes: {
      //   HomeScreen.id: (context) => HomeScreen(),
      //   ChooseScreen.id: (context) => ChooseScreen(),
      //   FormGangguan.id: (context) => FormGangguan()
      // },
