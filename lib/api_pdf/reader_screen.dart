import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:virtual_assistant/model/docment.dart';

class ReaderScreen extends StatefulWidget {
  final Document doc;
  const ReaderScreen({required this.doc, Key? key}) : super(key: key);
  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff7195E1),
        title: Text(
          widget.doc.docTitle,
          style: GoogleFonts.poppins(
              textStyle:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
      ),
      body: SfPdfViewer.asset(widget.doc.docName),
    );
  }
}
