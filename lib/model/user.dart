class Users {
  late int id;
  late String name;
  late String username;
  late String email;
  late String phone;
  late String website;

  Users(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website});

  //constructor that can take a JSON object and create a Users
  //instance from it, this function will return a
  //list of user data obtained from the specified URL
  Users.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    username = json["username"];
    email = json["email"];
    phone = json["phone"];
    website = json["website"];
  }
}
