class MeModel {
  int id;
  String username, email;
  MeModel({
    this.id,
    this.email,
  });

  MeModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.username = map['username'];
    this.email = map['email'];
  }
}
