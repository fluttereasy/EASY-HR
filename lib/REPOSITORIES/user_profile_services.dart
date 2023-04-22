import 'dart:convert';
import 'package:hr_easy/BLoC%20and%20Model/USER%20PROFILE/user_profile_model.dart';
import 'package:hr_easy/CONSTANT/api_url.dart';
import 'package:http/http.dart' as http;

class UserProfile {
  Future getUserProfile(String phoneNumber) async {
    print("inside profile");

    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      String endPoint = "GetIdbyNumber?MobileNo=$phoneNumber";
      final response = await http.get(
        Uri.parse(Constant.baseUrl + endPoint),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data = (UserProfileModel.fromJson(jsonData));
        return data;
      } else {
        print("userProfileAPI Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
