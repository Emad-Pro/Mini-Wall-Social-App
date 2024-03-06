class PostsModel {
  List<Posts>? posts;

  PostsModel({this.posts});

  PostsModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? userName;
  String? postsMessage;
  String? email;
  String? timeStmp;

  Posts({this.userName, this.postsMessage, this.email, this.timeStmp});

  Posts.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    postsMessage = json['postMessage'];
    email = json['userEmail'];
    timeStmp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['postMessage'] = postsMessage;
    data['userEmail'] = email;
    data['timeStamp'] = timeStmp;
    return data;
  }
}
