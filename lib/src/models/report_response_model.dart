class ReportResponseModal {
  final String? reason;
  final String? description;
  final int statusCode;

  ReportResponseModal({
    required this.statusCode,
    this.reason,
    this.description,
  });

  factory ReportResponseModal.fromJson(
          Map<String, dynamic> json, int statusCode) =>
      ReportResponseModal(
        reason: json["reason"],
        description: json["description"],
        statusCode: statusCode,
      );
}
