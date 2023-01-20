
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../services/firebase_storge.dart';
class pdfViwer extends StatefulWidget {
  const pdfViwer({Key? key}) : super(key: key);

  @override
  State<pdfViwer> createState() => _pdfViwerState();
}

class _pdfViwerState extends State<pdfViwer> {
 var pdfUrl = FirebaseStorageMethod().downloadDiet;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar:AppBar(),
        body: Container(
            child: SfPdfViewer.network(
                '$pdfUrl',
                canShowScrollHead: true,
                canShowScrollStatus: true)));
  }
}
