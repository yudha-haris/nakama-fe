import 'package:flutter/material.dart';

class IngatkanTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscuredText;
  final int maxLine;
  final Widget? prefixIcon;

  const IngatkanTextField({Key? key, required this.controller, required this.hint, this.obscuredText = false, this.maxLine = 1, this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // TODO(Adeline): Edit Style
          border: Border.all(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: TextField(
        maxLines: maxLine == 99 ? null : maxLine,
        controller: controller,
        obscureText: obscuredText,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hint,
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16)
            // TODO(Adeline): Edit Style
            ),
      ),
    );
  }
}
