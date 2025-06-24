// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Рабочее время';

  @override
  String get greeting => 'Привет!';

  @override
  String get export => 'Экспорт';

  @override
  String get delete => 'Удалить';

  @override
  String get edit => 'Редактировать';

  @override
  String get hours => 'Часы';

  @override
  String get confirm => 'Подтвердите удаление';

  @override
  String get navbar1 => 'Калькулятор';

  @override
  String get navbar2 => 'Рабочее время';

  @override
  String get calculator => 'Калькулятор часов';

  @override
  String get noDate => 'Дата не выбрана';

  @override
  String get date => 'дата';

  @override
  String get chooseDate => 'Выберите дату';

  @override
  String get begin => 'Начало';

  @override
  String get end => 'Конец';

  @override
  String get format24Hour => '24-часовой формат';

  @override
  String get alert => 'Подсказка';

  @override
  String get error => 'Ошибка';

  @override
  String get eHandler =>
      'Начало должно быть раньше конца, а время паузы не должно быть отрицательным.';

  @override
  String get hourdiff => 'Разница в часах';

  @override
  String get insert => 'Регистрация';

  @override
  String get cconfirm => 'Подтвердите';

  @override
  String get question => 'Вы действительно хотите удалить эту запись?';

  @override
  String get noData => 'Нет данных';

  @override
  String get exportAll => 'все_рабочие_часы_экспорт';

  @override
  String get exportSelected => 'рабочее_время_экспорта';

  @override
  String get noSupported => 'платформа не поддерживается.';

  @override
  String get exportError => 'Экспорт не удался';

  @override
  String get chooseExport => 'Что вы хотите экспортировать?';

  @override
  String get month => 'месяц';

  @override
  String get year => 'Год';

  @override
  String get all => 'Все данные';

  @override
  String get sumFor => 'Всего за';

  @override
  String get monthlyHours => 'Месячные часы';

  @override
  String get details => 'Подробности для';

  @override
  String get fur => 'для';

  @override
  String get breakTime => 'Перерыв (например, 0,5 на 30 минут)';

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get startTime => 'Start time (e.g. 8.5 for 08:30)';

  @override
  String get endTime => 'End time (e.g. 17.0 for 17:00)';

  @override
  String get overlapWarning =>
      'This time overlaps with an existing entry. Please edit the existing entry or choose another time.';
}
