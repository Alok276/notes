import 'package:firebase_database/firebase_database.dart';
import 'package:notes/model/noting.dart';

class Data {

  DatabaseReference ref = FirebaseDatabase.instance.ref("notes");


  //insert the data in the database
  Future<bool> insert(Noting note) async{
           try{
           
               await ref.child("${note.id}").set({
            "title": note.title,
            "description": note.description,
            "dateTime": note.dateTime
           });

           return true;
           } catch (e){
                    return false;
           }
           
  }

  //fetch the data from the database
Future<Noting> fetch(int index) async{
  
 Noting note=Noting(0, "", "", "");
 DatabaseReference refs = FirebaseDatabase.instance.ref("notes/$index");

DatabaseEvent event = await refs.once();
note = note.fromMap(event.snapshot.value as Map);

    return note;
}
 
 
  //update the data from the database

  
  //Delete the data from the database
    Future remove(int index) async{
    DatabaseReference refs = FirebaseDatabase.instance.ref("notes/$index");
      await refs.remove();
    
   }



   //update the indexes of the list when a note is removed
   Future<bool> updateIndex(Noting note, int index) async{
            try{    
               await ref.child("$index").update({
            "title": note.title,
            "description": note.description,
            "dateTime": note.dateTime
           });
           return true;
           } catch (e){
                    return false;
           }
   } 

//to give the the title to the list item
String title(Noting note){
  String head = note.title;
  return head;
}
//to give the date to the list item
String time(Noting note){
  String date = note.dateTime;
  date = date.substring(0,10);
  date = "Last Edited: $date";
  return date;
}


}