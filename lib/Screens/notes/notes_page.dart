import 'package:fluttertoast/fluttertoast.dart';
import 'notes_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


class NotesScreen extends StatelessWidget {
  final String semester;
  final String subject;
  final controller = Get.find<GetNotesController>();

  NotesScreen({super.key, required this.semester, required this.subject});

  @override
  Widget build(BuildContext context) {
    controller.fetchNotes(semester, subject);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes - $subject'),
      ),
      body: Obx(
            () => controller.isLoadingNotes.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return ListTile(
              title: Text('Note ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Uploaded: ${note.uploadedAt}'),
                  Text('File: ${note.notesFile}'),
                ],
              ),
              onTap: () {
                Fluttertoast.showToast(msg: 'Opening note: ${note.notesFile}');
              },
            );
          },
        ),
      ),
    );
  }
}
