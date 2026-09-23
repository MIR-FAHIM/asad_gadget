class SampleItemModel {
  final int id;
  final String title;
  final String description;

  SampleItemModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory SampleItemModel.fromJson(Map<String, dynamic> json) {
    return SampleItemModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
