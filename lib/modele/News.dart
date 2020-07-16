class News {
  final String title;
  final String content;
  final String date;

  News(this.title, this.content, this.date);

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      json["title"],
      json["content"],
      json["date"],
    );
  }
}