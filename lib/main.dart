import 'package:d_bam/constants.dart';
import 'package:d_bam/l10n/l10n.dart';
import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/choose_data.dart';
import 'package:d_bam/models/counter.dart';
import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/evident.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/providers/local_provider.dart';
import 'package:d_bam/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PackageData>(
          create: (context) => PackageData(),
        ),
        ChangeNotifierProvider<DatePicker>(
          create: (context) => DatePicker(),
        ),
        ChangeNotifierProvider<CategoryData>(
          create: (context) => CategoryData(),
        ),
        ChangeNotifierProvider<TextData>(
          create: (context) => TextData(),
        ),
        ChangeNotifierProvider<Counter>(
          create: (context) => Counter(),
        ),
        ChangeNotifierProvider<ChooseData>(
          create: (context) => ChooseData(),
        ),
        ChangeNotifierProvider<LocaleProvider>(
          create: (context) => LocaleProvider(),
        ),
        ChangeNotifierProvider<Evident>(
          create: (context) => Evident(),
        ),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, snapShot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: kElevatedBtnStyle,
              ),
            ),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            locale: localeProvider.locale,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
