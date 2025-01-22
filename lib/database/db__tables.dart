import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

class Vocabulary extends Table{
  IntColumn get id =>  integer().autoIncrement()();
  TextColumn get word => text()();
  TextColumn get definition => text()();
  TextColumn get exampleSentence => text().nullable()();
  BoolColumn get mastered => boolean().withDefault(const Constant(false))();
  
  IntColumn get categoryId=> integer().references(VCategory, #id, onDelete: KeyAction.restrict)();
  DateTimeColumn get createdAt=> dateTime().nullable().clientDefault(()=>DateTime.now())();
  DateTimeColumn? get updatedAt => dateTime().nullable().withDefault(currentDateAndTime)();
}

class VCategory extends Table{
 IntColumn get id =>  integer().autoIncrement()();
 TextColumn get name => text().unique()();
  DateTimeColumn get createdAt=> dateTime().nullable().clientDefault(()=>DateTime.now())();
  DateTimeColumn? get updatedAt => dateTime().nullable().withDefault(currentDateAndTime)();
}