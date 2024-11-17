// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HafsSuraItemsTable extends HafsSuraItems
    with TableInfo<$HafsSuraItemsTable, HafsSuraItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HafsSuraItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'ID', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'Name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _placeMeta = const VerificationMeta('place');
  @override
  late final GeneratedColumn<String> place = GeneratedColumn<String>(
      'Place', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _verseCountMeta =
      const VerificationMeta('verseCount');
  @override
  late final GeneratedColumn<int> verseCount = GeneratedColumn<int>(
      'VerseCount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pageNoMeta = const VerificationMeta('pageNo');
  @override
  late final GeneratedColumn<int> pageNo = GeneratedColumn<int>(
      'PageNo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, place, verseCount, pageNo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Hafs_Sura';
  @override
  VerificationContext validateIntegrity(Insertable<HafsSuraItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ID')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['ID']!, _idMeta));
    }
    if (data.containsKey('Name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['Name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('Place')) {
      context.handle(
          _placeMeta, place.isAcceptableOrUnknown(data['Place']!, _placeMeta));
    } else if (isInserting) {
      context.missing(_placeMeta);
    }
    if (data.containsKey('VerseCount')) {
      context.handle(
          _verseCountMeta,
          verseCount.isAcceptableOrUnknown(
              data['VerseCount']!, _verseCountMeta));
    } else if (isInserting) {
      context.missing(_verseCountMeta);
    }
    if (data.containsKey('PageNo')) {
      context.handle(_pageNoMeta,
          pageNo.isAcceptableOrUnknown(data['PageNo']!, _pageNoMeta));
    } else if (isInserting) {
      context.missing(_pageNoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HafsSuraItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HafsSuraItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ID'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Name'])!,
      place: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Place'])!,
      verseCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}VerseCount'])!,
      pageNo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}PageNo'])!,
    );
  }

  @override
  $HafsSuraItemsTable createAlias(String alias) {
    return $HafsSuraItemsTable(attachedDatabase, alias);
  }
}

class HafsSuraItem extends DataClass implements Insertable<HafsSuraItem> {
  final int id;
  final String name;
  final String place;
  final int verseCount;
  final int pageNo;
  const HafsSuraItem(
      {required this.id,
      required this.name,
      required this.place,
      required this.verseCount,
      required this.pageNo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ID'] = Variable<int>(id);
    map['Name'] = Variable<String>(name);
    map['Place'] = Variable<String>(place);
    map['VerseCount'] = Variable<int>(verseCount);
    map['PageNo'] = Variable<int>(pageNo);
    return map;
  }

  HafsSuraItemsCompanion toCompanion(bool nullToAbsent) {
    return HafsSuraItemsCompanion(
      id: Value(id),
      name: Value(name),
      place: Value(place),
      verseCount: Value(verseCount),
      pageNo: Value(pageNo),
    );
  }

  factory HafsSuraItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HafsSuraItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      place: serializer.fromJson<String>(json['place']),
      verseCount: serializer.fromJson<int>(json['verseCount']),
      pageNo: serializer.fromJson<int>(json['pageNo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'place': serializer.toJson<String>(place),
      'verseCount': serializer.toJson<int>(verseCount),
      'pageNo': serializer.toJson<int>(pageNo),
    };
  }

  HafsSuraItem copyWith(
          {int? id,
          String? name,
          String? place,
          int? verseCount,
          int? pageNo}) =>
      HafsSuraItem(
        id: id ?? this.id,
        name: name ?? this.name,
        place: place ?? this.place,
        verseCount: verseCount ?? this.verseCount,
        pageNo: pageNo ?? this.pageNo,
      );
  HafsSuraItem copyWithCompanion(HafsSuraItemsCompanion data) {
    return HafsSuraItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      place: data.place.present ? data.place.value : this.place,
      verseCount:
          data.verseCount.present ? data.verseCount.value : this.verseCount,
      pageNo: data.pageNo.present ? data.pageNo.value : this.pageNo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HafsSuraItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('place: $place, ')
          ..write('verseCount: $verseCount, ')
          ..write('pageNo: $pageNo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, place, verseCount, pageNo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HafsSuraItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.place == this.place &&
          other.verseCount == this.verseCount &&
          other.pageNo == this.pageNo);
}

class HafsSuraItemsCompanion extends UpdateCompanion<HafsSuraItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> place;
  final Value<int> verseCount;
  final Value<int> pageNo;
  const HafsSuraItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.place = const Value.absent(),
    this.verseCount = const Value.absent(),
    this.pageNo = const Value.absent(),
  });
  HafsSuraItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String place,
    required int verseCount,
    required int pageNo,
  })  : name = Value(name),
        place = Value(place),
        verseCount = Value(verseCount),
        pageNo = Value(pageNo);
  static Insertable<HafsSuraItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? place,
    Expression<int>? verseCount,
    Expression<int>? pageNo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'ID': id,
      if (name != null) 'Name': name,
      if (place != null) 'Place': place,
      if (verseCount != null) 'VerseCount': verseCount,
      if (pageNo != null) 'PageNo': pageNo,
    });
  }

  HafsSuraItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? place,
      Value<int>? verseCount,
      Value<int>? pageNo}) {
    return HafsSuraItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      place: place ?? this.place,
      verseCount: verseCount ?? this.verseCount,
      pageNo: pageNo ?? this.pageNo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['ID'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['Name'] = Variable<String>(name.value);
    }
    if (place.present) {
      map['Place'] = Variable<String>(place.value);
    }
    if (verseCount.present) {
      map['VerseCount'] = Variable<int>(verseCount.value);
    }
    if (pageNo.present) {
      map['PageNo'] = Variable<int>(pageNo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HafsSuraItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('place: $place, ')
          ..write('verseCount: $verseCount, ')
          ..write('pageNo: $pageNo')
          ..write(')'))
        .toString();
  }
}

