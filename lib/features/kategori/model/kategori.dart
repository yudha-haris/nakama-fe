class Kategori {
  final String? id;
  final String? judul;
  final String? username;

  Kategori(
      {
        this.id,
        this.judul,
        this.username,
      });

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['judul'] = judul;
    return data;
  }
}