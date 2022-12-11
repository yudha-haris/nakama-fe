class Activity {
  final String? id;
  final String? judul;
  final String? isi;
  final String? writer;
  final String? timeStamp;
  final bool? isFinish;
  List<String>? categoryId;
  final String? tempCategory;

  Activity({
    this.id,
    this.judul,
    this.isi,
    this.writer,
    this.timeStamp,
    this.isFinish,
    this.categoryId,
    this.tempCategory,
  });

  static Activity parseFromResponse(List<dynamic> data) {
    return Activity(
      id: data[0].toString(),
      judul: data[1].toString(),
      isi: data[2].toString(),
      writer: data[3].toString(),
      timeStamp: data[4] ?? '07/12/2022',
      isFinish: data[5] ?? false,
      tempCategory: data[6] ?? '',
    );
  }

  static Activity parseFromResponseHistory(List<dynamic> data) {
    return Activity(
      id: data[0].toString(),
      judul: data[1].toString(),
      isi: data[2].toString(),
      writer: data[3].toString(),
      timeStamp: data[4] ?? '07/12/2022',
      isFinish: data[5] ?? false,
    );
  }
}
