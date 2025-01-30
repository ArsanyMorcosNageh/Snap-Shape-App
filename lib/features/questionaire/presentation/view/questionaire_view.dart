import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../../core/navigation/bottom_navigation_bar.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  final List<Map<String, dynamic>> questions = [
    {"type": "choices", "question": "What is your gender?", "options": ["Male", "Female"], "key": "gender", "multiSelect": false},
    {"type": "choices", "question": "I am a...", "options": ["Standard", "Vegetarian", "Vegan", "Pescatarian", "Gluten-Free"], "key": "diet", "multiSelect": false},
    {"type": "choices", "question": "Which meals do you usually have?", "options": ["Breakfast", "Snack", "Lunch", "Dinner"], "key": "meals", "multiSelect": true},
    {"type": "choices", "question": "Do you have any chronic diseases?", "options": ["Diabetes", "Heart Disease", "Cancer", "Other"], "key": "chronic_diseases", "multiSelect": true},
    {"type": "choices", "question": "You want to...", "options": ["Lose Weight", "Gain Weight", "Stabilize Weight"], "key": "goal", "multiSelect": false},
    {"type": "number", "question": "What is your age?", "minValue": 10, "maxValue": 100, "initialValue": 25, "key": "age"},
    {"type": "number", "question": "What is your current weight?", "minValue": 40, "maxValue": 200, "initialValue": 70, "key": "current_weight"},
    {"type": "number", "question": "What is your goal weight?", "minValue": 40, "maxValue": 200, "initialValue": 60, "key": "goal_weight"},
    {"type": "number", "question": "What is your height?", "minValue": 150, "maxValue": 300, "initialValue": 170, "key": "height"},
  ];

  final Map<String, dynamic> answers = {};

  Future<void> _saveAnswersLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedAnswers = jsonEncode(answers);
    await prefs.setString('user_answers', encodedAnswers);
  }

  void _goToNextQuestion() async {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      await _saveAnswersLocally(); // تخزين البيانات قبل الانتقال
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainView()), // يروح على MainView اللي فيها الـ NavBar
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    String questionText = currentQuestion["question"];
    String questionType = currentQuestion["type"];
    String key = currentQuestion["key"];
    bool multiSelect = currentQuestion["multiSelect"] ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text("Questions")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questionText, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            if (questionType == "number") ...[
              NumberPicker(
                value: answers[key] ?? currentQuestion["initialValue"],
                minValue: currentQuestion["minValue"],
                maxValue: currentQuestion["maxValue"],
                onChanged: (value) {
                  setState(() {
                    answers[key] = value;
                  });
                },
              ),
            ] else if (questionType == "choices") ...[
              Column(
                children: currentQuestion["options"].map<Widget>((option) {
                  bool isSelected = multiSelect
                      ? (answers[key] ?? []).contains(option)
                      : answers[key] == option;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (multiSelect) {
                          if (isSelected) {
                            (answers[key] ?? []).remove(option);
                          } else {
                            answers[key] = (answers[key] ?? [])..add(option);
                          }
                        } else {
                          answers[key] = option;
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xFFF9AB0B) : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: isSelected ? Color(0xFFF9AB0B) : Colors.grey, width: 2),
                      ),
                      child: Text(option, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isSelected ? Colors.black : Colors.grey[700])),
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (questionType == "choices" && (answers[key] == null || answers[key].isEmpty)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select an option before proceeding.")),
                  );
                } else {
                  _goToNextQuestion();
                }
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}










// SharedPreferences prefs = await SharedPreferences.getInstance();
// String? userAnswers = prefs.getString('user_answers');
// if (userAnswers != null) {
//   Map<String, dynamic> answers = jsonDecode(userAnswers);
//   print(answers);
// }