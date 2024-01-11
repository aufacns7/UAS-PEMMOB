class Movies {
  String? title;
  String? released;
  String? plot;
  String? language;
  List<String>? images;

  Movies({this.title, this.released, this.plot, this.language, this.images});

  Movies.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    released = json['Released'];
    plot = json['Plot'];
    language = json['Language'];
    images = json['Images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Released'] = this.released;
    data['Plot'] = this.plot;
    data['Language'] = this.language;
    data['Images'] = this.images;
    return data;
  }
}
