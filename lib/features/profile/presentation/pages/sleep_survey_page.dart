import 'package:flutter/material.dart';
import '../../data/survey_data.dart';
import 'survey_page.dart';

class SleepSurveyPage extends StatelessWidget {
  static final path = '/sleep-survey';
  const SleepSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SurveyPage(config: SurveyData.sleepSurvey, onSave: (answers) {});
  }
}
