import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTypography {
  static TextStyle _ubuntu({
    FontWeight? fontWeight,
    double? fontSize,
    double? letterSpacing,
    double? height,
    Color? color,
  }) => GoogleFonts.ubuntu(
    fontWeight: fontWeight,
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    height: height,
    color: color,
  ).copyWith(
    fontFeatures: const <FontFeature>[
      FontFeature.enable('lnum'),
      FontFeature.enable('pnum'),
      FontFeature.disable('liga'),
    ],
  );


  // Light styles (300)
  static TextStyle get font8Light => _ubuntu(fontSize: 8, fontWeight: FontWeight.w300);
  static TextStyle get font10Light => _ubuntu(fontSize: 10, fontWeight: FontWeight.w300);
  static TextStyle get font12Light => _ubuntu(fontSize: 12, fontWeight: FontWeight.w300);
  static TextStyle get font14Light => _ubuntu(fontSize: 14, fontWeight: FontWeight.w300);
  static TextStyle get font16Light => _ubuntu(fontSize: 16, fontWeight: FontWeight.w300);
  static TextStyle get font18Light => _ubuntu(fontSize: 18, fontWeight: FontWeight.w300);
  static TextStyle get font20Light => _ubuntu(fontSize: 20, fontWeight: FontWeight.w300);
  static TextStyle get font22Light => _ubuntu(fontSize: 22, fontWeight: FontWeight.w300);
  static TextStyle get font24Light => _ubuntu(fontSize: 24, fontWeight: FontWeight.w300);
  static TextStyle get font26Light => _ubuntu(fontSize: 26, fontWeight: FontWeight.w300);
  static TextStyle get font28Light => _ubuntu(fontSize: 28, fontWeight: FontWeight.w300);
  static TextStyle get font30Light => _ubuntu(fontSize: 30, fontWeight: FontWeight.w300);
  static TextStyle get font32Light => _ubuntu(fontSize: 32, fontWeight: FontWeight.w300);


  // Regular styles
  static TextStyle get font8Regular => _ubuntu(fontSize: 8);
  static TextStyle get font10Regular => _ubuntu(fontSize: 10);
  static TextStyle get font12Regular => _ubuntu(fontSize: 12);
  static TextStyle get font14Regular => _ubuntu(fontSize: 14);
  static TextStyle get font16Regular => _ubuntu(fontSize: 16);
  static TextStyle get font18Regular => _ubuntu(fontSize: 18);
  static TextStyle get font20Regular => _ubuntu(fontSize: 20);
  static TextStyle get font22Regular => _ubuntu(fontSize: 22);
  static TextStyle get font24Regular => _ubuntu(fontSize: 24);
  static TextStyle get font26Regular => _ubuntu(fontSize: 26);
  static TextStyle get font28Regular => _ubuntu(fontSize: 28);
  static TextStyle get font30Regular => _ubuntu(fontSize: 30);
  static TextStyle get font32Regular => _ubuntu(fontSize: 32);

  // Medium styles
  static TextStyle get font8Medium => _ubuntu(fontSize: 8, fontWeight: FontWeight.w500);
  static TextStyle get font10Medium => _ubuntu(fontSize: 10, fontWeight: FontWeight.w500);
  static TextStyle get font12Medium => _ubuntu(fontSize: 12, fontWeight: FontWeight.w500);
  static TextStyle get font14Medium => _ubuntu(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle get font16Medium => _ubuntu(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle get font18Medium => _ubuntu(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle get font20Medium => _ubuntu(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle get font22Medium => _ubuntu(fontSize: 22, fontWeight: FontWeight.w500);
  static TextStyle get font24Medium => _ubuntu(fontSize: 24, fontWeight: FontWeight.w500);
  static TextStyle get font26Medium => _ubuntu(fontSize: 26, fontWeight: FontWeight.w500);
  static TextStyle get font28Medium => _ubuntu(fontSize: 28, fontWeight: FontWeight.w500);
  static TextStyle get font30Medium => _ubuntu(fontSize: 30, fontWeight: FontWeight.w500);
  static TextStyle get font32Medium => _ubuntu(fontSize: 32, fontWeight: FontWeight.w500);

  // Bold styles
  static TextStyle get font8Bold => _ubuntu(fontSize: 8, fontWeight: FontWeight.w700);
  static TextStyle get font10Bold => _ubuntu(fontSize: 10, fontWeight: FontWeight.w700);
  static TextStyle get font12Bold => _ubuntu(fontSize: 12, fontWeight: FontWeight.w700);
  static TextStyle get font14Bold => _ubuntu(fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle get font16Bold => _ubuntu(fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle get font18Bold => _ubuntu(fontSize: 18, fontWeight: FontWeight.w700);
  static TextStyle get font20Bold => _ubuntu(fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle get font22Bold => _ubuntu(fontSize: 22, fontWeight: FontWeight.w700);
  static TextStyle get font24Bold => _ubuntu(fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle get font26Bold => _ubuntu(fontSize: 26, fontWeight: FontWeight.w700);
  static TextStyle get font28Bold => _ubuntu(fontSize: 28, fontWeight: FontWeight.w700);
  static TextStyle get font30Bold => _ubuntu(fontSize: 30, fontWeight: FontWeight.w700);
  static TextStyle get font32Bold => _ubuntu(fontSize: 32, fontWeight: FontWeight.w700);

  // Часто используемые текстовые стили
  static TextStyle get textTitle => _ubuntu(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.33, // 32/24
    letterSpacing: 0,
  );

  static TextStyle get textSubtitle => _ubuntu(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.5, // 27/18
  );

  static TextStyle get textBody => _ubuntu(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5, // 24/16
  );

  static TextStyle get textCaption => _ubuntu(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.33, // 16/12
  );
}

extension UbuntuWeights on TextStyle {
  TextStyle get ubuntuLight => copyWith(fontWeight: FontWeight.w300);
  TextStyle get ubuntuRegular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get ubuntuMedium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get ubuntuSemiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get ubuntuBold => copyWith(fontWeight: FontWeight.w700);
}