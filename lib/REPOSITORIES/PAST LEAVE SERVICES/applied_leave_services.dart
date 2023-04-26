import 'dart:convert';
import 'package:hr_easy/BLoC%20and%20Model/PAST%20APPLIED%20LEAVE/past_leave_model.dart';
import 'package:hr_easy/CONSTANT/api_url.dart';
import 'package:http/http.dart' as http;

class PastAppliedServices {
  Future getPastLeaves(String fyID, String date, String empCode) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String endPoint =
        "EmpOldAppliedLeave?FyId=$fyID&FromDate=$date&EmpCode=$empCode";

    try {
      final response = await http.get(Uri.parse(Constant.baseUrl + endPoint),
          headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data = PastAppliedModel.fromJson(jsonData);
        return data.appliedData;
        //print(data.appliedData);
      } else {
        print("API Failed PAst LEave");
      }
    } catch (e) {}
  }
}
