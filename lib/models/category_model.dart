class CategoryModel {
  final String? iconAsset;
  final String label;
  final String? subject;

  const CategoryModel({this.iconAsset, required this.label, this.subject});

  Map<String, dynamic> toJson() => {'iconAsset': iconAsset, 'label': label, 'subject': subject};

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    iconAsset: json['iconAsset'] as String?,
    label: json['label'] as String,
    subject: json['subject'] as String?,
  );
}
