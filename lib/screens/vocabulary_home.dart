import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabulary_app/database/app_db.dart';
import 'package:vocabulary_app/provider/vocabulary_provider.dart';
import 'package:vocabulary_app/screens/add_vocabulary.dart';

class VocabularyHome extends StatelessWidget {
  const VocabularyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddVocabulary()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Vocabulary Learning App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<VocabularyProvider>(builder: (_, vocabularyProvider, __) {
        if (vocabularyProvider.allVocabularies.isEmpty) {
          return Center(
            child: Text(
              "No vocabularies added yet. Please add some using + button",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: vocabularyProvider.allVocabularies.length,
              itemBuilder: (_, index) {
                VocabularyData vocabulary =
                    vocabularyProvider.allVocabularies[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddVocabulary(vd: vocabulary,)));
                  },
                  onLongPress: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text("The vacubulary will be deleted"),
                        actions: [
                          TextButton(onPressed: (){
                            vocabularyProvider.deleteVocabulary(vocabulary.id);
                            Navigator.pop(context);
                          }, child: Text("OK")),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Cancel"))
                          
                        ],
                      );

                    });
                  },
                  leading: CircleAvatar(
                    child: Center(
                      child: Text("${index + 1}"),
                    ),
                  ),
                  title: Text(vocabulary.word),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vocabulary.definition,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(vocabulary.exampleSentence ?? '')
                    ],
                  ),
                  trailing:
                      vocabulary.mastered ? Icon(Icons.check_rounded) : null,
                );
              });
        }
      }),
    );
  }
}
