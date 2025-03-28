import 'package:getoutofthebox/src/features/content/analyze_emotion/models/cognitive_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/transform_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_inner_work.dart';

class InWorkModel {
  int id;
  List<TrigersModel> trigers;
  List<TransformModel> transforms;
  List<CognitiveModel> cognitive;
  DateTime date;
  InnerWorkType type;

  InWorkModel({
    required this.id,
    required this.trigers,
    required this.transforms,
    required this.cognitive,
    required this.date,
    required this.type,
  });

  factory InWorkModel.init(int id) {
    return InWorkModel(
      id: id,
      trigers: [],
      transforms: [],
      cognitive: [],
      date: DateTime.now(),
      type: InnerWorkType.inProgress,
    );
  }

  factory InWorkModel.fromJson(Map<String, dynamic> json) {
    return InWorkModel(
      id: json['id'] ?? 0,
      trigers: json['trigers'] ?? [],
      transforms: json['transforms'] ?? [],
      cognitive: json['cognitive'] ?? [],
      date: json['date'] ?? DateTime.now(),
      type: json['type'] ?? InnerWorkType.inProgress,
    );
  }
  toJson() {
    return {
      'id': id,
      'trigers': trigers.map((e) => e.toJson()).toList(),
      'transforms': transforms.map((e) => e.toJson()).toList(),
      'cognitive': cognitive.map((e) => e.toJson()).toList(),
      'date': date,
      'type': type,
    };
  }
}
