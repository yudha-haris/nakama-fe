class Kategori {
  final String? id;
  final String? judul;
  final String? username;

  Kategori({
        this.id,
        this.judul,
        this.username,
      });

  static Kategori parseFromResponse(List<dynamic> data){
    return Kategori(
      id: data[0].toString(),
      judul: data[1].toString(),
      username: data[2].toString(),
    );
  }
}