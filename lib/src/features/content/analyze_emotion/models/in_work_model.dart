import 'package:getoutofthebox/src/features/content/analyze_emotion/models/cognitive_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/transform_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';

class InWorkModel {
  int id;
  List<TrigersModel> trigers;
  List<TransformModel> transforms;
  List<CognitiveModel> cognitive;
  DateTime date;

  InWorkModel({
    required this.id,
    required this.trigers,
    required this.transforms,
    required this.cognitive,
    required this.date,
  });

  factory InWorkModel.init(int id) {
    return InWorkModel(
      id: id,
      trigers: [],
      transforms: [],
      cognitive: [],
      date: DateTime.now(),
    );
  }

  factory InWorkModel.fromJson(Map<String, dynamic> json) {
    return InWorkModel(
      id: json['id'] ?? 0,
      trigers: json['trigers'] ?? [],
      transforms: json['transforms'] ?? [],
      cognitive: json['cognitive'] ?? [],
      date: json['date'] ?? DateTime.now(),
    );
  }
  toJson() {
    return {
      'id': id,
      'trigers': trigers.map((e) => e.toJson()).toList(),
      'transforms': transforms.map((e) => e.toJson()).toList(),
      'cognitive': cognitive.map((e) => e.toJson()).toList(),
      'date': date,
    };
  }
}
