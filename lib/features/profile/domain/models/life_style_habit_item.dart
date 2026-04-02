import 'package:ztech_hpih_app/l10n/app_localizations.dart';

class LifeStyleHabitItem {
  final String Function(AppLocalizations l10n) titleBuilder;
  final String routePath;

  LifeStyleHabitItem({required this.titleBuilder, required this.routePath});
}

List<LifeStyleHabitItem> lifeStyleHabitItems = [
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_nutrition,
    routePath: '',
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_drinking,
    routePath: '',
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_smoking,
    routePath: '',
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_sleep,
    routePath: '',
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_physical_activity,
    routePath: '',
  ),
  LifeStyleHabitItem(
    titleBuilder: (l10n) => l10n.profile_life_style_mental_health,
    routePath: '',
  ),
];
