import 'package:flutter/material.dart';

import 'package:note_keeper/models/note.dart';
import 'package:note_keeper/providers/note_provider.dart';
import 'package:provider/provider.dart';

class EditNoteScreenState extends StatefulWidget {
  final Note note;
  final int index;
  EditNoteScreenState({super.key, required this.note, required this.index});

  @override
  State<EditNoteScreenState> createState() => __EditNOteScreenStateState();
}

class __EditNOteScreenStateState extends State<EditNoteScreenState> {
  late TextEditingController titleController;

  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    descriptionController = TextEditingController(
      text: widget.note.description,
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(17)),
            child: AppBar(
              elevation: 30,
              centerTitle: true,
              title: Text("Upate Notes"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.blue.withOpacity(0.1),
            height: MediaQuery.of(context).size.height / 1.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.2),
                      border: Border.all(width: 1.0, color: Colors.teal),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "Title",
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.2),
                      border: Border.all(width: 1.0, color: Colors.teal),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: descriptionController,
                      maxLines: 5,

                      decoration: InputDecoration(
                        hintText: "Discription",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "Discription",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final updateNote = Note(
                        title: titleController.text,
                        description: descriptionController.text,
                      );
                      Provider.of<NoteProvider>(
                        context,
                        listen: false,
                      ).EditNotes(widget.index, updateNote);
                      Navigator.pop(context);
                    },
                    child: Text("Update Save", style: TextStyle(fontSize: 17)),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 68, 62, 88),
                      elevation: 3,
                      minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
