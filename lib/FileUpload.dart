import 'dart:html';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';

class FileUpload extends StatefulWidget{
  const FileUpload({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FileUploadState();
  }
}

class FileUploadState extends State<FileUpload> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(20.0),
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget FileUploadButton() {
    return ElevatedButton(
        onPressed: ()  {},
      child: Text("Select File"),
    );
  }
}