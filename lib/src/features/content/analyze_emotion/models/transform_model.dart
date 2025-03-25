class TransformModel {
  int id;
  String title;
  String description;
  int rate;
  String note;

  TransformModel({
    required this.id,
    required this.title,
    required this.description,
    required this.rate,
    required this.note,
  });

  factory TransformModel.initial() {
    return TransformModel(
      id: 0,
      title: '',
      description: '',
      rate: 0,
      note: '',
    );
  }

  factory TransformModel.fromJson(Map<String, dynamic> json) {
    return TransformModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      rate: json['rate'] ?? 0,
      note: json['note'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'rate': rate,
      'note': note,
    };
  }

  static List<TransformModel> getTransforms() {
    return [
      TransformModel(
        id: 1,
        title: 'Cognitive restructuring',
        description:
            'Revising and changing negative thoughts to more realistic ones.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 2,
        title: 'Thought journaling',
        description:
            'Recording negative thoughts and analyzing them for cognitive distortions.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 3,
        title: 'Evidence and counter-evidence technique',
        description: 'Looking for evidence for and against negative thoughts.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 4,
        title: 'Reframing',
        description:
            'Changing the interpretation of a situation to a more positive one.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 5,
        title: 'Automatic thoughts diary',
        description:
            'Logging automatic thoughts and subsequently evaluating them.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 6,
        title: 'Empirical testing of thoughts',
        description: 'Testing negative thoughts based on facts and experience.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 7,
        title: 'Positive affirmations',
        description: 'Replacing negative thoughts with positive affirmations.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 8,
        title: 'Thought-stopping technique',
        description:
            'Stopping negative thoughts and switching to positive ones.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 9,
        title: 'Gradual exposure',
        description: 'Gradually confronting feared situations to reduce fear.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 10,
        title: 'Mindfulness meditation',
        description:
            'Focusing on the present moment to reduce anxious thoughts.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 11,
        title: 'Working with deep-seated beliefs',
        description: 'Changing internal cognitive frameworks.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 12,
        title: 'Probability reassessment',
        description:
            'Analyzing the likelihood of negative events to reduce anxiety.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 13,
        title: 'Mental filter',
        description: 'Recognizing and addressing negative focus on situations.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 14,
        title: 'Change of approach',
        description: 'Solve old problems in new ways.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 15,
        title: 'Mind reading',
        description:
            'Analyzing the evidence for and against assumptions about others\' thoughts.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 16,
        title: 'Fortune telling',
        description:
            'Evaluating the probability of future events based on facts.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 17,
        title: 'Enhancement of the positive',
        description:
            'Acknowledging and enhancing the significance of positive events.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 18,
        title: 'What-if technique',
        description:
            'Analyzing the worst-case scenario and developing an action plan.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 19,
        title: 'Affirmations',
        description: 'Repeating positive statements to change thinking.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 20,
        title: 'Breaking tasks into parts',
        description:
            'Dividing complex tasks into smaller steps to reduce stress.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 21,
        title: 'Decatastrophizing technique',
        description: 'Reducing the intensity of catastrophic thoughts.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 22,
        title: 'Role-playing',
        description:
            'Acting out situations to improve perception and behavior.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 23,
        title: 'Realistic assessment of the situation',
        description:
            'Minimizing the importance of negative events and realistically assessing them.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 24,
        title: 'Positive visualization',
        description: 'Imagining positive outcomes and situations.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 25,
        title: 'Rewriting history technique',
        description:
            'Changing the interpretation of past experiences to a more positive one.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 26,
        title: 'Reverse perspective',
        description:
            'Comparing the current situation with past experiences to understand changes.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 27,
        title: 'Breathing exercises',
        description: 'Using breathing techniques to reduce anxious thoughts.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 28,
        title: 'Emotional reasoning',
        description:
            'Understanding the differences between emotions and reality.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 29,
        title: 'Muscle relaxation',
        description: 'Reducing physical tension to improve mental state.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 30,
        title: 'Reality vs. perception technique',
        description: 'Comparing real facts with perception.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 31,
        title: 'Selective attention',
        description:
            'Consciously shifting attention to positive aspects of a situation.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 32,
        title: 'Social support',
        description: 'Communicating with loved ones for support and feedback.',
        rate: 0,
        note: '',
      ),
      TransformModel(
        id: 33,
        title: 'Positive reinforcement',
        description:
            'Rewarding yourself for positive changes in thinking and behavior.',
        rate: 0,
        note: '',
      ),
    ];
  }
}
