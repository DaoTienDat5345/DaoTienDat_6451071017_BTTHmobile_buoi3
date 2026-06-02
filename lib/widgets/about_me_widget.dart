// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AboutMeWidget extends StatelessWidget {
  final TextEditingController controller;
  const AboutMeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      controller: controller,
      minLines: 3,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: "Write something about you",
        border: OutlineInputBorder(),
      ),
    );
  }
}
