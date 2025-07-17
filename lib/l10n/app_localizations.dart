import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('hi'),
    Locale('it'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In de, this message translates to:
  /// **'Arbeitszeiten'**
  String get appTitle;

  /// No description provided for @greeting.
  ///
  /// In de, this message translates to:
  /// **'Hallo!'**
  String get greeting;

  /// No description provided for @export.
  ///
  /// In de, this message translates to:
  /// **'Exportieren'**
  String get export;

  /// No description provided for @delete.
  ///
  /// In de, this message translates to:
  /// **'Löschen'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In de, this message translates to:
  /// **'Bearbeiten'**
  String get edit;

  /// No description provided for @hours.
  ///
  /// In de, this message translates to:
  /// **'Stunden'**
  String get hours;

  /// No description provided for @confirm.
  ///
  /// In de, this message translates to:
  /// **'Löschen bestätigen'**
  String get confirm;

  /// No description provided for @navbar1.
  ///
  /// In de, this message translates to:
  /// **'Rechner'**
  String get navbar1;

  /// No description provided for @navbar2.
  ///
  /// In de, this message translates to:
  /// **'Arbeitszeiten'**
  String get navbar2;

  /// No description provided for @calculator.
  ///
  /// In de, this message translates to:
  /// **'Stundenrechner'**
  String get calculator;

  /// No description provided for @noDate.
  ///
  /// In de, this message translates to:
  /// **'Kein Datum ausgewählt'**
  String get noDate;

  /// No description provided for @date.
  ///
  /// In de, this message translates to:
  /// **'Datum'**
  String get date;

  /// No description provided for @chooseDate.
  ///
  /// In de, this message translates to:
  /// **'Datum wählen'**
  String get chooseDate;

  /// No description provided for @begin.
  ///
  /// In de, this message translates to:
  /// **'Start'**
  String get begin;

  /// No description provided for @end.
  ///
  /// In de, this message translates to:
  /// **'Ende'**
  String get end;

  /// No description provided for @format24Hour.
  ///
  /// In de, this message translates to:
  /// **'24-Stunden-Format'**
  String get format24Hour;

  /// No description provided for @alert.
  ///
  /// In de, this message translates to:
  /// **'Hinweis'**
  String get alert;

  /// No description provided for @error.
  ///
  /// In de, this message translates to:
  /// **'Fehler'**
  String get error;

  /// No description provided for @eHandler.
  ///
  /// In de, this message translates to:
  /// **'Start muss vor Ende liegen und Pausenzeit darf nicht negativ sein.'**
  String get eHandler;

  /// No description provided for @hourdiff.
  ///
  /// In de, this message translates to:
  /// **'Stundendifferenz'**
  String get hourdiff;

  /// No description provided for @insert.
  ///
  /// In de, this message translates to:
  /// **'Eintragen'**
  String get insert;

  /// No description provided for @cconfirm.
  ///
  /// In de, this message translates to:
  /// **'Bestätigen'**
  String get cconfirm;

  /// No description provided for @question.
  ///
  /// In de, this message translates to:
  /// **'Möchtest du diesen Eintrag wirklich löschen?'**
  String get question;

  /// No description provided for @noData.
  ///
  /// In de, this message translates to:
  /// **'Keine Daten verfügbar'**
  String get noData;

  /// No description provided for @exportAll.
  ///
  /// In de, this message translates to:
  /// **'Alles'**
  String get exportAll;

  /// No description provided for @exportSelected.
  ///
  /// In de, this message translates to:
  /// **'arbeitszeit_export_'**
  String get exportSelected;

  /// No description provided for @noSupported.
  ///
  /// In de, this message translates to:
  /// **'Plattform nicht unterstützt.'**
  String get noSupported;

  /// No description provided for @exportError.
  ///
  /// In de, this message translates to:
  /// **'Export fehlgeschlagen'**
  String get exportError;

  /// No description provided for @chooseExport.
  ///
  /// In de, this message translates to:
  /// **'Was möchtest du exportieren?'**
  String get chooseExport;

  /// No description provided for @month.
  ///
  /// In de, this message translates to:
  /// **'Monat'**
  String get month;

  /// No description provided for @year.
  ///
  /// In de, this message translates to:
  /// **'Jahr'**
  String get year;

  /// No description provided for @all.
  ///
  /// In de, this message translates to:
  /// **'Alle Daten'**
  String get all;

  /// No description provided for @sumFor.
  ///
  /// In de, this message translates to:
  /// **'Summe für '**
  String get sumFor;

  /// No description provided for @monthlyHours.
  ///
  /// In de, this message translates to:
  /// **'Monatliche Stunden'**
  String get monthlyHours;

  /// No description provided for @details.
  ///
  /// In de, this message translates to:
  /// **'Details für '**
  String get details;

  /// No description provided for @fur.
  ///
  /// In de, this message translates to:
  /// **'für'**
  String get fur;

  /// No description provided for @breakTime.
  ///
  /// In de, this message translates to:
  /// **'Pause (z. B. 0.5 für 30 Minuten)'**
  String get breakTime;

  /// No description provided for @save.
  ///
  /// In de, this message translates to:
  /// **'Speichern'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get cancel;

  /// No description provided for @startTime.
  ///
  /// In de, this message translates to:
  /// **'Startzeit (z.B. 8.5 für 08:30)'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In de, this message translates to:
  /// **'Endzeit (z.B. 17.0 für 17:00)'**
  String get endTime;

  /// No description provided for @overlapWarning.
  ///
  /// In de, this message translates to:
  /// **'Dieser Zeitraum überschneidet sich mit einem bestehenden Eintrag. Bitte bearbeiten Sie den vorhandenen Eintrag oder wählen Sie eine andere Zeit.'**
  String get overlapWarning;

  /// No description provided for @exportSuccess.
  ///
  /// In de, this message translates to:
  /// **'Exportieren erfolgreich.'**
  String get exportSuccess;

  /// No description provided for @exportCurrentMonth.
  ///
  /// In de, this message translates to:
  /// **'Dieser Monat'**
  String get exportCurrentMonth;

  /// No description provided for @exportSelectedMonth.
  ///
  /// In de, this message translates to:
  /// **'Ausgewählter Monat'**
  String get exportSelectedMonth;

  /// No description provided for @exportCurrentYear.
  ///
  /// In de, this message translates to:
  /// **'Dieses Jahr'**
  String get exportCurrentYear;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'hi',
    'it',
    'ru',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
