import 'package:flutter/material.dart';
import 'package:ztech_hpih_app/features/profile/domain/models/survey_item.dart';

class SurveyQuestionItem extends StatelessWidget {
  final SurveyQuestion question;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;

  const SurveyQuestionItem({
    super.key,
    required this.question,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          question.question,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        ...question.options.map(
          (option) => RadioListTile<String>(
            contentPadding: EdgeInsets.all(0),
            value: option,
            groupValue: selectedOption,
            onChanged: onChanged,
            title: Text(option, style: const TextStyle(fontSize: 14)),
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            dense: true,
          ),
        ),
      ],
    );
  }
}