class $HafsWordItemsTable extends HafsWordItems
    with TableInfo<$HafsWordItemsTable, HafsWordItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HafsWordItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'ID', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _surahMeta = const VerificationMeta('surah');
  @override
  late final GeneratedColumn<int> surah = GeneratedColumn<int>(
      'Sura', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _verseMeta = const VerificationMeta('verse');
  @override
  late final GeneratedColumn<int> verse = GeneratedColumn<int>(
      'Verse', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pageNoMeta = const VerificationMeta('pageNo');
  @override
  late final GeneratedColumn<int> pageNo = GeneratedColumn<int>(
      'PageNo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lineNoMeta = const VerificationMeta('lineNo');
  @override
  late final GeneratedColumn<int> lineNo = GeneratedColumn<int>(
      'LineNo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wordNumMeta =
      const VerificationMeta('wordNum');
  @override
  late final GeneratedColumn<int> wordNum = GeneratedColumn<int>(
      'WordNum', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wordTextMeta =
      const VerificationMeta('wordText');
  @override
  late final GeneratedColumn<String> wordText = GeneratedColumn<String>(
      'WordText', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fontNameMeta =
      const VerificationMeta('fontName');
  @override
  late final GeneratedColumn<String> fontName = GeneratedColumn<String>(
      'FontName', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fontCodeMeta =
      const VerificationMeta('fontCode');
  @override
  late final GeneratedColumn<int> fontCode = GeneratedColumn<int>(
      'FontCode', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'Type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fontUnicodeMeta =
      const VerificationMeta('fontUnicode');
  @override
  late final GeneratedColumn<String> fontUnicode = GeneratedColumn<String>(
      'FontUniCode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        surah,
        verse,
        pageNo,
        lineNo,
        wordNum,
        wordText,
        fontName,
        fontCode,
        type,
        fontUnicode
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Hafs_Word';
  @override
  VerificationContext validateIntegrity(Insertable<HafsWordItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ID')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['ID']!, _idMeta));
    }
    if (data.containsKey('Sura')) {
      context.handle(
          _surahMeta, surah.isAcceptableOrUnknown(data['Sura']!, _surahMeta));
    } else if (isInserting) {
      context.missing(_surahMeta);
    }
    if (data.containsKey('Verse')) {
      context.handle(
          _verseMeta, verse.isAcceptableOrUnknown(data['Verse']!, _verseMeta));
    } else if (isInserting) {
      context.missing(_verseMeta);
    }
    if (data.containsKey('PageNo')) {
      context.handle(_pageNoMeta,
          pageNo.isAcceptableOrUnknown(data['PageNo']!, _pageNoMeta));
    } else if (isInserting) {
      context.missing(_pageNoMeta);
    }
    if (data.containsKey('LineNo')) {
      context.handle(_lineNoMeta,
          lineNo.isAcceptableOrUnknown(data['LineNo']!, _lineNoMeta));
    } else if (isInserting) {
      context.missing(_lineNoMeta);
    }
    if (data.containsKey('WordNum')) {
      context.handle(_wordNumMeta,
          wordNum.isAcceptableOrUnknown(data['WordNum']!, _wordNumMeta));
    } else if (isInserting) {
      context.missing(_wordNumMeta);
    }
    if (data.containsKey('WordText')) {
      context.handle(_wordTextMeta,
          wordText.isAcceptableOrUnknown(data['WordText']!, _wordTextMeta));
    } else if (isInserting) {
      context.missing(_wordTextMeta);
    }
    if (data.containsKey('FontName')) {
      context.handle(_fontNameMeta,
          fontName.isAcceptableOrUnknown(data['FontName']!, _fontNameMeta));
    } else if (isInserting) {
      context.missing(_fontNameMeta);
    }
    if (data.containsKey('FontCode')) {
      context.handle(_fontCodeMeta,
          fontCode.isAcceptableOrUnknown(data['FontCode']!, _fontCodeMeta));
    } else if (isInserting) {
      context.missing(_fontCodeMeta);
    }
    if (data.containsKey('Type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['Type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('FontUniCode')) {
      context.handle(
          _fontUnicodeMeta,
          fontUnicode.isAcceptableOrUnknown(
              data['FontUniCode']!, _fontUnicodeMeta));
    } else if (isInserting) {
      context.missing(_fontUnicodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HafsWordItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HafsWordItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ID'])!,
      surah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Sura'])!,
      verse: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Verse'])!,
      pageNo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}PageNo'])!,
      lineNo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}LineNo'])!,
      wordNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}WordNum'])!,
      wordText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}WordText'])!,
      fontName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}FontName'])!,
      fontCode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}FontCode'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Type'])!,
      fontUnicode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}FontUniCode'])!,
    );
  }

  @override
  $HafsWordItemsTable createAlias(String alias) {
    return $HafsWordItemsTable(attachedDatabase, alias);
  }
}

