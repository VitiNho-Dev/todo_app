import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:flutter/material.dart';
import 'package:app_todo/app/modules/add_items/presenter/page_todo/controller/check_controller.dart';
import 'package:app_todo/app/theme/app_colors.dart';
import 'package:app_todo/app/theme/app_text_style.dart';

class CustomListItems extends StatelessWidget {
  final List<ItemEntity> ictemCount;
  final String title;
  final bool check;
  final void Function()? onTap;

  const CustomListItems({
    Key? key,
    required this.ictemCount,
    required this.title,
    required this.check,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CheckController(false);
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyle.textBody,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: controller,
                builder: (context, value, child) {
                  value = check;
                  return GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: value
                          ? const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                            )
                          : BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.borderColor,
                              ),
                            ),
                      child: value
                          ? const Icon(
                              Icons.check,
                              color: AppColors.appBarTextColor,
                            )
                          : null,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Divider(),
      ],
    );
  }
}
