import 'dart:convert';

import 'package:hr_easy/CONSTANT/api_url.dart';
import 'package:http/http.dart' as http;

class OtpServicces {
  static int? otpSent;
  Future sendOtp(String phoneNumber) async {
    try {
      final String endPoint = "GenrateOTPByNumber?MobileNumber=$phoneNumber";
      final response = await http.post(Uri.parse(Constant.baseUrl + endPoint));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body.toString());
        var otpCode = jsonData[0];
        OtpServicces.otpSent = otpCode;
        print(otpCode);
        return otpCode;
      }
    } on Exception catch (e) {
      print("Exception");
    }
  }
}
