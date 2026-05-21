import 'package:flutter/material.dart';

class OutputPicker extends StatelessWidget {
  final Widget child;

  const OutputPicker({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
