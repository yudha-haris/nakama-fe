import 'package:flutter/material.dart';

class IngatkanButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final VoidCallback onPressed;
  const IngatkanButton(
      {Key? key,
      required this.label,
      this.isLoading = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isLoading) {
          onPressed.call();
        }
      },
      child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 4.0,
                  ))
              : Text(label)),
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    );
  }
}
