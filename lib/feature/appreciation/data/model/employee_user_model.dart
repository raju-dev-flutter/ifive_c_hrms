import '../../../../core/core.dart';

class EmployeeUserModel {
  List<CommonList>? employeeList;

  EmployeeUserModel({this.employeeList});

  EmployeeUserModel.fromJson(Map<String, dynamic> json) {
    if (json['userlist'] != null) {
      employeeList = <CommonList>[];
      json['userlist'].forEach((v) {
        employeeList!.add(CommonList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employeeList != null) {
      data['userlist'] = employeeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
