import 'dart:convert';

class Module {
  final String? summary;
  final List<String>? products;
  final String? uid;
  final Type? type;
  final String? title;
  final int? durationInMinutes;
  final Rating? rating;
  final double? popularity;
  final String? iconUrl;
  final String? socialImageUrl;
  final DateTime? lastModified;
  final String? url;
  final String? firstUnitUrl;
  final List<String>? units;
  final int? numberOfChildren;
  final List<String>? subjects;

  Module({
    this.summary,
    this.products,
    this.uid,
    this.type,
    this.title,
    this.durationInMinutes,
    this.rating,
    this.popularity,
    this.iconUrl,
    this.socialImageUrl,
    this.lastModified,
    this.url,
    this.firstUnitUrl,
    this.units,
    this.numberOfChildren,
    this.subjects,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
    summary: json["summary"],
    products: json["products"] == null ? [] : List<String>.from(json["products"]!.map((x) => x)),
    uid: json["uid"],
    title: json["title"],
    durationInMinutes: json["duration_in_minutes"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    popularity: json["popularity"]?.toDouble(),
    iconUrl: json["icon_url"],
    socialImageUrl: json["social_image_url"],
    lastModified: json["last_modified"] == null ? null : DateTime.parse(json["last_modified"]),
    url: json["url"],
    firstUnitUrl: json["firstUnitUrl"],
    units: json["units"] == null ? [] : List<String>.from(json["units"]!.map((x) => x)),
    numberOfChildren: json["number_of_children"],
    subjects: json["subjects"] == null ? [] : List<String>.from(json["subjects"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
    "uid": uid,
    "title": title,
    "duration_in_minutes": durationInMinutes,
    "rating": rating?.toJson(),
    "popularity": popularity,
    "icon_url": iconUrl,
    "social_image_url": socialImageUrl,
    "last_modified": lastModified?.toIso8601String(),
    "url": url,
    "firstUnitUrl": firstUnitUrl,
    "units": units == null ? [] : List<dynamic>.from(units!.map((x) => x)),
    "number_of_children": numberOfChildren,
    "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
  };

  Map<String, dynamic> toDatabase() => {
    'uid': uid,
    'summary': summary,
    'products': products == null ? null : jsonEncode(products),
    'type': type?.toString(),
    'title': title,
    'durationInMinutes': durationInMinutes,
    'rating': rating == null ? null : jsonEncode(rating!.toJson()),
    'popularity': popularity,
    'iconUrl': iconUrl,
    'socialImageUrl': socialImageUrl,
    'lastModified': lastModified?.toIso8601String(),
    'url': url,
    'firstUnitUrl': firstUnitUrl,
    'units': units == null ? null : jsonEncode(units),
    'numberOfChildren': numberOfChildren,
    'subjects': subjects == null ? null : jsonEncode(subjects),
  };

  factory Module.fromDatabase(Map<String, dynamic> dbRow) => Module(
    uid: dbRow['uid'],
    summary: dbRow['summary'],
    products: dbRow['products'] == null ? [] : List<String>.from(jsonDecode(dbRow['products'])),
    type: dbRow['type'],
    title: dbRow['title'],
    durationInMinutes: dbRow['durationInMinutes'],
    rating: dbRow['rating'] == null ? null : Rating.fromJson(jsonDecode(dbRow['rating'])),
    popularity: dbRow['popularity']?.toDouble(),
    iconUrl: dbRow['iconUrl'],
    socialImageUrl: dbRow['socialImageUrl'],
    lastModified: dbRow['lastModified'] == null ? null : DateTime.parse(dbRow['lastModified']),
    url: dbRow['url'],
    firstUnitUrl: dbRow['firstUnitUrl'],
    units: dbRow['units'] == null ? [] : List<String>.from(jsonDecode(dbRow['units'])),
    numberOfChildren: dbRow['numberOfChildren'],
    subjects: dbRow['subjects'] == null ? [] : List<String>.from(jsonDecode(dbRow['subjects'])),
  );
}

class Rating {
  final int? count;
  final double? average;

  Rating({this.count, this.average});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(count: json["count"], average: json["average"]?.toDouble());

  Map<String, dynamic> toJson() => {"count": count, "average": average};
}
