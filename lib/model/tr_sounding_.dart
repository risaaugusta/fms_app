// class TrSoundingNew {
//   int? soundingId;
//   String? siteId;
//   int? shiftId;
//   String? storageId;
//   String? sounding;
//   String? createdBy;
//   String? createdAt;
//   String? isSelected = "false";
//
//   TrSoundingNew(
//       {this.soundingId,
//         this.siteId,
//         this.shiftId,
//         this.sounding,
//         this.storageId,
//         this.createdBy,
//         this.createdAt,
//         this.isSelected});
//
//   TrSoundingNew.fromJson(Map<String, dynamic> json) {
//     soundingId = json['sounding_id'];
//     siteId = json['site_id'];
//     shiftId = int.parse(json['shift_id']);
//     sounding = json['sounding'];
//     storageId = json['storage_id'];
//     createdBy = json['created_by'];
//     createdAt = json['created_at'];
//     isSelected = json['isSelected'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['sounding_id'] = this.soundingId;
//     data['site_id'] = this.siteId;
//     data['shift_id'] = this.shiftId;
//     data['sounding'] = this.sounding;
//     data['storage_id'] = this.storageId;
//     data['created_by'] = this.createdBy;
//     data['created_at'] = this.createdAt;
//     data['is_selected'] = this.isSelected;
//     return data;
//   }
// }