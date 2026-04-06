import 'package:flutter/material.dart';
import '../../data/survey_data.dart';
import 'survey_page.dart';

class NutritionSurveyPage extends StatelessWidget {
  static final path = '/nutrition-survey';
  const NutritionSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SurveyPage(config: SurveyData.nutritionSurvey, onSave: (answers) {});
  }
}
