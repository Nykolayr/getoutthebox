class EmotionModel {
  final int id;
  final String title;
  final String description;
  final String cause;
  final String goal;
  final String image;
  final bool isSelected;

  EmotionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.cause,
    required this.goal,
    required this.image,
    this.isSelected = false,
  });

  factory EmotionModel.initial() {
    return EmotionModel(
      id: 0,
      title: '',
      description: '',
      cause: '',
      goal: '',
      image: '',
      isSelected: false,
    );
  }

  factory EmotionModel.fromJson(Map<String, dynamic> json) {
    return EmotionModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      cause: json['cause'] ?? '',
      goal: json['goal'] ?? '',
      image: json['image'] ?? '',
      isSelected: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'cause': cause,
      'goal': goal,
      'image': image,
    };
  }

  EmotionModel copyWith({
    bool? isSelected,
    String? title,
    String? description,
    String? cause,
    String? goal,
    String? image,
  }) {
    return EmotionModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      cause: cause ?? this.cause,
      goal: goal ?? this.goal,
      image: image ?? this.image,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
