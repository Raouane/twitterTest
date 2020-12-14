class Postmodel {
  int id;
  String image, descriptions;
  Postmodel({
    this.id,
    this.descriptions,
    this.image,
  });

  Postmodel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.descriptions = map['descriptions'];
    this.image = map['image']['name'];
    // this.profileimg = map['image']['image']['profileimage']['name'];
  }
}
