class PdfResponse {
  PdfResponse({
      this.message, 
      this.pdfs,});

  PdfResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['pdfs'] != null) {
      pdfs = [];
      json['pdfs'].forEach((v) {
        pdfs?.add(Pdfs.fromJson(v));
      });
    }
  }
  String? message;
  List<Pdfs>? pdfs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (pdfs != null) {
      map['pdfs'] = pdfs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Pdfs {
  Pdfs({
      this.id, 
      this.lessonId, 
      this.pdf, 
      this.title, 
      this.description, 
      this.fullSrc,});

  Pdfs.fromJson(dynamic json) {
    id = json['id'];
    lessonId = json['lesson_id'];
    pdf = json['pdf'];
    title = json['title'];
    description = json['description'];
    fullSrc = json['FullSrc'];
  }
  int? id;
  int? lessonId;
  String? pdf;
  String? title;
  String? description;
  String? fullSrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['lesson_id'] = lessonId;
    map['pdf'] = pdf;
    map['title'] = title;
    map['description'] = description;
    map['FullSrc'] = fullSrc;
    return map;
  }

}