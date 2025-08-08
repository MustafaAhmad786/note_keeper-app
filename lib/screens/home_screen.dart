import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:note_keeper/providers/note_provider.dart';
import 'package:note_keeper/screens/add_note_screen.dart';
import 'package:note_keeper/widgets/note_cards.dart';
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
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(17)),
            child: AppBar(
              elevation: 30,
              centerTitle: true,
              title: Text("Notes Keeper"),
              backgroundColor: Colors.transparent,
            ),
          ),
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
          child: Container(
            color: Colors.white.withOpacity(0.2),
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
      ),
    );
  }
}
