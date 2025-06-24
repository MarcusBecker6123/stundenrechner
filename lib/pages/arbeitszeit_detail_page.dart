import 'package:flutter/material.dart';
import 'database_helper.dart';


class ArbeitszeitDetailPage extends StatefulWidget {
  final Map<String, dynamic> entry;
  final Function(Map<String, dynamic>)? onSave;

  const ArbeitszeitDetailPage({required this.entry, this.onSave, Key? key})
    : super(key: key);

  @override
  State<ArbeitszeitDetailPage> createState() => _ArbeitszeitDetailPageState();
}

class _ArbeitszeitDetailPageState extends State<ArbeitszeitDetailPage> {
  late TextEditingController startController;
  late TextEditingController endController;
  late TextEditingController breakController;

  @override
  void initState() {
    super.initState();
    startController = TextEditingController(
      text: widget.entry['start_time']?.toString() ?? '',
    );
    endController = TextEditingController(
      text: widget.entry['end_time']?.toString() ?? '',
    );
    breakController = TextEditingController(
      text: widget.entry['break_time']?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();
    breakController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details für ${widget.entry['date']}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: startController,
              decoration: InputDecoration(
                labelText: 'Startzeit (z.B. 8.5 für 08:30)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: endController,
              decoration: InputDecoration(
                labelText: 'Endzeit (z.B. 17.0 für 17:00)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: breakController,
              decoration: InputDecoration(
                labelText: 'Pause in Stunden (z.B. 0.5 für 30min)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updatedEntry = Map<String, dynamic>.from(widget.entry);
                updatedEntry['start_time'] =
                    double.tryParse(startController.text) ?? 0.0;
                updatedEntry['end_time'] =
                    double.tryParse(endController.text) ?? 0.0;
                updatedEntry['break_time'] =
                    double.tryParse(breakController.text) ?? 0.0;

                // Always use 0.0 if break_time is null
                final breakTime = updatedEntry['break_time'] ?? 0.0;
                updatedEntry['working_time'] = (updatedEntry['end_time'] - updatedEntry['start_time']) - breakTime;

                await DatabaseHelper.instance.updateWorkTime(updatedEntry);

                Navigator.pop(context, updatedEntry);
              },
              child: const Text('Speichern'),
            ),
          ],
        ),
      ),
    );
  }
}
