import 'package:chat_app/Screens/multi_step_form/personal_info.dart';
import 'package:flutter/material.dart';
import 'duration.dart';
import 'education.dart';

class HorizontalStepperForm extends StatefulWidget {
  const HorizontalStepperForm({super.key});

  @override
  State<HorizontalStepperForm> createState() => _HorizontalStepperFormState();
}

class _HorizontalStepperFormState extends State<HorizontalStepperForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> get _formPages => [
    const Info(),
    const Education(),
    const Recent(),
  ];

  void _nextPage() async {
    if (_currentPage < _formPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Steps'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: List.generate(
                _formPages.length,
                    (index) => Expanded(
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    color: index <= _currentPage ? Colors.blue : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: _formPages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: _previousPage,
                    child: const Text('Previous'),
                  )
                else
                  const SizedBox.shrink(),
                ElevatedButton(
                  onPressed: _nextPage,
                  child: Text(_currentPage == _formPages.length - 1 ? 'Submit' : 'Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}