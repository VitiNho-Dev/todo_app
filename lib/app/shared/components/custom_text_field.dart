import 'package:flutter/material.dart';

import '../../theme/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.hintText,
      ),
    );
  }
}
