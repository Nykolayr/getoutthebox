import 'package:getoutofthebox/src/features/content/analyze_emotion/models/experience_model.dart';

class CognitiveModel {
  int id;
  String title;
  String description;
  ExperienceModel experience;

  CognitiveModel({
    required this.id,
    required this.title,
    required this.description,
    required this.experience,
  });

  factory CognitiveModel.initial() {
    return CognitiveModel(
      id: 0,
      title: '',
      description: '',
      experience: ExperienceModel.initial(),
    );
  }

  factory CognitiveModel.fromJson(Map<String, dynamic> json) {
    return CognitiveModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      experience: json['experience'] != null
          ? ExperienceModel.fromJson(json['experience'])
          : ExperienceModel.initial(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'experience': experience.toJson(),
    };
  }

  static List<CognitiveModel> getCognitive() {
    return [
      CognitiveModel(
        id: 1,
        title: 'Black-and-white thinking',
        description:
            'Seeing a situation only in extreme, opposing ways without considering intermediates.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 2,
        title: 'Overgeneralization',
        description: 'Making broad generalizations based on a single event.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 3,
        title: 'Mental filter',
        description: 'Focusing on negative aspects and ignoring positive ones.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 4,
        title: 'Discounting the positive',
        description:
            'Denying or minimizing the significance of positive events.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 5,
        title: 'Jumping to conclusions',
        description: 'Making conclusions without sufficient grounds.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 6,
        title: 'Mind reading',
        description: 'Being certain that you know what others are thinking.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 7,
        title: 'Fortune telling',
        description:
            'Expecting negative events to happen without objective grounds.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 8,
        title: 'Catastrophizing',
        description:
            'Exaggerating the importance of minor troubles to the level of a catastrophe.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 9,
        title: 'Magnification',
        description:
            'Overestimating the probability and importance of negative events.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 10,
        title: 'Minimization',
        description: 'Underestimating the significance of positive events.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 11,
        title: 'Emotional reasoning',
        description:
            'Accepting your own emotional states as objective reality.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 12,
        title: 'Should statements',
        description:
            'Living according to rigid rules like "should," "must," and "ought."',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 13,
        title: 'Labeling',
        description:
            'Applying harsh, negative characteristics to yourself or others.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 14,
        title: 'Personalization',
        description:
            'Taking responsibility for external events that are beyond your control.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 15,
        title: 'Comparison',
        description:
            'Comparing yourself to others with the aim of devaluing yourself.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 16,
        title: 'Rationalization',
        description: 'Searching for justifications for your own behavior.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 17,
        title: 'Confirmation bias',
        description:
            'Seeking and remembering information that confirms your beliefs.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 18,
        title: 'Anchoring effect',
        description:
            'Being strongly influenced by the first information received on a topic.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 19,
        title: 'Blind spot bias',
        description: 'Inability to notice your own cognitive biases.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 20,
        title: 'Halo effect',
        description:
            'Overall judgment of a person based on one positive or negative trait.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 21,
        title: 'Illusion of control',
        description: 'Belief in the ability to control random events.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 22,
        title: 'Ignoring probability',
        description:
            'Ignoring statistical data when assessing the likelihood of events.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 23,
        title: 'Hindsight bias',
        description: 'Belief that past events were predictable.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 24,
        title: 'Focusing effect',
        description:
            'Overestimating the importance of one detail when forming an overall impression.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 25,
        title: 'Spotlight effect',
        description: 'Overestimating how much others notice your actions.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 26,
        title: 'Observer effect',
        description:
            'Attributing your actions to external circumstances and others\' actions to their internal qualities.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 27,
        title: 'Primacy and recency effect',
        description: 'Better memory of information received first and last.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 28,
        title: 'Projection',
        description: 'Attributing your own undesirable qualities to others.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 29,
        title: 'Ostrich effect',
        description: 'Ignoring negative information.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 30,
        title: 'Malignant identity phenomenon',
        description: 'Accepting negative evaluations of others as true.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 31,
        title: 'Curse of knowledge',
        description: 'Expecting others to have the same information as you.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 32,
        title: 'Expectation effect',
        description:
            'Changing behavior in accordance with others\' expectations.',
        experience: ExperienceModel.initial(),
      ),
      CognitiveModel(
        id: 33,
        title: 'Self-fulfilling prophecy',
        description:
            'Expectations of events that ultimately occur because of these expectations.',
        experience: ExperienceModel.initial(),
      ),
    ];
  }
}
