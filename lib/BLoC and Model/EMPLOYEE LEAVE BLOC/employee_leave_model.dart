
class EmployeeLeaveModel {
  int? oK;
  List ?getLeaveData;

  EmployeeLeaveModel({this.oK, this.getLeaveData});

  factory EmployeeLeaveModel.fromJson(Map<String, dynamic> json) {
    return EmployeeLeaveModel(
      oK: json["OK"],
      getLeaveData: json["EmpLeave"]
    );
    // if (json['EmpLeave'] != null) {
    //   getLeaveData = <EmployeeLeaveData>[];
    //   json['EmpLeave'].forEach((v) {
    //     getLeaveData?.add(EmployeeLeaveData.fromJson(v));
    //   });
    // }
  }
}
class EmployeeLeaveData {
  String? empName;
  String? leavelimit;
  String? leaveCode;
  String? totalLeave;
  String? startingDate;
  String? endingDate;
  String? leaveTaken;
  String? balance;
  String? duration;
  String? permission;

  EmployeeLeaveData({
    this.empName,
    this.leavelimit,
    this.leaveCode,
    this.totalLeave,
    this.startingDate,
    this.endingDate,
    this.leaveTaken,
    this.balance,
    this.duration,
    this.permission,
  });

  factory EmployeeLeaveData.fromJson(Map<String, dynamic> json) {
    return EmployeeLeaveData(
      empName: json['EmpName'],
      leavelimit: json['Leavelimit'],
      leaveTaken: json["LeaveTaken"],
      leaveCode: json["LeaveCode"],
      totalLeave: json["TotalLeave"],
      startingDate: json["StartingDate"],
      endingDate: json["EndingDate"],
      balance: json["Balance"],
      duration: json["Duration"],
      permission: json["Permission"],
    );
  }
}
