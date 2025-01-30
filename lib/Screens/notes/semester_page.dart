import 'package:chat_app/Screens/notes/subject_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'notes_getx.dart';

class SemesterScreen extends StatelessWidget {
  final controller = Get.put(GetNotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semesters'),
      ),
      body: Obx(() => controller.isLoadingSemesters.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.semesters.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.semesters[index]),
              onTap: () {
                controller.fetchSubjects(controller.semesters[index]);
                Get.to(() => SubjectScreen(semester: controller.semesters[index]));
              },
            );
          },
        ),
      ),
    );
  }
}
