import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trabajo_final_keep_note/style/app_style.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'tus notas recientes', 
            style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, 
            fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}