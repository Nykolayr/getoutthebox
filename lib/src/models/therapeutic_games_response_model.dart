/// Модель категории терапевтической игры
class GameCategory {
  final int id;
  final String title;
  final bool isActive;
  final String createdAt;
  final String icon;

  GameCategory({
    required this.id,
    required this.title,
    required this.isActive,
    required this.createdAt,
    required this.icon,
  });

  /// Создает экземпляр класса из JSON
  factory GameCategory.fromJson(Map<String, dynamic> json) {
    return GameCategory(
      id: json['id'],
      title: json['title'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      icon: json['icon'],
    );
  }

  /// Преобразует экземпляр класса в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'is_active': isActive,
      'created_at': createdAt,
      'icon': icon,
    };
  }
}

/// Модель терапевтической игры
class TherapeuticGame {
  final String id;
  final GameCategory category;
  final String title;
  final String description;
  final bool isActive;
  final bool isFree;
  final String createdAt;
  final List<TherapeuticGameQuestion> questions;

  TherapeuticGame({
    required this.id,
    required this.category,
    required this.description,
    required this.title,
    required this.isActive,
    required this.isFree,
    required this.createdAt,
    required this.questions,
  });

  /// Создает экземпляр класса из JSON
  factory TherapeuticGame.fromJson(Map<String, dynamic> json) {
    return TherapeuticGame(
      id: json['id'],
      category: GameCategory.fromJson(json['category']),
      description: json['description'],
      title: json['title'],
      isActive: json['is_active'],
      isFree: json['is_free'],
      createdAt: json['created_at'],
      questions: (json['questions'] as List)
          .map((q) => TherapeuticGameQuestion.fromJson(q))
          .toList(),
    );
  }

  /// Преобразует экземпляр класса в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category.toJson(),
      'description': description,
      'title': title,
      'is_active': isActive,
      'is_free': isFree,
      'created_at': createdAt,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

/// Модель вопроса терапевтической игры
class TherapeuticGameQuestion {
  final int id;
  final String gameId;
  final String question;
  final bool isExample;
  final String createdAt;

  TherapeuticGameQuestion({
    required this.id,
    required this.gameId,
    required this.question,
    required this.isExample,
    required this.createdAt,
  });

  /// Создает экземпляр класса из JSON
  factory TherapeuticGameQuestion.fromJson(Map<String, dynamic> json) {
    return TherapeuticGameQuestion(
      id: json['id'],
      gameId: json['game'],
      question: json['question_text'],
      isExample: json['is_example'],
      createdAt: json['created_at'],
    );
  }

  /// Преобразует экземпляр класса в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'game': gameId,
      'question_text': question,
      'is_example': isExample,
      'created_at': createdAt,
    };
  }
}

/// Модель ответа сервера со списком терапевтических игр
class TherapeuticGamesResponseModel {
  final int statusCode;
  final List<dynamic> data;

  /// Создает экземпляр класса из JSON и кода статуса
  factory TherapeuticGamesResponseModel.fromJson(
      List<dynamic> json, int statusCode) {
    return TherapeuticGamesResponseModel(
      data: json,
      statusCode: statusCode,
    );
  }

  TherapeuticGamesResponseModel({required this.statusCode, required this.data});
}
