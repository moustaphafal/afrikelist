class User {
  final String uid;
  String name;
  bool isManager;

  User({this.uid, this.name, this.isManager});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'isManager': isManager,
    };
  }
}
