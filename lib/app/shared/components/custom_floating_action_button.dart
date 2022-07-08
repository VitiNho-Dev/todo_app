import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function()? onPressed;

  const CustomFloatingActionButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        child: const Icon(Icons.add),
      ),
      onPressed: onPressed,
    );
  }
}
