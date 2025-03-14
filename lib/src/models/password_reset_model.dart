class PasswordResetModel {
  final int statusCode;
  final String? message;

  PasswordResetModel({
    required this.message,
    required this.statusCode,
  });

  factory PasswordResetModel.fromJson(
          Map<String, dynamic> json, int statusCode) =>
      PasswordResetModel(
        message: json['success'] ?? json['email']?[0] ?? json['error'],
        statusCode: statusCode,
      );
}
