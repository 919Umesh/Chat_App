import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'notes_getx.dart';
import 'notes_page.dart';

class SubjectScreen extends StatelessWidget {
  final String semester;
  final controller = Get.find<GetNotesController>();

  SubjectScreen({required this.semester});

  @override
  Widget build(BuildContext context) {
    // Fetch subjects for the selected semester
    controller.fetchSubjects(semester);

    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects - $semester',style:const TextStyle(
          fontFamily: 'roboto',
        ),),
      ),
      body: Obx(
            () => controller.isLoadingSubjects.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.subjects.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.subjects[index]),
              onTap: () {
                // Fetch notes for the selected subject and semester
                controller.fetchNotes(semester, controller.subjects[index]);
                Get.to(() => NotesScreen(
                  semester: semester,
                  subject: controller.subjects[index],
                ));
              },
            );
          },
        ),
      ),
    );
  }
}
