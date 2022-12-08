class Kategori {
  String? username;
  String? email;
  String? phoneNumber;
  String? name;
  String? theme;
  bool? isAdmin;

  Kategori(
      {this.username,
        this.email,
        this.phoneNumber,
        this.name,
        this.theme,
        this.isAdmin});

  Kategori.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    name = json['name'];
    theme = json['theme'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['name'] = name;
    data['theme'] = theme;
    data['is_admin'] = isAdmin;
    return data;
  }
}