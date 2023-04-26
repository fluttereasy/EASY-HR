import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_easy/REPOSITORIES/OTP%20SERVICES/otp_services.dart';
import 'package:hr_easy/SHARED%20PREF%20UTILS/shared_pref_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DashBoard/dashboard_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String? phoneNumber;
  const OtpVerificationScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();

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
                text: TextSpan(children: [
              const TextSpan(
                  text: 'Enter the code that we have sent on your \n number',
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              TextSpan(
                  text: "  ${widget.phoneNumber?.substring(0, 6)}" "***",
                  style: const TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ])),
            const SizedBox(height: 30),
            PinCodeTextField(
              appContext: context,
              length: 6, // Length of the OTP
              obscureText:
                  false, // Set to true if the OTP digits should be obscured
              controller: otpController,
              onChanged: (value) {},
              onCompleted: (value) {
                // Callback function when the OTP is completed
                //todo
              },
              keyboardType:
                  TextInputType.number, // Set the keyboard type to numeric
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(20),
                fieldHeight: 40,
                fieldWidth: 40,
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
                onPressed: () async {
                  if (otpController.text == OtpServicces.otpSent.toString()) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => DashBoardScreen(
                                  phonNumber: widget.phoneNumber,
                                )));

                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString(SharedPrefUtils.phoneNumberKey,
                        widget.phoneNumber.toString());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Incorrect OTP")));
                  }
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
