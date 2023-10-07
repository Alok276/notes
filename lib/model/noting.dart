
class Noting {
   int? id;
  String title;
  String description;
  String dateTime;

  Noting(this.id, this.title, this.description, this.dateTime);
  Noting.withoutId(this.title, this.description, this.dateTime);

  //converting data to map
  Map<String ,dynamic> toMap(Noting note){
 
    var map = <String, dynamic>{};
      map['id']= note.id;
       map['title']= note.title;
      map['description']= note.description;
      map['dateTime']= note.dateTime;
     
     return map;
 }

 //taking data from map
Noting fromMap(Map<dynamic, dynamic> map){

        Noting note= Noting(
        id=map['id'], 
        title=map['title'], 
        description=map['description'],
         dateTime=map['dateTime']
         );
        return note;
}
}