class HafsWordItem extends DataClass implements Insertable<HafsWordItem> {
  final int id;
  final int surah;
  final int verse;
  final int pageNo;
  final int lineNo;
  final int wordNum;
  final String wordText;
  final String fontName;
  final int fontCode;
  final int type;
  final String fontUnicode;
  const HafsWordItem(
      {required this.id,
      required this.surah,
      required this.verse,
      required this.pageNo,
      required this.lineNo,
      required this.wordNum,
      required this.wordText,
      required this.fontName,
      required this.fontCode,
      required this.type,
      required this.fontUnicode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ID'] = Variable<int>(id);
    map['Sura'] = Variable<int>(surah);
    map['Verse'] = Variable<int>(verse);
    map['PageNo'] = Variable<int>(pageNo);
    map['LineNo'] = Variable<int>(lineNo);
    map['WordNum'] = Variable<int>(wordNum);
    map['WordText'] = Variable<String>(wordText);
    map['FontName'] = Variable<String>(fontName);
    map['FontCode'] = Variable<int>(fontCode);
    map['Type'] = Variable<int>(type);
    map['FontUniCode'] = Variable<String>(fontUnicode);
    return map;
  }

  HafsWordItemsCompanion toCompanion(bool nullToAbsent) {
    return HafsWordItemsCompanion(
      id: Value(id),
      surah: Value(surah),
      verse: Value(verse),
      pageNo: Value(pageNo),
      lineNo: Value(lineNo),
      wordNum: Value(wordNum),
      wordText: Value(wordText),
      fontName: Value(fontName),
      fontCode: Value(fontCode),
      type: Value(type),
      fontUnicode: Value(fontUnicode),
    );
  }

  factory HafsWordItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HafsWordItem(
      id: serializer.fromJson<int>(json['id']),
      surah: serializer.fromJson<int>(json['surah']),
      verse: serializer.fromJson<int>(json['verse']),
      pageNo: serializer.fromJson<int>(json['pageNo']),
      lineNo: serializer.fromJson<int>(json['lineNo']),
      wordNum: serializer.fromJson<int>(json['wordNum']),
      wordText: serializer.fromJson<String>(json['wordText']),
      fontName: serializer.fromJson<String>(json['fontName']),
      fontCode: serializer.fromJson<int>(json['fontCode']),
      type: serializer.fromJson<int>(json['type']),
      fontUnicode: serializer.fromJson<String>(json['fontUnicode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'surah': serializer.toJson<int>(surah),
      'verse': serializer.toJson<int>(verse),
      'pageNo': serializer.toJson<int>(pageNo),
      'lineNo': serializer.toJson<int>(lineNo),
      'wordNum': serializer.toJson<int>(wordNum),
      'wordText': serializer.toJson<String>(wordText),
      'fontName': serializer.toJson<String>(fontName),
      'fontCode': serializer.toJson<int>(fontCode),
      'type': serializer.toJson<int>(type),
      'fontUnicode': serializer.toJson<String>(fontUnicode),
    };
  }

  HafsWordItem copyWith(
          {int? id,
          int? surah,
          int? verse,
          int? pageNo,
          int? lineNo,
          int? wordNum,
          String? wordText,
          String? fontName,
          int? fontCode,
          int? type,
          String? fontUnicode}) =>
      HafsWordItem(
        id: id ?? this.id,
        surah: surah ?? this.surah,
        verse: verse ?? this.verse,
        pageNo: pageNo ?? this.pageNo,
        lineNo: lineNo ?? this.lineNo,
        wordNum: wordNum ?? this.wordNum,
        wordText: wordText ?? this.wordText,
        fontName: fontName ?? this.fontName,
        fontCode: fontCode ?? this.fontCode,
        type: type ?? this.type,
        fontUnicode: fontUnicode ?? this.fontUnicode,
      );
  HafsWordItem copyWithCompanion(HafsWordItemsCompanion data) {
    return HafsWordItem(
      id: data.id.present ? data.id.value : this.id,
      surah: data.surah.present ? data.surah.value : this.surah,
      verse: data.verse.present ? data.verse.value : this.verse,
      pageNo: data.pageNo.present ? data.pageNo.value : this.pageNo,
      lineNo: data.lineNo.present ? data.lineNo.value : this.lineNo,
      wordNum: data.wordNum.present ? data.wordNum.value : this.wordNum,
      wordText: data.wordText.present ? data.wordText.value : this.wordText,
      fontName: data.fontName.present ? data.fontName.value : this.fontName,
      fontCode: data.fontCode.present ? data.fontCode.value : this.fontCode,
      type: data.type.present ? data.type.value : this.type,
      fontUnicode:
          data.fontUnicode.present ? data.fontUnicode.value : this.fontUnicode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HafsWordItem(')
          ..write('id: $id, ')
          ..write('surah: $surah, ')
          ..write('verse: $verse, ')
          ..write('pageNo: $pageNo, ')
          ..write('lineNo: $lineNo, ')
          ..write('wordNum: $wordNum, ')
          ..write('wordText: $wordText, ')
          ..write('fontName: $fontName, ')
          ..write('fontCode: $fontCode, ')
          ..write('type: $type, ')
          ..write('fontUnicode: $fontUnicode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, surah, verse, pageNo, lineNo, wordNum,
      wordText, fontName, fontCode, type, fontUnicode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HafsWordItem &&
          other.id == this.id &&
          other.surah == this.surah &&
          other.verse == this.verse &&
          other.pageNo == this.pageNo &&
          other.lineNo == this.lineNo &&
          other.wordNum == this.wordNum &&
          other.wordText == this.wordText &&
          other.fontName == this.fontName &&
          other.fontCode == this.fontCode &&
          other.type == this.type &&
          other.fontUnicode == this.fontUnicode);
}

class HafsWordItemsCompanion extends UpdateCompanion<HafsWordItem> {
  final Value<int> id;
  final Value<int> surah;
  final Value<int> verse;
  final Value<int> pageNo;
  final Value<int> lineNo;
  final Value<int> wordNum;
  final Value<String> wordText;
  final Value<String> fontName;
  final Value<int> fontCode;
  final Value<int> type;
  final Value<String> fontUnicode;
  const HafsWordItemsCompanion({
    this.id = const Value.absent(),
    this.surah = const Value.absent(),
    this.verse = const Value.absent(),
    this.pageNo = const Value.absent(),
    this.lineNo = const Value.absent(),
    this.wordNum = const Value.absent(),
    this.wordText = const Value.absent(),
    this.fontName = const Value.absent(),
    this.fontCode = const Value.absent(),
    this.type = const Value.absent(),
    this.fontUnicode = const Value.absent(),
  });
  HafsWordItemsCompanion.insert({
    this.id = const Value.absent(),
    required int surah,
    required int verse,
    required int pageNo,
    required int lineNo,
    required int wordNum,
    required String wordText,
    required String fontName,
    required int fontCode,
    required int type,
    required String fontUnicode,
  })  : surah = Value(surah),
        verse = Value(verse),
        pageNo = Value(pageNo),
        lineNo = Value(lineNo),
        wordNum = Value(wordNum),
        wordText = Value(wordText),
        fontName = Value(fontName),
        fontCode = Value(fontCode),
        type = Value(type),
        fontUnicode = Value(fontUnicode);
  static Insertable<HafsWordItem> custom({
    Expression<int>? id,
    Expression<int>? surah,
    Expression<int>? verse,
    Expression<int>? pageNo,
    Expression<int>? lineNo,
    Expression<int>? wordNum,
    Expression<String>? wordText,
    Expression<String>? fontName,
    Expression<int>? fontCode,
    Expression<int>? type,
    Expression<String>? fontUnicode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'ID': id,
      if (surah != null) 'Sura': surah,
      if (verse != null) 'Verse': verse,
      if (pageNo != null) 'PageNo': pageNo,
      if (lineNo != null) 'LineNo': lineNo,
      if (wordNum != null) 'WordNum': wordNum,
      if (wordText != null) 'WordText': wordText,
      if (fontName != null) 'FontName': fontName,
      if (fontCode != null) 'FontCode': fontCode,
      if (type != null) 'Type': type,
      if (fontUnicode != null) 'FontUniCode': fontUnicode,
    });
  }

  HafsWordItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? surah,
      Value<int>? verse,
      Value<int>? pageNo,
      Value<int>? lineNo,
      Value<int>? wordNum,
      Value<String>? wordText,
      Value<String>? fontName,
      Value<int>? fontCode,
      Value<int>? type,
      Value<String>? fontUnicode}) {
    return HafsWordItemsCompanion(
      id: id ?? this.id,
      surah: surah ?? this.surah,
      verse: verse ?? this.verse,
      pageNo: pageNo ?? this.pageNo,
      lineNo: lineNo ?? this.lineNo,
      wordNum: wordNum ?? this.wordNum,
      wordText: wordText ?? this.wordText,
      fontName: fontName ?? this.fontName,
      fontCode: fontCode ?? this.fontCode,
      type: type ?? this.type,
      fontUnicode: fontUnicode ?? this.fontUnicode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['ID'] = Variable<int>(id.value);
    }
    if (surah.present) {
      map['Sura'] = Variable<int>(surah.value);
    }
    if (verse.present) {
      map['Verse'] = Variable<int>(verse.value);
    }
    if (pageNo.present) {
      map['PageNo'] = Variable<int>(pageNo.value);
    }
    if (lineNo.present) {
      map['LineNo'] = Variable<int>(lineNo.value);
    }
    if (wordNum.present) {
      map['WordNum'] = Variable<int>(wordNum.value);
    }
    if (wordText.present) {
      map['WordText'] = Variable<String>(wordText.value);
    }
    if (fontName.present) {
      map['FontName'] = Variable<String>(fontName.value);
    }
    if (fontCode.present) {
      map['FontCode'] = Variable<int>(fontCode.value);
    }
    if (type.present) {
      map['Type'] = Variable<int>(type.value);
    }
    if (fontUnicode.present) {
      map['FontUniCode'] = Variable<String>(fontUnicode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HafsWordItemsCompanion(')
          ..write('id: $id, ')
          ..write('surah: $surah, ')
          ..write('verse: $verse, ')
          ..write('pageNo: $pageNo, ')
          ..write('lineNo: $lineNo, ')
          ..write('wordNum: $wordNum, ')
          ..write('wordText: $wordText, ')
          ..write('fontName: $fontName, ')
          ..write('fontCode: $fontCode, ')
          ..write('type: $type, ')
          ..write('fontUnicode: $fontUnicode')
          ..write(')'))
        .toString();
  }
}

class $SurahItemsTable extends SurahItems
    with TableInfo<$SurahItemsTable, SurahItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SurahItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _surahNoMeta =
      const VerificationMeta('surahNo');
  @override
  late final GeneratedColumn<int> surahNo = GeneratedColumn<int>(
      'no_surah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bilanganAyatMeta =
      const VerificationMeta('bilanganAyat');
  @override
  late final GeneratedColumn<int> bilanganAyat = GeneratedColumn<int>(
      'bilangan_ayat', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mukaSuratMeta =
      const VerificationMeta('mukaSurat');
  @override
  late final GeneratedColumn<int> mukaSurat = GeneratedColumn<int>(
      'muka_surat', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _juzukMeta = const VerificationMeta('juzuk');
  @override
  late final GeneratedColumn<int> juzuk = GeneratedColumn<int>(
      'juzuk', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _namaArabMeta =
      const VerificationMeta('namaArab');
  @override
  late final GeneratedColumn<String> namaArab = GeneratedColumn<String>(
      'nama_arab', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _namaMelayuMeta =
      const VerificationMeta('namaMelayu');
  @override
  late final GeneratedColumn<String> namaMelayu = GeneratedColumn<String>(
      'nama_melayu', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _namaEnglishMeta =
      const VerificationMeta('namaEnglish');
  @override
  late final GeneratedColumn<String> namaEnglish = GeneratedColumn<String>(
      'nama_english', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _maksudMelayuMeta =
      const VerificationMeta('maksudMelayu');
  @override
  late final GeneratedColumn<String> maksudMelayu = GeneratedColumn<String>(
      'maksud_melayu', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _maksudEnglishMeta =
      const VerificationMeta('maksudEnglish');
  @override
  late final GeneratedColumn<String> maksudEnglish = GeneratedColumn<String>(
      'maksud_english', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tempatTurunMeta =
      const VerificationMeta('tempatTurun');
  @override
  late final GeneratedColumn<String> tempatTurun = GeneratedColumn<String>(
      'tempat_diturunkan', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        surahNo,
        bilanganAyat,
        mukaSurat,
        juzuk,
        namaArab,
        namaMelayu,
        namaEnglish,
        maksudMelayu,
        maksudEnglish,
        tempatTurun
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'surahs';
  @override
  VerificationContext validateIntegrity(Insertable<SurahItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('no_surah')) {
      context.handle(_surahNoMeta,
          surahNo.isAcceptableOrUnknown(data['no_surah']!, _surahNoMeta));
    } else if (isInserting) {
      context.missing(_surahNoMeta);
    }
    if (data.containsKey('bilangan_ayat')) {
      context.handle(
          _bilanganAyatMeta,
          bilanganAyat.isAcceptableOrUnknown(
              data['bilangan_ayat']!, _bilanganAyatMeta));
    } else if (isInserting) {
      context.missing(_bilanganAyatMeta);
    }
    if (data.containsKey('muka_surat')) {
      context.handle(_mukaSuratMeta,
          mukaSurat.isAcceptableOrUnknown(data['muka_surat']!, _mukaSuratMeta));
    } else if (isInserting) {
      context.missing(_mukaSuratMeta);
    }
    if (data.containsKey('juzuk')) {
      context.handle(
          _juzukMeta, juzuk.isAcceptableOrUnknown(data['juzuk']!, _juzukMeta));
    } else if (isInserting) {
      context.missing(_juzukMeta);
    }
    if (data.containsKey('nama_arab')) {
      context.handle(_namaArabMeta,
          namaArab.isAcceptableOrUnknown(data['nama_arab']!, _namaArabMeta));
    } else if (isInserting) {
      context.missing(_namaArabMeta);
    }
    if (data.containsKey('nama_melayu')) {
      context.handle(
          _namaMelayuMeta,
          namaMelayu.isAcceptableOrUnknown(
              data['nama_melayu']!, _namaMelayuMeta));
    } else if (isInserting) {
      context.missing(_namaMelayuMeta);
    }
    if (data.containsKey('nama_english')) {
      context.handle(
          _namaEnglishMeta,
          namaEnglish.isAcceptableOrUnknown(
              data['nama_english']!, _namaEnglishMeta));
    } else if (isInserting) {
      context.missing(_namaEnglishMeta);
    }
    if (data.containsKey('maksud_melayu')) {
      context.handle(
          _maksudMelayuMeta,
          maksudMelayu.isAcceptableOrUnknown(
              data['maksud_melayu']!, _maksudMelayuMeta));
    } else if (isInserting) {
      context.missing(_maksudMelayuMeta);
    }
    if (data.containsKey('maksud_english')) {
      context.handle(
          _maksudEnglishMeta,
          maksudEnglish.isAcceptableOrUnknown(
              data['maksud_english']!, _maksudEnglishMeta));
    } else if (isInserting) {
      context.missing(_maksudEnglishMeta);
    }
    if (data.containsKey('tempat_diturunkan')) {
      context.handle(
          _tempatTurunMeta,
          tempatTurun.isAcceptableOrUnknown(
              data['tempat_diturunkan']!, _tempatTurunMeta));
    } else if (isInserting) {
      context.missing(_tempatTurunMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SurahItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SurahItem(
      surahNo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}no_surah'])!,
      bilanganAyat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bilangan_ayat'])!,
      mukaSurat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}muka_surat'])!,
      juzuk: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}juzuk'])!,
      namaArab: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_arab'])!,
      namaMelayu: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_melayu'])!,
      namaEnglish: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_english'])!,
      maksudMelayu: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}maksud_melayu'])!,
      maksudEnglish: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}maksud_english'])!,
      tempatTurun: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}tempat_diturunkan'])!,
    );
  }

  @override
  $SurahItemsTable createAlias(String alias) {
    return $SurahItemsTable(attachedDatabase, alias);
  }
}

class SurahItem extends DataClass implements Insertable<SurahItem> {
  final int surahNo;
  final int bilanganAyat;
  final int mukaSurat;
  final int juzuk;
  final String namaArab;
  final String namaMelayu;
  final String namaEnglish;
  final String maksudMelayu;
  final String maksudEnglish;
  final String tempatTurun;
  const SurahItem(
      {required this.surahNo,
      required this.bilanganAyat,
      required this.mukaSurat,
      required this.juzuk,
      required this.namaArab,
      required this.namaMelayu,
      required this.namaEnglish,
      required this.maksudMelayu,
      required this.maksudEnglish,
      required this.tempatTurun});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['no_surah'] = Variable<int>(surahNo);
    map['bilangan_ayat'] = Variable<int>(bilanganAyat);
    map['muka_surat'] = Variable<int>(mukaSurat);
    map['juzuk'] = Variable<int>(juzuk);
    map['nama_arab'] = Variable<String>(namaArab);
    map['nama_melayu'] = Variable<String>(namaMelayu);
    map['nama_english'] = Variable<String>(namaEnglish);
    map['maksud_melayu'] = Variable<String>(maksudMelayu);
    map['maksud_english'] = Variable<String>(maksudEnglish);
    map['tempat_diturunkan'] = Variable<String>(tempatTurun);
    return map;
  }

  SurahItemsCompanion toCompanion(bool nullToAbsent) {
    return SurahItemsCompanion(
      surahNo: Value(surahNo),
      bilanganAyat: Value(bilanganAyat),
      mukaSurat: Value(mukaSurat),
      juzuk: Value(juzuk),
      namaArab: Value(namaArab),
      namaMelayu: Value(namaMelayu),
      namaEnglish: Value(namaEnglish),
      maksudMelayu: Value(maksudMelayu),
      maksudEnglish: Value(maksudEnglish),
      tempatTurun: Value(tempatTurun),
    );
  }

  factory SurahItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SurahItem(
      surahNo: serializer.fromJson<int>(json['surahNo']),
      bilanganAyat: serializer.fromJson<int>(json['bilanganAyat']),
      mukaSurat: serializer.fromJson<int>(json['mukaSurat']),
      juzuk: serializer.fromJson<int>(json['juzuk']),
      namaArab: serializer.fromJson<String>(json['namaArab']),
      namaMelayu: serializer.fromJson<String>(json['namaMelayu']),
      namaEnglish: serializer.fromJson<String>(json['namaEnglish']),
      maksudMelayu: serializer.fromJson<String>(json['maksudMelayu']),
      maksudEnglish: serializer.fromJson<String>(json['maksudEnglish']),
      tempatTurun: serializer.fromJson<String>(json['tempatTurun']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'surahNo': serializer.toJson<int>(surahNo),
      'bilanganAyat': serializer.toJson<int>(bilanganAyat),
      'mukaSurat': serializer.toJson<int>(mukaSurat),
      'juzuk': serializer.toJson<int>(juzuk),
      'namaArab': serializer.toJson<String>(namaArab),
      'namaMelayu': serializer.toJson<String>(namaMelayu),
      'namaEnglish': serializer.toJson<String>(namaEnglish),
      'maksudMelayu': serializer.toJson<String>(maksudMelayu),
      'maksudEnglish': serializer.toJson<String>(maksudEnglish),
      'tempatTurun': serializer.toJson<String>(tempatTurun),
    };
  }

  SurahItem copyWith(
          {int? surahNo,
          int? bilanganAyat,
          int? mukaSurat,
          int? juzuk,
          String? namaArab,
          String? namaMelayu,
          String? namaEnglish,
          String? maksudMelayu,
          String? maksudEnglish,
          String? tempatTurun}) =>
      SurahItem(
        surahNo: surahNo ?? this.surahNo,
        bilanganAyat: bilanganAyat ?? this.bilanganAyat,
        mukaSurat: mukaSurat ?? this.mukaSurat,
        juzuk: juzuk ?? this.juzuk,
        namaArab: namaArab ?? this.namaArab,
        namaMelayu: namaMelayu ?? this.namaMelayu,
        namaEnglish: namaEnglish ?? this.namaEnglish,
        maksudMelayu: maksudMelayu ?? this.maksudMelayu,
        maksudEnglish: maksudEnglish ?? this.maksudEnglish,
        tempatTurun: tempatTurun ?? this.tempatTurun,
      );
  SurahItem copyWithCompanion(SurahItemsCompanion data) {
    return SurahItem(
      surahNo: data.surahNo.present ? data.surahNo.value : this.surahNo,
      bilanganAyat: data.bilanganAyat.present
          ? data.bilanganAyat.value
          : this.bilanganAyat,
      mukaSurat: data.mukaSurat.present ? data.mukaSurat.value : this.mukaSurat,
      juzuk: data.juzuk.present ? data.juzuk.value : this.juzuk,
      namaArab: data.namaArab.present ? data.namaArab.value : this.namaArab,
      namaMelayu:
          data.namaMelayu.present ? data.namaMelayu.value : this.namaMelayu,
      namaEnglish:
          data.namaEnglish.present ? data.namaEnglish.value : this.namaEnglish,
      maksudMelayu: data.maksudMelayu.present
          ? data.maksudMelayu.value
          : this.maksudMelayu,
      maksudEnglish: data.maksudEnglish.present
          ? data.maksudEnglish.value
          : this.maksudEnglish,
      tempatTurun:
          data.tempatTurun.present ? data.tempatTurun.value : this.tempatTurun,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SurahItem(')
          ..write('surahNo: $surahNo, ')
          ..write('bilanganAyat: $bilanganAyat, ')
          ..write('mukaSurat: $mukaSurat, ')
          ..write('juzuk: $juzuk, ')
          ..write('namaArab: $namaArab, ')
          ..write('namaMelayu: $namaMelayu, ')
          ..write('namaEnglish: $namaEnglish, ')
          ..write('maksudMelayu: $maksudMelayu, ')
          ..write('maksudEnglish: $maksudEnglish, ')
          ..write('tempatTurun: $tempatTurun')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      surahNo,
      bilanganAyat,
      mukaSurat,
      juzuk,
      namaArab,
      namaMelayu,
      namaEnglish,
      maksudMelayu,
      maksudEnglish,
      tempatTurun);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SurahItem &&
          other.surahNo == this.surahNo &&
          other.bilanganAyat == this.bilanganAyat &&
          other.mukaSurat == this.mukaSurat &&
          other.juzuk == this.juzuk &&
          other.namaArab == this.namaArab &&
          other.namaMelayu == this.namaMelayu &&
          other.namaEnglish == this.namaEnglish &&
          other.maksudMelayu == this.maksudMelayu &&
          other.maksudEnglish == this.maksudEnglish &&
          other.tempatTurun == this.tempatTurun);
}

class SurahItemsCompanion extends UpdateCompanion<SurahItem> {
  final Value<int> surahNo;
  final Value<int> bilanganAyat;
  final Value<int> mukaSurat;
  final Value<int> juzuk;
  final Value<String> namaArab;
  final Value<String> namaMelayu;
  final Value<String> namaEnglish;
  final Value<String> maksudMelayu;
  final Value<String> maksudEnglish;
  final Value<String> tempatTurun;
  final Value<int> rowid;
  const SurahItemsCompanion({
    this.surahNo = const Value.absent(),
    this.bilanganAyat = const Value.absent(),
    this.mukaSurat = const Value.absent(),
    this.juzuk = const Value.absent(),
    this.namaArab = const Value.absent(),
    this.namaMelayu = const Value.absent(),
    this.namaEnglish = const Value.absent(),
    this.maksudMelayu = const Value.absent(),
    this.maksudEnglish = const Value.absent(),
    this.tempatTurun = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SurahItemsCompanion.insert({
    required int surahNo,
    required int bilanganAyat,
    required int mukaSurat,
    required int juzuk,
    required String namaArab,
    required String namaMelayu,
    required String namaEnglish,
    required String maksudMelayu,
    required String maksudEnglish,
    required String tempatTurun,
    this.rowid = const Value.absent(),
  })  : surahNo = Value(surahNo),
        bilanganAyat = Value(bilanganAyat),
        mukaSurat = Value(mukaSurat),
        juzuk = Value(juzuk),
        namaArab = Value(namaArab),
        namaMelayu = Value(namaMelayu),
        namaEnglish = Value(namaEnglish),
        maksudMelayu = Value(maksudMelayu),
        maksudEnglish = Value(maksudEnglish),
        tempatTurun = Value(tempatTurun);
  static Insertable<SurahItem> custom({
    Expression<int>? surahNo,
    Expression<int>? bilanganAyat,
    Expression<int>? mukaSurat,
    Expression<int>? juzuk,
    Expression<String>? namaArab,
    Expression<String>? namaMelayu,
    Expression<String>? namaEnglish,
    Expression<String>? maksudMelayu,
    Expression<String>? maksudEnglish,
    Expression<String>? tempatTurun,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (surahNo != null) 'no_surah': surahNo,
      if (bilanganAyat != null) 'bilangan_ayat': bilanganAyat,
      if (mukaSurat != null) 'muka_surat': mukaSurat,
      if (juzuk != null) 'juzuk': juzuk,
      if (namaArab != null) 'nama_arab': namaArab,
      if (namaMelayu != null) 'nama_melayu': namaMelayu,
      if (namaEnglish != null) 'nama_english': namaEnglish,
      if (maksudMelayu != null) 'maksud_melayu': maksudMelayu,
      if (maksudEnglish != null) 'maksud_english': maksudEnglish,
      if (tempatTurun != null) 'tempat_diturunkan': tempatTurun,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SurahItemsCompanion copyWith(
      {Value<int>? surahNo,
      Value<int>? bilanganAyat,
      Value<int>? mukaSurat,
      Value<int>? juzuk,
      Value<String>? namaArab,
      Value<String>? namaMelayu,
      Value<String>? namaEnglish,
      Value<String>? maksudMelayu,
      Value<String>? maksudEnglish,
      Value<String>? tempatTurun,
      Value<int>? rowid}) {
    return SurahItemsCompanion(
      surahNo: surahNo ?? this.surahNo,
      bilanganAyat: bilanganAyat ?? this.bilanganAyat,
      mukaSurat: mukaSurat ?? this.mukaSurat,
      juzuk: juzuk ?? this.juzuk,
      namaArab: namaArab ?? this.namaArab,
      namaMelayu: namaMelayu ?? this.namaMelayu,
      namaEnglish: namaEnglish ?? this.namaEnglish,
      maksudMelayu: maksudMelayu ?? this.maksudMelayu,
      maksudEnglish: maksudEnglish ?? this.maksudEnglish,
      tempatTurun: tempatTurun ?? this.tempatTurun,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (surahNo.present) {
      map['no_surah'] = Variable<int>(surahNo.value);
    }
    if (bilanganAyat.present) {
      map['bilangan_ayat'] = Variable<int>(bilanganAyat.value);
    }
    if (mukaSurat.present) {
      map['muka_surat'] = Variable<int>(mukaSurat.value);
    }
    if (juzuk.present) {
      map['juzuk'] = Variable<int>(juzuk.value);
    }
    if (namaArab.present) {
      map['nama_arab'] = Variable<String>(namaArab.value);
    }
    if (namaMelayu.present) {
      map['nama_melayu'] = Variable<String>(namaMelayu.value);
    }
    if (namaEnglish.present) {
      map['nama_english'] = Variable<String>(namaEnglish.value);
    }
    if (maksudMelayu.present) {
      map['maksud_melayu'] = Variable<String>(maksudMelayu.value);
    }
    if (maksudEnglish.present) {
      map['maksud_english'] = Variable<String>(maksudEnglish.value);
    }
    if (tempatTurun.present) {
      map['tempat_diturunkan'] = Variable<String>(tempatTurun.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SurahItemsCompanion(')
          ..write('surahNo: $surahNo, ')
          ..write('bilanganAyat: $bilanganAyat, ')
          ..write('mukaSurat: $mukaSurat, ')
          ..write('juzuk: $juzuk, ')
          ..write('namaArab: $namaArab, ')
          ..write('namaMelayu: $namaMelayu, ')
          ..write('namaEnglish: $namaEnglish, ')
          ..write('maksudMelayu: $maksudMelayu, ')
          ..write('maksudEnglish: $maksudEnglish, ')
          ..write('tempatTurun: $tempatTurun, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HafsSuraItemsTable hafsSuraItems = $HafsSuraItemsTable(this);
  late final $HafsWordItemsTable hafsWordItems = $HafsWordItemsTable(this);
  late final $SurahItemsTable surahItems = $SurahItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [hafsSuraItems, hafsWordItems, surahItems];
}

typedef $$HafsSuraItemsTableCreateCompanionBuilder = HafsSuraItemsCompanion
    Function({
  Value<int> id,
  required String name,
  required String place,
  required int verseCount,
  required int pageNo,
});
typedef $$HafsSuraItemsTableUpdateCompanionBuilder = HafsSuraItemsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> place,
  Value<int> verseCount,
  Value<int> pageNo,
});

class $$HafsSuraItemsTableFilterComposer
    extends Composer<_$AppDatabase, $HafsSuraItemsTable> {
  $$HafsSuraItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get place => $composableBuilder(
      column: $table.place, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get verseCount => $composableBuilder(
      column: $table.verseCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pageNo => $composableBuilder(
      column: $table.pageNo, builder: (column) => ColumnFilters(column));
}

class $$HafsSuraItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $HafsSuraItemsTable> {
  $$HafsSuraItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get place => $composableBuilder(
      column: $table.place, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get verseCount => $composableBuilder(
      column: $table.verseCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pageNo => $composableBuilder(
      column: $table.pageNo, builder: (column) => ColumnOrderings(column));
}

class $$HafsSuraItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HafsSuraItemsTable> {
  $$HafsSuraItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get place =>
      $composableBuilder(column: $table.place, builder: (column) => column);

  GeneratedColumn<int> get verseCount => $composableBuilder(
      column: $table.verseCount, builder: (column) => column);

  GeneratedColumn<int> get pageNo =>
      $composableBuilder(column: $table.pageNo, builder: (column) => column);
}

class $$HafsSuraItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HafsSuraItemsTable,
    HafsSuraItem,
    $$HafsSuraItemsTableFilterComposer,
    $$HafsSuraItemsTableOrderingComposer,
    $$HafsSuraItemsTableAnnotationComposer,
    $$HafsSuraItemsTableCreateCompanionBuilder,
    $$HafsSuraItemsTableUpdateCompanionBuilder,
    (
      HafsSuraItem,
      BaseReferences<_$AppDatabase, $HafsSuraItemsTable, HafsSuraItem>
    ),
    HafsSuraItem,
    PrefetchHooks Function()> {
  $$HafsSuraItemsTableTableManager(_$AppDatabase db, $HafsSuraItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HafsSuraItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HafsSuraItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HafsSuraItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> place = const Value.absent(),
            Value<int> verseCount = const Value.absent(),
            Value<int> pageNo = const Value.absent(),
          }) =>
              HafsSuraItemsCompanion(
            id: id,
            name: name,
            place: place,
            verseCount: verseCount,
            pageNo: pageNo,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String place,
            required int verseCount,
            required int pageNo,
          }) =>
              HafsSuraItemsCompanion.insert(
            id: id,
            name: name,
            place: place,
            verseCount: verseCount,
            pageNo: pageNo,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HafsSuraItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HafsSuraItemsTable,
    HafsSuraItem,
    $$HafsSuraItemsTableFilterComposer,
    $$HafsSuraItemsTableOrderingComposer,
    $$HafsSuraItemsTableAnnotationComposer,
    $$HafsSuraItemsTableCreateCompanionBuilder,
    $$HafsSuraItemsTableUpdateCompanionBuilder,
    (
      HafsSuraItem,
      BaseReferences<_$AppDatabase, $HafsSuraItemsTable, HafsSuraItem>
    ),
    HafsSuraItem,
    PrefetchHooks Function()>;
typedef $$HafsWordItemsTableCreateCompanionBuilder = HafsWordItemsCompanion
    Function({
  Value<int> id,
  required int surah,
  required int verse,
  required int pageNo,
  required int lineNo,
  required int wordNum,
  required String wordText,
  required String fontName,
  required int fontCode,
  required int type,
  required String fontUnicode,
});
typedef $$HafsWordItemsTableUpdateCompanionBuilder = HafsWordItemsCompanion
    Function({
  Value<int> id,
  Value<int> surah,
  Value<int> verse,
  Value<int> pageNo,
  Value<int> lineNo,
  Value<int> wordNum,
  Value<String> wordText,
  Value<String> fontName,
  Value<int> fontCode,
  Value<int> type,
  Value<String> fontUnicode,
});

class $$HafsWordItemsTableFilterComposer
    extends Composer<_$AppDatabase, $HafsWordItemsTable> {
  $$HafsWordItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get surah => $composableBuilder(
      column: $table.surah, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get verse => $composableBuilder(
      column: $table.verse, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pageNo => $composableBuilder(
      column: $table.pageNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lineNo => $composableBuilder(
      column: $table.lineNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wordNum => $composableBuilder(
      column: $table.wordNum, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wordText => $composableBuilder(
      column: $table.wordText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fontName => $composableBuilder(
      column: $table.fontName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fontCode => $composableBuilder(
      column: $table.fontCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fontUnicode => $composableBuilder(
      column: $table.fontUnicode, builder: (column) => ColumnFilters(column));
}

class $$HafsWordItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $HafsWordItemsTable> {
  $$HafsWordItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get surah => $composableBuilder(
      column: $table.surah, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get verse => $composableBuilder(
      column: $table.verse, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pageNo => $composableBuilder(
      column: $table.pageNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lineNo => $composableBuilder(
      column: $table.lineNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wordNum => $composableBuilder(
      column: $table.wordNum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wordText => $composableBuilder(
      column: $table.wordText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fontName => $composableBuilder(
      column: $table.fontName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fontCode => $composableBuilder(
      column: $table.fontCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fontUnicode => $composableBuilder(
      column: $table.fontUnicode, builder: (column) => ColumnOrderings(column));
}

class $$HafsWordItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HafsWordItemsTable> {
  $$HafsWordItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get surah =>
      $composableBuilder(column: $table.surah, builder: (column) => column);

  GeneratedColumn<int> get verse =>
      $composableBuilder(column: $table.verse, builder: (column) => column);

  GeneratedColumn<int> get pageNo =>
      $composableBuilder(column: $table.pageNo, builder: (column) => column);

  GeneratedColumn<int> get lineNo =>
      $composableBuilder(column: $table.lineNo, builder: (column) => column);

  GeneratedColumn<int> get wordNum =>
      $composableBuilder(column: $table.wordNum, builder: (column) => column);

  GeneratedColumn<String> get wordText =>
      $composableBuilder(column: $table.wordText, builder: (column) => column);

  GeneratedColumn<String> get fontName =>
      $composableBuilder(column: $table.fontName, builder: (column) => column);

  GeneratedColumn<int> get fontCode =>
      $composableBuilder(column: $table.fontCode, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get fontUnicode => $composableBuilder(
      column: $table.fontUnicode, builder: (column) => column);
}

class $$HafsWordItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HafsWordItemsTable,
    HafsWordItem,
    $$HafsWordItemsTableFilterComposer,
    $$HafsWordItemsTableOrderingComposer,
    $$HafsWordItemsTableAnnotationComposer,
    $$HafsWordItemsTableCreateCompanionBuilder,
    $$HafsWordItemsTableUpdateCompanionBuilder,
    (
      HafsWordItem,
      BaseReferences<_$AppDatabase, $HafsWordItemsTable, HafsWordItem>
    ),
    HafsWordItem,
    PrefetchHooks Function()> {
  $$HafsWordItemsTableTableManager(_$AppDatabase db, $HafsWordItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HafsWordItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HafsWordItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HafsWordItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> surah = const Value.absent(),
            Value<int> verse = const Value.absent(),
            Value<int> pageNo = const Value.absent(),
            Value<int> lineNo = const Value.absent(),
            Value<int> wordNum = const Value.absent(),
            Value<String> wordText = const Value.absent(),
            Value<String> fontName = const Value.absent(),
            Value<int> fontCode = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<String> fontUnicode = const Value.absent(),
          }) =>
              HafsWordItemsCompanion(
            id: id,
            surah: surah,
            verse: verse,
            pageNo: pageNo,
            lineNo: lineNo,
            wordNum: wordNum,
            wordText: wordText,
            fontName: fontName,
            fontCode: fontCode,
            type: type,
            fontUnicode: fontUnicode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int surah,
            required int verse,
            required int pageNo,
            required int lineNo,
            required int wordNum,
            required String wordText,
            required String fontName,
            required int fontCode,
            required int type,
            required String fontUnicode,
          }) =>
              HafsWordItemsCompanion.insert(
            id: id,
            surah: surah,
            verse: verse,
            pageNo: pageNo,
            lineNo: lineNo,
            wordNum: wordNum,
            wordText: wordText,
            fontName: fontName,
            fontCode: fontCode,
            type: type,
            fontUnicode: fontUnicode,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HafsWordItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HafsWordItemsTable,
    HafsWordItem,
    $$HafsWordItemsTableFilterComposer,
    $$HafsWordItemsTableOrderingComposer,
    $$HafsWordItemsTableAnnotationComposer,
    $$HafsWordItemsTableCreateCompanionBuilder,
    $$HafsWordItemsTableUpdateCompanionBuilder,
    (
      HafsWordItem,
      BaseReferences<_$AppDatabase, $HafsWordItemsTable, HafsWordItem>
    ),
    HafsWordItem,
    PrefetchHooks Function()>;
typedef $$SurahItemsTableCreateCompanionBuilder = SurahItemsCompanion Function({
  required int surahNo,
  required int bilanganAyat,
  required int mukaSurat,
  required int juzuk,
  required String namaArab,
  required String namaMelayu,
  required String namaEnglish,
  required String maksudMelayu,
  required String maksudEnglish,
  required String tempatTurun,
  Value<int> rowid,
});
typedef $$SurahItemsTableUpdateCompanionBuilder = SurahItemsCompanion Function({
  Value<int> surahNo,
  Value<int> bilanganAyat,
  Value<int> mukaSurat,
  Value<int> juzuk,
  Value<String> namaArab,
  Value<String> namaMelayu,
  Value<String> namaEnglish,
  Value<String> maksudMelayu,
  Value<String> maksudEnglish,
  Value<String> tempatTurun,
  Value<int> rowid,
});

class $$SurahItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SurahItemsTable> {
  $$SurahItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get surahNo => $composableBuilder(
      column: $table.surahNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bilanganAyat => $composableBuilder(
      column: $table.bilanganAyat, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get mukaSurat => $composableBuilder(
      column: $table.mukaSurat, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get juzuk => $composableBuilder(
      column: $table.juzuk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get namaArab => $composableBuilder(
      column: $table.namaArab, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get namaMelayu => $composableBuilder(
      column: $table.namaMelayu, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get namaEnglish => $composableBuilder(
      column: $table.namaEnglish, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maksudMelayu => $composableBuilder(
      column: $table.maksudMelayu, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maksudEnglish => $composableBuilder(
      column: $table.maksudEnglish, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tempatTurun => $composableBuilder(
      column: $table.tempatTurun, builder: (column) => ColumnFilters(column));
}

class $$SurahItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SurahItemsTable> {
  $$SurahItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get surahNo => $composableBuilder(
      column: $table.surahNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bilanganAyat => $composableBuilder(
      column: $table.bilanganAyat,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mukaSurat => $composableBuilder(
      column: $table.mukaSurat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get juzuk => $composableBuilder(
      column: $table.juzuk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get namaArab => $composableBuilder(
      column: $table.namaArab, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get namaMelayu => $composableBuilder(
      column: $table.namaMelayu, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get namaEnglish => $composableBuilder(
      column: $table.namaEnglish, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maksudMelayu => $composableBuilder(
      column: $table.maksudMelayu,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maksudEnglish => $composableBuilder(
      column: $table.maksudEnglish,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tempatTurun => $composableBuilder(
      column: $table.tempatTurun, builder: (column) => ColumnOrderings(column));
}

class $$SurahItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SurahItemsTable> {
  $$SurahItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get surahNo =>
      $composableBuilder(column: $table.surahNo, builder: (column) => column);

  GeneratedColumn<int> get bilanganAyat => $composableBuilder(
      column: $table.bilanganAyat, builder: (column) => column);

  GeneratedColumn<int> get mukaSurat =>
      $composableBuilder(column: $table.mukaSurat, builder: (column) => column);

  GeneratedColumn<int> get juzuk =>
      $composableBuilder(column: $table.juzuk, builder: (column) => column);

  GeneratedColumn<String> get namaArab =>
      $composableBuilder(column: $table.namaArab, builder: (column) => column);

  GeneratedColumn<String> get namaMelayu => $composableBuilder(
      column: $table.namaMelayu, builder: (column) => column);

  GeneratedColumn<String> get namaEnglish => $composableBuilder(
      column: $table.namaEnglish, builder: (column) => column);

  GeneratedColumn<String> get maksudMelayu => $composableBuilder(
      column: $table.maksudMelayu, builder: (column) => column);

  GeneratedColumn<String> get maksudEnglish => $composableBuilder(
      column: $table.maksudEnglish, builder: (column) => column);

  GeneratedColumn<String> get tempatTurun => $composableBuilder(
      column: $table.tempatTurun, builder: (column) => column);
}

class $$SurahItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SurahItemsTable,
    SurahItem,
    $$SurahItemsTableFilterComposer,
    $$SurahItemsTableOrderingComposer,
    $$SurahItemsTableAnnotationComposer,
    $$SurahItemsTableCreateCompanionBuilder,
    $$SurahItemsTableUpdateCompanionBuilder,
    (SurahItem, BaseReferences<_$AppDatabase, $SurahItemsTable, SurahItem>),
    SurahItem,
    PrefetchHooks Function()> {
  $$SurahItemsTableTableManager(_$AppDatabase db, $SurahItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SurahItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SurahItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SurahItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> surahNo = const Value.absent(),
            Value<int> bilanganAyat = const Value.absent(),
            Value<int> mukaSurat = const Value.absent(),
            Value<int> juzuk = const Value.absent(),
            Value<String> namaArab = const Value.absent(),
            Value<String> namaMelayu = const Value.absent(),
            Value<String> namaEnglish = const Value.absent(),
            Value<String> maksudMelayu = const Value.absent(),
            Value<String> maksudEnglish = const Value.absent(),
            Value<String> tempatTurun = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SurahItemsCompanion(
            surahNo: surahNo,
            bilanganAyat: bilanganAyat,
            mukaSurat: mukaSurat,
            juzuk: juzuk,
            namaArab: namaArab,
            namaMelayu: namaMelayu,
            namaEnglish: namaEnglish,
            maksudMelayu: maksudMelayu,
            maksudEnglish: maksudEnglish,
            tempatTurun: tempatTurun,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int surahNo,
            required int bilanganAyat,
            required int mukaSurat,
            required int juzuk,
            required String namaArab,
            required String namaMelayu,
            required String namaEnglish,
            required String maksudMelayu,
            required String maksudEnglish,
            required String tempatTurun,
            Value<int> rowid = const Value.absent(),
          }) =>
              SurahItemsCompanion.insert(
            surahNo: surahNo,
            bilanganAyat: bilanganAyat,
            mukaSurat: mukaSurat,
            juzuk: juzuk,
            namaArab: namaArab,
            namaMelayu: namaMelayu,
            namaEnglish: namaEnglish,
            maksudMelayu: maksudMelayu,
            maksudEnglish: maksudEnglish,
            tempatTurun: tempatTurun,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SurahItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SurahItemsTable,
    SurahItem,
    $$SurahItemsTableFilterComposer,
    $$SurahItemsTableOrderingComposer,
    $$SurahItemsTableAnnotationComposer,
    $$SurahItemsTableCreateCompanionBuilder,
    $$SurahItemsTableUpdateCompanionBuilder,
    (SurahItem, BaseReferences<_$AppDatabase, $SurahItemsTable, SurahItem>),
    SurahItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HafsSuraItemsTableTableManager get hafsSuraItems =>
      $$HafsSuraItemsTableTableManager(_db, _db.hafsSuraItems);
  $$HafsWordItemsTableTableManager get hafsWordItems =>
      $$HafsWordItemsTableTableManager(_db, _db.hafsWordItems);
  $$SurahItemsTableTableManager get surahItems =>
      $$SurahItemsTableTableManager(_db, _db.surahItems);
}
