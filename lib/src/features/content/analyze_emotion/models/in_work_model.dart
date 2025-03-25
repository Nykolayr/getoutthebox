import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';

class InWorkModel {
  int id;
  String name;
  String experience;
  String image;
  String description;
  List<TrigersModel> trigers;
  DateTime date;
  int stars;

  InWorkModel({
    required this.id,
    required this.name,
    required this.experience,
    required this.image,
    required this.description,
    required this.trigers,
    required this.date,
    required this.stars,
  });

  factory InWorkModel.init(int id) {
    return InWorkModel(
      id: id,
      name: '',
      experience: '',
      image: '',
      description: '',
      trigers: [],
      date: DateTime.now(),
      stars: 0,
    );
  }

  factory InWorkModel.fromJson(Map<String, dynamic> json) {
    return InWorkModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      experience: json['experience'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      trigers: json['trigers'] ?? [],
      date: json['date'] ?? DateTime.now(),
      stars: json['stars'] ?? 0,
    );
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'experience': experience,
      'image': image,
      'description': description,
      'trigers': trigers.map((e) => e.toJson()).toList(),
      'date': date,
      'stars': stars,
    };
  }
}
