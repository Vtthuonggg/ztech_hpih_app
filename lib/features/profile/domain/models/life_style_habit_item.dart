import 'package:ztech_hpih_app/features/profile/presentation/pages/activity_survey_page.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/drink_survey_page.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/mental_health_survey_page.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/nutrition_survey_page.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/sleep_survey_page.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/smoking_survey_page.dart';
import 'package:ztech_hpih_app/l10n/app_localizations.dart';

class LifeStyleHabitItem {
  final String Function(AppLocalizations l10n) titleBuilder;
  final String routePath;

  LifeStyleHabitItem({required this.titleBuilder, required this.routePath});
}

List<LifeStyleHabitItem> lifeStyleHabitItems = [
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_nutrition,
    routePath: NutritionSurveyPage.path,
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_drinking,
    routePath: DrinkSurveyPage.path,
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_smoking,
    routePath: SmokingSurveyPage.path,
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_sleep,
    routePath: SleepSurveyPage.path,
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_physical_activity,
    routePath: ActivitySurveyPage.path,
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_mental_health,
    routePath: MentalHealthSurveyPage.path,
  ),
];
