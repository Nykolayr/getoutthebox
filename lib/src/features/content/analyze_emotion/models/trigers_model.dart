import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_model.dart';

class TrigersModel {
  int id;
  String title;
  String description;
  List<EmotionModel> emotions;

  TrigersModel({
    required this.id,
    required this.title,
    required this.description,
    required this.emotions,
  });

  factory TrigersModel.initial() {
    return TrigersModel(
      id: 0,
      title: '',
      description: '',
      emotions: EmotionModel.getEmotions(),
    );
  }

  factory TrigersModel.fromJson(Map<String, dynamic> json) {
    return TrigersModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      emotions: EmotionModel.getEmotions(),
    );
  }

  factory TrigersModel.init() {
    return TrigersModel(
      id: 0,
      title: '',
      description: '',
      emotions: EmotionModel.getEmotions(),
    );
  }
  toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'emotions': emotions.map((e) => e.toJson()).toList(),
    };
  }

  static List<TrigersModel> getTrigers() {
    return [
      TrigersModel(
        id: 1,
        title:
            'Describe your personality as a child. Were you calm, quiet, competitive, or wild? What influenced your personality?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 2,
        title:
            'Did you change when you grew up? How? What events or circumstances caused this change?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 3,
        title:
            'Describe a childhood memory, good or bad. Why do you still remember it?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 4,
        title: 'Describe the character of the person who hurt you the most.',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 5,
        title:
            'What was your biggest personal failure in life? Why do you think it happened?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 6,
        title: 'Do you envy others? What do you think makes you feel jealous?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 7,
        title: 'Do you hold grudges? Why is it hard for you to let go?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 8,
        title:
            'Who do you hold a grudge against? What could make you forgive them?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 9,
        title:
            'What are you too embarrassed to tell others? Would it make you a different person? How?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 10,
        title: 'What made you angry last time? Why? How did you deal with it?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 11,
        title:
            'Name one thing you are afraid to do. Why? How can you overcome this fear?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 12,
        title: 'Do you often sabotage yourself? Why do you do it?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 13,
        title: 'What makes you feel lonely and why?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 14,
        title: 'Do you feel guilty about something? Why do you think so?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 15,
        title:
            'How do you react to constructive criticism? Are you very sensitive or do you react well? Describe your last experience.',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 16,
        title: 'What causes you negative emotions? Why?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 17,
        title: 'How do you deal with stress?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 18,
        title: 'What emotions do you usually try to avoid? Why do you do this?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 19,
        title:
            'Do you have trouble sleeping? What thoughts often keep you awake?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 20,
        title:
            'Do you often have nightmares or recurring dreams? Describe them.',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 21,
        title: 'What is one thing you need to let go of?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 22,
        title:
            'What is your biggest regret? Would things be different if you chose another path? How?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 23,
        title: 'What traits in other people annoy you the most? Why?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 24,
        title:
            'Describe a traumatic event from your past and its impact on you.',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 25,
        title:
            'When was the last time you felt disappointed in a person you trusted? Was it betrayal, rejection, or being ignored? How did you deal with it?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 26,
        title:
            'Describe your ideal self. Compare which qualities you already possess. Assign a score to each quality.',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 27,
        title:
            'Describe how your relationships with family members have changed since childhood.',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 28,
        title:
            'What relationships in your life no longer serve you? Are you ready to let them go? Why or why not?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 29,
        title: 'List your best character traits.',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 30,
        title: 'What qualities did you lack in childhood?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 31,
        title:
            'What makes you feel insecure? Do you like being authentic? Or do you try to show the world another version of yourself? Why?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 32,
        title:
            'Are you a perfectionist? What type of perfectionist are you? Do you ask for help when needed? Why or why not?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
      TrigersModel(
        id: 33,
        title:
            'What one thing would you like to change about yourself if you could? Why would you want to make this change?',
        description: '',
        emotions: EmotionModel.getEmotions(),
      ),
    ];
  }
}
