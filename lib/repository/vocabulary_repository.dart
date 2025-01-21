import 'dart:developer';

import 'package:vocabulary_app/database/app_db.dart';
import 'package:vocabulary_app/locator.dart';

class VocabularyRepository {
  AppDb db = locator.get<AppDb>();

  //deine functions to perform crud operation
  Future<List<VocabularyData>> allVocabularies() async {
    try {
      return await db.select(db.vocabulary).get();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  //get vocabulary by id
  getVocabularyById(int id) async {
    try {
      return await (db.select(db.vocabulary)
            ..where((vocabulary) => vocabulary.id.equals(id)))
          .getSingle();
    } catch (e) {
      log(e.toString());
    }
  }

  addVocabulary(VocabularyCompanion vc)async{
         try {
      return await db.into(db.vocabulary).insert(vc);
    } catch (e) {
      log(e.toString());
    }
  }

  updateVocabulary(VocabularyCompanion vc)async{
         try {
      return await db.update(db.vocabulary).replace(vc);
    } catch (e) {
      log(e.toString());
    }
  }

  deleteVocabulary(int id)async{
   try {
      return await (db.delete(db.vocabulary)
            ..where((vocabulary) => vocabulary.id.equals(id)))
          .go();
    } catch (e) {
      log(e.toString());
    }
  }
}
