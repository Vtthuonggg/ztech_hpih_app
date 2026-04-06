import 'package:flutter/material.dart';
import 'package:ztech_hpih_app/features/profile/data/survey_data.dart';

import 'survey_page.dart';

class AllergySurveyPage extends StatelessWidget {
  static const path = '/allergy-survey/:type';

  static String location(String type) => '/allergy-survey/$type';

  final String type;

  const AllergySurveyPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SurveyPage(
      config: SurveyData.allergySurveyByType(type),
      onSave: (answers) {},
    );
  }
}
