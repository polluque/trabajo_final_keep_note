import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('FireNotes'),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'tus notas recientes paul', 
              style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, 
              fontSize: 22,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('notes').snapshots(),
              builder:(context, AsyncSnapshot snapshot) {
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
                        children: 
                        snapshot.data!.map((note) => noteCard(() {}, note)),
                        );
                  }
                return Text('no exiten notas', style: GoogleFonts.nunito(color: Colors.white),);
              },
            )
          ],
        ),
      ),
    );
  }
}