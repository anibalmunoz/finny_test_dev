// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

ModuleModel courseModelFromJson(String str) => ModuleModel.fromJson(json.decode(str));

String courseModelToJson(ModuleModel data) => json.encode(data.toJson());

class ModuleModel {
  final List<Module>? modules;

  ModuleModel({this.modules});

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
    modules: json["modules"] == null ? [] : List<Module>.from(json["modules"]!.map((x) => Module.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "modules": modules == null ? [] : List<dynamic>.from(modules!.map((x) => x.toJson())),
  };
}

class Module {
  final String? summary;
  final List<Level>? levels;
  final List<Role>? roles;
  final List<String>? products;
  final String? uid;
  final Type? type;
  final String? title;
  final int? durationInMinutes;
  final Rating? rating;
  final double? popularity;
  final String? iconUrl;
  final String? socialImageUrl;
  final Locale? locale;
  final DateTime? lastModified;
  final String? url;
  final String? firstUnitUrl;
  final List<String>? units;
  final int? numberOfChildren;
  final List<String>? subjects;

  Module({
    this.summary,
    this.levels,
    this.roles,
    this.products,
    this.uid,
    this.type,
    this.title,
    this.durationInMinutes,
    this.rating,
    this.popularity,
    this.iconUrl,
    this.socialImageUrl,
    this.locale,
    this.lastModified,
    this.url,
    this.firstUnitUrl,
    this.units,
    this.numberOfChildren,
    this.subjects,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
    summary: json["summary"],
    levels: json["levels"] == null ? [] : List<Level>.from(json["levels"]!.map((x) => levelValues.map[x]!)),
    roles: json["roles"] == null ? [] : List<Role>.from(json["roles"]!.map((x) => roleValues.map[x]!)),
    products: json["products"] == null ? [] : List<String>.from(json["products"]!.map((x) => x)),
    uid: json["uid"],
    type: typeValues.map[json["type"]]!,
    title: json["title"],
    durationInMinutes: json["duration_in_minutes"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    popularity: json["popularity"]?.toDouble(),
    iconUrl: json["icon_url"],
    socialImageUrl: json["social_image_url"],
    locale: localeValues.map[json["locale"]]!,
    lastModified: json["last_modified"] == null ? null : DateTime.parse(json["last_modified"]),
    url: json["url"],
    firstUnitUrl: json["firstUnitUrl"],
    units: json["units"] == null ? [] : List<String>.from(json["units"]!.map((x) => x)),
    numberOfChildren: json["number_of_children"],
    subjects: json["subjects"] == null ? [] : List<String>.from(json["subjects"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary,
    "levels": levels == null ? [] : List<dynamic>.from(levels!.map((x) => levelValues.reverse[x])),
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => roleValues.reverse[x])),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
    "uid": uid,
    "type": typeValues.reverse[type],
    "title": title,
    "duration_in_minutes": durationInMinutes,
    "rating": rating?.toJson(),
    "popularity": popularity,
    "icon_url": iconUrl,
    "social_image_url": socialImageUrl,
    "locale": localeValues.reverse[locale],
    "last_modified": lastModified?.toIso8601String(),
    "url": url,
    "firstUnitUrl": firstUnitUrl,
    "units": units == null ? [] : List<dynamic>.from(units!.map((x) => x)),
    "number_of_children": numberOfChildren,
    "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
  };
}

enum Level { ADVANCED, BEGINNER, INTERMEDIATE }

final levelValues = EnumValues({
  "advanced": Level.ADVANCED,
  "beginner": Level.BEGINNER,
  "intermediate": Level.INTERMEDIATE,
});

enum Locale { EN_US, ES_ES, ES_MX }

final localeValues = EnumValues({"en-us": Locale.EN_US, "es-es": Locale.ES_ES, "es-mx": Locale.ES_MX});

class Rating {
  final int? count;
  final double? average;

  Rating({this.count, this.average});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(count: json["count"], average: json["average"]?.toDouble());

  Map<String, dynamic> toJson() => {"count": count, "average": average};
}

enum Role {
  ADMINISTRATOR,
  AI_EDGE_ENGINEER,
  AI_ENGINEER,
  AUDITOR,
  BUSINESS_ANALYST,
  BUSINESS_OWNER,
  BUSINESS_USER,
  DATABASE_ADMINISTRATOR,
  DATA_ANALYST,
  DATA_ENGINEER,
  DATA_SCIENTIST,
  DEVELOPER,
  DEVOPS_ENGINEER,
  FUNCTIONAL_CONSULTANT,
  HIGHER_ED_EDUCATOR,
  IDENTITY_ACCESS_ADMIN,
  IP_ADMIN,
  K_12_EDUCATOR,
  MAKER,
  NETWORK_ENGINEER,
  PARENT_GUARDIAN,
  PLATFORM_ENGINEER,
  PRIVACY_MANAGER,
  RISK_PRACTITIONER,
  SCHOOL_LEADER,
  SECURITY_ENGINEER,
  SECURITY_OPERATIONS_ANALYST,
  SERVICE_ADOPTION_SPECIALIST,
  SOLUTION_ARCHITECT,
  STARTUP_FOUNDER,
  STUDENT,
  SUPPORT_ENGINEER,
  TECHNICAL_WRITER,
  TECHNOLOGY_MANAGER,
}

final roleValues = EnumValues({
  "administrator": Role.ADMINISTRATOR,
  "ai-edge-engineer": Role.AI_EDGE_ENGINEER,
  "ai-engineer": Role.AI_ENGINEER,
  "auditor": Role.AUDITOR,
  "business-analyst": Role.BUSINESS_ANALYST,
  "business-owner": Role.BUSINESS_OWNER,
  "business-user": Role.BUSINESS_USER,
  "database-administrator": Role.DATABASE_ADMINISTRATOR,
  "data-analyst": Role.DATA_ANALYST,
  "data-engineer": Role.DATA_ENGINEER,
  "data-scientist": Role.DATA_SCIENTIST,
  "developer": Role.DEVELOPER,
  "devops-engineer": Role.DEVOPS_ENGINEER,
  "functional-consultant": Role.FUNCTIONAL_CONSULTANT,
  "higher-ed-educator": Role.HIGHER_ED_EDUCATOR,
  "identity-access-admin": Role.IDENTITY_ACCESS_ADMIN,
  "ip-admin": Role.IP_ADMIN,
  "k-12-educator": Role.K_12_EDUCATOR,
  "maker": Role.MAKER,
  "network-engineer": Role.NETWORK_ENGINEER,
  "parent-guardian": Role.PARENT_GUARDIAN,
  "platform-engineer": Role.PLATFORM_ENGINEER,
  "privacy-manager": Role.PRIVACY_MANAGER,
  "risk-practitioner": Role.RISK_PRACTITIONER,
  "school-leader": Role.SCHOOL_LEADER,
  "security-engineer": Role.SECURITY_ENGINEER,
  "security-operations-analyst": Role.SECURITY_OPERATIONS_ANALYST,
  "service-adoption-specialist": Role.SERVICE_ADOPTION_SPECIALIST,
  "solution-architect": Role.SOLUTION_ARCHITECT,
  "startup-founder": Role.STARTUP_FOUNDER,
  "student": Role.STUDENT,
  "support-engineer": Role.SUPPORT_ENGINEER,
  "technical-writer": Role.TECHNICAL_WRITER,
  "technology-manager": Role.TECHNOLOGY_MANAGER,
});

enum Type { MODULE }

final typeValues = EnumValues({"module": Type.MODULE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
