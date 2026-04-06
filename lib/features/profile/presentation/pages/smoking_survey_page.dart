import 'package:flutter/material.dart';
import '../../data/survey_data.dart';
import 'survey_page.dart';

class SmokingSurveyPage extends StatelessWidget {
  static final path = '/smoking-survey';
  const SmokingSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SurveyPage(config: SurveyData.smokingSurvey, onSave: (answers) {});
  }
}
