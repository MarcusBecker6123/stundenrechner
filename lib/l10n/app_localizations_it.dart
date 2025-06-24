// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Orario di lavoro';

  @override
  String get greeting => 'Ciao!';

  @override
  String get export => 'Esportazione';

  @override
  String get delete => 'Cancellare';

  @override
  String get edit => 'Modifica';

  @override
  String get hours => 'Orario';

  @override
  String get confirm => 'Confermare l\'eliminazione';

  @override
  String get navbar1 => 'Calcolatrice';

  @override
  String get navbar2 => 'Orario di lavoro';

  @override
  String get calculator => 'Calcolatore orario';

  @override
  String get noDate => 'Nessuna data selezionata';

  @override
  String get date => 'data';

  @override
  String get chooseDate => 'Selezionare la data';

  @override
  String get begin => 'Inizio';

  @override
  String get end => 'Fine';

  @override
  String get format24Hour => 'Formato 24 ore';

  @override
  String get alert => 'Suggerimento';

  @override
  String get error => 'Errore';

  @override
  String get eHandler =>
      'L\'inizio deve essere precedente alla fine e il tempo di pausa non deve essere negativo.';

  @override
  String get hourdiff => 'Differenza in ore';

  @override
  String get insert => 'Registro';

  @override
  String get cconfirm => 'Confermare';

  @override
  String get question => 'Vuoi davvero cancellare questa voce?';

  @override
  String get noData => 'Nessun dato disponibile';

  @override
  String get exportAll => 'tutte_le_ore_di_lavoro_esportazione';

  @override
  String get exportSelected => 'orario_di_lavoro_esportazione_';

  @override
  String get noSupported => 'non è supportata.';

  @override
  String get exportError => 'Esportazione fallita';

  @override
  String get chooseExport => 'Cosa si vuole esportare?';

  @override
  String get month => 'mese';

  @override
  String get year => 'Anno';

  @override
  String get all => 'Tutti i dati';

  @override
  String get sumFor => 'Totale per';

  @override
  String get monthlyHours => 'Ore mensili';

  @override
  String get details => 'Dettagli per';

  @override
  String get fur => 'per';

  @override
  String get breakTime => 'Pausa (ad es. 0,5 per 30 minuti)';

  @override
  String get save => 'Risparmiare';

  @override
  String get cancel => 'Annullamento';

  @override
  String get startTime => 'Ora di inizio (ad es. 8,5 per le 08:30)';

  @override
  String get endTime => 'Ora di fine (ad es. 17.0 per 17:00)';
}
