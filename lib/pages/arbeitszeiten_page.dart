import 'package:flutter/material.dart';
import 'package:stundenrechner/l10n/app_localizations.dart';
import 'package:stundenrechner/pages/database_helper.dart';
import 'arbeitszeit_detail_page.dart';

class ArbeitszeitenPage extends StatefulWidget {
  @override
  State<ArbeitszeitenPage> createState() => _ArbeitszeitenPageState();
}

class _ArbeitszeitenPageState extends State<ArbeitszeitenPage> {
  String? selectedMonth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(199, 65, 119, 200),
        title: Center(
          child: Text(
            AppLocalizations.of(context)?.appTitle ?? 'Working hours',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper.instance.getAllWorkTimes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          final data = snapshot.data!;

          // Extract unique months from data
          final months =
              data
                  .map(
                    (entry) => entry['date'].toString().substring(3, 10),
                  ) // "MM.YYYY"
                  .toSet()
                  .toList()
                ..sort((a, b) => b.compareTo(a)); // descending

          // Set default month to current if not set
          final now = DateTime.now();
          final currentMonth =
              '${now.month.toString().padLeft(2, '0')}.${now.year}';
          selectedMonth ??= months.contains(currentMonth)
              ? currentMonth
              : (months.isNotEmpty ? months.first : null);

          // Filter data by selected month
          final filtered = selectedMonth == null
              ? []
              : data
                    .where(
                      (entry) =>
                          entry['date'].toString().substring(3, 10) ==
                          selectedMonth,
                    )
                    .toList();

          // Sort filtered by date ascending
          filtered.sort((a, b) {
            final dateA = _parseDate(a['date']);
            final dateB = _parseDate(b['date']);
            return dateA.compareTo(dateB);
          });

          // Calculate total working time for the month
          final totalWorkingTime = filtered.fold<double>(
            0.0,
            (sum, entry) => sum + (entry['working_time'] ?? 0.0),
          );

          return Column(
            children: [
              if (months.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: selectedMonth,
                    items: months
                        .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedMonth = val;
                      });
                    },
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final entry = filtered[index];
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${entry['date']}'),
                          Text(
                            '${(entry['working_time'] ?? 0.0).toStringAsFixed(2)} ${AppLocalizations.of(context)?.hours ?? 'Hours'}',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              final updatedEntry = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ArbeitszeitDetailPage(entry: entry),
                                ),
                              );
                              if (updatedEntry != null) {
                                setState(() {});
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    AppLocalizations.of(context)?.confirm ??
                                        'Confirm Deletion',
                                  ),
                                  content: Text(
                                    AppLocalizations.of(context)?.question ??
                                        'Are you sure you want to delete this entry?',
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        AppLocalizations.of(context)?.cancel ??
                                            'Cancel',
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                    ),
                                    TextButton(
                                      child: Text(
                                        AppLocalizations.of(context)?.delete ??
                                            'Delete',
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                    ),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                await DatabaseHelper.instance.deleteWorkTime(
                                  entry['id'],
                                );
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            AppLocalizations.of(context)?.sumFor ??
                            'Sum for' + ' $selectedMonth:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black, // or your default color
                        ),
                      ),
                      TextSpan(
                        text: '${totalWorkingTime.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green, // Only the number is green
                        ),
                      ),
                      TextSpan(
                        text:
                            ' ${AppLocalizations.of(context)?.hours ?? 'Hours'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black, // or your default color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Helper function to parse "dd.MM.yyyy"
  DateTime _parseDate(String dateStr) {
    final parts = dateStr.split('.');
    return DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );
  }
}
