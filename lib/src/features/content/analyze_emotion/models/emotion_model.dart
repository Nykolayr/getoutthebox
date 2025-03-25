class EmotionModel {
  int id;
  String title;
  String description;
  String cause;
  String goal;
  bool isSelected;

  EmotionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.cause,
    required this.goal,
    this.isSelected = false,
  });

  factory EmotionModel.initial() {
    return EmotionModel(
      id: 0,
      title: '',
      description: '',
      cause: '',
      goal: '',
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
      isSelected: isSelected ?? this.isSelected,
    );
  }

  static List<EmotionModel> getEmotions() {
    return [
      EmotionModel(
        id: 1,
        title: 'Anger',
        description: '',
        cause: 'Violation of boundaries',
        goal: 'To stop suffering, a drive for action',
        isSelected: false,
      ),
      EmotionModel(
        id: 2,
        title: 'Sadness',
        description: '',
        cause: 'Dissatisfaction with the current state',
        goal: 'To pause and listen to oneself',
        isSelected: false,
      ),
      EmotionModel(
        id: 3,
        title: 'Envy',
        description: '',
        cause: 'Presence of limiting beliefs and cognitive distortions',
        goal:
            'To analyze limitations and opportunities, a drive to find resources',
        isSelected: false,
      ),
      EmotionModel(
        id: 4,
        title: 'Guilt',
        description: '',
        cause: 'Dissatisfaction with a decision made',
        goal: 'To regulate social relationships',
        isSelected: false,
      ),
      EmotionModel(
        id: 5,
        title: 'Shame',
        description: '',
        cause: 'Dissatisfaction with a decision made',
        goal: 'To regulate the relationship with oneself',
        isSelected: false,
      ),
      EmotionModel(
        id: 6,
        title: 'Fear',
        description: '',
        cause: 'Lack of resources or information',
        goal: 'To provide a warning',
        isSelected: false,
      ),
      EmotionModel(
        id: 7,
        title: 'Hatred',
        description: '',
        cause:
            'Conflicting interests while being forced to interact, inability to exit the situation',
        goal: 'To find common ground or exit the communication',
        isSelected: false,
      ),
      EmotionModel(
        id: 8,
        title: 'Resentment',
        description: '',
        cause: 'Violation of expectations',
        goal: 'To transform the relationship',
        isSelected: false,
      ),
      EmotionModel(
        id: 9,
        title: 'Confusion, Shock',
        description: '',
        cause: 'An unusual situation, pattern disruption',
        goal: 'To draw attention to the task\'s importance',
        isSelected: false,
      ),
      EmotionModel(
        id: 10,
        title: 'Disappointment',
        description: '',
        cause: 'Violation of expectations',
        goal: 'To transform goals, align with reality',
        isSelected: false,
      ),
      EmotionModel(
        id: 11,
        title: 'Disgust',
        description: '',
        cause: 'Discovery of something harmful to the body or core values',
        goal: 'To eliminate the irritant',
        isSelected: false,
      ),
      EmotionModel(
        id: 12,
        title: 'Boredom',
        description: '',
        cause: 'Loss of meaning',
        goal: 'To realize true values',
        isSelected: false,
      ),
      EmotionModel(
        id: 13,
        title: 'Anxiety',
        description: '',
        cause: 'Fear of encountering negative experiences',
        goal: 'To highlight the importance of the current situation',
        isSelected: false,
      ),
      EmotionModel(
        id: 14,
        title: 'Joy',
        description: '',
        cause: 'Alignment with expectations or achieving a goal',
        goal: 'To reinforce positive experiences and motivation for repetition',
        isSelected: false,
      ),
      EmotionModel(
        id: 15,
        title: 'Satisfaction',
        description: '',
        cause: 'Achieving personal or social goals',
        goal: 'To maintain self-esteem and inner harmony',
        isSelected: false,
      ),
      EmotionModel(
        id: 16,
        title: 'Pride',
        description: '',
        cause: 'Recognition of achievements, both personal and those of others',
        goal: 'To boost motivation and self-confidence',
        isSelected: false,
      ),
      EmotionModel(
        id: 17,
        title: 'Gratitude',
        description: '',
        cause: 'Receiving help or support from others',
        goal: 'To strengthen social bonds and a sense of mutual support',
        isSelected: false,
      ),
      EmotionModel(
        id: 18,
        title: 'Interest',
        description: '',
        cause: 'Discovering new information or skills that satisfy curiosity',
        goal: 'To stimulate learning and self-development',
        isSelected: false,
      ),
      EmotionModel(
        id: 19,
        title: 'Love',
        description: '',
        cause:
            'Emotional closeness and attachment to people, things, or activities',
        goal:
            'To deepen interpersonal connections and foster a sense of security',
        isSelected: false,
      ),
      EmotionModel(
        id: 20,
        title: 'Inspiration',
        description: '',
        cause: 'Admiration for ideas, creativity, or achievements of others',
        goal: 'To stimulate creativity and a desire to take action',
        isSelected: false,
      ),
      EmotionModel(
        id: 21,
        title: 'Calmness',
        description: '',
        cause: 'Absence of threats and a state of safety',
        goal: 'To maintain inner balance and stability',
        isSelected: false,
      ),
      EmotionModel(
        id: 22,
        title: 'Hope',
        description: '',
        cause: 'Expectation of a positive outcome or change for the better',
        goal: 'To sustain resilience in challenging situations',
        isSelected: false,
      ),
      EmotionModel(
        id: 23,
        title: 'Engagement',
        description: '',
        cause: 'Immersion in an activity that brings enjoyment',
        goal: 'To enrich life and enhance the quality of time spent',
        isSelected: false,
      ),
      EmotionModel(
        id: 24,
        title: 'Encouragement',
        description: '',
        cause: 'Receiving a positive boost from others or events',
        goal: 'To increase energy for implementing ideas and achieving goals',
        isSelected: false,
      ),
      EmotionModel(
        id: 25,
        title: 'Admiration',
        description: '',
        cause: 'Noticing something beautiful, remarkable, or significant',
        goal:
            'To cultivate appreciation for beauty and inspire striving for more',
        isSelected: false,
      ),
      EmotionModel(
        id: 26,
        title: 'Euphoria',
        description: '',
        cause: 'Experiencing an intense burst of happiness',
        goal: 'To maximize enjoyment of the moment and gain a surge of energy',
        isSelected: false,
      ),
    ];
  }
}
