

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vocabulary_app/database/app_db.dart';
//import 'package:vocabulary_app/database/db__tables.dart';
import 'package:vocabulary_app/repository/vocabulary_repository.dart';

class VocabularyProvider extends ChangeNotifier{

  VocabularyProvider(){
     getAllVocabularies();
  }

  VocabularyRepository _vocabularyRepository=VocabularyRepository();
  List<VocabularyData>_allVocabularies=[];
  List<VocabularyData>get allVocabularies=>_allVocabularies;
  bool _checkBoxValue = false;
  bool get checkBoxValue => _checkBoxValue;
  setCheckBoxValue(){
    _checkBoxValue=!_checkBoxValue;
    notifyListeners();
  }

  getAllVocabularies()async{
    _allVocabularies=await _vocabularyRepository.allVocabularies();
    log('The all vocabularies are $_allVocabularies');
    notifyListeners();
  }
  addVocabulary(VocabularyCompanion vc)async{
    await _vocabularyRepository.addVocabulary(vc);
    getAllVocabularies();
  }

  updateVocabulary(VocabularyCompanion vc)async{
    await _vocabularyRepository.updateVocabulary(vc);
    getAllVocabularies();
  }

  deleteVocabulary(int id)async{
    await _vocabularyRepository.deleteVocabulary(id);
    getAllVocabularies();
  }
  //updateVocabulary
}