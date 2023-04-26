class AppliedModel {
  int? oK;
  List? appliedData;

  AppliedModel({this.oK, this.appliedData});

  factory AppliedModel.fromJson(Map<String, dynamic> json) {
    return AppliedModel(oK: json["OK"], appliedData: json["OldAppliedLeave"]);
    // if (json['EmpLeave'] != null) {
    //   getLeaveData = <EmployeeLeaveData>[];
    //   json['EmpLeave'].forEach((v) {
    //     getLeaveData?.add(EmployeeLeaveData.fromJson(v));
    //   });
    // }
  }
}
