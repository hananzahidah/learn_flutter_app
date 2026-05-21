import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  final String title;
  final String value;
  final bool showDivider;

  const SummaryItem({
    super.key,
    required this.title,
    required this.value,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Text(value)],
        ),

        if (showDivider) Divider(color: Color(0xffEDEEF1)),
      ],
    );
  }
}
