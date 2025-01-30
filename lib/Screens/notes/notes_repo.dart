import '../../Models/notes_model.dart';
import '../../Models/semester_model.dart';
import '../../Models/subject_model.dart';
import '../../base/Api_end_point/api_endpoints.dart';
import '../../base/Dio_services/dio_base_repository.dart';

class GetNotesRepository extends BaseRepository {
  Future<SemesterResponseModel> getSemester() async {
    final response = await getDataFromServer(
      ApiEndpoint.getSemester,
      needsAuthorization: false,
      params: {},
    );
    return SemesterResponseModel.fromJson(response.data);
  }

  Future<SubjectResponseModel> getSubject(String semester) async {
    final response = await getDataFromServer(
      ApiEndpoint.getSubject,
      needsAuthorization: false,
      params: {
        'semester': semester
      },
    );
    return SubjectResponseModel.fromJson(response.data);
  }

  Future<NotesResponseModel> getNotes(String semester,String subject) async {
    final response = await getDataFromServer(
      ApiEndpoint.getNotes,
      needsAuthorization: false,
      params: {
        'semester': semester,
        'subject': subject,
      },
    );
    return NotesResponseModel.fromJson(response.data);
  }
}

GetNotesRepository getNotesRepository = GetNotesRepository();

// https://node-chat-mvlu.onrender.com/notes/semesters
// https://node-chat-mvlu.onrender.com/notes/subjects?semester=Semster1
// https://node-chat-mvlu.onrender.com/notes/notes?semester=Semster1&subject=DSA