import 'package:flutter/material.dart';
import '../../data/survey_data.dart';
import 'survey_page.dart';

class ActivitySurveyPage extends StatelessWidget {
  static final path = '/activity-survey';
  const ActivitySurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SurveyPage(config: SurveyData.activitySurvey, onSave: (answers) {});
  }
}
