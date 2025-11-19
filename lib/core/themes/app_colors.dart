import 'package:blank_flutter_project/core/extensions/colors.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // MARK: - Primary Colors
  static final Color primary100 = ColorsExtension.fromHex('#E6F4F5');
  static final Color primary400 = ColorsExtension.fromHex('#4DA8AF');
  static final Color primary500 = ColorsExtension.fromHex('#2D979F');
  static final Color primary600 = ColorsExtension.fromHex('#1A858D');
  static final Color primary700 = ColorsExtension.fromHex('#15737A');
  static final Color primary800 = ColorsExtension.fromHex('#116168');

  // MARK: - Secondary Colors
  static final Color secondary500 = ColorsExtension.fromHex('#FF9800');
  static final Color secondary600 = ColorsExtension.fromHex('#F57C00');
  // MARK: - Neutral Colors
  static final Color neutral100 = ColorsExtension.fromHex('#FFFFFF');
  static final Color neutral300 = ColorsExtension.fromHex('#E0E0E0');
  static final Color neutral400 = ColorsExtension.fromHex('#BDBDBD');
  static final Color neutral600 = ColorsExtension.fromHex('#757575');
  static final Color neutral700 = ColorsExtension.fromHex('#616161');
  static final Color neutral800 = ColorsExtension.fromHex('#424242');
  static final Color neutral900 = ColorsExtension.fromHex('#212121');
  static final Color neutral1000 = ColorsExtension.fromHex('#000000');
  // MARK: - Status Colors
  static final Color green200 = ColorsExtension.fromHex('#4CAF50');
  static final Color red100 = ColorsExtension.fromHex('#F44336');
  static final Color yellow200 = ColorsExtension.fromHex('#FFC107');
  // MARK: - Common
  static final Color background = ColorsExtension.fromHex('#FAFAFA');
  static final Color error = ColorsExtension.fromHex('#F44336');
}
