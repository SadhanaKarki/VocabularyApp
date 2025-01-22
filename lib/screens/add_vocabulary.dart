import 'package:drift/drift.dart' as db;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabulary_app/database/app_db.dart';
import 'package:vocabulary_app/provider/vocabulary_provider.dart';

class AddVocabulary extends StatefulWidget {
  final VocabularyData? vd;
  const AddVocabulary({super.key, this.vd});

  @override
  State<AddVocabulary> createState() => _AddVocabularyState();
}

class _AddVocabularyState extends State<AddVocabulary> {
  GlobalKey<FormState> _formKey = GlobalKey();
    TextEditingController _wordController= TextEditingController();
    TextEditingController _definitionController= TextEditingController();
    TextEditingController _exampleController= TextEditingController();
  @override
  void initState() {
    if(widget.vd!=null){
      _wordController.text =widget.vd!.word;
      _exampleController.text=widget.vd!.exampleSentence??'';
      _definitionController.text=widget.vd!.definition;
     WidgetsBinding.instance.addPostFrameCallback((_){
       Provider.of<VocabularyProvider>(context, listen: false).setCheckBoxValue(widget.vd!.mastered);
     });

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.indigo,
        title: Text("Add Vocabulary",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
        centerTitle: true,

      ),
      body: Consumer<VocabularyProvider>(
        builder: (context,vocabularyProvider,child) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "word cannot be empty";
                      }
                      return null;
                    },
                    controller: _wordController,
                    decoration: InputDecoration(
                      
                      labelText: "Word",
                      helperText: "Enter your word here",
                      hintText:"Enter the vocabulary that you want to master" ,
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "definition cannot be empty";
                      }
                      return null;
                    },
                    controller: _definitionController,
                    decoration: InputDecoration(
                      labelText: "Definition",
                      helperText: "Enter the definition here",
                      hintText:"Enter the definition" ,
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    
                    controller: _exampleController,
                    decoration: InputDecoration(
                      labelText: "Example",
                      helperText: "Enter your example here",
                      hintText:"Enter the example of the word" ,
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                
                DropdownButton(
                  value: vocabularyProvider.dropDownSelectedCategory,
                  items: List.generate(
                    vocabularyProvider.allCategories.length, (index){
                       return DropdownMenuItem(
                        value: vocabularyProvider.allCategories[index],
                        child: Text(vocabularyProvider.allCategories[index].name));
                    }), 
                  onChanged:(value){
                    vocabularyProvider.setDropDownSelectedCategory(value!);
                  }
                  ),
          
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,0.8,0),
                  child: Row(
                    children: [
                      Text("Is mastered"),
                      Checkbox(value: vocabularyProvider.checkBoxValue, onChanged: (v){
                        vocabularyProvider.setCheckBoxValue(false);
                      }),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: ()async{   
                  
                  if(_formKey.currentState!.validate()){
                  
                    VocabularyCompanion vc= VocabularyCompanion(
                      categoryId: db.Value(vocabularyProvider.dropDownSelectedCategory!.id),
                     word: db.Value(_wordController.text),
                     definition: db.Value(_definitionController.text),
                     exampleSentence: db.Value(_exampleController.text==''?null:_exampleController.text),
                     mastered: db.Value(vocabularyProvider.checkBoxValue)
                    );

                      //make a call in database by provider
                      if(widget.vd==null){
                    await vocabularyProvider.addVocabulary(vc);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Vocabulary added successfully")));
                      }
                      else{
                         VocabularyCompanion vc= VocabularyCompanion(
                          categoryId: db.Value(vocabularyProvider.dropDownSelectedCategory!.id),
                          id: db.Value(widget.vd!.id) ,
                     word: db.Value(_wordController.text),
                     definition: db.Value(_definitionController.text),
                     exampleSentence: db.Value(_exampleController.text==''?null:_exampleController.text),
                     mastered: db.Value(vocabularyProvider.checkBoxValue)
                    );
                        await vocabularyProvider.updateVocabulary(vc);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Vocabulary updated successfully")));
                      }
                      Navigator.pop(context);
              
                    
                  }
                }, 
                child: Text(widget.vd==null?"Add Vocabulary":"Update Vocabulary")
                )
              ],
            
            ),
          );
        }
      ),
    );
  }
}