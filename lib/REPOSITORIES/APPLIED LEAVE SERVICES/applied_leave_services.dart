import 'dart:convert';

import 'package:hr_easy/BLoC%20and%20Model/APPLIED%20LEAVE%20BLoC/applied_model.dart';
import 'package:hr_easy/CONSTANT/api_url.dart';
import 'package:http/http.dart' as http;

class AppliedLeaveServices {
  Future getAppliedLeaves(
    String fyID,
    String empCode,
    String date,
  ) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final endPopint =
        "EmpRecentAppliedLeave?FyId=$fyID&EmpCode=$empCode&FromDate=$date";
    try {
      final response = await http.get(Uri.parse(Constant.baseUrl + endPopint),
          headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data = AppliedModel.fromJson(jsonData);
        return data.appliedData;
      } else {
        print("API Failed");
      }
    } catch (e) {
      print("Exception");
    }
  }
}
