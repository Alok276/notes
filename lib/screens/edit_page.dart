import 'package:flutter/material.dart';
import 'package:notes/data.dart';
import 'package:notes/model/noting.dart';

class EditPage extends StatefulWidget {
  final int index;
  const EditPage({super.key,
  required this.index});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
 TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController timeController = TextEditingController();
     late Data object;
     
     @override
     void initState() {
      
    super.initState();
    //working here-----
    object = Data();
    retrieve(widget.index); 
  }

  //saving the data to the database
  void save() async
  {
    Noting note =Noting(widget.index, titleController.text, desController.text, DateTime.now().toString());
    await object.insert(note);
    
     Navigator.pop(context,note);
     
  }

  //Retrieving the data from the database
  void retrieve(int index) async {
        try {
        Noting note = await object.fetch(index);  
          setState(() {
             titleController.text= note.title;
          desController.text = note.description;
          });
        }
        catch(e){
          SnackBar(content: Text("$e"));
        }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: save,
              child: const Text(
                "SAVE",
                style: TextStyle(color: Colors.black),
              )),
          const IconButton(
              onPressed: null,
              icon: Icon(Icons.more_vert, color: Colors.black)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
              width: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      maxLines: null,
                      textAlign: TextAlign.start,
                      controller: titleController,
                      cursorColor: Colors.orange,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 23),
                      decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Title",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 23)),
                    ),
                    TextField(
                      maxLines: null,
                      controller: desController,
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Enter text here",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}