import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../DashBoard/dashboard_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  String currentText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Verification Code',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 2),
            ),
            const SizedBox(height: 10),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'Enter the code that we have sent on your \n number',
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              TextSpan(
                  text: '    7985564***',
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ])),
            const SizedBox(height: 30),
            PinCodeTextField(
              appContext: context,
              length: 4, // Length of the OTP
              obscureText:
                  false, // Set to true if the OTP digits should be obscured
              controller: otpController,
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
              onCompleted: (value) {
                // Callback function when the OTP is completed
                //todo
              },
              keyboardType:
                  TextInputType.number, // Set the keyboard type to numeric
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(20),
                fieldHeight: 70,
                fieldWidth: 70,
                activeFillColor: Colors.white,
                activeColor: Colors.teal,
                inactiveFillColor: Colors.white,
                inactiveColor: Colors.grey,
                selectedFillColor: Colors.white,
                selectedColor: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const DashBoardScreen()));
                },
                child: const Text(
                  'Verify',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Did't receive the code? ",
                    style: TextStyle(fontSize: 18)),
                Text(
                  'Resend',
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
