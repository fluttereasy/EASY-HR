import 'package:flutter/material.dart';

class LoginCameraButton extends StatefulWidget {
  const LoginCameraButton({Key? key}) : super(key: key);

  @override
  State<LoginCameraButton> createState() => _LoginCameraButtonState();
}

class _LoginCameraButtonState extends State<LoginCameraButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Mark Attendance',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("Mark Attendance")))
        ],
      ),
    );
  }
}
