import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/item_module/presenter/item_presenter/page_items/widgets/custom_text_button_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomShowBottomSheetWidget extends StatelessWidget {
  final String text;
  final void Function() addItem;
  final TextEditingController controller;

  const CustomShowBottomSheetWidget({
    Key? key,
    required this.text,
    required this.addItem,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWidget(
                onTap: () {
                  Modular.to.pop();
                  controller.clear();
                },
                title: 'Cancelar',
                style: AppTextStyle.textButton2,
                border: Border.all(
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(width: 22),
              CustomButtonWidget(
                onTap: addItem,
                title: 'Adcionar',
                style: AppTextStyle.textButton,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
