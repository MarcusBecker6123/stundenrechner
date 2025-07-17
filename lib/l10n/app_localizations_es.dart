// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Horario de trabajo';

  @override
  String get greeting => '¡Hola!';

  @override
  String get export => 'Exportar';

  @override
  String get delete => 'Borrar';

  @override
  String get edit => 'Editar';

  @override
  String get hours => 'Horas';

  @override
  String get confirm => 'Confirmar eliminación';

  @override
  String get navbar1 => 'Calculadora';

  @override
  String get navbar2 => 'Horario de trabajo';

  @override
  String get calculator => 'Calculadora horaria';

  @override
  String get noDate => 'Ninguna fecha seleccionada';

  @override
  String get date => 'fecha';

  @override
  String get chooseDate => 'Seleccione la fecha';

  @override
  String get begin => 'Inicio';

  @override
  String get end => 'Fin';

  @override
  String get format24Hour => 'Formato de 24 horas';

  @override
  String get alert => 'Sugerencia';

  @override
  String get error => 'Error';

  @override
  String get eHandler =>
      'El inicio debe ser anterior al final y el tiempo de pausa no debe ser negativo.';

  @override
  String get hourdiff => 'Diferencia en horas';

  @override
  String get insert => 'Regístrese en';

  @override
  String get cconfirm => 'Confirme';

  @override
  String get question => '¿De verdad quieres borrar esta entrada?';

  @override
  String get noData => 'No hay datos disponibles';

  @override
  String get exportAll => 'todas_horas_trabajo_exportar';

  @override
  String get exportSelected => 'tiempo_trabajo_exportar';

  @override
  String get noSupported => 'no es compatible.';

  @override
  String get exportError => 'Error de exportación';

  @override
  String get chooseExport => '¿Qué quiere exportar?';

  @override
  String get month => 'mes';

  @override
  String get year => 'Año';

  @override
  String get all => 'Todos los datos';

  @override
  String get sumFor => 'Total para';

  @override
  String get monthlyHours => 'Horas mensuales';

  @override
  String get details => 'Detalles';

  @override
  String get fur => 'para';

  @override
  String get breakTime => 'Pausa (por ejemplo, 0,5 durante 30 minutos)';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get startTime => 'Hora de inicio (por ejemplo, 8,5 para las 08:30)';

  @override
  String get endTime =>
      'Hora de finalización (por ejemplo, 17.0 para las 17:00)';

  @override
  String get overlapWarning =>
      'Dieser Zeitraum überschneidet sich mit einem bestehenden Eintrag. Bitte bearbeiten Sie den vorhandenen Eintrag oder wählen Sie eine andere Zeit.';

  @override
  String get exportSuccess => 'Exportieren erfolgreich.';

  @override
  String get exportCurrentMonth => 'Dieser Monat';

  @override
  String get exportSelectedMonth => 'Ausgewählter Monat';

  @override
  String get exportCurrentYear => 'Dieses Jahr';
}
