import 'package:expense_tracker/core/core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TodayBarChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final Color incomeColor;
  final Color expenseColor;
  final double height;

  const TodayBarChart({
    super.key,
    required this.data,
    this.incomeColor = Colors.green,
    this.expenseColor = Colors.red,
    this.height = 250,
  });

  double get _maxValue {
    if (data.isEmpty) return 100;
    double maxIncome = data
        .map((e) => e["income"] as double)
        .reduce((a, b) => a > b ? a : b);
    double maxExpense = data
        .map((e) => e["expense"] as double)
        .reduce((a, b) => a > b ? a : b);
    double max = maxIncome > maxExpense ? maxIncome : maxExpense;
    return max == 0 ? 100 : max;
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            "কোনো ডাটা নেই",
            style: TextStyle(
              color: AppColors.backgroundLight.withValues(alpha: 0.7),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: _maxValue + (_maxValue * 0.3),
          minY: 0,
          groupsSpace: 16,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Colors.black87,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final item = data[groupIndex];
                final isIncome = rodIndex == 0;
                final value = isIncome
                    ? item["income"] as double
                    : item["expense"] as double;
                if (value == 0) return null;
                return BarTooltipItem(
                  "${isIncome ? "Income" : "Expense"}\n৳${value.toStringAsFixed(0)}",
                  TextStyle(
                    color: isIncome ? incomeColor : expenseColor,
                    fontWeight: FontWeight.bold,
                    fontSize: getSp(10),
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 45,
                interval: _maxValue / 2,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "৳${value.toStringAsFixed(0)}",
                    style: TextStyle(
                      color: AppColors.backgroundLight,
                      fontSize: getSp(9),
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= data.length) return const SizedBox();
                  return Padding(
                    padding: EdgeInsets.only(top: getHeight(5)),
                    child: Text(
                      "#${index + 1}",
                      style: const TextStyle(
                        color: AppColors.backgroundLight,
                        fontSize: 10,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: _maxValue / 2,
            getDrawingHorizontalLine: (value) => FlLine(
              color: AppColors.backgroundLight.withValues(alpha: 0.08),
              strokeWidth: 1,
              dashArray: [4, 4],
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: data.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final income = item["income"] as double;
            final expense = item["expense"] as double;

            return BarChartGroupData(
              x: index,
              groupVertically: false,
              barRods: [
                BarChartRodData(
                  toY: income,
                  fromY: 0,
                  color: income > 0 ? incomeColor : Colors.transparent,
                  width: 14,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: _maxValue + (_maxValue * 0.3),
                    fromY: 0,
                    color: incomeColor.withValues(alpha: 0.05),
                  ),
                ),
                BarChartRodData(
                  toY: expense,
                  fromY: 0,
                  color: expense > 0 ? expenseColor : Colors.transparent,
                  width: 14,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getRadius(4)),
                    topRight: Radius.circular(getRadius(4)),
                  ),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: _maxValue + (_maxValue * 0.3),
                    fromY: 0,
                    color: expenseColor.withValues(alpha: 0.05),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
