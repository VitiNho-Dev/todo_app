import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/item_module/presenter/item_presenter/page_items/widgets/custom_text_button_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import 'custom_text_field.dart';

class CustomShowBottomSheetWidget extends StatelessWidget {
  final String text;
  final void Function() addItem;
  final TextEditingController controllerName;
  final TextEditingController? controllerDescription;
  final String? hintTextName;
  final String? hintTextDescription;
  final bool visible;

  const CustomShowBottomSheetWidget({
    Key? key,
    required this.text,
    required this.addItem,
    required this.controllerName,
    this.controllerDescription,
    this.hintTextName,
    this.hintTextDescription,
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTextStyle.titleBody,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: controllerName,
            hintText: hintTextName,
          ),
          Visibility(
            visible: visible,
            child: CustomTextField(
              controller: controllerDescription,
              hintText: hintTextDescription,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWidget(
                onTap: () {
                  Modular.to.pop();
                  controllerName.clear();
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
