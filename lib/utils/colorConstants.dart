import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static final searchContainerColor = Color(0xFFeff2f7);

  static final shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-0.5, -0.5),
    end: Alignment(0.5, 0.5),
    tileMode: TileMode.clamp,
  );
}
