class CheckboxValue {
  String name = "";
  bool isSelected = false;

  CheckboxValue({required this.name, required this.isSelected});

  CheckboxValue.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isSelected'] = this.isSelected;
    return data;
  }
}