class RegistrationResponseModel {
  final int statusCode;
  final String? error;
  final String? accessToken;
  final String? refreshToken;

  RegistrationResponseModel(
      {this.error,
      required this.statusCode,
      this.accessToken,
      this.refreshToken});

  factory RegistrationResponseModel.fromJson(
      Map<String, dynamic> json, int statusCode) {
    String? errorMessage;
    if (json['success'] != true) {
      errorMessage = json.entries
          .where((entry) => entry.key != 'success' && entry.value is List)
          .map((entry) => '${entry.key} : ${entry.value[0]}')
          .first;
    }
    return RegistrationResponseModel(
      error: errorMessage,
      statusCode: statusCode,
      accessToken: json['tokens']?['access'], 
      refreshToken: json['tokens']?['refresh'], 
    );
  }
}
