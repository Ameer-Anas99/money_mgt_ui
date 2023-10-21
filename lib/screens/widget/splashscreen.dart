import 'package:flutter/material.dart';
import 'package:my_app/bottom/bottomnavigationbar.dart';
import 'package:my_app/main.dart';
import 'package:my_app/screens/widget/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo mgt.jpeg',
          height: 310,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    Future.delayed(
      Duration(seconds: 5),
    );
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ScreenLogin()));
  }

  Future<void> checkUserLoggedIn() async {
    final sharedpref = await SharedPreferences.getInstance();
    final userLoggedIn = sharedpref.getBool(saveKeyName);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => BottomBar(username: "", userimage: ""),
      ));
    }
  }
}