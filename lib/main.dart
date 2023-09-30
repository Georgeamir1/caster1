import 'dart:async';
import 'package:caster1/regBirthdate.dart';
import 'package:flutter/material.dart';
import 'core/ui_components/componants.dart';
import 'Onboarding1.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'editprofile.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  bool _showSplash = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      setState(() {
        FlutterNativeSplash.remove();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding1(),
      // home: _showSplash ? const SplashScreen() :  Editprofile(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Secondary,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/image.png',width: 30),
                  Text(
                      " Media way",
                      style: TextStyle(color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                      )
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical:  70.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/splash.png",

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}