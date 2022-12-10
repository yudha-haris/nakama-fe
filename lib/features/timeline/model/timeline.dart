
class Timeline {
  final String? id;
  final String? judul;
  final String? isi;
  final String? writer;
  final String? timeStamp;

  Timeline({
    this.id,
    this.judul,
    this.isi,
    this.writer,
    this.timeStamp,
  });

  static Timeline parseFromResponse(List<dynamic> data){
    return Timeline(
      id: data[0].toString(),
      judul: data[1].toString(),
      isi: data[2].toString(),
      writer: data[3].toString(),
      timeStamp: data[4].toString(),
    );
  }

}