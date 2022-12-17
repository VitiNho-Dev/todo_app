import 'package:flutter/material.dart';

import '../../../../../../theme/app_text_style.dart';

class CardListWidget extends StatelessWidget {
  final String name;
  final String description;
  final void Function()? onTap;
  final void Function()? onPressed;
  const CardListWidget({
    super.key,
    required this.name,
    required this.description,
    required this.onTap,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: AppTextStyle.titleBodyInitialState,
                ),
                InkWell(
                  onTap: onPressed,
                  child: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              description,
              style: AppTextStyle.titleBody,
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'ABRIR',
                style: AppTextStyle.cardTextButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
