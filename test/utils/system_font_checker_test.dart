// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:quran_publisher_desktop/utils/system_font_checker.dart';

void main() {
  /// These tests intended to debug the function in Dart environment. It is not really a
  /// Unit test, because the result may very from systems to systems
  group('SystemFontChecker tests', () {
    test('Check Font Installed in System', () async {
      final result = SystemFontChecker().getAvailableFonts();
      print(result);
      expect(result, isNotEmpty);
    });

    test('Check QCF4 Fonts', () async {
      final result = SystemFontChecker().checkQcf4NormalFonts();
      print(result);
      expect(result, isNotEmpty);
      final exist = result.entries.where((e) => e.value).length;
      final notExist = result.entries.where((e) => !e.value).length;
      print('Exist: $exist, Not Exist: $notExist');
    });
  });
}
