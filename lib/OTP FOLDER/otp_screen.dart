import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'otp_verification_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 2),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Enter your number to login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                    letterSpacing: 2),
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  hintText: 'Enter your number',
                  prefixIcon: const Icon(
                    Icons.local_post_office_outlined,
                    color: Colors.grey,
                  ),
                  filled: true,
                  focusColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey.shade300))),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => OtpVerificationScreen()));
                },
                child: const Text(
                  'Get OTP',
                  style: TextStyle(fontSize: 18, letterSpacing: 2),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Don't have account? ", style: TextStyle(fontSize: 18)),
                Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.teal, fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
