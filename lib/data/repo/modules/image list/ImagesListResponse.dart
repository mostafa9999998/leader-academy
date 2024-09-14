class ImagesListResponse {
  ImagesListResponse({
      this.id, 
      this.image, 
      this.fullSrc,});

  ImagesListResponse.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    fullSrc = json['FullSrc'];
  }
  int? id;
  String? image;
  String? fullSrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['FullSrc'] = fullSrc;
    return map;
  }

}