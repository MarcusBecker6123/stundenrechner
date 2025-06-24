import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stundenrechner/l10n/app_localizations.dart';

class StatistikPage extends StatelessWidget {
  final List<Map<String, dynamic>> monthlyHours;

  const StatistikPage({super.key, required this.monthlyHours});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.monthlyHours)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: monthlyHours.isEmpty
            ? Center(
                child: Text(
                  AppLocalizations.of(context)?.noData ?? 'No Data Available',
                ),
              )
            : BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY:
                      monthlyHours
                          .map((e) => (e['hours'] as num).toDouble())
                          .reduce((a, b) => a > b ? a : b) +
                      10,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 45,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= monthlyHours.length) {
                            return const SizedBox();
                          }
                          return Text(monthlyHours[index]['month']);
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(monthlyHours.length, (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: (monthlyHours[index]['hours'] as num).toDouble(),
                          color: Colors.blue,
                          width: 50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }),
                ),
              ),
      ),
    );
  }
}
