import 'package:flutter/material.dart';
import 'package:ztech_hpih_app/features/profile/domain/models/survey_item.dart';
import 'package:ztech_hpih_app/features/profile/presentation/widgets/survey_question.dart';
import '../../../../core/theme/app_theme.dart';

class SurveyPage extends StatefulWidget {
  final SurveyConfig config;
  final void Function(Map<String, String> answers)? onSave;

  const SurveyPage({super.key, required this.config, this.onSave});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  // key = question, value = selected option
  late final Map<String, String?> _answers;

  @override
  void initState() {
    super.initState();
    _answers = {for (final q in widget.config.questions) q.question: null};
  }

  void _handleSave() {
    final answered = _answers.map((key, value) => MapEntry(key, value ?? ''));
    widget.onSave?.call(answered);
    // TODO: gọi BLoC / cubit submit ở đây
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          widget.config.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: widget.config.questions.map((question) {
          return SurveyQuestionItem(
            question: question,
            selectedOption: _answers[question.question],
            onChanged: (value) {
              setState(() => _answers[question.question] = value);
            },
          );
        }).toList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: ElevatedButton(
          onPressed: _handleSave,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'LƯU',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
