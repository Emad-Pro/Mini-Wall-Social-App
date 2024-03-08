import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  String? postsMessage;
  String? email;
  Timestamp? timeStmp;

  Posts({this.postsMessage, this.email, this.timeStmp});

  Posts.fromJson(Map<String, dynamic> json) {
    postsMessage = json['postMessage'];
    email = json['userEmail'];
    timeStmp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['postMessage'] = postsMessage;
    data['userEmail'] = email;
    data['timeStamp'] = timeStmp;
    return data;
  }

  factory Posts.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Posts(
        postsMessage: data['postMessage'],
        email: data['userEmail'],
        timeStmp: data['timeStamp']);
  }
}
