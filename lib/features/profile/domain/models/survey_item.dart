class SurveyQuestion {
  final String question;
  final List<String> options;

  const SurveyQuestion({required this.question, required this.options});
}

class SurveyConfig {
  final String title;
  final List<SurveyQuestion> questions;

  const SurveyConfig({required this.title, required this.questions});
}
