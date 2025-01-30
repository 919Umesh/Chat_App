class NotesResponseModel {
  NotesResponseModel({
    required this.status,
    required this.message,
    required this.notes,
  });

  final int status;
  final String message;
  final List<NoteModel> notes;

  factory NotesResponseModel.fromJson(Map<String, dynamic> json) {
    return NotesResponseModel(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      notes: json["notes"] == null
          ? []
          : List<NoteModel>.from(
          json["notes"]!.map((x) => NoteModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "notes": notes.map((x) => x.toJson()).toList(),
  };
}

class NoteModel {
  NoteModel({
    required this.id,
    required this.semester,
    required this.subject,
    required this.notesFile,
    required this.uploadedAt,
    required this.v,
  });

  final String id;
  final String semester;
  final String subject;
  final String notesFile;
  final String uploadedAt;
  final int v;

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json["_id"] ?? "",
      semester: json["semester"] ?? "",
      subject: json["subject"] ?? "",
      notesFile: json["notesFile"] ?? "",
      uploadedAt: json["uploadedAt"] ?? "",
      v: json["__v"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "semester": semester,
    "subject": subject,
    "notesFile": notesFile,
    "uploadedAt": uploadedAt,
    "__v": v,
  };
}
