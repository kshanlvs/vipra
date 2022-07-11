import 'package:flutter/material.dart';
import 'package:vipratechuserauth/route/routenames.dart';
import 'package:vipratechuserauth/route/routes.dart';
import 'package:provider/provider.dart';
import 'package:vipratechuserauth/utils/providers.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providerList,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: _themeData,
          initialRoute: RouteNames.loginPage,
          onGenerateRoute: RouteManager.generateRoute),
    );
  }
}

ThemeData get _themeData {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: _primarySwatch,
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0.0,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black, size: 24.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        primary: primaryColor,
        side: const BorderSide(color: primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      )),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
      iconTheme: const IconThemeData(color: Color(0xFF1C1B1B), size: 24),
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        shadowColor: Color(0x24579924),
      ));
}

const MaterialColor _primarySwatch = MaterialColor(
  _primaryValue,
  <int, Color>{
    50: Color(0xFF2A5798),
    100: Color(0xFF2A5798),
    200: Color(0xFF2A5798),
    300: Color(0xFF2A5798),
    400: Color(0xFF2A5798),
    500: Color(_primaryValue),
    600: Color(0xFF2A5798),
    700: Color(0xFF2A5798),
    800: Color(0xFF2A5798),
    900: Color(0xFF2A5798),
  },
);
const int _primaryValue = 0xff685EC0;
const primaryColor = Colors.amber;
