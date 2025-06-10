import 'package:flutter/material.dart';
import 'package:stundenrechner/pages/arbeitszeiten_page.dart';
import 'database_helper.dart';

class StundenRechner extends StatefulWidget {
  const StundenRechner({super.key});

  @override
  State<StundenRechner> createState() => _StundenRechnerState();
}

class _StundenRechnerState extends State<StundenRechner> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    StundenRechnerForm(),
    ArbeitszeitenPage(), // You need to create this page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Rechner',
            backgroundColor: Color.fromARGB(199, 65, 119, 200),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Arbeitszeiten',
            backgroundColor: Color.fromARGB(199, 65, 119, 200),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color.fromARGB(
          199,
          65,
          119,
          200,
        ), // <-- selected icon color
        unselectedItemColor: Colors.grey, // <-- unselected icon color
      ),
    );
  }
}

// Move your previous build code into a new widget:
class StundenRechnerForm extends StatefulWidget {
  @override
  State<StundenRechnerForm> createState() => _StundenRechnerFormState();
}

class _StundenRechnerFormState extends State<StundenRechnerForm> {
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  DateTime? _selectedDate;
  TimeOfDay? _breakStartTime; // NEW
  TimeOfDay? _breakEndTime; // NEW
  bool _use24HourFormat = true; // NEW

  // NEW: Last difference value
  double? _lastDifferenz;

  // Helper to format TimeOfDay
  String _formatTime(TimeOfDay? time) {
    if (time == null) return '--:--';
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  double _timeOfDayToDouble(TimeOfDay time) => time.hour + time.minute / 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(199, 65, 119, 200),
        title: Center(
          child: Text(
            'Stunden Rechner',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Date picker button
              Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Kein Datum gewählt'
                        : 'Datum: ${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}',
                  ),
                  const SizedBox(width: 24),
                  ElevatedButton(
                    onPressed: () async {
                      final locale = Localizations.localeOf(context);
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        locale:
                            locale, // <-- This line sets the calendar language
                      );
                      if (picked != null) {
                        setState(() {
                          _selectedDate = picked;
                        });
                      }
                    },
                    child: const Text('Datum wählen', style: TextStyle(color: Color.fromARGB(199, 65, 119, 200)),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Replace the two ListTiles for start and end time with this one:
              ListTile(
                leading: Icon(Icons.access_time),
                title: Row(
                  children: [
                    Text('Beginn: ${_formatTime(_startTime)}'),
                    const SizedBox(width: 24),
                    Text('Ende: ${_formatTime(_endTime)}'),
                  ],
                ),
                onTap: () async {
                  // Pick start time
                  final pickedStart = await showTimePicker(
                    context: context,
                    initialTime:
                        _startTime ??
                        TimeOfDay(hour: TimeOfDay.now().hour, minute: 0),
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(
                          context,
                        ).copyWith(alwaysUse24HourFormat: _use24HourFormat),
                        child: child!,
                      );
                    },
                  );
                  if (pickedStart != null) {
                    setState(() {
                      _startTime = pickedStart;
                    });
                  }

                  // Pick end time
                  final pickedEnd = await showTimePicker(
                    context: context,
                    initialTime:
                        _endTime ??
                        TimeOfDay(hour: TimeOfDay.now().hour, minute: 0),
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(
                          context,
                        ).copyWith(alwaysUse24HourFormat: _use24HourFormat),
                        child: child!,
                      );
                    },
                  );
                  if (pickedEnd != null) {
                    setState(() {
                      _endTime = pickedEnd;
                    });
                  }
                },
              ),
              // NEW: Break start and end in one ListTile
              ListTile(
                leading: Icon(Icons.free_breakfast),
                title: Row(
                  children: [
                    Text('Beginn: ${_formatTime(_breakStartTime)}'),
                    const SizedBox(width: 24),
                    Text('Ende: ${_formatTime(_breakEndTime)}'),
                  ],
                ),
                onTap: () async {
                  // Show dialog to pick both break start and end times
                  final breakStart = await showTimePicker(
                    context: context,
                    initialTime:
                        _breakStartTime ?? TimeOfDay(hour: 12, minute: 0),
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(
                          context,
                        ).copyWith(alwaysUse24HourFormat: _use24HourFormat),
                        child: child!,
                      );
                    },
                  );
                  if (breakStart != null) {
                    setState(() {
                      _breakStartTime = breakStart;
                    });
                  }
                  final breakEnd = await showTimePicker(
                    context: context,
                    initialTime:
                        _breakEndTime ?? TimeOfDay(hour: 12, minute: 45),
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(
                          context,
                        ).copyWith(alwaysUse24HourFormat: _use24HourFormat),
                        child: child!,
                      );
                    },
                  );
                  if (breakEnd != null) {
                    setState(() {
                      _breakEndTime = breakEnd;
                    });
                  }
                },
              ),
              const SizedBox(height: 35),
              // NEW: 24-hour format switch
              Row(
                children: [
                  const Text('24-Stunden-Format'),
                  Switch(
                    activeColor: Colors.white,
                    activeTrackColor: const Color.fromARGB(121, 65, 119, 200),
,
                    value: _use24HourFormat,
                    onChanged: (val) {
                      setState(() {
                        _use24HourFormat = val;
                      });
                    },
                    ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  if (_startTime == null ||
                      _endTime == null ||
                      _selectedDate == null)
                    return;
                  final start = _timeOfDayToDouble(_startTime!);
                  final end = _timeOfDayToDouble(_endTime!);

                  double breakDuration = 0.0;
                  if (_breakStartTime != null && _breakEndTime != null) {
                    breakDuration =
                        _timeOfDayToDouble(_breakEndTime!) -
                        _timeOfDayToDouble(_breakStartTime!);
                    if (breakDuration < 0) breakDuration = 0.0;
                  }

                  final differenz = (end - start) - breakDuration;
                  final dateString =
                      '${_selectedDate!.day.toString().padLeft(2, '0')}.${_selectedDate!.month.toString().padLeft(2, '0')}.${_selectedDate!.year}';

                  await DatabaseHelper.instance.insertWorkTime(
                    dateString,
                    start,
                    end,
                    breakDuration, // <-- break time
                    differenz, // <-- working time
                  );
                  print('Stunden Differenz: $differenz');
                },
                child: const Text('Eintragen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final labels = {
  'en': {'calculator': 'Calculator', 'working_times': 'Working Times'},
  'de': {'calculator': 'Rechner', 'working_times': 'Arbeitszeiten'},
};

String? getLabel(BuildContext context, String key) {
  final locale = Localizations.localeOf(context).languageCode;
  return labels[locale]?[key] ?? labels['en']![key];
}
