import 'dart:io' show Platform, exit;

import 'package:d_bam/screens/choose_screen/choose_screen.dart';
import 'package:d_bam/screens/customer_screen/form_customer_screen.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';
import 'components/locale_dropdown.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      backgroundColor: kBgColour,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorPadding,
            vertical: kVerPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (BuildContext context) {
                    return InkWell(
                      child: SvgPicture.asset(
                        'assets/icons/ic_menu.svg',
                      ),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  }),
                  CircleAvatar(
                    backgroundColor: kBgColour,
                    child: Image.asset(
                      'assets/images/logo1.png',
                      fit: BoxFit.cover,
                    ),
                    radius: 24,
                  ),
                ],
              ),
              LocaleDropdown(),
              Spacer(),
              Expanded(
                flex: 2,
                child: SvgPicture.asset(
                  'assets/images/img_blank.svg',
                  height: 300,
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 78,
              ),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.labelHome,
                  style: kTextStyle20,
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              BottonRounded(
                title: AppLocalizations.of(context)!.buttonCreateBA,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: FormCustomer(),
                        type: PageTransitionType.rightToLeft),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press Again to Exit Bro !');
      return Future.value(false);
    }
    Platform.isAndroid ? SystemNavigator.pop() : exit(0);
    return Future.value(true);
  }

  Widget drawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 16,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: kBgColour,
          width: 2,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(kPadding * 2),
          topRight: Radius.circular(kPadding * 2),
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(kPadding * 2),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: kPadding * 6,
                  color: kIcColour,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Digitalisasi ',
                      style: kTextStyle14Bold,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Berita Acara Manual ',
                      style: kTextStyle14Bold,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Name',
                  style: kTextStyle14Bold,
                ),
              ),
              ListTile(
                leading: Icon(Icons.card_membership),
                title: Text(
                  'NIK',
                  style: kTextStyle14Bold,
                ),
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text(
                  'Role',
                  style: kTextStyle14Bold,
                ),
              ),
              SizedBox(
                height: kPadding * 2,
              ),
              Text(
                'This layout is not yet implemented',
                style: kTextStyle16Bold,
              ),
            ],
          ),
          Spacer(),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Divider(),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: kTextStyle14Bold,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text(
                    'Help',
                    style: kTextStyle14Bold,
                  ),
                ),
                _infoTile('d_bam version', _packageInfo.version),
                // _infoTile('Build number', _packageInfo.buildNumber),
                // _infoTile('Build signature', _packageInfo.buildSignature),
                // _infoTile('App name', _packageInfo.appName),
                // _infoTile('Package name', _packageInfo.packageName),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: kTextStyle14,
      ),
      subtitle: Text(
        subtitle.isEmpty ? 'Not set' : subtitle,
        style: kTextStyle14,
      ),
    );
  }
}
