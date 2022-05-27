final String tableShift = 'msshift';

class MsShift {
  int ShiftId = -1;
  String siteId = '';
  String ShiftName = '';
  String ShiftStartTime = '';
  String ShiftEndTime = '';

  MsShift(
      { required this.ShiftId,
        required this.siteId,
        required this.ShiftName,
        required this.ShiftStartTime,
        required this.ShiftEndTime});

  MsShift.fromJson(Map<String, dynamic> json) {
    ShiftId = json['shift_id'];
    siteId = json['site_id'];
    ShiftName = json['ShiftName'];
    ShiftStartTime = json['ShiftStartTime'];
    ShiftEndTime = json['ShiftEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shift_id'] = this.ShiftId;
    data['site_id'] = this.siteId;
    data['ShiftName'] = this.ShiftName;
    data['ShiftStartTime'] = this.ShiftStartTime;
    data['ShiftEndTime'] = this.ShiftEndTime;
    return data;
  }
}