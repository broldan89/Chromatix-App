import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  TextStyle get displaySmall => GoogleFonts.getFont('Inter',
      color: primaryText, fontWeight: FontWeight.normal, fontSize: 36);
  TextStyle get headlineSmall => GoogleFonts.getFont('Inter',
      color: primaryText, fontWeight: FontWeight.w500, fontSize: 24);
  TextStyle get titleLarge => GoogleFonts.getFont('Inter',
      color: primaryText, fontWeight: FontWeight.bold, fontSize: 22);
  TextStyle get titleMedium => GoogleFonts.getFont('Inter',
      color: primaryText, fontWeight: FontWeight.w500, fontSize: 18);
  TextStyle get titleSmall => GoogleFonts.getFont('Inter',
      color: primaryText, fontWeight: FontWeight.w500, fontSize: 16);
  TextStyle get bodyMedium => GoogleFonts.getFont('Inter',
      color: primaryText, fontWeight: FontWeight.normal, fontSize: 14);
  TextStyle get bodySmall => GoogleFonts.getFont('Inter',
      color: secondaryText, fontWeight: FontWeight.normal, fontSize: 12);
}

class LightModeTheme extends FlutterFlowTheme {
  LightModeTheme() {
    primaryColor = const Color(0xFF4B39EF);
    secondaryColor = const Color(0xFF39D2C0);
    tertiaryColor = const Color(0xFFEE8B60);
    alternate = const Color(0xFFFF5963);
    primaryBackground = const Color(0xFFF1F4F8);
    secondaryBackground = const Color(0xFFFFFFFF);
    primaryText = const Color(0xFF101213);
    secondaryText = const Color(0xFF57636C);
  }
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    double? letterSpacing, // <--- ESTO SOLUCIONA EL ERROR
    List<Shadow>? shadows, // <--- ESTO SOLUCIONA EL ERROR
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily ?? 'Inter',
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              letterSpacing: letterSpacing,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              letterSpacing: letterSpacing,
              shadows: shadows,
            );
}
