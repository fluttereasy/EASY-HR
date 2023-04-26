import 'package:flutter/cupertino.dart';

class UserProfileModel {
  int? oK;
  // List<Getdatabynumber>? getdatabynumber;
  List? getdatabynumber;

  UserProfileModel({this.oK, this.getdatabynumber});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
        oK: json['OK'], getdatabynumber: json["getEmpdatabynumber"]);
    // if (json['getdatabynumber'] != null) {
    //   getdatabynumber = <Getdatabynumber>[];
    //   json['getdatabynumber'].forEach((v) {
    //     getdatabynumber?.add(Getdatabynumber.fromJson(v));
    //   });
    // }
  }
}

class Getdatabynumber {
  String? empId;
  String? empCode;
  String? unitId;
  String? hospitalId;
  String? fyId;

  Getdatabynumber(
      {this.empId, this.empCode, this.unitId, this.hospitalId, this.fyId});

  factory Getdatabynumber.fromJson(Map<String, dynamic> json) {
    return Getdatabynumber(empCode: json['EmpCode'], empId: json['EmpId']);
  }
}
