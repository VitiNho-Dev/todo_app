import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Color? color;
  final BoxBorder? border;
  final TextStyle? style;

  const CustomButtonWidget({
    Key? key,
    this.onTap,
    required this.title,
    this.color,
    this.border,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.height * 0.16,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          border: border,
        ),
        child: Center(
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
