import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const CustomTextField({
    Key key,
    this.hint,
    this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        // height: 600,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(hintText: hint),
          ),
        ),
      ),
    );
  }
}
