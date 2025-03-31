class SituationModels {
  int id;
  String title;
  String description;
  String note;

  SituationModels({
    required this.id,
    required this.title,
    required this.description,
    required this.note,
  });

  factory SituationModels.fromJson(Map<String, dynamic> json) {
    return SituationModels(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'pathImage': description,
      'note': note,
    };
  }

  factory SituationModels.initial() {
    return SituationModels(
      id: 0,
      title: '',
      description: '',
      note: '',
    );
  }

  static List<SituationModels> getMock() {
    return [
      SituationModels(
        id: 1,
        title: 'Your physical reaction?',
        description:
            'For example, tension in the shoulders, rapid heartbeat, dry mouth.',
        note: '',
      ),
      SituationModels(
        id: 2,
        title: 'What emotions have arisen?',
        description: 'For example, fear, joy, anxiety.',
        note: '',
      ),
      SituationModels(
        id: 3,
        title: 'What thoughts came to mind?',
        description: 'Write down what thoughts came to mind.',
        note: '',
      ),
    ];
  }
}
