import 'package:flutter/material.dart';
import '../../data/survey_data.dart';
import 'survey_page.dart';

class DrinkSurveyPage extends StatelessWidget {
  static final path = '/drink-survey';
  const DrinkSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SurveyPage(config: SurveyData.drinkingSurvey, onSave: (answers) {});
  }
}
