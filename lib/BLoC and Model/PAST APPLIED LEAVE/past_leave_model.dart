class PastAppliedModel {
  int? oK;
  List? appliedData;

  PastAppliedModel({this.oK, this.appliedData});

  factory PastAppliedModel.fromJson(Map<String, dynamic> json) {
    return PastAppliedModel(
        oK: json["OK"], appliedData: json["OldAppliedLeave"]);
    // if (json['EmpLeave'] != null) {
    //   getLeaveData = <EmployeeLeaveData>[];
    //   json['EmpLeave'].forEach((v) {
    //     getLeaveData?.add(EmployeeLeaveData.fromJson(v));
    //   });
    // }
  }
}
