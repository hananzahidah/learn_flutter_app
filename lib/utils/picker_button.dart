import 'package:flutter/material.dart';

class PickerButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PickerButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: const Color(0xffF2F7FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
        ),

        onPressed: onPressed,

        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xff0061FF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
