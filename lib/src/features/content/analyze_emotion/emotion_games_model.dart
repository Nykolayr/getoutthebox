class EmotionGamesModel {
  final String id;
  final String name;
  final String description;
  final String image;

  EmotionGamesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory EmotionGamesModel.initial() {
    return EmotionGamesModel(
      id: '',
      name: '',
      description: '',
      image: '',
    );
  }

  factory EmotionGamesModel.fromJson(Map<String, dynamic> json) {
    return EmotionGamesModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
