class ProfileModel {
  String? email;
  String? name;

  ProfileModel({this.email, this.name});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
