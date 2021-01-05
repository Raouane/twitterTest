class UserModel {
  int id;
  String username, email, image, bannar;
  UserModel({
    this.id,
    this.email,
    this.image,
    this.bannar,
  });

  UserModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.username = map['username'];
    this.email = map['email'];
    this.image = map['image']['url'];
    this.bannar = map['bannar']['url'];

    // this.image = map['image'] != null ? map['image']['url'] : null;
    // this.bannar = map['bannar'] != null ? map['bannar']['url'] : null;
  }
}
