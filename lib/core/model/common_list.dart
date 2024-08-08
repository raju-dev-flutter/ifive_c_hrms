class CommonList {
  int? id;
  String? name;

  CommonList({this.id, this.name});

  CommonList.fromJson(Map<String, dynamic> json) {
    if (json['leave_type'] != null) {
      id = json['leave_type_id'];
      name = json['leave_type'];
    }
    if (json['first_name'] != null) {
      id = json['employee_id'];
      name = json['first_name'];
    }
    if (json['permission_type'] != null) {
      id = json['permission_type_id'];
      name = json['permission_type'];
    }
    if (json['shift_name'] != null) {
      id = json['shift_id'];
      name = json['shift_name'];
    }
    if (json['lookup_meaning'] != null) {
      id = json['lookuplines_id'];
      name = json['lookup_meaning'];
    }
    if (json['country_name'] != null) {
      id = json['country_id'];
      name = json['country_name'];
    }
    if (json['state_name'] != null) {
      id = json['state_id'];
      name = json['state_name'];
    }
    if (json['city_name'] != null) {
      id = json['city_id'];
      name = json['city_name'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
