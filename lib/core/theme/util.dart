import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
  BuildContext context,
  String bodyFontString,
  String displayFontString,
) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(
    bodyFontString,
    baseTextTheme,
  );
  TextTheme displayTextTheme = GoogleFonts.getTextTheme(
    displayFontString,
    baseTextTheme,
  );
  TextTheme textTheme = displayTextTheme.copyWith(
    displayLarge: displayTextTheme.displayLarge?.copyWith(fontSize: 57),
    displayMedium: displayTextTheme.displayMedium?.copyWith(fontSize: 45),
    displaySmall: displayTextTheme.displaySmall?.copyWith(fontSize: 36),
    headlineLarge: displayTextTheme.headlineLarge?.copyWith(fontSize: 32),
    headlineMedium: displayTextTheme.headlineMedium?.copyWith(fontSize: 28),
    headlineSmall: displayTextTheme.headlineSmall?.copyWith(fontSize: 24),
    titleLarge: displayTextTheme.titleLarge?.copyWith(fontSize: 22),
    titleMedium: bodyTextTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: bodyTextTheme.titleSmall?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: bodyTextTheme.bodyLarge?.copyWith(fontSize: 18),
    bodyMedium: bodyTextTheme.bodyMedium?.copyWith(fontSize: 16),
    bodySmall: bodyTextTheme.bodySmall?.copyWith(fontSize: 14),
    labelLarge: bodyTextTheme.labelLarge?.copyWith(fontSize: 16),
    labelMedium: bodyTextTheme.labelMedium?.copyWith(fontSize: 14),
    labelSmall: bodyTextTheme.labelSmall?.copyWith(fontSize: 12),
  );
  return textTheme;
}
