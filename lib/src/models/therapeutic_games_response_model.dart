class TherapeuticGame {
  final String title;
  final String description;
  final bool isFree;
  final List<TherapeuticGameQuestion> questions;

  TherapeuticGame(
      {required this.description,
      required this.title,
      required this.isFree,
      required this.questions});

  factory TherapeuticGame.fromJson(Map<String, dynamic> json) {
    return TherapeuticGame(
      description: json['description'],
      title: json['title'],
      isFree: json['is_free'],
      questions: (json['questions'] as List)
          .map((q) => TherapeuticGameQuestion.fromJson(q))
          .toList(),
    );
  }
}

class TherapeuticGamesList {
  final List<TherapeuticGame> games;

  TherapeuticGamesList({required this.games});

  factory TherapeuticGamesList.fromJson(List<dynamic> json) {
    return TherapeuticGamesList(
      games: json.map((game) => TherapeuticGame.fromJson(game)).toList(),
    );
  }
}

class TherapeuticGameQuestion {
  final String question;
  final bool isExample;

  TherapeuticGameQuestion({required this.question, required this.isExample});

  factory TherapeuticGameQuestion.fromJson(Map<String, dynamic> json) {
    return TherapeuticGameQuestion(
      question: json['question_text'],
      isExample: json['is_example'],
    );
  }
}

class TherapeuticGamesResponseModel {
  final int statusCode;
  final List<dynamic> data;

  factory TherapeuticGamesResponseModel.fromJson(
      List<dynamic> json, int statusCode) {
    return TherapeuticGamesResponseModel(
      data: json,
      statusCode: statusCode,
    );
  }

  TherapeuticGamesResponseModel({required this.statusCode, required this.data});
}
