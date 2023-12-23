class BannersDataModel {
  final int id;
  final String text;
  final String imagePath;

  BannersDataModel({
    required this.id,
    required this.text,
    required this.imagePath,
  });

  factory BannersDataModel.fromJson(Map<String, dynamic> json) {
    return BannersDataModel(
      id: json['id'] as int,
      text: json['text'] as String,
      imagePath: json['imagePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'imagePath': imagePath,
    };
  }
}
