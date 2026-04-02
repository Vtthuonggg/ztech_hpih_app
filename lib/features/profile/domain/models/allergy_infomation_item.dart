import 'package:ztech_hpih_app/l10n/app_localizations.dart';

class AllergyInfomationItem {
  final String Function(AppLocalizations l10n) titleBuilder;
  final String routePath;

  AllergyInfomationItem({required this.titleBuilder, required this.routePath});
}

List<AllergyInfomationItem> allergyInfomationItems = [
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_history,
    routePath: '',
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_food,
    routePath: '',
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_medicine,
    routePath: '',
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_skin,
    routePath: '',
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_environment,
    routePath: '',
  ),
  AllergyInfomationItem(
    titleBuilder: (l10n) => l10n.profile_allergy_other,
    routePath: '',
  ),
];
