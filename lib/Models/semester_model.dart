class SemesterResponseModel {
  SemesterResponseModel({
    required this.status,
    required this.message,
    required this.semesters,
  });

  final int status;
  final String message;
  final List<String> semesters;

  factory SemesterResponseModel.fromJson(Map<String, dynamic> json) {
    return SemesterResponseModel(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      semesters: json["semesters"] == null
          ? []
          : List<String>.from(json["semesters"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "semesters": semesters.map((x) => x).toList(),
  };
}