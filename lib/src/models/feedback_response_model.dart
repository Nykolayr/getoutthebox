class FeedbackResponceModel {
  final int? user;
  final String? error;
  final int? rating;
  final String? comment;
  final int statusCode;

  FeedbackResponceModel({
    this.error,
    required this.statusCode,
    this.user,
    this.rating,
    this.comment,
  });

  factory FeedbackResponceModel.fromJson(
      Map<String, dynamic> json, int statusCode) {
    var ratingValue = json["rating"];

    int? parsedRating;
    String? errorMessage;

    if (ratingValue is int) {
      parsedRating = ratingValue;
    } else if (ratingValue is List && ratingValue.isNotEmpty) {
      if (ratingValue[0] is int) {
        parsedRating = ratingValue[0];
      } else if (ratingValue[0] is String) {
        errorMessage = ratingValue[0];
      }
    }

    return FeedbackResponceModel(
      user: json["user"],
      error: errorMessage ?? '',
      rating: parsedRating,
      comment: json["comment"],
      statusCode: statusCode,
    );
  }
}
