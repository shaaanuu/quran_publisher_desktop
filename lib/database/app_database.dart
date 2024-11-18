import 'package:drift/drift.dart';

import 'db_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  HafsSuraItems,
  HafsWordItems,
  SurahItems,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.queryExecutor);

  @override
  int get schemaVersion => 1;

  /// Get list of surah
  Future<List<SurahItem>> getAllSurah() => select(surahItems).get();

  Future<int?> getTotalAyatInSurah(int surahNumber) async {
    final surahItem = await (select(surahItems)
          ..where((tbl) => tbl.surahNo.equals(surahNumber)))
        .getSingleOrNull();

    return surahItem?.bilanganAyat;
  }

  Future<(List<int> codePoints, String fontName)> getCodePointsForAyat({
    required int surahNumber,
    required int ayatNumber,
  }) async {
    final rows = await (select(hafsWordItems)
          ..where((tbl) =>
              tbl.surah.equals(surahNumber) & tbl.verse.equals(ayatNumber)))
        .get();

    final codePoints = <int>[];

    for (final row in rows) {
      codePoints.add(row.fontCode);
    }

    return (codePoints, rows.first.fontName);
  }

  Future<List<ManuscriptString>> getManuscriptString({
    required int surahStart,
    required int ayatStart,
    int? surahEnd,
    int? ayatEnd,
  }) async {
    // Validate input parameters
    if (surahStart < 1 || ayatStart < 1) {
      throw ArgumentError('Surah and Ayat numbers must be positive');
    }

    // If end parameters are not provided, set them equal to start parameters
    surahEnd ??= surahStart;
    ayatEnd ??= ayatStart;

    // Validate range
    if (surahEnd < surahStart ||
        (surahEnd == surahStart && ayatEnd < ayatStart)) {
      throw ArgumentError('End range cannot be before start range');
    }

    // Query using Drift
    final rows = await (select(hafsWordItems)
          ..where((tbl) {
            if (surahEnd == null || ayatEnd == null) {
              return (tbl.surah.isBiggerOrEqualValue(surahStart) &
                  tbl.verse.isBiggerOrEqualValue(ayatStart));
            }
            return ((tbl.surah.isBiggerOrEqualValue(surahStart) &
                    tbl.verse.isBiggerOrEqualValue(ayatStart))) &
                ((tbl.surah.isSmallerOrEqualValue(surahEnd) &
                    tbl.verse.isSmallerOrEqualValue(ayatEnd)));
          })
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.surah),
            (tbl) => OrderingTerm(expression: tbl.verse),
            (tbl) => OrderingTerm(expression: tbl.wordNum),
          ]))
        .get();

    String currentKey = '';
    String currentFontName = '';
    List<int> fontCodePoints = [];
    Map<String, ManuscriptString> result = {};

    for (var row in rows) {
      // Create key in format "surah:verse"
      String key = '${row.surah}:${row.verse}';

      // If we've moved to a new verse, save the previous one
      if (currentKey != '' && currentKey != key) {
        result[currentKey] = ManuscriptString(
          text: String.fromCharCodes(fontCodePoints),
          fontName: currentFontName,
        );
        fontCodePoints.clear();
      }

      // Update current key and font name
      currentKey = key;
      currentFontName = row.fontName;

      // Skip Surah name (Type 5)
      if (row.type != 5) {
        // Add space between words, except for first word
        // if (fontCodePoints.isNotEmpty) {
        //   fontCodePoints.add(32); // Add space character
        // }
        // Add FontCode to the list of code points
        fontCodePoints.add(row.fontCode);
      }
    }

    // Don't forget to add the last verse
    if (currentKey != '') {
      result[currentKey] = ManuscriptString(
        text: String.fromCharCodes(fontCodePoints),
        fontName: currentFontName,
      );
    }

    return result.values.toList();
  }
}

class ManuscriptString {
  String text;
  String fontName;

  ManuscriptString({required this.text, required this.fontName});
}
