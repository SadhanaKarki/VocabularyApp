// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $VCategoryTable extends VCategory
    with TableInfo<$VCategoryTable, VCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'v_category';
  @override
  VerificationContext validateIntegrity(Insertable<VCategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VCategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $VCategoryTable createAlias(String alias) {
    return $VCategoryTable(attachedDatabase, alias);
  }
}

class VCategoryData extends DataClass implements Insertable<VCategoryData> {
  final int id;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const VCategoryData(
      {required this.id, required this.name, this.createdAt, this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  VCategoryCompanion toCompanion(bool nullToAbsent) {
    return VCategoryCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory VCategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VCategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  VCategoryData copyWith(
          {int? id,
          String? name,
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      VCategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  VCategoryData copyWithCompanion(VCategoryCompanion data) {
    return VCategoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VCategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VCategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VCategoryCompanion extends UpdateCompanion<VCategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const VCategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VCategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<VCategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VCategoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return VCategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VCategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VocabularyTable extends Vocabulary
    with TableInfo<$VocabularyTable, VocabularyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabularyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _definitionMeta =
      const VerificationMeta('definition');
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
      'definition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exampleSentenceMeta =
      const VerificationMeta('exampleSentence');
  @override
  late final GeneratedColumn<String> exampleSentence = GeneratedColumn<String>(
      'example_sentence', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _masteredMeta =
      const VerificationMeta('mastered');
  @override
  late final GeneratedColumn<bool> mastered = GeneratedColumn<bool>(
      'mastered', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("mastered" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES v_category (id) ON DELETE RESTRICT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        word,
        definition,
        exampleSentence,
        mastered,
        categoryId,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocabulary';
  @override
  VerificationContext validateIntegrity(Insertable<VocabularyData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('definition')) {
      context.handle(
          _definitionMeta,
          definition.isAcceptableOrUnknown(
              data['definition']!, _definitionMeta));
    } else if (isInserting) {
      context.missing(_definitionMeta);
    }
    if (data.containsKey('example_sentence')) {
      context.handle(
          _exampleSentenceMeta,
          exampleSentence.isAcceptableOrUnknown(
              data['example_sentence']!, _exampleSentenceMeta));
    }
    if (data.containsKey('mastered')) {
      context.handle(_masteredMeta,
          mastered.isAcceptableOrUnknown(data['mastered']!, _masteredMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabularyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabularyData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      definition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}definition'])!,
      exampleSentence: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}example_sentence']),
      mastered: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mastered'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $VocabularyTable createAlias(String alias) {
    return $VocabularyTable(attachedDatabase, alias);
  }
}

class VocabularyData extends DataClass implements Insertable<VocabularyData> {
  final int id;
  final String word;
  final String definition;
  final String? exampleSentence;
  final bool mastered;
  final int categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const VocabularyData(
      {required this.id,
      required this.word,
      required this.definition,
      this.exampleSentence,
      required this.mastered,
      required this.categoryId,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['definition'] = Variable<String>(definition);
    if (!nullToAbsent || exampleSentence != null) {
      map['example_sentence'] = Variable<String>(exampleSentence);
    }
    map['mastered'] = Variable<bool>(mastered);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  VocabularyCompanion toCompanion(bool nullToAbsent) {
    return VocabularyCompanion(
      id: Value(id),
      word: Value(word),
      definition: Value(definition),
      exampleSentence: exampleSentence == null && nullToAbsent
          ? const Value.absent()
          : Value(exampleSentence),
      mastered: Value(mastered),
      categoryId: Value(categoryId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory VocabularyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabularyData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      definition: serializer.fromJson<String>(json['definition']),
      exampleSentence: serializer.fromJson<String?>(json['exampleSentence']),
      mastered: serializer.fromJson<bool>(json['mastered']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'definition': serializer.toJson<String>(definition),
      'exampleSentence': serializer.toJson<String?>(exampleSentence),
      'mastered': serializer.toJson<bool>(mastered),
      'categoryId': serializer.toJson<int>(categoryId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  VocabularyData copyWith(
          {int? id,
          String? word,
          String? definition,
          Value<String?> exampleSentence = const Value.absent(),
          bool? mastered,
          int? categoryId,
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      VocabularyData(
        id: id ?? this.id,
        word: word ?? this.word,
        definition: definition ?? this.definition,
        exampleSentence: exampleSentence.present
            ? exampleSentence.value
            : this.exampleSentence,
        mastered: mastered ?? this.mastered,
        categoryId: categoryId ?? this.categoryId,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  VocabularyData copyWithCompanion(VocabularyCompanion data) {
    return VocabularyData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      definition:
          data.definition.present ? data.definition.value : this.definition,
      exampleSentence: data.exampleSentence.present
          ? data.exampleSentence.value
          : this.exampleSentence,
      mastered: data.mastered.present ? data.mastered.value : this.mastered,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('definition: $definition, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('mastered: $mastered, ')
          ..write('categoryId: $categoryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, definition, exampleSentence,
      mastered, categoryId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabularyData &&
          other.id == this.id &&
          other.word == this.word &&
          other.definition == this.definition &&
          other.exampleSentence == this.exampleSentence &&
          other.mastered == this.mastered &&
          other.categoryId == this.categoryId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VocabularyCompanion extends UpdateCompanion<VocabularyData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> definition;
  final Value<String?> exampleSentence;
  final Value<bool> mastered;
  final Value<int> categoryId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const VocabularyCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.definition = const Value.absent(),
    this.exampleSentence = const Value.absent(),
    this.mastered = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VocabularyCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required String definition,
    this.exampleSentence = const Value.absent(),
    this.mastered = const Value.absent(),
    required int categoryId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : word = Value(word),
        definition = Value(definition),
        categoryId = Value(categoryId);
  static Insertable<VocabularyData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? definition,
    Expression<String>? exampleSentence,
    Expression<bool>? mastered,
    Expression<int>? categoryId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (definition != null) 'definition': definition,
      if (exampleSentence != null) 'example_sentence': exampleSentence,
      if (mastered != null) 'mastered': mastered,
      if (categoryId != null) 'category_id': categoryId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VocabularyCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? definition,
      Value<String?>? exampleSentence,
      Value<bool>? mastered,
      Value<int>? categoryId,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return VocabularyCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      definition: definition ?? this.definition,
      exampleSentence: exampleSentence ?? this.exampleSentence,
      mastered: mastered ?? this.mastered,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (exampleSentence.present) {
      map['example_sentence'] = Variable<String>(exampleSentence.value);
    }
    if (mastered.present) {
      map['mastered'] = Variable<bool>(mastered.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('definition: $definition, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('mastered: $mastered, ')
          ..write('categoryId: $categoryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $VCategoryTable vCategory = $VCategoryTable(this);
  late final $VocabularyTable vocabulary = $VocabularyTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [vCategory, vocabulary];
}

typedef $$VCategoryTableCreateCompanionBuilder = VCategoryCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
});
typedef $$VCategoryTableUpdateCompanionBuilder = VCategoryCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
});

final class $$VCategoryTableReferences
    extends BaseReferences<_$AppDb, $VCategoryTable, VCategoryData> {
  $$VCategoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VocabularyTable, List<VocabularyData>>
      _vocabularyRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
          db.vocabulary,
          aliasName:
              $_aliasNameGenerator(db.vCategory.id, db.vocabulary.categoryId));

  $$VocabularyTableProcessedTableManager get vocabularyRefs {
    final manager = $$VocabularyTableTableManager($_db, $_db.vocabulary)
        .filter((f) => f.categoryId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_vocabularyRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$VCategoryTableFilterComposer
    extends Composer<_$AppDb, $VCategoryTable> {
  $$VCategoryTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> vocabularyRefs(
      Expression<bool> Function($$VocabularyTableFilterComposer f) f) {
    final $$VocabularyTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vocabulary,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VocabularyTableFilterComposer(
              $db: $db,
              $table: $db.vocabulary,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VCategoryTableOrderingComposer
    extends Composer<_$AppDb, $VCategoryTable> {
  $$VCategoryTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$VCategoryTableAnnotationComposer
    extends Composer<_$AppDb, $VCategoryTable> {
  $$VCategoryTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> vocabularyRefs<T extends Object>(
      Expression<T> Function($$VocabularyTableAnnotationComposer a) f) {
    final $$VocabularyTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vocabulary,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VocabularyTableAnnotationComposer(
              $db: $db,
              $table: $db.vocabulary,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VCategoryTableTableManager extends RootTableManager<
    _$AppDb,
    $VCategoryTable,
    VCategoryData,
    $$VCategoryTableFilterComposer,
    $$VCategoryTableOrderingComposer,
    $$VCategoryTableAnnotationComposer,
    $$VCategoryTableCreateCompanionBuilder,
    $$VCategoryTableUpdateCompanionBuilder,
    (VCategoryData, $$VCategoryTableReferences),
    VCategoryData,
    PrefetchHooks Function({bool vocabularyRefs})> {
  $$VCategoryTableTableManager(_$AppDb db, $VCategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VCategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VCategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VCategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              VCategoryCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              VCategoryCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$VCategoryTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({vocabularyRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (vocabularyRefs) db.vocabulary],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vocabularyRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$VCategoryTableReferences._vocabularyRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VCategoryTableReferences(db, table, p0)
                                .vocabularyRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$VCategoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $VCategoryTable,
    VCategoryData,
    $$VCategoryTableFilterComposer,
    $$VCategoryTableOrderingComposer,
    $$VCategoryTableAnnotationComposer,
    $$VCategoryTableCreateCompanionBuilder,
    $$VCategoryTableUpdateCompanionBuilder,
    (VCategoryData, $$VCategoryTableReferences),
    VCategoryData,
    PrefetchHooks Function({bool vocabularyRefs})>;
typedef $$VocabularyTableCreateCompanionBuilder = VocabularyCompanion Function({
  Value<int> id,
  required String word,
  required String definition,
  Value<String?> exampleSentence,
  Value<bool> mastered,
  required int categoryId,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
});
typedef $$VocabularyTableUpdateCompanionBuilder = VocabularyCompanion Function({
  Value<int> id,
  Value<String> word,
  Value<String> definition,
  Value<String?> exampleSentence,
  Value<bool> mastered,
  Value<int> categoryId,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
});

final class $$VocabularyTableReferences
    extends BaseReferences<_$AppDb, $VocabularyTable, VocabularyData> {
  $$VocabularyTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VCategoryTable _categoryIdTable(_$AppDb db) =>
      db.vCategory.createAlias(
          $_aliasNameGenerator(db.vocabulary.categoryId, db.vCategory.id));

  $$VCategoryTableProcessedTableManager get categoryId {
    final manager = $$VCategoryTableTableManager($_db, $_db.vCategory)
        .filter((f) => f.id($_item.categoryId));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$VocabularyTableFilterComposer
    extends Composer<_$AppDb, $VocabularyTable> {
  $$VocabularyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get definition => $composableBuilder(
      column: $table.definition, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get mastered => $composableBuilder(
      column: $table.mastered, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$VCategoryTableFilterComposer get categoryId {
    final $$VCategoryTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.vCategory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VCategoryTableFilterComposer(
              $db: $db,
              $table: $db.vCategory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VocabularyTableOrderingComposer
    extends Composer<_$AppDb, $VocabularyTable> {
  $$VocabularyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get definition => $composableBuilder(
      column: $table.definition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get mastered => $composableBuilder(
      column: $table.mastered, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$VCategoryTableOrderingComposer get categoryId {
    final $$VCategoryTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.vCategory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VCategoryTableOrderingComposer(
              $db: $db,
              $table: $db.vCategory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VocabularyTableAnnotationComposer
    extends Composer<_$AppDb, $VocabularyTable> {
  $$VocabularyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get definition => $composableBuilder(
      column: $table.definition, builder: (column) => column);

  GeneratedColumn<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence, builder: (column) => column);

  GeneratedColumn<bool> get mastered =>
      $composableBuilder(column: $table.mastered, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$VCategoryTableAnnotationComposer get categoryId {
    final $$VCategoryTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.vCategory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VCategoryTableAnnotationComposer(
              $db: $db,
              $table: $db.vCategory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VocabularyTableTableManager extends RootTableManager<
    _$AppDb,
    $VocabularyTable,
    VocabularyData,
    $$VocabularyTableFilterComposer,
    $$VocabularyTableOrderingComposer,
    $$VocabularyTableAnnotationComposer,
    $$VocabularyTableCreateCompanionBuilder,
    $$VocabularyTableUpdateCompanionBuilder,
    (VocabularyData, $$VocabularyTableReferences),
    VocabularyData,
    PrefetchHooks Function({bool categoryId})> {
  $$VocabularyTableTableManager(_$AppDb db, $VocabularyTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VocabularyTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VocabularyTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VocabularyTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> word = const Value.absent(),
            Value<String> definition = const Value.absent(),
            Value<String?> exampleSentence = const Value.absent(),
            Value<bool> mastered = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              VocabularyCompanion(
            id: id,
            word: word,
            definition: definition,
            exampleSentence: exampleSentence,
            mastered: mastered,
            categoryId: categoryId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String word,
            required String definition,
            Value<String?> exampleSentence = const Value.absent(),
            Value<bool> mastered = const Value.absent(),
            required int categoryId,
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              VocabularyCompanion.insert(
            id: id,
            word: word,
            definition: definition,
            exampleSentence: exampleSentence,
            mastered: mastered,
            categoryId: categoryId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$VocabularyTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$VocabularyTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$VocabularyTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$VocabularyTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $VocabularyTable,
    VocabularyData,
    $$VocabularyTableFilterComposer,
    $$VocabularyTableOrderingComposer,
    $$VocabularyTableAnnotationComposer,
    $$VocabularyTableCreateCompanionBuilder,
    $$VocabularyTableUpdateCompanionBuilder,
    (VocabularyData, $$VocabularyTableReferences),
    VocabularyData,
    PrefetchHooks Function({bool categoryId})>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$VCategoryTableTableManager get vCategory =>
      $$VCategoryTableTableManager(_db, _db.vCategory);
  $$VocabularyTableTableManager get vocabulary =>
      $$VocabularyTableTableManager(_db, _db.vocabulary);
}
