
class BeritaHeadlineModel {
  String? _srcID;
  String? _srcName;
  String? _author;
  String? _title;
  String? get srcID => _srcID;
  String? _description;
  String? _url;
  String? _urlToImage;
  DateTime? _publishedAt;
  String? _content;

 BeritaHeadlineModel(this._srcID, this._srcName, this._author, this._title,
      this._description, this._url, this._urlToImage, this._publishedAt,
      this._content);


  factory BeritaHeadlineModel.fromJson(Map<String, dynamic> json) {
    return BeritaHeadlineModel(
        json["source"]["id"],
        json["source"]["name"],
        json["author"],
        json["title"],
        json["description"],
        json["url"],
        json["urlToImage"],
        DateTime.parse(json["publishedAt"]),
        json["content"]
    );
  }

  String? get srcName => _srcName;

  String? get author => _author;

  String? get title => _title;

  String? get description => _description;

  String? get url => _url;

  String? get urlToImage => _urlToImage;

  DateTime? get publishedAt => _publishedAt;

  String? get content => _content;


}