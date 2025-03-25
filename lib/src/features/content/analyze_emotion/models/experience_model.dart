class ExperienceModel {
  int id;
  String title;
  String description;

  ExperienceModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory ExperienceModel.initial() {
    return ExperienceModel(
      id: 1,
      title: 'Never',
      description: '',
    );
  }

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  static List<ExperienceModel> getExperiences() {
    return [
      ExperienceModel(
        id: 0,
        title: 'Never',
        description: '',
      ),
      ExperienceModel(
        id: 1,
        title: 'Rarely',
        description: '',
      ),
      ExperienceModel(
        id: 2,
        title: 'Sometimes',
        description: '',
      ),
      ExperienceModel(
        id: 3,
        title: 'Often',
        description: '',
      ),
      ExperienceModel(
        id: 4,
        title: 'Constantly',
        description: '',
      ),
    ];
  }
}
