// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Formats date to (e.g., "Jan 15, 2023" in English or "١٥ يناير ٢٠٢٣" in Arabic)
  String formatDate([String? locale]) =>
      DateFormat('MMM d, y', locale ?? 'en').format(this);

  /// Formats time to (e.g., "3:45 PM" in English or "٣:٤٥ م" in Arabic)
  String formatTime([String? locale]) =>
      DateFormat('h:mm a', locale ?? 'en').format(this);
}
