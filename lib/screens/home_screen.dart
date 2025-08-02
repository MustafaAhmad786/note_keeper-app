import 'package:flutter/material.dart';
import 'package:marfah_tech/models/note.dart';
import 'package:marfah_tech/providers/note_provider.dart';
import 'package:marfah_tech/screens/add_note_screen.dart';
import 'package:marfah_tech/widgets/note_cards.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? noDate;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NoteProvider>(context).notes;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Notes Keeper"),
          backgroundColor: Colors.transparent,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()),
            );
          },
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child:
                    notes.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                "😪NO TASK     ",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "PLEASE ADD YOUR TASK 😉",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            return NoteCard(note: notes[index], index: index);
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 

Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("title Show"),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      icon: Icon(Icons.more_vert),
                                      value: selectValue,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text('edit'),
                                          value: "edit",
                                        ),
                                        DropdownMenuItem(
                                          child: Text('delete'),
                                          value: "delete",
                                        ),
                                      ],
                                      onChanged: (value) {
                                        selectValue = value!;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Text("Discriptio Show"),
                            ],
                          ),
                        ),
                      ),
                    );
*/
