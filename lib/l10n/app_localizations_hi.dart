// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'कार्य समय';

  @override
  String get greeting => 'नमस्ते!';

  @override
  String get export => 'निर्यात करें';

  @override
  String get delete => 'हटाएं';

  @override
  String get edit => 'संपादित करें';

  @override
  String get hours => 'घंटे';

  @override
  String get confirm => 'हटाने की पुष्टि करें';

  @override
  String get navbar1 => 'कैलकुलेटर';

  @override
  String get navbar2 => 'कार्य समय';

  @override
  String get calculator => 'घंटा कैलकुलेटर';

  @override
  String get noDate => 'कोई तिथि चयनित नहीं';

  @override
  String get date => 'तिथि';

  @override
  String get chooseDate => 'तिथि चुनें';

  @override
  String get begin => 'प्रारंभ';

  @override
  String get end => 'समाप्त';

  @override
  String get format24Hour => '24-घंटे प्रारूप';

  @override
  String get alert => 'सूचना';

  @override
  String get error => 'त्रुटि';

  @override
  String get eHandler =>
      'प्रारंभ अंत से पहले होना चाहिए और ब्रेक समय नकारात्मक नहीं हो सकता।';

  @override
  String get hourdiff => 'घंटों का अंतर';

  @override
  String get insert => 'जोड़ें';

  @override
  String get cconfirm => 'पुष्टि करें';

  @override
  String get question => 'क्या आप वाकई इस प्रविष्टि को हटाना चाहते हैं?';

  @override
  String get noData => 'निर्यात करने के लिए कोई डेटा नहीं।';

  @override
  String get exportAll => 'kaaryasamay_niryaat_sabhi';

  @override
  String get exportSelected => 'kaaryasamay_niryaat_';

  @override
  String get noSupported => 'प्लेटफ़ॉर्म समर्थित नहीं है।';

  @override
  String get exportError => 'डेटा निर्यात करने में त्रुटि।';

  @override
  String get chooseExport => 'आप क्या निर्यात करना चाहते हैं?';

  @override
  String get month => 'केवल चयनित माह';

  @override
  String get year => 'पूरा वर्ष';

  @override
  String get all => 'सभी डेटा';

  @override
  String get sumFor => 'के लिए योग';

  @override
  String get monthlyHours => 'मासिक घंटे';

  @override
  String get details => 'विवरण';

  @override
  String get fur => 'के लिए';

  @override
  String get breakTime => 'ब्रेक समय';

  @override
  String get save => 'सहेजें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get startTime => 'Start time (e.g. 8.5 for 08:30)';

  @override
  String get endTime => 'End time (e.g. 17.0 for 17:00)';

  @override
  String get overlapWarning =>
      'This time overlaps with an existing entry. Please edit the existing entry or choose another time.';
}
