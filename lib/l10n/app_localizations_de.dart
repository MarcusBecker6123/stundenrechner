// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Arbeitszeiten';

  @override
  String get greeting => 'Hallo!';

  @override
  String get export => 'Exportieren';

  @override
  String get delete => 'Löschen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get hours => 'Stunden';

  @override
  String get confirm => 'Löschen bestätigen';

  @override
  String get navbar1 => 'Rechner';

  @override
  String get navbar2 => 'Arbeitszeiten';

  @override
  String get calculator => 'Stundenrechner';

  @override
  String get noDate => 'Kein Datum ausgewählt';

  @override
  String get date => 'Datum';

  @override
  String get chooseDate => 'Datum wählen';

  @override
  String get begin => 'Start';

  @override
  String get end => 'Ende';

  @override
  String get format24Hour => '24-Stunden-Format';

  @override
  String get alert => 'Hinweis';

  @override
  String get error => 'Fehler';

  @override
  String get eHandler => 'Start muss vor Ende liegen und Pausenzeit darf nicht negativ sein.';

  @override
  String get hourdiff => 'Stundendifferenz';

  @override
  String get insert => 'Eintragen';

  @override
  String get cconfirm => 'Bestätigen';

  @override
  String get question => 'Möchtest du diesen Eintrag wirklich löschen?';

  @override
  String get noData => 'Keine Daten verfügbar';

  @override
  String get exportAll => 'alle_arbeitszeiten_export';

  @override
  String get exportSelected => 'arbeitszeit_export_';

  @override
  String get noSupported => 'Plattform nicht unterstützt.';

  @override
  String get exportError => 'Export fehlgeschlagen';

  @override
  String get chooseExport => 'Was möchtest du exportieren?';

  @override
  String get month => 'Monat';

  @override
  String get year => 'Jahr';

  @override
  String get all => 'Alle Daten';

  @override
  String get sumFor => 'Summe für ';

  @override
  String get monthlyHours => 'Monatliche Stunden';

  @override
  String get details => 'Details für ';

  @override
  String get fur => 'für';

  @override
  String get breakTime => 'Pause (z. B. 0.5 für 30 Minuten)';

  @override
  String get save => 'Speichern';

  @override
  String get cancel => 'Abbrechen';
}
