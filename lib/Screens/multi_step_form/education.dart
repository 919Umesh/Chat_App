
// education.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_provider.dart';


class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final _formKey = GlobalKey<FormState>();
  final _degreeController = TextEditingController();
  final _universityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final formData = await context.read<FormDataProvider>().getFormData();
    setState(() {
      _degreeController.text = formData['degree'] ?? '';
      _universityController.text = formData['university'] ?? '';
    });
  }

  @override
  void dispose() {
    _degreeController.dispose();
    _universityController.dispose();
    super.dispose();
  }

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      await context.read<FormDataProvider>().savePage2Data(
        'education',
        {
          'degree': _degreeController.text,
          'university': _universityController.text,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onWillPop: () async {
        await _saveData();
        return true;
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Education Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _degreeController,
              decoration: const InputDecoration(
                labelText: 'Degree',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your degree';
                }
                return null;
              },
              onEditingComplete: _saveData,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _universityController,
              decoration: const InputDecoration(
                labelText: 'University',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your university';
                }
                return null;
              },
              onEditingComplete: _saveData,
            ),
          ],
        ),
      ),
    );
  }
}