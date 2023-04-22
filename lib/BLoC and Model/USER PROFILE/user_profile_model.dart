import 'package:flutter/cupertino.dart';

class UserProfileModel {
  int? oK;
  List<Getdatabynumber>? getdatabynumber;

  UserProfileModel({this.oK, this.getdatabynumber});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    oK = json['OK'];
    if (json['getdatabynumber'] != null) {
      getdatabynumber = <Getdatabynumber>[];
      json['getdatabynumber'].forEach((v) {
        getdatabynumber?.add(new Getdatabynumber.fromJson(v));
      });
    }
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
