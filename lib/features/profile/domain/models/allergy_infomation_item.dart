import 'package:ztech_hpih_app/l10n/app_localizations.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/allergy_survey_page.dart';

class AllergyInfomationItem {
  final String Function(AppLocalizations l10n) titleBuilder;
  final String routePath;

  AllergyInfomationItem({required this.titleBuilder, required this.routePath});
}

List<AllergyInfomationItem> allergyInfomationItems = [
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_history,
    routePath: AllergySurveyPage.location('history'),
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_food,
    routePath: AllergySurveyPage.location('food'),
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_medicine,
    routePath: AllergySurveyPage.location('medicine'),
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_skin,
    routePath: AllergySurveyPage.location('skin'),
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_environment,
    routePath: AllergySurveyPage.location('environment'),
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_other,
    routePath: AllergySurveyPage.location('other'),
  ),
];
