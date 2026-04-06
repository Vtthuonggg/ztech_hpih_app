import 'package:flutter/material.dart';
import '../../data/survey_data.dart';
import 'survey_page.dart';

class MentalHealthSurveyPage extends StatelessWidget {
  static final path = '/mental-health-survey';
  const MentalHealthSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SurveyPage(config: SurveyData.mentalSurvey, onSave: (answers) {});
  }
}
