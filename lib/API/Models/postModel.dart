class Postmodel {
  int id, tweeUserId;
  String image, descriptions, tweetUsername;
  Postmodel({
    this.id,
    this.descriptions,
    this.image,
  });

  Postmodel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    // this.tweeUserId = map['users_permissions_user']['id'];
    //  this.tweetUsername = map['users_permissions_user']['username'];
    this.descriptions = map['descriptions'];
    this.image = map['image']['url'];
  }
}
