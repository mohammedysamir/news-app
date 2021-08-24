class SourceResponse {

  String status;
  List<Source> sources;

  SourceResponse.fromJsonMap(Map<String, dynamic> map):
        status = map["status"],
        sources = List<Source>.from(map["sources"].map((d) => Source.fromJsonMap(d)));
}
class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Source.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        name = map["name"],
        description = map["description"],
        url = map["url"],
        category = map["category"],
        language = map["language"],
        country = map["country"];
}