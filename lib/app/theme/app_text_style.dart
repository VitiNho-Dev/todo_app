import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static final textAppBar = GoogleFonts.ubuntu(
    color: AppColors.appBarTextColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final nameTextAppBar = GoogleFonts.ubuntu(
    color: AppColors.appBarTextColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final textAppBar2 = GoogleFonts.ubuntu(
    color: AppColors.appBarTextColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final titleBodyInitialState = GoogleFonts.ubuntu(
    color: AppColors.textColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final titleBody = GoogleFonts.ubuntu(
    color: AppColors.textColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final textBody = GoogleFonts.ubuntu(
    color: AppColors.textColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final textButton = GoogleFonts.ubuntu(
    color: AppColors.appBarTextColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final textButton2 = GoogleFonts.ubuntu(
    color: AppColors.textColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final cardTextButton = GoogleFonts.ubuntu(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // TODO: finalizar o estilo do hintText
  static final hintText = GoogleFonts.ubuntu(
    color: AppColors.textColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}
