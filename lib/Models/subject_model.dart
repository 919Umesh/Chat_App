class SubjectResponseModel {
  SubjectResponseModel({
    required this.status,
    required this.message,
    required this.subjects,
  });

  final int status;
  final String message;
  final List<String> subjects;

  factory SubjectResponseModel.fromJson(Map<String, dynamic> json) {
    return SubjectResponseModel(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      subjects: json["subjects"] == null
          ? []
          : List<String>.from(json["subjects"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "subjects": subjects.map((x) => x).toList(),
  };
}