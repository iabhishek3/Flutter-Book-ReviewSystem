class loginRes {
  final String id;

  loginRes({this.id});

  factory loginRes.fromJson(Map<String, dynamic> json) {
    return loginRes(
      id: json['id'],
    );
  }
}
