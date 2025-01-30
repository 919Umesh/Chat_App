import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Models/notes_model.dart';
import 'notes_repo.dart';


class GetNotesController extends GetxController {
  final isLoadingSemesters = false.obs;
  final semesters = <String>[].obs;

  final isLoadingSubjects = false.obs;
  final subjects = <String>[].obs;

  final isLoadingNotes = false.obs;
  final notes = <NoteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSemesters();
  }

  Future<void> fetchSemesters() async {
    isLoadingSemesters.value = true;
    try {
      final response = await getNotesRepository.getSemester();

      if (response.status == 200) {
        semesters.value = response.semesters;
      }
    } catch (e) {
      debugPrint('Error fetching semesters: $e');
    } finally {
      isLoadingSemesters.value = false;
    }
  }

  Future<void> fetchSubjects(String semester) async {
    isLoadingSubjects.value = true;
    try {
      final response = await getNotesRepository.getSubject(semester);
      if (response.status == 200) {
        subjects.value = response.subjects;
      }
    } catch (e) {
      debugPrint('Error fetching subjects: $e');
    } finally {
      isLoadingSubjects.value = false;
    }
  }

  Future<void> fetchNotes(String semester, String subject) async {
    isLoadingNotes.value = true;
    try {
      final response = await getNotesRepository.getNotes(semester, subject);
      if (response.status == 200) {
        notes.value = response.notes;
      }
    } catch (e) {
      debugPrint('Error fetching notes: $e');
    } finally {
      isLoadingNotes.value = false;
    }
  }
}
