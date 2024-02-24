class Article {
  String? author, sourceName, title, desc, url, urlImage, date;

  Article({
    this.author,
    this.sourceName,
    this.title,
    this.url,
    this.urlImage,
    this.date,
    this.desc,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'],
      sourceName: json['source']['name'],
      title: json['title'],
      desc: json['description'],
      url: json['url'],
      urlImage: json['urlToImage'],
      date: json['publishedAt'],
    );
  }
}
