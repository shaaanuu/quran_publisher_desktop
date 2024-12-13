// ignore: dangling_library_doc_comments
/// This class is adapted from system_fonts plugin to suit our needs. https://github.com/Mr-1311/system_fonts/blob/master/lib/system_fonts.dart
/// MIT License
///
/// Copyright (c) 2024 Metin Ur
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in all
/// copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
/// SOFTWARE.

import 'dart:io';
import 'package:path/path.dart' as p;

class SystemFontChecker {
  static final SystemFontChecker _instance = SystemFontChecker._internal();

  factory SystemFontChecker() {
    return _instance;
  }

  SystemFontChecker._internal() {
    _fontDirectories.addAll(_getFontDirectories());
  }

  final List<String> _fontDirectories = [];
  final List<String> _fontPaths = [];
  final Map<String, String> _fontMap = {};

  List<String> _getFontDirectories() {
    if (Platform.isWindows) {
      return [
        '${Platform.environment['windir']}/fonts/',
        '${Platform.environment['USERPROFILE']}/AppData/Local/Microsoft/Windows/Fonts/'
      ];
    }
    if (Platform.isMacOS) {
      return [
        '/Library/Fonts/',
        '/System/Library/Fonts/',
        '${Platform.environment['HOME']}/Library/Fonts/'
      ];
    }
    if (Platform.isLinux) {
      return [
        '/usr/share/fonts/',
        '/usr/local/share/fonts/',
        '${Platform.environment['HOME']}/.local/share/fonts/'
      ];
    }
    return [];
  }

  /// Gets all font file paths from system directories
  List<String> getFontPaths() {
    if (_fontPaths.isEmpty) {
      for (final path in _fontDirectories) {
        if (!Directory(path).existsSync()) continue;

        final fontFiles = Directory(path)
            .listSync()
            .where((element) =>
                element.path.endsWith('.ttf') || element.path.endsWith('.otf'))
            .map((e) => e.path)
            .toList();

        _fontPaths.addAll(fontFiles);
      }
    }
    return _fontPaths;
  }

  /// Gets a map of font names to their file paths
  Map<String, String> getFontMap() {
    if (_fontMap.isEmpty) {
      _fontMap.addAll(Map.fromEntries(getFontPaths()
          .map((e) => MapEntry(p.basenameWithoutExtension(e), e))));
    }
    return _fontMap;
  }

  /// Gets list of all available system font names
  List<String> getAvailableFonts() {
    return getFontMap().keys.toList();
  }

  /// Checks if a specific font is installed
  bool isFontInstalled(String fontName) {
    return getFontMap().containsKey(fontName);
  }

  /// Checks if QCF4 Normal font series is completely installed
  /// Returns a map with details about missing fonts, if any
  Map<String, bool> checkQcf4NormalFonts() {
    Map<String, bool> fontStatus = {};

    // Check all 47 font families
    for (int i = 1; i <= 47; i++) {
      // Format the index with leading zero
      String index = i.toString().padLeft(2, '0');
      String fontName = 'QCF4_Hafs_${index}_W';

      fontStatus[fontName] = isFontInstalled(fontName);
    }

    return fontStatus;
  }

  /// Returns true only if all QCF4 Normal fonts are installed
  bool isQcf4NormalComplete() {
    return checkQcf4NormalFonts().values.every((installed) => installed);
  }

  /// Gets a list of missing QCF4 Normal fonts
  List<String> getMissingQcf4Fonts() {
    final status = checkQcf4NormalFonts();
    return status.entries
        .where((entry) => !entry.value)
        .map((entry) => entry.key)
        .toList();
  }

  /// Adds a custom directory to search for fonts
  void addFontDirectory(String path) {
    if (!Directory(path).existsSync()) return;

    Directory(path)
        .listSync()
        .where((e) => e.path.endsWith('.ttf') || e.path.endsWith('.otf'))
        .forEach((e) {
      _fontMap[p.basenameWithoutExtension(e.path)] = e.path;
    });
  }

  /// Clears cached font information and rescans
  void rescan() {
    _fontMap.clear();
    _fontPaths.clear();
  }
}
