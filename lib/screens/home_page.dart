

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:notes/data.dart';
import 'package:notes/model/noting.dart';
import 'package:notes/screens/edit_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref("notes");
  List<dynamic> notes =[];
   late Data data= Data();
   late SharedPreferences prefs;
   List<dynamic> filteredNotes = [];
@override
void initState() {  
    super.initState();
    loadNotes();
    filteredNotes = notes;
  }
   ///----------------state management for the app--when reopened
   void saveNotesLength(int length) async {
    
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('notesLength', length);
}
    void loadNotes() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? length = prefs.getInt('notesLength');
      if(length==null){
      return ;
      }
      for(int i=0;i<length;i++){
        Noting note = await data.fetch(i); 
        setState(() {
          notes.add(note);
        });
      
      }
}
///-----------------state management for the app--when reopened



  //searching from the notes
  void search(String texts) {
  setState(() {
    // Use the query to filter the notes list
  setState(() {
      filteredNotes = notes
          .where((noting) =>
              noting.title.toLowerCase().contains(texts.toLowerCase()))
          .toList();
    });
  });
       }



void updateList(List<dynamic> list){
  filteredNotes = list;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(171, 23, 21, 21),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color:const Color(0XFFFFA500),
                  borderRadius: BorderRadius.circular(24.0)),
              child: TextField(
                cursorColor: Colors.white,
                controller: searchController,
                onChanged: search,
                style: const TextStyle(),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(24.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.black54),
                        borderRadius: BorderRadius.circular(24.0)),
                    hintText: 'Search'),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filteredNotes.length, //notes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(8),
                      color: Colors.grey,
                    ),
                    height: 120,
                   
                    child: GestureDetector(
                      onTap: () { 
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context){
                               return EditPage(index: index);
                          }));
                      },
                      child:  Row(
                       
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  enabled: false,
                                  controller: TextEditingController(text: data.title(notes.elementAt(index))),
                                 decoration: const InputDecoration(
                                  
                                  hintText: "title here",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.zero
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 2)
                                 ),
                                  //note.title, 
                                  // Display note title
                                  style: const TextStyle(fontSize: 18),
                                ),
                                TextField(
                                   enabled: false,
                                  controller: TextEditingController(text: notes.elementAt(index).dateTime),
                                  decoration: const InputDecoration(
                                    hintText: "time here",
                                    border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.zero
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 1,vertical: 1)
                                 
                                  ),
                                  // note.timeStamp, // Display edited time
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.deepPurpleAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                         const  SizedBox(
                            width: 170,
                          ),
                           IconButton(
                              onPressed: ()async {
                               setState(() {
                                //deleting a note and rearranging the indexes  after the list after deletion 
                                        notes.removeAt(index);   
                                        saveNotesLength(notes.length); 
                                        updateList(notes);  
                                       data.remove(index); 
                                  for(int i=0; i<notes.length; i++) {
                                     data.updateIndex(notes.elementAt(i),i);
                                      } 
                                       data.remove(notes.length);    
                                                                     
                               }); },
                               // till here ====== deletion code is there
                              icon:const Icon(
                                Icons.delete,
                                color: Colors.black,   
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide.none),
        onPressed: () {

            Navigator.push( context, 
            MaterialPageRoute(builder: (context){
                  return EditPage(index: notes.length);
            })).then((note) => {
              setState(() {
              notes.add(note);
              saveNotesLength(notes.length);
              updateList(notes);
            })
          });
        },
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.add,
          size: 34,
          color: Colors.white,
        ),
      ),
    );
  }
}