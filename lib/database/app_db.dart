import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
//import 'package:flutter/rendering.dart';
import 'db__tables.dart';

part 'app_db.g.dart';

//a function to create a database
LazyDatabase _openConnection(){
  return LazyDatabase((){      //pass function that return a drift db
       return driftDatabase(
      name: 'my_database',
    );                                   
  });
}

@DriftDatabase(tables: [Vocabulary, VCategory])
class AppDb extends _$AppDb{
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

}