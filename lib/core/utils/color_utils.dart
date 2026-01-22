import 'package:flutter/material.dart';

class ColorUtils {
  static Color parseHex(String? hexString, {Color fallback = Colors.grey}) {
    if (hexString == null || hexString.isEmpty) return fallback;
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return fallback;
    }
  }

  // Fallback icon logic if needed
  static const IconData defaultCategoryIcon = Icons.local_florist;
}
