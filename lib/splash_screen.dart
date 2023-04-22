import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_easy/DashBoard/dashboard_screen.dart';
import 'package:hr_easy/SHARED%20PREF%20UTILS/shared_pref_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'OTP FOLDER/otp_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void chechUserLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final user = sp.get(SharedPrefUtils.phoneNumberKey);
    print(user);
    if (user == null) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => const OtpScreen()));
    } else if (user != null) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => DashBoardScreen()));
    } else {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => DashBoardScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    chechUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.teal,
      )),
    );
  }
}
