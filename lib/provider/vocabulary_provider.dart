

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vocabulary_app/database/app_db.dart';
import 'package:vocabulary_app/repository/category_repository.dart';
//import 'package:vocabulary_app/database/db__tables.dart';
import 'package:vocabulary_app/repository/vocabulary_repository.dart';

class VocabularyProvider extends ChangeNotifier{

  VocabularyProvider(){
     getAllVocabularies();
     getAllCategories();
  }

  VCategoryData? _dropDownSelectedCategory;
  VCategoryData? get dropDownSelectedCategory=> _dropDownSelectedCategory;

  setDropDownSelectedCategory(VCategoryData vc){
    _dropDownSelectedCategory=vc;
    notifyListeners();
  }

  VocabularyRepository _vocabularyRepository=VocabularyRepository();
  CategoryRepository _categoryRepository=CategoryRepository();

  List<VCategoryData>_allCategories=[];
  List<VCategoryData>get allCategories=> _allCategories;

    List<VocabularyData>_currentVocabularies=[];
  List<VocabularyData>get currentVocabularies=> _currentVocabularies;


  List<VocabularyData>_allVocabularies=[];
  List<VocabularyData>get allVocabularies=>_allVocabularies;
  
  int? _selectedCategoryId;
  int? get selectedCategoryId=> _selectedCategoryId;

  setSelectedCategory(int id){
    _selectedCategoryId=id;
    
    notifyListeners();
  }

  bool _checkBoxValue = false;
  bool get checkBoxValue => _checkBoxValue;

  getAllCategories()async{
    _allCategories=await _categoryRepository.allVCategories();
    notifyListeners();
  }

  getVocabularyByCategoryId(){
    
    log("The selected category id is $_selectedCategoryId");
    _currentVocabularies=_allVocabularies.where((vocabulary)=> vocabulary.categoryId==_selectedCategoryId).toList();
    notifyListeners();
  }

  //initiate
  setCheckBoxValue(bool mastered){
    _checkBoxValue=!_checkBoxValue;
    notifyListeners();
  }

  getAllVocabularies()async{
    _allVocabularies=await _vocabularyRepository.allVocabularies();
    _currentVocabularies=_allVocabularies;
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