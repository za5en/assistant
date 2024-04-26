class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.currency,
    required this.isEmailConfirmed,
    this.isSubscribed,
    this.imagePath,
    this.password,
    required this.groups,
    this.invites,
    this.premium,
  });

  int id;
  String? email;
  String? name;
  int? currency;
  List<String>? devices;
  bool? isSubscribed;
  String? imagePath;
  String? password;
  bool isEmailConfirmed;
  Map groups;
  Map? invites;
  bool? premium;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        currency: json["currency"] == '' ? 0 : json["currency"],
        imagePath: json["photo"],
        isEmailConfirmed: (json["isEmailConfirmed"] ?? '') == ''
            ? false
            : json["isEmailConfirmed"],
        //isSubscribed: json["subscription"],
        groups: json["groups"] == '' ? {} : json["groups"],
        invites: json["invites"],
        premium: json["premium"],
      )..devices = List.from(json['syncDevices'] ?? []);
}
