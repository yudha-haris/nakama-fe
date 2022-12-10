import 'package:flutter/material.dart';

class IngatkanTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscuredText;

  const IngatkanTextField({Key? key, required this.controller, required this.hint, this.obscuredText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // TODO(Adeline): Edit Style
          border: Border.all(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(10)
      ),
      height: 50,
      width: double.infinity,
      child: TextField(
        controller: controller,
        obscureText: obscuredText,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 16, right: 16)
            // TODO(Adeline): Edit Style
        ),
      ),
    );
  }
}