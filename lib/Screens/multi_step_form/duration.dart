import 'package:chat_app/Screens/multi_step_form/summary_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_provider.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  final _formKey = GlobalKey<FormState>();
  final _companyController = TextEditingController();
  final _experienceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final formData = await context.read<FormDataProvider>().getFormData();
    setState(() {
      _companyController.text = formData['company'] ?? '';
      _experienceController.text = formData['experience'] ?? '';
    });
  }

  @override
  void dispose() {
    _companyController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      await context.read<FormDataProvider>().savePageData(
        'experience',
        {
          'company': _companyController.text,
          'experience': _experienceController.text,
        },
      );
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await _saveData();
      final formData = await context.read<FormDataProvider>().getFormData();
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SummaryScreen(data: formData),
          ),
        );
      }
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
              'Recent Experience',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _companyController,
              decoration: const InputDecoration(
                labelText: 'Company Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter company name';
                }
                return null;
              },
              onEditingComplete: _saveData,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _experienceController,
              decoration: const InputDecoration(
                labelText: 'Work Experience',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your work experience';
                }
                return null;
              },
              onEditingComplete: _saveData,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _submitForm,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                ),
                height: 80,
                width: 150,
                child: const Center(
                  child:Text('Submit'),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
