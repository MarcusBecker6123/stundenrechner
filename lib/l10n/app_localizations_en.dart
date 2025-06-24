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

  @override
  String get hours => 'Hours';

  @override
  String get confirm => 'Confirm Deletion';

  @override
  String get navbar1 => 'Calculator';

  @override
  String get navbar2 => 'Working Hours';

  @override
  String get calculator => 'Hours Calculator';

  @override
  String get noDate => 'No date selected';

  @override
  String get date => 'Date';

  @override
  String get chooseDate => 'Choose Date';

  @override
  String get begin => 'Start';

  @override
  String get end => 'End';

  @override
  String get format24Hour => '24-Hour Format';

  @override
  String get alert => 'Hint';

  @override
  String get error => 'Error';

  @override
  String get eHandler => 'Start must be before end and break time cannot be negative.';

  @override
  String get hourdiff => 'Hour Difference';

  @override
  String get insert => 'Enter';

  @override
  String get cconfirm => 'Confirm';

  @override
  String get question => 'Are you sure you want to delete this entry?';

  @override
  String get noData => 'No data available';

  @override
  String get exportAll => 'all_working_hours_export';

  @override
  String get exportSelected => 'hours_export_';

  @override
  String get noSupported => 'Platform not supported.';

  @override
  String get exportError => 'Export failed';

  @override
  String get chooseExport => 'What would you like to export?';

  @override
  String get month => 'Month';

  @override
  String get year => 'Year';

  @override
  String get all => 'All Data';

  @override
  String get sumFor => 'Sum for ';

  @override
  String get monthlyHours => 'Monthly Hours';

  @override
  String get details => 'Details for ';

  @override
  String get fur => 'for';

  @override
  String get breakTime => 'Break (e.g., 0.5 for 30 minutes)';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';
}
