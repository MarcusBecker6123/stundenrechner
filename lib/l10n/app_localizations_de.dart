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

  String get hours => 'Stunden';

  String get confirm => 'Löschen bestätigen';

  String get navbar1 => 'Rechner';

  String get navbar2 => 'Arbeitszeiten';

  String get calculator => 'Stundenrechner';

  String get noDate => 'Kein Datum ausgewählt';

  String get date => 'Datum';

  String get chooseDate => 'Datum auswählen';

  String get begin => 'Beginn';

  String get end => 'Ende';

  String get format24Hour => '24-Stunden-Format';

  String get alert => 'Hinweis';

  String get error => 'Fehler';

  String get eHandler =>
      'Beginn muss vor Ende liegen und Pausenzeit darf nicht negativ sein.';

  String get hourdiff => 'Stunden Differenz';

  String get insert => 'Eintragen';

  String get cconfirm => 'Bestätigen';

  String get question => 'Möchtest du diesen Eintrag wirklich löschen?';

  String get noData => 'Keine Daten zum Extrahieren vorhanden.';

  String get exportAll => 'arbeitszeiten_export_alle';

  String get exportSelected => 'arbeitszeiten_export_';

  String get noSupported => 'Plattform nicht unterstützt.';

  String get exportError => 'Fehler beim Exportieren der Daten. ';

  String get chooseExport => 'Was möchtest du exportieren?';

  String get month => 'Nur gewählter Monat';
  String get all => 'Alle Daten';
  String get year => 'Ganzes Jahr';
  String get sumFor => 'Summe für';

  String get monthlyHours => 'Stunden pro Monat';

  String get details => 'Details für';

  
  String get fur => 'für';

  String get breakTime => 'Pausenzeit (z.B. 0.5 für 30min)';

  String get save => 'Speichern';

  String get cancel => 'Abbrechen';

}
