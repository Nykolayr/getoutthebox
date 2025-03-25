import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';

class InWorkModel {
  final String id;
  final String name;
  final String experience;
  final String image;
  final String description;
  final List<TrigersModel> trigers;
  final DateTime date;

  InWorkModel({
    required this.id,
    required this.name,
    required this.experience,
    required this.image,
    required this.description,
    required this.trigers,
    required this.date,
  });
}
