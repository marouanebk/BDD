import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPreviewPage extends StatefulWidget {
  const PdfPreviewPage({super.key});

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.network(
          'https://firebasestorage.googleapis.com/v0/b/bddproject-98372.appspot.com/o/courses%2F22c8cd50-891f-11ed-b727-4775087224bbsample.pdf?alt=media&token=7d42b6bc-d26c-4206-b313-4d1b501b0bb3',
        ),
      ),
    );
  }
}
