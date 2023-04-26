import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../BLoC and Model/EMPLOYEE LEAVE BLOC/employee_leave_model.dart';
import '../../CONSTANT/api_url.dart';

class EmployeeLeaveServices {
  Future getLeaveBalance(String empCode, String financialID) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String endPoint = "EmpBalanceLeave?EmpCode=$empCode&FyId=$financialID";
    try {
      final response = await http.get(Uri.parse(Constant.baseUrl + endPoint),
          headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final leaveData = EmployeeLeaveModel.fromJson(jsonData);
        return leaveData.getLeaveData;
      } else {
        print("Leave Api Failed");
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
