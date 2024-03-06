class CustomProfileModel {
  String? email;
  String? name;

  CustomProfileModel({this.email, this.name});

  CustomProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['userName'] = name;
    return data;
  }
}
