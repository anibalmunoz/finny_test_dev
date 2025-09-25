class CourseModel {
  final String? uid;
  final String? courseNumber;
  final String? title;
  final String? summary;
  final int? durationInHours;
  final String? url;
  final String? iconUrl;
  final List<String>? locales;
  final String? type;
  final String? certification;
  final String? exam;
  final List<String>? levels;
  final List<String>? roles;
  final List<String>? products;
  final List<StudyGuide>? studyGuide;

  CourseModel({
    this.uid,
    this.courseNumber,
    this.title,
    this.summary,
    this.durationInHours,
    this.url,
    this.iconUrl,
    this.locales,
    this.type,
    this.certification,
    this.exam,
    this.levels,
    this.roles,
    this.products,
    this.studyGuide,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    uid: json["uid"],
    courseNumber: json["course_number"],
    title: json["title"],
    summary: json["summary"],
    durationInHours: json["duration_in_hours"],
    url: json["url"],
    iconUrl: json["icon_url"],
    locales: json["locales"] == null ? [] : List<String>.from(json["locales"]!.map((x) => x)),
    type: json["type"],
    certification: json["certification"],
    exam: json["exam"],
    levels: json["levels"] == null ? [] : List<String>.from(json["levels"]!.map((x) => x)),
    roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
    products: json["products"] == null ? [] : List<String>.from(json["products"]!.map((x) => x)),
    studyGuide: json["study_guide"] == null
        ? []
        : List<StudyGuide>.from(json["study_guide"]!.map((x) => StudyGuide.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "course_number": courseNumber,
    "title": title,
    "summary": summary,
    "duration_in_hours": durationInHours,
    "url": url,
    "icon_url": iconUrl,
    "locales": locales == null ? [] : List<dynamic>.from(locales!.map((x) => x)),
    "type": type,
    "certification": certification,
    "exam": exam,
    "levels": levels == null ? [] : List<dynamic>.from(levels!.map((x) => x)),
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
    "study_guide": studyGuide == null ? [] : List<dynamic>.from(studyGuide!.map((x) => x.toJson())),
  };
}

class StudyGuide {
  final String? uid;
  final String? type;

  StudyGuide({this.uid, this.type});

  factory StudyGuide.fromJson(Map<String, dynamic> json) => StudyGuide(uid: json["uid"], type: json["type"]);

  Map<String, dynamic> toJson() => {"uid": uid, "type": type};
}
