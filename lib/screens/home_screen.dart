import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trabajo_final_keep_note/screens/note_editor.dart';
import 'package:trabajo_final_keep_note/screens/note_reader.dart';
import 'package:trabajo_final_keep_note/style/app_style.dart';
import 'package:trabajo_final_keep_note/widgets/note_card.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Kepp Notes'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,       
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola, Estas son tus Notas mas Recientes', 
              style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, 
              fontSize: 22,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('notes').snapshots(),
                builder:(context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    // validando la conexion a firebase 
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData){
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                          children: snapshot.data!.docs.map((note) => noteCard(() {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => NoteReaderScreen(note),
                                ));
                          }, note)).toList(),
                          );
                    }
                  return Text('no exiten notas', style: GoogleFonts.nunito(color: Colors.white),);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => NoteEditorScreen()));
        }, 
        label: Text('A??adir Nota'),
        icon: Icon(Icons.add),
      ),
    );
  }
}