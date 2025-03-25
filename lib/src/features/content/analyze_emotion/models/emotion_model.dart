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

  static List<EmotionModel> getEmotions() {
    return [
      EmotionModel(
        id: 1,
        title: 'Anger',
        image: '',
        description: '',
        cause: 'Violation of boundaries',
        goal: 'To stop suffering, a drive for action',
        isSelected: false,
      ),
      EmotionModel(
        id: 2,
        title: 'Sadness',
        image: '',
        description: '',
        cause: 'Dissatisfaction with the current state',
        goal: 'To pause and listen to oneself',
        isSelected: false,
      ),
      EmotionModel(
        id: 3,
        title: 'Envy',
        image: '',
        description: '',
        cause: 'Presence of limiting beliefs and cognitive distortions',
        goal:
            'To analyze limitations and opportunities, a drive to find resources',
        isSelected: false,
      ),
      EmotionModel(
        id: 4,
        title: 'Guilt',
        image: '',
        description: '',
        cause: 'Dissatisfaction with a decision made',
        goal: 'To regulate social relationships',
        isSelected: false,
      ),
      EmotionModel(
        id: 5,
        title: 'Shame',
        image: '',
        description: '',
        cause: 'Dissatisfaction with a decision made',
        goal: 'To regulate the relationship with oneself',
        isSelected: false,
      ),
      EmotionModel(
        id: 6,
        title: 'Fear',
        image: '',
        description: '',
        cause: 'Lack of resources or information',
        goal: 'To provide a warning',
        isSelected: false,
      ),
    ];
  }
}
