class VideoResponse {
  VideoResponse({
      this.title, 
      this.description, 
      this.url,});

  VideoResponse.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    url = json['url'];
  }
  String? title;
  String? description;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    return map;
  }

}