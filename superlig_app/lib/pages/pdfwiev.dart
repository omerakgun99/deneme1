import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewPage extends StatefulWidget {
  const PdfViewPage({super.key});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  final pdfPinchController = PdfControllerPinch(
    document: PdfDocument.openAsset('assets/sample.pdf'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfViewPinch(
        controller: pdfPinchController,
      ),
      appBar: AppBar(),
    );
  }
}
