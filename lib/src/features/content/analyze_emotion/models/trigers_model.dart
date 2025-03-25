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
}
