import 'package:chat_app/Helper/get_routes.dart';
import 'package:chat_app/Screens/notes/subject_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../Helper/shared_preference_fun.dart';
import 'notes_getx.dart';

class SemesterScreen extends GetView<GetNotesController> {
  const SemesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Semester Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.postLogin);
                controller.update();
              },
              icon: const Icon(Bootstrap.person)),
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.getCustomerPage,arguments: <String,dynamic>{
                  'is_editing':true
                });
                controller.update();
              },
              icon: const Icon(Bootstrap.person)),
        ],
      ),
      body: Obx(() {
        if (controller.isLoadingSemesters.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                ),
                const SizedBox(height: 16),
                Text(
                  'Loading semesters',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.semesters.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  title: Text(
                    controller.semesters[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.directions,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    controller.fetchSubjects(controller.semesters[index]);
                    Get.to(() => SubjectScreen(
                          semester: controller.semesters[index],
                        ));
                  },
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await SharedPreferencesHelper.clearAllData();
          Get.offAllNamed(Routes.postLogin);
        },
        child: const Icon(Bootstrap.door_open),
      ),
    );
  }
}
