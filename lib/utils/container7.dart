import 'package:flutter/material.dart';

class Container7 extends StatelessWidget {
  final Widget child;

  final Key? sectionKey;

  final bool? isResult;

  const Container7({
    super.key,
    required this.child,
    this.sectionKey,
    this.isResult,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isResult == null ? Colors.white : Color(0xffF2F7FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: Color(0xffEDEEF1)),
      ),
      child: child,
    );
  }
}
