// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Working Hours';

  @override
  String get greeting => 'Hello!';

  @override
  String get export => 'Export';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  String get hours => 'Hours';

  String get confirm => 'Confirm Deletion';

  String get navbar1 => 'Calculator';

  String get navbar2 => 'Working Hours';

  String get calculator => 'Hours Calculator';

  String get noDate => 'No date selected';

  String get date => 'Date';

  String get chooseDate => 'Choose Date';

  String get begin => 'Start';

  String get end => 'End';

  String get format24Hour => '24-Hour Format';

  String get alert => 'Hint';

  String get error => 'Error';

  String get eHandler =>
      'Start must be before end and break time cannot be negative.';

  String get hourdiff => 'Hour Difference';

  String get insert => 'Enter';

  String get cconfirm => 'Confirm';

  String get question => 'Are you sure you want to delete this entry?';

  String get noData => 'No data available';

  String get exportAll => 'all_working_hours_export';

  String get exportSelected => 'hours_export_';

  String get noSupported => 'Platform not supported.';

  String get exportError => 'Export failed';

  String get chooseExport => 'What would you like to export?';

  String get month => 'Month';
  String get year => 'Year';
  String get all => 'All Data';
  String get sumFor => 'Sum for ';
  String get monthlyHours => 'Monthly Hours';
  String get details => 'Details for ';
  String get fur => 'for';
  String get breakTime => 'Break (e.g., 0.5 for 30 minutes)';
  String get save => 'Save';

  String get cancel => 'Cancel';
}
