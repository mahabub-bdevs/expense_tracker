import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size_class.dart';
import '../../../core/widgets/custom_text.dart';

class TableInfoCard extends StatelessWidget {
  final List<Map<String, String>> rows;
  final Color borderColor;

  const TableInfoCard({
    super.key,
    required this.rows,
    this.borderColor = AppColors.warningDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getRadius(10)),
        border: Border.all(color: borderColor, width: 1),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: List.generate(rows.length, (index) {
          final isLast = index == rows.length - 1;
          return _TableRow(
            name: rows[index]['name'] ?? '',
            value: rows[index]['value'] ?? '',
            showDivider: !isLast,
            isEven: index.isEven,
            borderColor: borderColor,
          );
        }),
      ),
    );
  }
}

class _TableRow extends StatelessWidget {
  final String name;
  final String value;
  final bool showDivider;
  final bool isEven;
  final Color borderColor;

  const _TableRow({
    required this.name,
    required this.value,
    required this.showDivider,
    required this.isEven,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Label column
              Container(
                width: getWidth(110),
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(10),
                  vertical: getHeight(9),
                ),
                color: isEven
                    ? borderColor.withValues(alpha: 0.8)
                    : Colors.transparent,
                child: CustomText(
                  text: name,

                  fontSize: getSp(12),
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Vertical divider
              Container(width: 0.5, color: borderColor.withValues(alpha: 0.5)),
              // Value column
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(10),
                    vertical: getHeight(9),
                  ),
                  color: isEven
                      ? borderColor.withValues(alpha: 0.5)
                      : Colors.transparent,
                  child: CustomText(text: value, fontSize: getSp(12)),
                ),
              ),
            ],
          ),
        ),
        // Horizontal divider
        if (showDivider)
          Divider(
            height: 0.5,
            thickness: 0.5,
            color: borderColor.withValues(alpha: 0.3),
          ),
      ],
    );
  }
}
