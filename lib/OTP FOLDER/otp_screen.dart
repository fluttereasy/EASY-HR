import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_easy/BLoC%20and%20Model/OTP%20BLoC/otp_bloc.dart';
import 'otp_verification_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _numberController = TextEditingController();
  final _otpFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _numberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpBloc(),
      child: Scaffold(
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
          child: Form(
            key: _otpFormKey,
            child: SingleChildScrollView(
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
                    validator: (value) {
                      if (value!.isEmpty || value.length < 10) {
                        return "Please check the Number";
                      }
                      return null;
                    },
                    controller: _numberController,
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
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300))),
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<OtpBloc, OtpState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () async {
                            // calling OTP Bloc for Otp
                            if (_otpFormKey.currentState!.validate()) {
                              if (_numberController.text.length == 10) {
                                context.read<OtpBloc>().add(OtpSendEvent(
                                    phoneNumber: _numberController.text));

                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            OtpVerificationScreen(
                                              phoneNumber:
                                                  _numberController.text,
                                            )));
                              }
                            }
                          },
                          child: const Text(
                            'Get OTP',
                            style: TextStyle(fontSize: 18, letterSpacing: 2),
                          ));
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Don't have account? ",
                          style: TextStyle(fontSize: 18)),
                      Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.teal, fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
