import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_model.dart';

class TrigersModel {
  final int id;
  final String name;
  final String description;
  final List<EmotionModel> emotions;

  TrigersModel({
    required this.id,
    required this.name,
    required this.description,
    required this.emotions,
  });

  factory TrigersModel.initial() {
    return TrigersModel(
      id: 0,
      name: '',
      description: '',
      emotions: EmotionModel.getEmotions(),
    );
  }

  factory TrigersModel.fromJson(Map<String, dynamic> json) {
    return TrigersModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      emotions: EmotionModel.getEmotions(),
    );
  }

  factory TrigersModel.init() {
    return TrigersModel(
      id: 0,
      name: '',
      description: '',
      emotions: EmotionModel.getEmotions(),
    );
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'emotions': emotions.map((e) => e.toJson()).toList(),
    };
  }
}
